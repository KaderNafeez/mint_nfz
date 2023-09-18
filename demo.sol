pragma solidity 0.5.1;
contract cryptcoin

  {
    address public mint;
    mapping (address => uint) public balance;
    event send(address from,address to, uint amount);

    constructor() public {
        mint =msg.sender;
    }
    function mints(address reciever, uint amount) public {

        require(msg.sender == mint);
        require(amount < 1e60);
        balance[reciever] += amount;
    }     

    function sent(address reciever, uint amount) public {
        require(amount <= balance[msg.sender],"Insufficent balance to send");
        balance[msg.sender] -= amount;
        balance[reciever] += amount;
        emit send(msg.sender,reciever,amount);
    }
    function rem_balance(address _account) external view returns (uint)
    {
        return balance[_account];
    }
}