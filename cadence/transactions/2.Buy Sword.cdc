import Players from 0x01

// This transaction creates a new player, creates a sword and
// puts the sword on the player. Then it stores the player in account storage.
transaction {
    prepare(acct: AuthAccount) {

        // get resources refs

        // init payment

        //check balance 

        // transfer flow tokens  

        // Puts the Sword on the Player!
        let playerSword <- player.weapons["Katana"] <- sword1
        destroy playerSword
       

        log("The player has the sword")

        // Store the player in storage
        acct.save(<-player, to: /storage/player)
    }
}
