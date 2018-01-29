# Ethereum Bank


## Data structure
interest_rate_savings
interest_rate_FD
struct {
	deposit date
	amount
	lock time
}

##Functions

### Deposit()
Payable function, send value in ETH 

### Fixed_deposit(uint locktime)
Payable function, lock funds 

### Check Balance
Viewable calculate interest

### Withdraw()
Withdraw amount, check ownership, add interest earned, send transaction 

### Get_loan

## Ownable Functions

### Set Interest Rate 

### Deposit 

### Check bank balance 