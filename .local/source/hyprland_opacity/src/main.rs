use hyprland::ctl::set_prop::{self, PropType};
use hyprland::data::{Client, Clients};
use hyprland::shared::{HyprData, HyprDataActiveOptional};
use std::fs::{self, OpenOptions};
use std::io::{Read, Result, Write};

const FILE_PATH: &str = "/tmp/OPACITY";

fn main() -> Result<()> {
    let active_window = Client::get_active().unwrap();

    if let Some(active_window) = active_window {
        let address = active_window.address.to_string();

        purge_file()?;

        if !in_file(&address)? {
            write_address_to_file(&address)?;
            change_opacity(&address, true);
        } else {
            delete_address_from_file(&address)?;
            change_opacity(&address, false);
        }
    }

    Ok(())
}

/// Changes the opacity of a window identified by `address`.
/// If `_override` is true, sets the window opacity override to true.
fn change_opacity(address: &str, _override: bool) {
    set_prop::call(
        format!("address:{}", address),
        PropType::AlphaOverride(_override, false),
        false,
    )
    .unwrap();
}

/// Checks if the given `address` exists in the file specified by `FILE_PATH`.
/// Returns `true` if the address is found, `false` otherwise.
fn in_file(address: &str) -> Result<bool> {
    let content = read_file()?;
    Ok(content.lines().any(|line| line == address))
}

/// Removes any addresses from the file specified by `FILE_PATH`
/// that are no longer associated with active windows.
fn purge_file() -> Result<()> {
    let clients = Clients::get().unwrap();
    let addresses: Vec<String> = clients.iter().map(|x| x.address.to_string()).collect();
    let content = read_file()?;

    let new_content: String = content
        .lines()
        .filter(|line| addresses.contains(&line.to_string()))
        .collect::<Vec<&str>>()
        .join("\n");

    fs::write(FILE_PATH, new_content)?;

    Ok(())
}

/// Reads the contents of the file specified by `FILE_PATH`
/// and returns it as a `String`.
fn read_file() -> Result<String> {
    let mut file = OpenOptions::new()
        .read(true)
        .write(true)
        .create(true)
        .open(FILE_PATH)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

/// Removes the given `address` from the file specified by `FILE_PATH`.
fn delete_address_from_file(address: &str) -> Result<()> {
    let content = read_file()?;
    let new_content: String = content
        .lines()
        .filter(|line| line != &address)
        .collect::<Vec<&str>>()
        .join("\n");

    fs::write(FILE_PATH, new_content)?;

    Ok(())
}

/// Writes the given `address` to the file specified by `FILE_PATH`.
fn write_address_to_file(address: &str) -> Result<()> {
    let mut file = OpenOptions::new()
        .append(true)
        .create(true)
        .open(FILE_PATH)?;
    let content = read_file()?;

    // Ensure there's a newline before appending if the file is not empty.
    // For some reason after deleting it won't put a new address on a new line.
    // you'd think the .append() or the writeln! would do that.
    if !content.is_empty() {
        write!(file, "\n")?;
    }

    writeln!(file, "{}", address)?;
    Ok(())
}
