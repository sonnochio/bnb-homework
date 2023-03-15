##Security Risks
https://gist.github.com/extropyCoder/156a26c5ba5a9148dc38740eb43f7d60
###Overall analysis
This is an unfair lottery and the distributed amount is unmatched with the claimed amount.

###Detailed Error Spotted
- prizeAmount should be private or internal, not public. exposure to prize modification.
- constructor empty while it should set the prizeAmount here.
- num_players++ should be included in the if statement.
- winnersPaid event falsly emitted when players reaches 50.
- pickWinner function shoulnd't be public. Users might use it for multiple entries.
- payout function called when 100 entires reached. Actual distributed amount amountToPay should be set to prizeAmount / prize_winners.length, not prize_winners.length / 100, which is a far less prize.
- distributePrize shouldn't be public, transfered amount is at risk of exploition of any amount.
