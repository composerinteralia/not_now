# Not Now

Why run code now when you can run it later?

It's a gem for some reason:
`gem install not_now`

A simple hello world app:

```rb
require 'not_now'

NotNow.(-> (later) {
  print "H"

  print_D = -> { print "D" }
  print_O = -> { print "O" }

  later.(-> {
    print "L"
    later.(-> { print "L" })

    NotNow.(-> (later) {
      later.(-> { print "W" })

      NotNow.(-> (later) {
        later.(print_O)
        later.(-> { print " " })
        print "L"
      })
    })

    print_O.()
    later.(print_D)
    print "R"
  })

  print "E"
})

print "!\n"
```
