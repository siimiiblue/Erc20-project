// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//import interphase file
import "November/projectinterphase.sol";

contract miniproject is ITOKEN{//create a contract named miniproject

//Keyword 'override' will be added to every function/variable that exists in the interphase to prevent a clash
uint public override totalSupply= 10**24;  //create a variable totalsupply of type uint 

mapping (address=>uint)public override balanceOf; //create a mapping called balanceOf that connects an address to its balance
mapping(address => mapping (address => uint)) public override allowance; //create a nested mapping to map the spenders allowance in a mapping of owners address

string public name= "tech4dev"; //create a variable to declare our token name
string public symbol="T4D"; //create a variable to declare our token symbol
uint public decimals= 18; //create a variable decimals to declare our token in units

function transfer(address recipient, uint amount) external override returns(bool){//insert an argument to be executed when this function is called
balanceOf[msg.sender] -= amount; //This line of code ensures the amount being transferred is deducted from the owners address and reflects on the balance
balanceOf[recipient] += amount; //This line of code ensures the amount being transferred is added to the recipients wallet and reflects on the balance

emit Transfer(msg.sender, recipient, amount);//This line of code is to emit the status of our transaction when function transfer is called.
    return true;//it returns true when all input is valid and transaction is successful
}

function approve(address spender,uint amount) external override returns(bool){//create a function to approve the maximum spend limit for the allowance
    allowance[msg.sender][spender] = amount;//this line of code specificies the address of sender, spender and amount to be approved

    emit Approve(msg.sender, spender,amount);//This line //of code is to emit the status of our transaction when function transfer is called.
    return true;//it returns true when all input is valid and transaction is successful
}

function transferFrom(address owner, address recipient, uint amount)external override returns(bool){//create a function that grants spender access to the allowance and takes an inpot of owners address, recipients address and amount
allowance[owner][msg.sender] -= amount;//this line of code specificies the address of owner, spender as msg.sender and amount to be approved
balanceOf[owner] -= amount;//This line of code ensures the amount being transferred is deducted from the owners address and reflects on the balance
balanceOf[recipient] += amount;//This line of code ensures the amount being transferred is added to the recipients wallet and reflects on the balance

emit Transfer(owner, recipient, amount);//This line of code is to broadcast the status of our transaction when function transferFrom is called.
return true;//it returns true when all input is valid and transaction is successful
}

function mint(uint amount)external {//This function is used to create new tokens and it takes an input of the amount of tokens you want to create
balanceOf[msg.sender] += amount;//this line of code adds the newly minted token to the balance of msg.sender
totalSupply += amount;//this line of code adds the newly minted token to the total supply of tokens in circulation
emit Transfer(address(0), msg.sender, amount);//this line of code is to broadcast the status of our transaction, address(0) means we are creating/minting from a non existent address
}

function burn(uint amount) external{//This function is used to destroy a specific amount of tokens and it takes an input of the amount of tokens you want to create
    balanceOf[msg.sender] -= amount;//This line of code removes the ampount of tokens to be destroyed from msg.sender balance
    totalSupply -= amount;//This line of code removes the amount of tokens to be destroyed from the totall supply in circulation
    emit Transfer(msg.sender, address(0), amount);//this line of code is to broadcast the status of our transaction, address(0) means we are destroying by sending to a non existent address

}
}