pragma solidity = 0.8.26;
contract BallotV2 {

    struct Voter {
        uint weight;
        bool voted;
        uint vote;
    }

    struct Proposal {
        uint voteCount;
    }

    address chairPerson;
    mapping(address => Voter) voters;
    Proposal[] proposals;

	enum Phase {Init, Regs, Vote, Done}

	Phase public state = Phase.Init;

	constructor (uint numProposals) public  {
		chairPerson = msg.sender;
		voters[chairPerson].weight = 2;
		for (uint prop = 0; prop < numProposals; prop++)
			proposals.push(Proposal(0)); 
	}

	// function for changing Phase; can be done only by chairPerson
	function changeState(Phase ) public {
		if (msg.sender != chairPerson) { revert(); }

		if (x < state) revert();

		state = x;
	}
		
}
