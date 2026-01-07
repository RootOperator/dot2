#!/bin/bash

CITY="groningen"

cachedir=~/.cache/rbn
cachefile=${0##*/}-"$CITY"

mkdir -p "$cachedir"

cache_is_valid=false
if [ -s "$cachedir/$cachefile" ]; then
    cache_age=$(($(date +%s) - $(stat -c '%Y' "$cachedir/$cachefile")))
    if [ "$cache_age" -le 1800 ]; then
        cache_is_valid=true
    fi
fi

if ! $cache_is_valid; then
    curl -s "https://wttr.in/$CITY?format=%l,%C,%t,%f" > "$cachedir/$cachefile"
fi

if [ ! -s "$cachedir/$cachefile" ]; then
    echo -e "{\"text\":\"\", \"tooltip\":\"Error: Could not fetch weather data.\"}"
    exit 1
fi

weather_data=$(cat "$cachedir/$cachefile")

location=$(echo "$weather_data" | cut -d',' -f1)
condition_text=$(echo "$weather_data" | cut -d',' -f2 | tr '[:upper:]' '[:lower:]')
temp_c=$(echo "$weather_data" | cut -d',' -f3)
feels_like_c=$(echo "$weather_data" | cut -d',' -f4)

case "$condition_text" in
    "clear" | "sunny")
        condition_icon=""
        ;;
    "partly cloudy")
        condition_icon=""
        ;;
    "cloudy")
        condition_icon=""
        ;;
    "overcast")
        condition_icon=""
        ;;
    "mist" | "fog" | "freezing fog")
        condition_icon="󰖑"
        ;;
    "patchy rain possible" | "patchy light drizzle" | "light drizzle" | "patchy light rain" | "light rain" | "light rain shower" | "rain")
        condition_icon="󰖗"
        ;;
    "moderate rain at times" | "moderate rain" | "heavy rain at times" | "heavy rain" | "moderate or heavy rain shower" | "torrential rain shower" | "rain shower")
        condition_icon="󰖖"
        ;;
    "patchy snow possible" | "patchy sleet possible" | "patchy freezing drizzle possible" | "freezing drizzle" | "heavy freezing drizzle" | "light freezing rain" | "moderate or heavy freezing rain" | "light sleet" | "ice pellets" | "light sleet showers" | "moderate or heavy sleet showers")
        condition_icon="󰖘"
        ;;
    "blowing snow" | "moderate or heavy sleet" | "patchy light snow" | "light snow" | "light snow showers" | "blizzard" | "patchy moderate snow" | "moderate snow" | "patchy heavy snow" | "heavy snow" | "moderate or heavy snow with thunder" | "moderate or heavy snow showers")
        condition_icon=""
        ;;
    "thundery outbreaks possible" | "patchy light rain with thunder" | "moderate or heavy rain with thunder" | "patchy light snow with thunder")
        condition_icon=""
        ;;
    *)
        condition_icon=""
        temp_c=""
        ;;
esac

text_output="$temp_c $condition_icon"
tooltip_output="$location: ${condition_text^} ($temp_c, feels like $feels_like_c)"

echo -e "{\"text\":\"$text_output\", \"alt\":\"$condition_text\", \"tooltip\":\"$tooltip_output\"}"
