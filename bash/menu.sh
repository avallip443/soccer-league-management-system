#!/bin/sh

Pause() {
    echo "Press [Enter] to continue..."
    read
}

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
        echo " $IS_SELECTED4 4) Basic Queries"
        echo " $IS_SELECTED5 5) Advanced Queries"
        echo " $IS_SELECTED6 5) Interesting Advanced Queries"
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
                # Basic Queries Submenu
                while true; do
                    clear
                    echo "================================================================="
                    echo "| Basic Queries Menu                                             |"
                    echo "| Select a query to run:                                         |"
                    echo "-----------------------------------------------------------------"
                    echo " 1) Query 1: Players in Team managed by 'sindig1'"
                    echo " 2) Query 2: League standings for 'joe027'"
                    echo " 3) Query 3: Players sorted most goals scored"
                    echo " 4) Query 4: Games in Mississauga League"
                    echo " 5) Query 5: Players with the most hattricks"
                    echo " 6) Return to Main Menu"
                    echo "Choose: "

                    read QUERY_CHOICE
                    case "$QUERY_CHOICE" in
                        1)
                            echo "Running Query 1..."
                            bash basic_query1.sh 
                            Pause
                            ;;
                        2)
                            echo "Running Query 2..."
                            bash query2.sh 
                            Pause
                            ;;
                        3)
                            echo "Running Query 3..."
                            bash query3.sh
                            Pause
                            ;;
                        4)
                            echo "Running Query 4..."
                            bash query4.sh 
                            Pause
                            ;;
                        5)
                            echo "Running Query 5..."
                            bash query5.sh 
                            Pause
                            ;;
                        6)
                            break 
                            ;;
                        *)
                            echo "Invalid choice. Please try again."
                            ;;
                    esac
                done
                ;;
            5)
                # Advanced Queries Submenu
                while true; do
                    clear
                    echo "================================================================="
                    echo "| Advanced Queries Menu                                          |"
                    echo "| Select a query to run:                                         |"
                    echo "-----------------------------------------------------------------"
                    echo " 1) Query 1: Players in Team managed by 'sindig1'"
                    echo " 2) Query 2: League standings for 'joe027'"
                    echo " 3) Query 3: Players sorted most goals scored"
                    echo " 4) Query 4: Games in Mississauga League"
                    echo " 5) Query 5: Players with the most hattricks"
                    echo " 6) Return to Main Menu"
                    echo "Choose: "

                    read QUERY_CHOICE
                    case "$QUERY_CHOICE" in
                        1)
                            echo "Running Query 1..."
                            bash advanced_query1.sh 
                            Pause
                            ;;
                        2)
                            echo "Running Query 2..."
                            bash advanced_query2.sh 
                            Pause
                            ;;
                        3)
                            echo "Running Query 3..."
                            bash advanced_query3.sh
                            Pause
                            ;;
                        4)
                            echo "Running Query 4..."
                            bash advanced_query4.sh 
                            Pause
                            ;;
                        5)
                            echo "Running Query 5..."
                            bash advanced_query5.sh 
                            Pause
                            ;;
                        6)
                            break 
                            ;;
                        *)
                            echo "Invalid choice. Please try again."
                            ;;
                    esac
                done
                ;;
            6)
                # Interesting Advanced Queries Submenu
                while true; do
                    clear
                    echo "================================================================="
                    echo "| Interesting Advanced Queries Menu                              |"
                    echo "| Select a query to run:                                         |"
                    echo "-----------------------------------------------------------------"
                    echo " 1) Query 1: Players in Team managed by 'sindig1'"
                    echo " 2) Query 2: League standings for 'joe027'"
                    echo " 3) Query 3: Players sorted most goals scored"
                    echo " 4) Query 4: Games in Mississauga League"
                    echo " 5) Query 5: Players with the most hattricks"
                    echo " 6) Return to Main Menu"
                    echo "Choose: "

                    read QUERY_CHOICE
                    case "$QUERY_CHOICE" in
                        1)
                            echo "Running Query 1..."
                            bash interesting_query1.sh 
                            Pause
                            ;;
                        2)
                            echo "Running Query 2..."
                            bash interesting_query2.sh 
                            Pause
                            ;;
                        3)
                            echo "Running Query 3..."
                            bash interesting_query3.sh
                            Pause
                            ;;
                        4)
                            echo "Running Query 4..."
                            bash interesting_query4.sh 
                            Pause
                            ;;
                        5)
                            echo "Running Query 5..."
                            bash interesting_query5.sh 
                            Pause
                            ;;
                        6)
                            break 
                            ;;
                        *)
                            echo "Invalid choice. Please try again."
                            ;;
                    esac
                done
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
