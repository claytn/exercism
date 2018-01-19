{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_space_age (
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
version = Version [1,1,0,4] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/cmarshall/Documents/Development/exercism/haskell/space-age/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/bin"
libdir     = "/Users/cmarshall/Documents/Development/exercism/haskell/space-age/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/lib/x86_64-osx-ghc-8.2.2/space-age-1.1.0.4-GQ4rwh3T1BzFnuEXTwIP4M-test"
dynlibdir  = "/Users/cmarshall/Documents/Development/exercism/haskell/space-age/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/lib/x86_64-osx-ghc-8.2.2"
datadir    = "/Users/cmarshall/Documents/Development/exercism/haskell/space-age/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/share/x86_64-osx-ghc-8.2.2/space-age-1.1.0.4"
libexecdir = "/Users/cmarshall/Documents/Development/exercism/haskell/space-age/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/libexec/x86_64-osx-ghc-8.2.2/space-age-1.1.0.4"
sysconfdir = "/Users/cmarshall/Documents/Development/exercism/haskell/space-age/.stack-work/install/x86_64-osx/lts-10.2/8.2.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "space_age_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "space_age_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "space_age_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "space_age_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "space_age_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "space_age_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
