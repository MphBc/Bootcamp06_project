# -*- coding: utf-8 -*-

# -- Sheet --

# # Pao Ying Chub


import random

rd = random.randrange(1,4)

Win = []
Lose = []
Draw = []

def game(choose_n):
    if choose_n == 1 and rd == 1: # choose rock
        print("Draw")
        Draw.append("Draw")
    elif choose_n == 1 and rd == 2:
        print("You Lose")
        Lose.append("Lose")
    elif choose_n == 1 and rd == 3:
        print("You Win")
        Win.append("Win")
    elif  choose_n == 2 and rd == 1: # choose paper
        print("You Win")
        Win.append("Win")
    elif choose_n == 2 and rd == 2:
        print("Draw")
        Draw.append("Draw")
    elif choose_n == 2 and rd == 3:
        print("You Lose")
        Lose.append("Lose")
    elif  choose_n == 3 and rd == 1: # choose scissors
        print("You Lose")
        Lose.append("Lose")
    elif choose_n == 3 and rd == 2:
        print("You Win")
        Win.append("Win")
    elif choose_n == 3 and rd == 3:
        print("Draw")
        Draw.append("Draw")

while True:
    print("Pao Ying Chub Game")
    print("play now")
    print("............................")
    print("Choose")
    print("1.Rock","2.Paper","3.Scissors")
    print("You choose no. : ")
    choose_n = int(input())
    print("Bot choose no. : ")
    print(rd)
    game(choose_n)
    print("............................")
    print("Play again / press : 1")
    print("End / press : 2")
    play_end = int(input())
    if play_end == 2:
        break
    
total_result = Win.count("Win") + Lose.count("Lose") + Draw.count("Draw")

print("............................")
print("Total result")
print("Win:", (Win.count("Win") / total_result) * 100, "%")
print("Lose:", (Lose.count("Lose") / total_result) * 100, "%")
print("Draw:", (Draw.count("Draw") / total_result) * 100, "%")

