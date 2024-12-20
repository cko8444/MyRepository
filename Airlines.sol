pragma solidity ^0.8.26.0;
contract Airlines {
    address chairPerson;
    struct details {
        uint escrow;
        uint status;
        uint hashOfDetails;
    }
    
    mapping (address=>details) public balanceDetails;
    mapping (address=>uint) membership;

    // modifiers or rules
    modifier onlyChairPerson {
        require(msg.sender == chairPerson);
        _;
    }

    modifier onlyMember {
        require (membership[msg.sender] == 1);
        _;
    }

    // constructor function
    constructor() public payable {

        chairPerson = msg.sender;
        membership[msg.sender] = 1;
        balanceDetails[msg.sender].escrow = msg.value;
    }

    function register() public payable {
        address AirlineA = msg.sender;
        membership[AirlineA] = 1;
        balanceDetails[msg.sender].escrow = msg.value;
    }

    function unregister(address payable AirlineZ) onlyChairPerson public {
        if (chairPerson != msg.sender) {
            revert();
        }
        membership[AirlineZ] = 0;

        // return escrow to leaving airline: verify other conditions
        AirlineZ.transfer(balanceDetails[AirlineZ].escrow);
        balanceDetails[AirlineZ].escrow = 0;
    }

    function request(address toAirline, uint hashOfDetails) onlyMember public {
        if (membership[toAirline] != 1) {
            revert();
        }
        balanceDetails[msg.sender].status = 0;
        balanceDetails[msg.sender].hashOfDetails = hashOfDetails;
    }

    function response(address fromAirline, uint hashOfDetails, uint done) onlyMember public {
        if (membership[fromAirline] != 1) {
            revert();
        }
        balanceDetails[msg.sender].status = done;
        balanceDetails[fromAirline].hashOfDetails = hashOfDetails;
    }

    function settlePayment(address payable toAirline) onlyMember payable public {
        address fromAirline = msg.sender;
        uint amt = msg.value;
        balanceDetails[toAirline].escrow = balanceDetails[toAirline].escrow + amt;

        // amt subtracted from msg.sender and given to toAirline
        toAirline.transfer(amt);
    }
}
