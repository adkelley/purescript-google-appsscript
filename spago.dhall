{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "google-appsscript"
, dependencies =
  [ "console"
  , "effect"
  , "foreign"
  , "foreign-object"
  , "functions"
  , "js-date"
  , "nullable"
  , "options"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
