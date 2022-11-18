# homework2
# pao ying chub
  # user play unlimited times

# 1 = rock
# 2 = paper
# 3 = scissors



win = 0
loss = 0
tie = 0
attemp = 0

while (attemp<100) {
start <- print("Let's play")
print("Choose 1 = rock  2 = paper  3 = scissors ")
print("You choose : ")
select <- readLines("stdin", n=1)
random <- 1:3
s_random <- sample(random, size = 1)
  
  if (select == 1 & s_random == 1 ){
  print("tie")
  tie = tie + 1
} else if (select == 1 & s_random == 2 ){
  print("loss")
  loss = loss + 1
} else if (select == 1 & s_random == 3 ){
  print("win")
  win = win + 1
} else if (select == 2 & s_random == 1 ){
  print("win")
  win = win + 1
} else if (select == 2 & s_random == 2 ){
  print("tie")
  tie = tie + 1
} else if (select == 2 & s_random == 3 ){
  print("loss")
  loss = loss + 1
} else if (select == 3 & s_random == 1 ){
  print("loss")
  loss = loss + 1
} else if (select == 3 & s_random == 2 ){
  print("win")
  win = win + 1
} else if (select == 3 & s_random == 3 ){
  print("tie")
  tie = tie + 1
}

print(paste(win, "win", loss, "loss", tie, "tie"))
print("play again! or exit")
print("1 = play again")
print("2 = exit")
question <- readLines("stdin", n=1)
if (question == 2){
  break
} 
attemp <- attemp + 1  
}

  
