{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_leap (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,3,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/cmarshall/Documents/Development/exercism/haskell/leap/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/bin"
libdir     = "/Users/cmarshall/Documents/Development/exercism/haskell/leap/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/lib/x86_64-osx-ghc-8.2.2/leap-1.3.0.6-2ImAYgMC9Ay5QGoF3TkkNb"
dynlibdir  = "/Users/cmarshall/Documents/Development/exercism/haskell/leap/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/lib/x86_64-osx-ghc-8.2.2"
datadir    = "/Users/cmarshall/Documents/Development/exercism/haskell/leap/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/share/x86_64-osx-ghc-8.2.2/leap-1.3.0.6"
libexecdir = "/Users/cmarshall/Documents/Development/exercism/haskell/leap/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/libexec/x86_64-osx-ghc-8.2.2/leap-1.3.0.6"
sysconfdir = "/Users/cmarshall/Documents/Development/exercism/haskell/leap/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "leap_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "leap_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "leap_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "leap_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "leap_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "leap_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
