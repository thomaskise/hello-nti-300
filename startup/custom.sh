# /etc/profile.d/custom.sh
# custom global definitions

alias ls="ls -al"

# function startmail will start an email to everyone logged on the the server
# Simple; no arguments; simply type startmail on the command line

function startmail
{

filename="who"                                      # assign var for filename
field="f1"                                          # assign var for field
mail $($filename | cut -d' ' -$field)               # output the text for the requested field
}

# function lsd provides a directory listing 
# given an input date formatted mmm d, a date column number and a  filename column number
function lsd
{
    if [ -z "$1" ] ; then                                  # check for input argument; end script if none provided
       echo "you didn't provide an argument"
       exit 0;
    fi

    date=$1
    datecol=$2
    filenamecol=$3
    ls -l | grep -i "^.\{$datecol\}$date" | cut -c$filenamecol-
}

# function findfield finds a field in a space delimted file
# given inputs of filename and field column
function findfield 
{
   if [ -z "$1" ] ; then                                   # check for input argument; end script if none provided
     echo "you didn't provide an argument"
     exit 0;
   fi

   filename=$1                                             # assign var for argument 1
   field="f"$2                                             # assign var for argument 2
   echo $($filename | cut -d' ' -$field)                   # output the text for the requested field
}

# function pushd pushes a directory onto a stack for ordered retrival
# given input arguement of a directory name e.g. pushd /etc
pushd () 
{

   dirname=$1                                              # assign var for argument 1
   DIR_STACK="$dirname ${DIR_STACK:-$PWD' '}"              # push the input directory onto the stack
   cd ${dirname:?"missing directory name."}                # cd to the new directory and assign message if directory was not provided (input)
   echo "$DIR_STACK"                                       # output the contents of the current stack
}

# function popd retrieves the top directory from a stack
# popd has no arguments
popd () 
{

   DIR_STACK=${DIR_STACK#* }                               # remove the top directory from the stack
   cd ${DIR_STACK%% *}                                     # remove the top directory as an argument 
   echo "$PWD"                                             # output the reemaining top directory on the stack
}
