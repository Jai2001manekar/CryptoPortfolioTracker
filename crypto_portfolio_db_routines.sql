-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: crypto_portfolio_db
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `full_portfolio_overview`
--

DROP TABLE IF EXISTS `full_portfolio_overview`;
/*!50001 DROP VIEW IF EXISTS `full_portfolio_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `full_portfolio_overview` AS SELECT 
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `wallet_id`,
 1 AS `wallet_name`,
 1 AS `crypto`,
 1 AS `holding_qty`,
 1 AS `avg_cost`,
 1 AS `current_price`,
 1 AS `market_value`,
 1 AS `cost_basis`,
 1 AS `unrealized_pnl`,
 1 AS `realized_pnl`,
 1 AS `total_pnl`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `unrealized_pnl_view`
--

DROP TABLE IF EXISTS `unrealized_pnl_view`;
/*!50001 DROP VIEW IF EXISTS `unrealized_pnl_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `unrealized_pnl_view` AS SELECT 
 1 AS `wallet_id`,
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `wallet_name`,
 1 AS `crypto`,
 1 AS `quantity`,
 1 AS `avg_cost`,
 1 AS `current_price`,
 1 AS `unrealized_pnl`,
 1 AS `market_value`,
 1 AS `cost_basis`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `realized_pnl_summary`
--

DROP TABLE IF EXISTS `realized_pnl_summary`;
/*!50001 DROP VIEW IF EXISTS `realized_pnl_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `realized_pnl_summary` AS SELECT 
 1 AS `wallet_id`,
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `wallet_name`,
 1 AS `crypto`,
 1 AS `total_realized_pnl`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `passbook_view`
--

DROP TABLE IF EXISTS `passbook_view`;
/*!50001 DROP VIEW IF EXISTS `passbook_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passbook_view` AS SELECT 
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `wallet_name`,
 1 AS `crypto`,
 1 AS `transaction_type`,
 1 AS `amount`,
 1 AS `price_per_coin`,
 1 AS `transaction_date`,
 1 AS `current_holding_after`,
 1 AS `average_buy_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `full_portfolio_overview`
--

/*!50001 DROP VIEW IF EXISTS `full_portfolio_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `full_portfolio_overview` AS select `u`.`user_id` AS `user_id`,`u`.`name` AS `user_name`,`w`.`wallet_id` AS `wallet_id`,`w`.`wallet_name` AS `wallet_name`,`up`.`crypto` AS `crypto`,coalesce(`up`.`quantity`,0) AS `holding_qty`,coalesce(`up`.`avg_cost`,0) AS `avg_cost`,coalesce(`up`.`current_price`,0) AS `current_price`,coalesce(`up`.`market_value`,0) AS `market_value`,coalesce(`up`.`cost_basis`,0) AS `cost_basis`,coalesce(`up`.`unrealized_pnl`,0) AS `unrealized_pnl`,coalesce(`r`.`total_realized_pnl`,0) AS `realized_pnl`,(coalesce(`up`.`unrealized_pnl`,0) + coalesce(`r`.`total_realized_pnl`,0)) AS `total_pnl` from (((`unrealized_pnl_view` `up` left join `realized_pnl_summary` `r` on(((`up`.`wallet_id` = `r`.`wallet_id`) and (`up`.`crypto` = `r`.`crypto`)))) join `wallet` `w` on((`up`.`wallet_id` = `w`.`wallet_id`))) join `user` `u` on((`w`.`user_id` = `u`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unrealized_pnl_view`
--

/*!50001 DROP VIEW IF EXISTS `unrealized_pnl_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `unrealized_pnl_view` AS select `w`.`wallet_id` AS `wallet_id`,`u`.`user_id` AS `user_id`,`u`.`name` AS `user_name`,`w`.`wallet_name` AS `wallet_name`,`c`.`symbol` AS `crypto`,`h`.`quantity` AS `quantity`,`h`.`avg_cost` AS `avg_cost`,`c`.`current_price` AS `current_price`,round(((`c`.`current_price` - `h`.`avg_cost`) * `h`.`quantity`),2) AS `unrealized_pnl`,round((`h`.`quantity` * `c`.`current_price`),2) AS `market_value`,round((`h`.`quantity` * `h`.`avg_cost`),2) AS `cost_basis` from (((`holding` `h` join `wallet` `w` on((`h`.`wallet_id` = `w`.`wallet_id`))) join `user` `u` on((`w`.`user_id` = `u`.`user_id`))) join `cryptocurrency` `c` on((`h`.`crypto_id` = `c`.`crypto_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `realized_pnl_summary`
--

/*!50001 DROP VIEW IF EXISTS `realized_pnl_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `realized_pnl_summary` AS select `w`.`wallet_id` AS `wallet_id`,`u`.`user_id` AS `user_id`,`u`.`name` AS `user_name`,`w`.`wallet_name` AS `wallet_name`,`c`.`symbol` AS `crypto`,sum(`r`.`realized_pnl`) AS `total_realized_pnl` from (((`realized_pnl` `r` join `wallet` `w` on((`r`.`wallet_id` = `w`.`wallet_id`))) join `user` `u` on((`w`.`user_id` = `u`.`user_id`))) join `cryptocurrency` `c` on((`r`.`crypto_id` = `c`.`crypto_id`))) group by `w`.`wallet_id`,`c`.`crypto_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passbook_view`
--

/*!50001 DROP VIEW IF EXISTS `passbook_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passbook_view` AS select `u`.`user_id` AS `user_id`,`u`.`name` AS `user_name`,`w`.`wallet_name` AS `wallet_name`,`c`.`symbol` AS `crypto`,`t`.`transaction_type` AS `transaction_type`,`t`.`amount` AS `amount`,`t`.`price_per_coin` AS `price_per_coin`,`t`.`transaction_date` AS `transaction_date`,`h`.`quantity` AS `current_holding_after`,`h`.`avg_cost` AS `average_buy_price` from ((((`transaction` `t` join `wallet` `w` on((`t`.`wallet_id` = `w`.`wallet_id`))) join `user` `u` on((`w`.`user_id` = `u`.`user_id`))) join `cryptocurrency` `c` on((`t`.`crypto_id` = `c`.`crypto_id`))) left join `holding` `h` on(((`h`.`wallet_id` = `w`.`wallet_id`) and (`h`.`crypto_id` = `c`.`crypto_id`)))) order by `u`.`user_id`,`t`.`transaction_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'crypto_portfolio_db'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `daily_price_snapshot` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `daily_price_snapshot` ON SCHEDULE EVERY 1 DAY STARTS '2025-08-06 00:05:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL TakeDailyPriceSnapshot() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'crypto_portfolio_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `LoginUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LoginUser`(
    IN input_email VARCHAR(100),
    IN input_password VARCHAR(255)
)
BEGIN
    DECLARE count_user INT;

    SELECT COUNT(*) INTO count_user
    FROM User
    WHERE email = input_email AND password_hash = input_password;

    IF count_user = 1 THEN
        SELECT 'Login Successful. Access Granted!' AS message;
    ELSE
        SELECT 'Access Denied. Invalid Email or Password.' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcessTrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcessTrade`(
    IN p_wallet_id INT,
    IN p_symbol VARCHAR(10),
    IN p_type ENUM('BUY','SELL'),
    IN p_amount DECIMAL(30,8),
    IN p_price DECIMAL(30,8)
)
BEGIN
    DECLARE p_crypto_id INT;
    DECLARE existing_qty DECIMAL(30,8);
    DECLARE existing_avg_cost DECIMAL(30,8);
    DECLARE new_qty DECIMAL(30,8);
    DECLARE new_avg_cost DECIMAL(30,8);
    DECLARE realized DECIMAL(30,8);
    
    -- Resolve crypto_id
    SELECT crypto_id INTO p_crypto_id FROM Cryptocurrency WHERE symbol = p_symbol;

    -- Insert into Transaction log
    INSERT INTO Transaction (wallet_id, crypto_id, transaction_type, amount, price_per_coin)
    VALUES (p_wallet_id, p_crypto_id, p_type, p_amount, p_price);

    -- Check if holding exists
    SELECT quantity, avg_cost INTO existing_qty, existing_avg_cost
    FROM Holding
    WHERE wallet_id = p_wallet_id AND crypto_id = p_crypto_id
    FOR UPDATE;

    IF p_type = 'BUY' THEN
        IF existing_qty IS NULL THEN
            -- No prior holding: insert new
            INSERT INTO Holding (wallet_id, crypto_id, quantity, avg_cost)
            VALUES (p_wallet_id, p_crypto_id, p_amount, p_price);
        ELSE
            -- Update weighted average cost
            SET new_qty = existing_qty + p_amount;
            SET new_avg_cost = ((existing_qty * existing_avg_cost) + (p_amount * p_price)) / new_qty;
            UPDATE Holding
            SET quantity = new_qty,
                avg_cost = new_avg_cost
            WHERE wallet_id = p_wallet_id AND crypto_id = p_crypto_id;
        END IF;
    ELSEIF p_type = 'SELL' THEN
        -- Ensure enough quantity
        IF existing_qty IS NULL OR existing_qty < p_amount THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient holdings to sell';
        ELSE
            -- Realized PnL using existing_avg_cost
            SET realized = (p_price - existing_avg_cost) * p_amount;

            -- Record realized PnL
            INSERT INTO Realized_PnL (
                wallet_id, crypto_id, sell_amount, sell_price_per_coin, avg_cost_at_sale, realized_pnl
            ) VALUES (
                p_wallet_id, p_crypto_id, p_amount, p_price, existing_avg_cost, realized
            );

            -- Reduce holding quantity (avg_cost remains same unless quantity becomes zero)
            SET new_qty = existing_qty - p_amount;
            IF new_qty = 0 THEN
                DELETE FROM Holding
                WHERE wallet_id = p_wallet_id AND crypto_id = p_crypto_id;
            ELSE
                UPDATE Holding
                SET quantity = new_qty
                WHERE wallet_id = p_wallet_id AND crypto_id = p_crypto_id;
            END IF;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TakeDailyPriceSnapshot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TakeDailyPriceSnapshot`()
BEGIN
    INSERT INTO Price_History (crypto_id, price, recorded_at)
    SELECT crypto_id, current_price, CURDATE()
    FROM Cryptocurrency
    ON DUPLICATE KEY UPDATE
        price = VALUES(price);  -- optional: overwrite if already exists for today
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TradeCrypto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TradeCrypto`(
    IN p_wallet_id INT,
    IN p_symbol VARCHAR(10),
    IN p_type ENUM('BUY', 'SELL'),
    IN p_amount DECIMAL(18,8),
    IN p_price DECIMAL(18,8)
)
BEGIN
    DECLARE p_crypto_id INT;

    -- Get crypto ID based on symbol
    SELECT crypto_id INTO p_crypto_id FROM Cryptocurrency WHERE symbol = p_symbol;

    -- Insert transaction
    INSERT INTO Transaction (wallet_id, crypto_id, transaction_type, amount, price_per_coin)
    VALUES (p_wallet_id, p_crypto_id, p_type, p_amount, p_price);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-06  4:53:50
