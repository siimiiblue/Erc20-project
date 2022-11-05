// SPDX-License-Identifier: MIT(
pragma solidity ^0.8.0;

interface ITOKEN {
//create a function that returns total number of tokens in circulation
function totalSupply()external view returns(uint);

//create a function that returns the balance of an inputed address
function balanceOf(address account)external view returns(uint);

//create a function that allows us to send tokens and returns the status of the transaction as a bool data type
function transfer(address recipient, uint amount) external returns(bool);

//create a function that enables us assign allowance to a spenders address
function allowance(address owner, address spender) external view returns(uint);

//create a function to approve the maximum spend limit for the allowance
function approve(address spender,uint amount) external returns(bool);

//create a function that grants spender access to the allowance
function transferFrom(address owner, address recipient, uint amount) external returns(bool);


//create an event transfer and approve to emit our transaction status to frontend
event Transfer(address indexed to, address indexed from, uint amount);
event Approve(address indexed owner, address indexed spender, uint amount);
}
