# Minecraft Package Manager (MPM)
**MPM** is a **package manager** designed for **Minecraft**'s **ComputerCraft mod**, allowing you to easily manage and update scripts and utilities on your **in-game computers** by pulling directly from GitHub repositories.

## Installation
1. Download the **install.lua** file to your in-game computer using the Pastebin **get** command. Replace **pastebin_link** with the appropriate Pastebin link:
install

**wget run https://shelfwood-mpm.netlify.app/install.lua**

3. Run the **install.lua** script to install **MPM**. This script will automatically download the necessary **package manager** files from the MPM GitHub repository.
   
4. During **installation**, you will be prompted to add the default package repository, which contains a variety of useful packages. Simply enter **yes** when prompted.
   

## Usage
Once **MPM** is installed, you can use the following **commands**:

* **mpm tap_repository <repository url>**: Add a new repository to your list of tapped repositories.
* **mpm install <version>**: Install a specific Minecraft version from the tapped repositories.
* **mpm update [version]**: Update a specific Minecraft version or all versions if no version name is provided.
* **mpm remove <version>**: Remove a specific Minecraft version.
* **mpm list**: List all installed Minecraft versions.
* **mpm run <version>**: Launch a specific Minecraft version.
* **mpm self_update**: Update the MPM system itself.
For example, to install a **Minecraft version named 1.16.5**, you would use the following command:

**mpm install 1.16.5**

## Contributing
**Contributions** to **MPM** are welcome. Feel free to submit a **Pull Request** or open an **issue** if you have any ideas or encounter any problems.

## Updates
* The installation process now **automatically deletes install.lua** after completion.
* Running **mpm** without arguments now **displays the list** of available commands.
* Fixed the issue with **mpm** not being **globally accessible** from the **terminal**.
* Introduced the **mpm self_update** command to keep **MPM** up to date.
* **mpm** update now allows updating **all packages** when no package name is provided.
For more **information** and to get involved, visit the **MPM GitHub repository**.






