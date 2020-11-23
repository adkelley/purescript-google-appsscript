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

-- | Deletes all properties in the current Properties store.
foreign import deleteAllProperties :: Properties -> GASEff Properties

foreign import deletePropertyImpl :: Fn2 String Properties (GASEff Properties)

-- | Gets all keys in the current Properties store.
foreign import getKeys :: Properties -> GASEff (Array String)

-- | Gets a copy of all key-value pairs in the current Properties store. 
foreign import getProperties :: Properties -> GASEff Props

foreign import getPropertyImpl :: Fn2 String Properties (GASEff (Nullable String))

foreign import setPropertiesImpl :: Fn2 Props Properties (GASEff Properties)

foreign import setPropertyImpl :: Fn3 String String Properties (GASEff Properties)

-- | Sets the given key-value pair in the current Properties store.
setProperty :: String -> String -> Properties -> GASEff Properties
setProperty k v p = runFn3 setPropertyImpl k v p

-- | Sets all key-value pairs from the given object in the current Properties store.
setProperties :: Props -> Properties -> GASEff Properties
setProperties pp p = runFn2 setPropertiesImpl pp p

-- | Gets (Just value) associated with the given key in the current Properties store, or Nothing if 
-- | no such key exists.
getProperty :: String -> Properties -> GASEff (Maybe String)
getProperty k p = toMaybe <$> runFn2 getPropertyImpl k p

-- | Deletes the property with the given key in the current Properties store.
deleteProperty :: String -> Properties -> GASEff Properties
deleteProperty k p = runFn2 deletePropertyImpl k p
