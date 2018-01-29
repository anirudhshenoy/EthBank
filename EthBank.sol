pragma solidity ^0.4.17;

/**
 * The EthBank contract does this and that...
 */

 import "./Ownable.sol";

contract EthBank is Ownable {
	
	uint interest_rate_savings = 5;

	struct accountData {
		uint deposit_timestamp;
		uint amount;
		uint lock_time;
		
	}
	
	mapping (address=> accountData) getAccounts;

	event funds_withdrawn (uint amount);
    event funds_deposit (uint amount, address depositor);

    function deposit_savings() public payable {     
        getAccounts[msg.sender].amount=msg.value;
        getAccounts[msg.sender].deposit_timestamp=now; 
        funds_deposit(getAccounts[msg.sender].amount, msg.sender); 
    }

    function check_balance () public view returns (uint) {
    	accountData memory account= getAccounts[msg.sender];
    	uint current_balance = account.amount *( 1 + (interest_rate_savings/100)*
    						(now-account.deposit_timestamp));
    	return current_balance;
    }

    function withdraw_funds() public {
        require (getAccounts[msg.sender].amount > 0);
        msg.sender.transfer(getAccounts[msg.sender].amount);
        funds_withdrawn(getAccounts[msg.sender].amount);
        getAccounts[msg.sender].amount=0;
    }

    function update_interest_rate_savings (uint _interest_rate_savings ) public onlyOwner {
    	interest_rate_savings=_interest_rate_savings;
    }

    function check_interest_rate_savings() public view returns (uint) {
    	return interest_rate_savings;
    }
}

