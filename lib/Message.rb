# require "Colors"

module Messages
  WELCOME = "Welcome to MASTERMIND!\n"
  ACTION = "Would you like to (p)lay, read the (i)nstructions, read a little (b)ackground on Mastermind or (q)uit?"
  GET_NAME = "So you would like to play! \nStart by telling me your name: "
  SELECT_LEVEL = "=================================================================\n"\
                  "To start the game select a level you would like to play:\n"\
                  "Enter (1) for Beginner,\nEnter (2) for Intermediate,\nEnter (3) for Advanced.\n"\
                  "================================================================\n"

  USER_WIN = "Insane! you are a Mastermind, you got the right sequence in %s trial(s) \nPlease play again?"
  USER_LOOSE = "You have %s exacts and %s partials, keep on trying! you still have %s trials left"

  CHEATS = "Shhhh! do not tell anyone: %s"

  WELCOME_USER = "Hello %s I have generated a beginner sequence with %s characters made up of:\n "
  GAME_INSTRUCTION = "Computer will generate a Random list of colors, it will be your challenge to decipher \n"\
                      "the order in which theses colors are arranged by the computer\n"


  IN_GAME_INSTRUCTION = "You are to guess the sequence in which these colors appeared\n"\
                      "e.g: %s for %s You have 12 guesses to get these colors or you lose the game."\
                      "Use (q)uit at any time to end the game.Ready to play? \nWhat's your guess?"


  GAME_FEEDBACK = "You have %s exacts and %s partials, keep on trying! you still have 11 trials left"
  EXIT_GAME = "Thank you for using MasterMind!"
  QUIT_GAME = "Alrighty, cleaning up..."

  PRESS_CONTINUE = "Press enter to continue\n"\
                    "===============================================================\n"
  PRESS_RETURN =    "Press enter to return\n"\
                    "===============================================================\n"

  CONSOLE_SEPERATOR = "===============================================================\n"

  ABOUT_GAME = "This game was developed as a requirement to getting into Andela\n"

end
