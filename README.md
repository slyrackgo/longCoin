# longCoin

The Healthcare Reward Smart Contract is designed to facilitate a crypto reward system within a healthcare app. 
It allows healthcare providers to reward patients with tokens for various positive behaviors.

Key Functionalities:
A. Initialization: Upon deployment, the contract is initialized with the token name "LongevityToken" and symbol "LONG". The address of the deploying healthcare provider is also set.
B. Reward Amount Setting: The healthcare provider can set the reward amount using the setRewardAmount function.
C. Reward Granting: The healthcare provider can grant rewards to patients using the grantReward function by specifying the patient's Ethereum address and the reward amount. The specified amount is transferred from the contract's address to the patient's address.
D. Reward Claiming: Patients can claim their earned rewards through the claimReward function. The tokens are transferred from the patient's address back to the contract, making them available for future withdrawals.
E. Get Provider Address: Anyone can retrieve the current healthcare provider's address using the getProvider function.
