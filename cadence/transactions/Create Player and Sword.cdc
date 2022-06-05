import Players from 0x01

// This transaction creates a new player, creates a sword and
// puts the sword on the player. Then it stores the player in account storage.
transaction {
    prepare(acct: AuthAccount) {

        // Create the player object
        let player <- Players.createPlayer()

        // Create the playerHat objects
        let sword1 <- Players.createSword(id: 1, name: "Katana")

        // init payment

        //check balance 

        // transfer flow tokens  

        // Put the Sword on the Player!
        let playerSword <- player.weapons["Katana"] <- sword1
        destroy playerSword
       

        log("The cat has the hats")

        // Store the player in storage
        acct.save(<-player, to: /storage/player)
    }
}
