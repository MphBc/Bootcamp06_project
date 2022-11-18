# chatbot (rule-based)
# ordering pizza

# select category
select_category <- function(){
  if(select_1 == 1){
    print(data.frame(p_category))
  }else if(select_1 == 2){
    print(data.frame(ap_category))
  }else if(select_1 == 3){
    print(data.frame(s_category))
  }else if(select_1 == 4){
    print(data.frame(d_category))
  }
}

# category 
category <- list(
  No. = c(1,2,3,4),
  List = c("Pizza"," Appetizers","Salad","Drink & Desserts")
)

# 1.pizza category
p_category <- list(
  No. = c(1,2,3,4,5),
  Pizza_List = c("Seafood Deluxe","Super Deluxe","Meat Deluxe","Hawaiian","Classic Mushroom & Tomato"),
  Price = c(419,359,359,359,359)
)

# 2.appetizers
ap_category <- list(
  No. = c(1,2,3),
  Appetizers_list = c("Fish fingers","Cheese sticks","Garlic bread"),
  Price = c(89,89,79)
)

# 3.salad
s_category <- list(
  No. = c(1,2),
  Salad_list = c("Caesar salad","Garden salad with salad cream"),
  Price = c(149,129)
)

# 4.Drink & Desserts
d_category <- list(
  No. = c(1,2,3,4),
  Drink_Dessert = c("Coke","Sprite","Chocolate ice cream","Strawberry ice cream"),
  Price = c(32,32,219,219)
)


# user pick no.
user_pick <- function(){
  if(select_1 == 1){
    pick_pizza()
 }else if(select_1 == 2){
    pick_ap()
 }else if(select_1 == 3){
    pick_salad()
 }else if(select_1 == 4){
    pick_dd()
 }
}

# price
price_list <- function(){
  if(select_1 == 1){
    price_pizza()
 }else if(select_1 == 2){
    price_ap()
 }else if(select_1 == 3){
    price_salad()
 }else if(select_1 == 4){
    price_dd()
 }
}

# pick pizza list 
pick_pizza <- function(){
  if(select_2 == 1){
    p_category$Pizza_List[1]
  }else if(select_2 == 2){
    p_category$Pizza_List[2]
  }else if (select_2 == 3){
    p_category$Pizza_List[3]
  }else if (select_2 == 4){
    p_category$Pizza_List[4]
  }else if (select_2 == 5){
    p_category$Pizza_List[5]
  }
}
  
# price pizza 
price_pizza <- function(){
  if(select_2 == 1){
    p_category$Price[1]
  }else if(select_2 == 2){
    p_category$Price[2]
  }else if (select_2 == 3){
    p_category$Price[3]
  }else if (select_2 == 4){
    p_category$Price[4]
  }else if (select_2 == 5){
    p_category$Price[5]
  }
}

# pick appetizers
pick_ap <- function(){
  if(select_2 == 1){
    ap_category$Appetizers_list[1]
  }else if(select_2 == 2){
    ap_category$Appetizers_list[2]
  }else if(select_2 == 3){
    ap_category$Appetizers_list[3]
  }
}

# price appetizers
price_ap <- function(){
  if(select_2 == 1){
    ap_category$Price[1]
  }else if(select_2 == 2){
    ap_category$Price[2]
  }else if(select_2 == 3){
    ap_category$Price[3]
  }
}

# pick salad
pick_salad <- function(){
  if(select_2 == 1){
    s_category$Salad_list[1]
  }else if(select_2 == 2){
    s_category$Salad_list[2]
  }
}

# price salad
price_salad <- function(){
  if(select_2 == 1){
    s_category$Price[1]
  }else if(select_2 == 2){
    s_category$Price[2]
  }
}

# pick drink and dessert
pick_dd <- function(){
  if(select_2 == 1){
    d_category$Drink_Dessert[1]
  }else if(select_2 == 2){
    d_category$Drink_Dessert[2]
  }else if(select_2 == 3){
    d_category$Drink_Dessert[3]
  }else if(select_2 == 4){
    d_category$Drink_Dessert[4]
  }
 }
    
# price drink and dessert
price_dd <- function(){
  if(select_2 == 1){
    d_category$Price[1]
  }else if(select_2 == 2){
    d_category$Price[2]
  }else if(select_2 == 3){
    d_category$Price[3]
  }else if(select_2 == 4){
    d_category$Price[4]
  }
 }

# Main    
# greeting
print("Welcome to Datarockie Pizza ")
print("What's your name?")
name <- readLines("stdin", n=1)
print(paste("Hi!", name))
print("Please select category")


total_order <- NULL
x <- 0
  
# category
while(x<5){
  print(data.frame(category))
  print("What's number category?")
  print("category no. :")
  select_1 <- as.integer(readLines("stdin", n=1))

  select_category()

  # pick
  print("You pick No. :")
  select_2 <- as.integer(readLines("stdin", n=1))
  
  
  # how many
  print("How many pieces?")
  qty <- as.integer(readLines("stdin", n=1)) 
  list_order <- list(
    'No.' = user_pick(),     
    'Qty.'= qty,
    'Unit'= "pieces",
    'sum_price' = price_list()*qty,
    'Unit'= "THB")
  
  print("Would you like to order anything else?")
  YN <- c("Yes","No")
  num <- c(1,2) 
  print(data.frame(num, YN))
  more_pizza <- readLines("stdin", n=1)

  df_order <- data.frame(list_order)
  total_order <- rbind(total_order,df_order)
  
  x <- x+1
    
  if(more_pizza == 2){
    break
   }
    

}

# summarise order
cat("Total your order","----------------------------------",
   "----------------------------------",sep="\n")
print(total_order)
print(paste("Total amount :",sum(total_order$sum_price)))
cat("----------------------------------",
   "----------------------------------",sep="\n")
  
# get information
print("Got it. Just need your info and we are done")
print("Your name?")
name <- readLines("stdin", n=1)
print("Your mobile number?")
mobile <- readLines("stdin", n=1)
print("Your address?")
address <- readLines("stdin", n=1)

  
# payment
print("Do you pay cash or credit card ?")
print("1 = cash")
print("2 = credit card")
payment <- readLines("stdin", n=1)
  
print("Awesome. Your order is booked.")
print("Thank you")
