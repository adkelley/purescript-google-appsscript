module Google.AppsScript.Properties.Properties
  ( Props
  , deleteAllProperties
  , deleteProperty
  , getKeys
  , getProperties
  , getProperty
  , setProperties
  , setProperty
  ) where

import Prelude
import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Data.Maybe (Maybe)
import Data.Nullable (toMaybe, Nullable)
import Foreign.Object (Object)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Properties.PropertiesService (Properties)

type Props
  = Object String

-- TODO: Document these FFs
foreign import deleteAllProperties :: Properties -> GASEff Properties

foreign import deletePropertyImpl :: Fn2 String Properties (GASEff Properties)

foreign import getKeys :: Properties -> GASEff (Array String)

foreign import getProperties :: Properties -> GASEff Props

foreign import getPropertyImpl :: Fn2 String Properties (GASEff (Nullable String))

foreign import setPropertiesImpl :: Fn2 Props Properties (GASEff Properties)

foreign import setPropertyImpl :: Fn3 String String Properties (GASEff Properties)

setProperty :: String -> String -> Properties -> GASEff Properties
setProperty k v p = runFn3 setPropertyImpl k v p

-- TODO: verify setProperties(properties), setProperties(properties, deleteAllOthers)
setProperties :: Props -> Properties -> GASEff Properties
setProperties pp p = runFn2 setPropertiesImpl pp p

getProperty :: String -> Properties -> GASEff (Maybe String)
getProperty k p = toMaybe <$> runFn2 getPropertyImpl k p

deleteProperty :: String -> Properties -> GASEff Properties
deleteProperty k p = runFn2 deletePropertyImpl k p
