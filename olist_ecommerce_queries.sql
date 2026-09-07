-- ============================================
-- Olist E-Commerce SQL Analysis
-- Database: olist_project
-- Tool: MySQL Workbench
-- ============================================

CREATE DATABASE olist_project;
USE olist_project;
SHOW TABLES;


-- ============================================
-- DATASET OVERVIEW
-- ============================================

SELECT COUNT(*) AS customers 
FROM olist_customers_dataset;

SELECT COUNT(*) AS geolocation 
FROM olist_geolocation_dataset;

SELECT COUNT(*) AS sellers 
FROM olist_sellers_dataset;

SELECT COUNT(*) AS orders 
FROM olist_orders_dataset;

SELECT COUNT(order_id) AS total_order_items 
FROM olist_order_items_dataset;

SELECT COUNT(*) AS payments 
FROM olist_order_payments_dataset;

SELECT COUNT(*) AS reviews 
FROM olist_order_reviews_dataset;

SELECT COUNT(*) AS products 
FROM olist_products_dataset;

SELECT COUNT(*) AS categories 
FROM product_category_name_translation;


-- ============================================
-- BASIC ANALYSIS
-- ============================================

-- How many customers are there in the Olist dataset?
SELECT COUNT(*) AS total_customer 
FROM olist_customers_dataset;


-- How many orders are there in the Olist dataset?
SELECT COUNT(*) AS total_orders 
FROM olist_orders_dataset;


-- How many products are in the dataset?
SELECT COUNT(*) AS total_products 
FROM olist_products_dataset;


-- How many sellers are in the dataset?
SELECT COUNT(*) AS total_sellers 
FROM olist_sellers_dataset;


-- What is the total payment value?
SELECT SUM(payment_value) AS total_payment
FROM olist_order_payments_dataset;


-- ============================================
-- PAYMENT ANALYSIS
-- ============================================

-- Which payment method is used most frequently?
SELECT 
    payment_type,
    COUNT(*) AS payment_count
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY payment_count DESC;


-- Which payment method generates the highest average payment value?
SELECT 
    payment_type,
    AVG(payment_value) AS average_payment
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY average_payment DESC;


-- ============================================
-- PRODUCT CATEGORY ANALYSIS
-- ============================================

-- Which product categories generate the most sales?
SELECT 
    t.product_category_name_english AS category,
    SUM(oi.price) AS total_sales
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
JOIN product_category_name_translation t
    ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english
ORDER BY total_sales DESC
LIMIT 10;


-- Which product categories have generated the highest total revenue,
-- and what is their average order-item price?
SELECT 
    t.product_category_name_english AS category,
    SUM(oi.price) AS total_revenue,
    AVG(oi.price) AS average_price
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
JOIN product_category_name_translation t
    ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;


-- Which product categories generated the highest total revenue,
-- and how many products were sold in each category?
SELECT
    p.product_category_name AS category,
    SUM(oi.price) AS total_revenue,
    COUNT(oi.product_id) AS products_sold
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


-- Which product categories have the highest average review score,
-- and how many orders does each category have?
SELECT
    p.product_category_name AS category,
    AVG(r.review_score) AS average_review_score,
    COUNT(DISTINCT r.order_id) AS total_orders
FROM olist_order_reviews_dataset r
JOIN olist_order_items_dataset oi
    ON r.order_id = oi.order_id
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY average_review_score DESC;


-- ============================================
-- SELLER ANALYSIS
-- ============================================

-- Which sellers generate the highest total sales?
SELECT 
    s.seller_id,
    SUM(oi.price) AS total_sales
FROM olist_sellers_dataset s
JOIN olist_order_items_dataset oi
    ON s.seller_id = oi.seller_id
GROUP BY s.seller_id
ORDER BY total_sales DESC
LIMIT 10;


-- Which sellers are ranked highest based on their total sales revenue?
SELECT 
    seller_id,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS seller_rank
FROM (
    SELECT 
        seller_id, 
        SUM(price) AS total_sales
    FROM olist_order_items_dataset
    GROUP BY seller_id
) AS seller_sales
ORDER BY seller_rank
LIMIT 10;


-- Which sellers generated the highest total revenue,
-- and how many orders did they receive?
SELECT 
    s.seller_id, 
    COUNT(DISTINCT o.order_id) AS total_orders, 
    SUM(oi.price) AS total_revenue
FROM olist_sellers_dataset s
JOIN olist_order_items_dataset oi
    ON s.seller_id = oi.seller_id
JOIN olist_orders_dataset o
    ON oi.order_id = o.order_id
GROUP BY s.seller_id
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================
-- REVIEW / ORDER STATUS ANALYSIS
-- ============================================

-- What is the average review score for each order status?
SELECT 
    o.order_status,
    AVG(r.review_score) AS average_review_score
FROM olist_orders_dataset o
JOIN olist_order_reviews_dataset r
    ON o.order_id = r.order_id
GROUP BY o.order_status
ORDER BY average_review_score DESC;


-- ============================================
-- END OF ANALYSIS
-- ============================================
