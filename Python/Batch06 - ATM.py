# -*- coding: utf-8 -*-

# -- Sheet --

# # ATM


class ATM:
    def __init__(self, acc_num, bank_acc):
        self.acc_num = acc_num
        self.bank = bank_acc

    def check_balance(self,balance):
        print(f"You balance : {balance} bath")

    def Transfer(self):
        Tr_amount = input("Transfer amount: ")
        print("------------------------------------")
        print("Choose Bank Account")
        print(*bank_list, sep="\n")
        transfer_to = input("Transfer to:")
        print("------------------------------------")
        input("account no. : ")
        print(f"Transfer amount {Tr_amount} bath to {bank_list[ATM.bank_acc - 1][1]}")

    def withdrawal(self):
        int(input("Withdrawal amount: "))
        print(f"Withdrawal amount {wd} bath")

    def payment(self):
        print("Choose Utility")
        public_utility = ("1.Electricity", "2.Gas", "3.Water", "4.Mobile")
        print(*public_utility, sep="\n")
        print("------------------------------------")
        u_no = int(input("Utility no. : "))
        paid = input("Paid amount : ")
        print("Paid",public_utility[u_no - 1],paid,"bath")

print("Insert PIN code (4 digit)")

while True:
    user_input = input("PIN:")

    if len(user_input) == 4:
        break
    else :
        print('Enter exactly 4 digit.')

# choose bank
print("Choose Bank Account")
bank_list = ((1,"SCB"), (2,"K-bank"), (3,"TTB"))
print(*bank_list, sep="\n")
ATM.bank_acc = int(input("Bank account:"))

# account number
print("------------------------------------")
ATM.acc_num = input(f"{bank_list[ATM.bank_acc - 1][1]} account number:")
print("------------------------------------")

# transaction
print("Choose a transaction")
transaction = ("1.Check balance", "2.Transfer", "3.Withdrawal", "4.Payment")
print(*transaction, sep="\n")
choose_no = int(input("choose no.:"))
print("------------------------------------")
print(transaction[choose_no - 1])

ATM = ATM(ATM.acc_num,ATM.bank_acc)

if choose_no == 1:
    ATM.check_balance(100000)
elif choose_no == 2:
    ATM.Transfer()
elif choose_no == 3:
    ATM.withdrawal()
elif choose_no == 4:
    ATM.payment()

