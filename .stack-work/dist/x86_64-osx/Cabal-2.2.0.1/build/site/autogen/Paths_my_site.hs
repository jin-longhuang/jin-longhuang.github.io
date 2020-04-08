{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_my_site (
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

bindir     = "/Users/danny/my-site/.stack-work/install/x86_64-osx/1ac0b580a95208e3e19f27bd9a7ed3dbbbe555240cd178cdf6e98057f1afc2b5/8.4.4/bin"
libdir     = "/Users/danny/my-site/.stack-work/install/x86_64-osx/1ac0b580a95208e3e19f27bd9a7ed3dbbbe555240cd178cdf6e98057f1afc2b5/8.4.4/lib/x86_64-osx-ghc-8.4.4/my-site-0.1.0.0-D4ZyHs7tFYFC8goSvXQq3M-site"
dynlibdir  = "/Users/danny/my-site/.stack-work/install/x86_64-osx/1ac0b580a95208e3e19f27bd9a7ed3dbbbe555240cd178cdf6e98057f1afc2b5/8.4.4/lib/x86_64-osx-ghc-8.4.4"
datadir    = "/Users/danny/my-site/.stack-work/install/x86_64-osx/1ac0b580a95208e3e19f27bd9a7ed3dbbbe555240cd178cdf6e98057f1afc2b5/8.4.4/share/x86_64-osx-ghc-8.4.4/my-site-0.1.0.0"
libexecdir = "/Users/danny/my-site/.stack-work/install/x86_64-osx/1ac0b580a95208e3e19f27bd9a7ed3dbbbe555240cd178cdf6e98057f1afc2b5/8.4.4/libexec/x86_64-osx-ghc-8.4.4/my-site-0.1.0.0"
sysconfdir = "/Users/danny/my-site/.stack-work/install/x86_64-osx/1ac0b580a95208e3e19f27bd9a7ed3dbbbe555240cd178cdf6e98057f1afc2b5/8.4.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "my_site_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "my_site_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "my_site_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "my_site_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "my_site_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "my_site_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
