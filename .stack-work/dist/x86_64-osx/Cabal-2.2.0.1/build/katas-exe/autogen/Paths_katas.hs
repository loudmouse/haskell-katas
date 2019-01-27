{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_katas (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/nneeley/future_finance/haskell-katas/.stack-work/install/x86_64-osx/lts-12.6/8.4.3/bin"
libdir     = "/Users/nneeley/future_finance/haskell-katas/.stack-work/install/x86_64-osx/lts-12.6/8.4.3/lib/x86_64-osx-ghc-8.4.3/katas-0.1.0.0-B7HxHfwPLLg3Qg5rtWBVkX-katas-exe"
dynlibdir  = "/Users/nneeley/future_finance/haskell-katas/.stack-work/install/x86_64-osx/lts-12.6/8.4.3/lib/x86_64-osx-ghc-8.4.3"
datadir    = "/Users/nneeley/future_finance/haskell-katas/.stack-work/install/x86_64-osx/lts-12.6/8.4.3/share/x86_64-osx-ghc-8.4.3/katas-0.1.0.0"
libexecdir = "/Users/nneeley/future_finance/haskell-katas/.stack-work/install/x86_64-osx/lts-12.6/8.4.3/libexec/x86_64-osx-ghc-8.4.3/katas-0.1.0.0"
sysconfdir = "/Users/nneeley/future_finance/haskell-katas/.stack-work/install/x86_64-osx/lts-12.6/8.4.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "katas_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "katas_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "katas_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "katas_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "katas_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "katas_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
