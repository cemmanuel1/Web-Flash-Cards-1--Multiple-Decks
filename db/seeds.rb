deck_capitols = Deck.create(name: 'State Capitols')

deck_capitols.cards.create(question: 'Capitol of Delaware?', answer: 'Dover')
deck_capitols.cards.create(question: 'Capitol of Idaho?',  answer: 'Boise')
deck_capitols.cards.create(question: 'Capitol of Louisiana?', answer:  'Baton Rouge')

deck_fun = Deck.create(name:  'Fun Questions')

deck_fun.cards.create(question: "What is Navid's favorite beer?", answer: "Carlsberg")
deck_fun.cards.create(question: "How many bones can you break in your body?", answer: "206")
deck_fun.cards.create(question: "What do you calll a fish with no eye?", answer: "Fssh")