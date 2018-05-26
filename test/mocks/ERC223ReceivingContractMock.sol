pragma solidity 0.4.23;

import '../../contracts/ERC223ReceivingContract.sol';

 /*
 * Contract that is working with ERC223 tokens
 */

contract ERC223ReceivingContractMock is ERC223ReceivingContract {
    address public sender;
    uint public value;
    bytes public data;

    function tokenFallback(address _from, uint _value, bytes _data) public {
        //TKN memory tkn;
        sender = _from;
        value = _value;
        data = _data;
      /* tkn variable is analogue of msg variable of Ether transaction
      *  tkn.sender is person who initiated this token transaction   (analogue of msg.sender)
      *  tkn.value the number of tokens that were sent   (analogue of msg.value)
      *  tkn.data is data of token transaction   (analogue of msg.data)
      */
    }
}