describe "Win/Lose Scenarios", ->

  xit "should say the player wins if 21 >= player score > dealer score", ->
    testGame = new App()
    # init a new deck
    # testDeck = testGame.get 'deck'
    card1 = new Card(
      rank: 1
      suit: 0
    )
    card2 = new Card(
      rank: 2
      suit: 0
    )

    myhand = new Hand [card1, card2]
    dealerhand = new Hand [card1, card2], null, true
    # plaer card = 1 and 10
    # dealer card = 2 and 10
    # compare score
    # expect(myhand).toEqual dealerhand
