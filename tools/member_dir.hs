import Control.Monad
import Data.Bool
import Data.List
import Data.Char
import System.FilePath
import System.Directory
import System.Posix.Files
import System.Exit

main :: IO ()
main = do
	bool (exit msgTopDir) (return ()) =<< (&&)
		<$> doesFileExist ".uuid"
		<*> ((== uuidTopDir) . head . lines <$> readFile ".uuid")
	lkd <- lines <$> readFile "events/linked"
	eds <- (\\ lkd) . filter ("event_" `isPrefixOf`)
		<$> getDirectoryContents "events"
	forM_ eds $ \ed -> do
		print ed
		mapM_ (symlink ed) . filter (isUpper . head)
			=<< getDirectoryContents ("events" </> ed)

symlink :: FilePath -> FilePath -> IO ()
symlink ed md = do
	createDirectoryIfMissing False m
	createSymbolicLink ("../../events" </> ed </> md) (m </> ed)
	putStrLn $ "ln ../../events/" ++ ed ++ " " ++ (m </> ed)
	appendFile "events/linked" (ed ++ "\n")
	where
	m = "members" </> md

msgTopDir, uuidTopDir :: String
msgTopDir = "Error: run in top directory"
uuidTopDir = "c116e0c8-1cac-4fe0-ba39-987a99f866fe"

exit :: String -> IO ()
exit = (>> exitFailure) . putStrLn
