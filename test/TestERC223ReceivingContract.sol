pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/ExampleToken.sol";
import "./mocks/ERC223ReceivingContractMock.sol";

contract TestERC223ReceivingContract {
    ExampleToken token;
    ERC223ReceivingContractMock receiver;

    function beforeEach() public {
        token = new ExampleToken();
        receiver = new ERC223ReceivingContractMock();
        token.mint(address(this), 100);
    }

    function testTransferToERC223TokenContract() public {
        bytes memory data = "Hola Mundo";
        token.transfer(receiver, 10, data);

        Assert.equal(receiver.sender(), address(this), 'Sender should be correct');
        Assert.equal(receiver.value(), 10, 'Value should be correct');
      //Assert.equal(receiver.data(), data, 'Data should be correct');
    }
}