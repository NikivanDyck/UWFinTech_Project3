pragma solidity ^0.5.0;

/*The Ownable contract has an owner address, and provides basic authorization control
 functions, basically for "user permissions".
 */
contract Ownable {
    address public owner;

    /* An event is an inheritable member of the contract, 
    which stores the arguments passed in the transaction logs when emitted. */

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
    The Ownable constructor sets the original `owner` of the contract to the sender
    account.
    */
    constructor() public {
        owner = msg.sender;
    }
    /**
    Throws if called by any account other than the owner.
    */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
    Allows the current owner to transfer control of the contract to a newOwner.
    newOwner The address to transfer ownership to.
    */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}