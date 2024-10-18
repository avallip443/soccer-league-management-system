#!/bin/sh

MainMenu() {
    while [ "$CHOICE" != "START" ]
    do
        clear
        echo "================================================================="
        echo "| Oracle All Inclusive Tool                                      |"
        echo "| Main Menu - Select Desired Operation(s):                       |"
        echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>               |"
        echo "-----------------------------------------------------------------"
        echo " $IS_SELECTEDM M) View Manual"
        echo " "
        echo " $IS_SELECTED1 1) Drop Tables"
        echo " $IS_SELECTED2 2) Create Tables"
        echo " $IS_SELECTED3 3) Populate Tables"
        echo " $IS_SELECTED4 4) Query Tables"
        echo " "
        echo " $IS_SELECTEDX X) Force/Stop/Kill Oracle DB"
        echo " "
        echo " $IS_SELECTEDE E) End/Exit"
        echo "Choose: "
        
        read CHOICE
        
        case "$CHOICE" in
            0)
                echo "Nothing Here"
                ;;
            1)
                bash drop_tables.sh
                Pause
                ;;
            2)
                bash create_tables.sh
                Pause
                ;;
            3)
                bash populate_tables.sh
                Pause
                ;;
            4)
                bash queries.sh
                Pause
                ;;
            E)
                exit
                ;;
            *)
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}

# Main Program
ProgramStart() {
    StartMessage
    while true
    do
        MainMenu
    done
}

ProgramStart
