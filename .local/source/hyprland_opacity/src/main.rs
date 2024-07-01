use std::fs::{self, File, OpenOptions};
use std::io::{Read, Write, Result};

use hyprland::ctl::set_prop;
use hyprland::ctl::set_prop::PropType;
use hyprland::data::{Clients, Client};
use hyprland::shared::{HyprData, HyprDataActiveOptional};


const FILE_PATH: &'static str = "/tmp/OPACITY";

fn main() -> Result<()> {
    let active_window = Client::get_active().unwrap();

    purge_file();

    if let Some(active_window) = active_window {
        let address = active_window.address.to_string();
        let formatted_address = format!("address:{}", address);

        if !in_file(&address).unwrap() {
            write_address_to_file(&address)?;
            change_opacity(&formatted_address, true);
        } else {
            delete_address_from_file(&address)?;
            change_opacity(&formatted_address, false);
        }
    }

    Ok(())
}

// changes opacity of the focussed window
fn change_opacity(address: &str, _override: bool) {
    set_prop::call(address.to_owned(), PropType::AlphaOverride(_override, false), false).unwrap();
}

// checks if address is in file
fn in_file(address: &str) -> Result<bool> {
    let content = read_file()?;

    Ok(content.contains(address))
}

// removes inactive addresses from file
fn purge_file() {
    let clients = Clients::get().unwrap();
    let addresses: Vec<String> = clients.iter().map(|x| x.address.to_string()).collect();

    let content = read_file().unwrap();

    for line in content.lines() {
        if !addresses.contains(&line.to_owned()) {
            delete_address_from_file(line).unwrap();
        }
    }
}

// reads file
fn read_file() -> Result<String> {
    let mut file = OpenOptions::new()
         .read(true)
         .write(true)
         .create(true)
         .open(FILE_PATH).unwrap();

    let mut content = String::new();
    file.read_to_string(&mut content)?;

    Ok(content)
}

// deletes specific address from file
fn delete_address_from_file(address: &str) -> Result<()>{
    let mut file = File::open(FILE_PATH)?;

    let mut content = String::new();
    file.read_to_string(&mut content)?;

    content = content
        .replace(&address, "")
        .trim()
        .to_string();
    fs::write(FILE_PATH, &content)?;

    Ok(())
}

// append address to file if it's not in there
fn write_address_to_file(address: &str) -> Result<()> {
    let mut file = OpenOptions::new()
         .append(true)
         .create(true)
         .open(FILE_PATH).expect("Cannot open file");

    writeln!(file, "{}", &address)?;
    Ok(())
}
