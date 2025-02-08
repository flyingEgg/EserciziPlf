{-# LANGUAGE OverloadedStrings #-}

import Database.PostgreSQL.Simple
import Control.Exception (try, SomeException)

main :: IO ()
main = do
    -- Configurazione della connessione al database
    let connInfo = defaultConnectInfo {
          connectHost     = "localhost",  -- Host del database
          connectPort     = 3306,         -- Porta del database
          connectUser     = "root", -- Nome utente
          connectPassword = "", -- Password
          connectDatabase = "vendita_libri"      -- Nome del database
        }

    -- Tentativo di connessione al database
    result <- try (connect connInfo) :: IO (Either SomeException Connection)

    case result of
        Left  err -> putStrLn $ "Errore di connessione: " ++ show err
        Right conn -> do
            putStrLn "Connessione al database riuscita!"

            -- Esegui una query di esempio
            rows <- query_ conn "SELECT * FROM tua_tabella LIMIT 5" :: IO [Only Int]
            mapM_ (print . fromOnly) rows

            -- Chiudi la connessione
            close conn
            putStrLn "Connessione chiusa."