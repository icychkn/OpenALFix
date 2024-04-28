#!/bin/bash

# expectations
# $1 is the id of the mod
# $2 is the name of the mod
# $3 points to the project directory
# $4 points to the .minecraft folder
# $5 is the archive name?

Help() {
  echo "<Minecraft 1.7 Revival Initiative> Workspace Initializer."
  echo
  echo "Syntax: script [id] [name] [project dir] [dot minecraft] [archive name]"
  echo
  echo -e "id:\t\tan all-lowercase alphabet string with no spaces"
  echo -e "name:\t\tstandard public-facing name of the mod, spaces and other characters allowed"
  echo -e "project dir:\tthe location of the project files, no slash at the end"
  echo -e "dot minecraft:\tlocation of the .minecraft folder to install the mod to"
  echo -e "archive name:\tkept as a 'just in case it becomes important' option"
  echo
}

while getopts ":h" option; do
  case $option in
    h)
      Help
      exit;;
    \?)
      echo "Error: Invalid option"
      exit;;
  esac
done

if ! [ $# -eq 5 ]; then
  >&2 echo "Incorrect number of arguments provided, use -h for syntax"
  exit
fi

ID=$1;
NAME=$2;
PROJECT_DIR=$3;
DOT_MINECRAFT=$4;
ARCHIVE_NAME=$5;

echo "
PS1=\"\[\033[01;36m\][\u@MRI\[\033[01;37m\] $NAME\[\033[01;36m\]]$\[\033[00m\] \";
" > "$PROJECT_DIR/.bashrc";

echo "#!/bin/sh
export PROJECT_DIR=\"$PROJECT_DIR\";
export DOT_MINECRAFT=\"$DOT_MINECRAFT\";

bash --init-file $PROJECT_DIR/.bashrc
" > "$PROJECT_DIR/enter-workspace.sh";

echo "
org.gradle.jvmargs=-Xms256M -Xmx2G
org.gradle.daemon=false

mc_version=1.7.10
mod_version=1.0.0
forge_version=10.13.4.1614
mod_group=com.icychkn.$ID
mod_id=$ID
mod_name=$NAME
mod_archives_name=$ARCHIVE_NAME
mod_author=icychkn
mod_icon=TEM_logo.png
mod_description=Some generic mod description
mod_credits=Me, for making this amazing mod.
" > "$PROJECT_DIR/gradle.properties"


SOURCE="$PROJECT_DIR/src/main/java/com/icychkn/$ID";
ASSETS="$PROJECT_DIR/src/main/resources/assets/$ID";

mkdir -p "$SOURCE";
mkdir -p "$ASSETS/lang";
mkdir -p "$ASSETS/textures";

touch "$ASSETS/lang/en_US.lang";

