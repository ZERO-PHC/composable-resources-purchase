// Players.cdc
//
// The Players contract defines two types of NFTs.
// One is a Sword, which represents a special hat, and
// the second is the Player resource, which can own Player Hats.
//
// You can put the hats on the cats and then call a hat function
// that tips the hat and prints a fun message.
// 
// This is a simple example of how Cadence supports
// extensibility for smart contracts, but the language will soon
// support even more powerful versions of this.
//
// Learn more about composable resources in this tutorial: https://docs.onflow.org/docs/composable-resources-Player-hats

pub contract Players {



    // Sword is a special resource type that represents a weapon
    pub resource Sword {
        pub let id: Int
        pub let name: String

        init(id: Int, name: String) {
            self.id = id
            self.name = name
        }
    }

    

    // Create a new sword
    pub fun createSword(id: Int, name: String): @Sword {
        return <-create Sword(id: id, name: name)
    }

    pub resource Player {

        pub let id: Int

        // place where the Player swords are stored
        pub let weapons: @{String: Sword}

        init(newID: Int) {
            self.id = newID
            self.weapons <- {}
        }

        destroy() {
            destroy self.weapons
        }
    }

    pub fun createPlayer(): @Player {
        return <-create Player(newID: 1)
    }
}
