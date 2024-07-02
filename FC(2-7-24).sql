toc.dat                                                                                             0000600 0004000 0002000 00000045034 14640777344 0014465 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   '    3                |            FarmConnect    16.2    16.2 =               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    51311    FarmConnect    DATABASE     �   CREATE DATABASE "FarmConnect" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "FarmConnect";
                postgres    false         �            1259    51672    cart    TABLE     �   CREATE TABLE public.cart (
    cartid bigint NOT NULL,
    userid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity numeric(10,2) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.cart;
       public         heap    postgres    false         �            1259    51671    cart_cartid_seq    SEQUENCE     x   CREATE SEQUENCE public.cart_cartid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.cart_cartid_seq;
       public          postgres    false    220                    0    0    cart_cartid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cart_cartid_seq OWNED BY public.cart.cartid;
          public          postgres    false    219         �            1259    51756    marketplaces    TABLE     
  CREATE TABLE public.marketplaces (
    marketid bigint NOT NULL,
    marketname character varying(100) NOT NULL,
    marketdescription text,
    marketlatitude numeric(10,8) NOT NULL,
    marketlongitude numeric(11,8) NOT NULL,
    marketaddress character varying(255) NOT NULL,
    marketopeningtime time without time zone,
    marketclosingtime time without time zone,
    marketimageurl character varying(255),
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);
     DROP TABLE public.marketplaces;
       public         heap    postgres    false         �            1259    51755    marketplaces_marketid_seq    SEQUENCE     �   CREATE SEQUENCE public.marketplaces_marketid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.marketplaces_marketid_seq;
       public          postgres    false    222                    0    0    marketplaces_marketid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.marketplaces_marketid_seq OWNED BY public.marketplaces.marketid;
          public          postgres    false    221         �            1259    51896    productlistings    TABLE       CREATE TABLE public.productlistings (
    listingid bigint NOT NULL,
    sellerid bigint NOT NULL,
    productid bigint NOT NULL,
    listingquantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);
 #   DROP TABLE public.productlistings;
       public         heap    postgres    false         �            1259    51895    productlistings_listingid_seq    SEQUENCE     �   CREATE SEQUENCE public.productlistings_listingid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.productlistings_listingid_seq;
       public          postgres    false    228                    0    0    productlistings_listingid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.productlistings_listingid_seq OWNED BY public.productlistings.listingid;
          public          postgres    false    227         �            1259    51837    products    TABLE     7  CREATE TABLE public.products (
    productid bigint NOT NULL,
    productname character varying(100) NOT NULL,
    productdescription text,
    productprice numeric(10,2) NOT NULL,
    producttypeid bigint NOT NULL,
    productmeasuretype character varying(10) NOT NULL,
    productimage character varying(255),
    maxquantity integer NOT NULL,
    availablequantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isavailable boolean DEFAULT true,
    isneeded boolean DEFAULT true,
    isdeleted boolean DEFAULT false
);
    DROP TABLE public.products;
       public         heap    postgres    false         �            1259    51836    products_productid_seq    SEQUENCE        CREATE SEQUENCE public.products_productid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.products_productid_seq;
       public          postgres    false    226         	           0    0    products_productid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;
          public          postgres    false    225         �            1259    51810    producttypes    TABLE     |   CREATE TABLE public.producttypes (
    producttypeid bigint NOT NULL,
    producttypename character varying(20) NOT NULL
);
     DROP TABLE public.producttypes;
       public         heap    postgres    false         �            1259    51809    producttypes_producttypeid_seq    SEQUENCE     �   CREATE SEQUENCE public.producttypes_producttypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.producttypes_producttypeid_seq;
       public          postgres    false    224         
           0    0    producttypes_producttypeid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.producttypes_producttypeid_seq OWNED BY public.producttypes.producttypeid;
          public          postgres    false    223         �            1259    51313    roles    TABLE     g   CREATE TABLE public.roles (
    roleid bigint NOT NULL,
    rolename character varying(10) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false         �            1259    51312    roles_roleid_seq    SEQUENCE     y   CREATE SEQUENCE public.roles_roleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.roles_roleid_seq;
       public          postgres    false    216                    0    0    roles_roleid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.roles_roleid_seq OWNED BY public.roles.roleid;
          public          postgres    false    215         �            1259    51322    users    TABLE     t  CREATE TABLE public.users (
    userid bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    roleid bigint NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    51321    users_userid_seq    SEQUENCE     y   CREATE SEQUENCE public.users_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    218                    0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    217         <           2604    51675    cart cartid    DEFAULT     j   ALTER TABLE ONLY public.cart ALTER COLUMN cartid SET DEFAULT nextval('public.cart_cartid_seq'::regclass);
 :   ALTER TABLE public.cart ALTER COLUMN cartid DROP DEFAULT;
       public          postgres    false    220    219    220         >           2604    51759    marketplaces marketid    DEFAULT     ~   ALTER TABLE ONLY public.marketplaces ALTER COLUMN marketid SET DEFAULT nextval('public.marketplaces_marketid_seq'::regclass);
 D   ALTER TABLE public.marketplaces ALTER COLUMN marketid DROP DEFAULT;
       public          postgres    false    221    222    222         G           2604    51899    productlistings listingid    DEFAULT     �   ALTER TABLE ONLY public.productlistings ALTER COLUMN listingid SET DEFAULT nextval('public.productlistings_listingid_seq'::regclass);
 H   ALTER TABLE public.productlistings ALTER COLUMN listingid DROP DEFAULT;
       public          postgres    false    227    228    228         B           2604    51840    products productid    DEFAULT     x   ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);
 A   ALTER TABLE public.products ALTER COLUMN productid DROP DEFAULT;
       public          postgres    false    225    226    226         A           2604    51813    producttypes producttypeid    DEFAULT     �   ALTER TABLE ONLY public.producttypes ALTER COLUMN producttypeid SET DEFAULT nextval('public.producttypes_producttypeid_seq'::regclass);
 I   ALTER TABLE public.producttypes ALTER COLUMN producttypeid DROP DEFAULT;
       public          postgres    false    224    223    224         8           2604    51316    roles roleid    DEFAULT     l   ALTER TABLE ONLY public.roles ALTER COLUMN roleid SET DEFAULT nextval('public.roles_roleid_seq'::regclass);
 ;   ALTER TABLE public.roles ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    216    215    216         9           2604    51325    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    217    218    218         �          0    51672    cart 
   TABLE DATA           N   COPY public.cart (cartid, userid, productid, quantity, createdat) FROM stdin;
    public          postgres    false    220       4855.dat �          0    51756    marketplaces 
   TABLE DATA           �   COPY public.marketplaces (marketid, marketname, marketdescription, marketlatitude, marketlongitude, marketaddress, marketopeningtime, marketclosingtime, marketimageurl, createdat, isdeleted) FROM stdin;
    public          postgres    false    222       4857.dat �          0    51896    productlistings 
   TABLE DATA           p   COPY public.productlistings (listingid, sellerid, productid, listingquantity, createdat, isdeleted) FROM stdin;
    public          postgres    false    228       4863.dat �          0    51837    products 
   TABLE DATA           �   COPY public.products (productid, productname, productdescription, productprice, producttypeid, productmeasuretype, productimage, maxquantity, availablequantity, createdat, isavailable, isneeded, isdeleted) FROM stdin;
    public          postgres    false    226       4861.dat �          0    51810    producttypes 
   TABLE DATA           F   COPY public.producttypes (producttypeid, producttypename) FROM stdin;
    public          postgres    false    224       4859.dat �          0    51313    roles 
   TABLE DATA           1   COPY public.roles (roleid, rolename) FROM stdin;
    public          postgres    false    216       4851.dat �          0    51322    users 
   TABLE DATA           k   COPY public.users (userid, firstname, lastname, email, password, roleid, createdat, isdeleted) FROM stdin;
    public          postgres    false    218       4853.dat            0    0    cart_cartid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.cart_cartid_seq', 13, true);
          public          postgres    false    219                    0    0    marketplaces_marketid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.marketplaces_marketid_seq', 6, true);
          public          postgres    false    221                    0    0    productlistings_listingid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.productlistings_listingid_seq', 13, true);
          public          postgres    false    227                    0    0    products_productid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.products_productid_seq', 9, true);
          public          postgres    false    225                    0    0    producttypes_producttypeid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.producttypes_producttypeid_seq', 3, true);
          public          postgres    false    223                    0    0    roles_roleid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.roles_roleid_seq', 3, true);
          public          postgres    false    215                    0    0    users_userid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_userid_seq', 12, true);
          public          postgres    false    217         S           2606    51678    cart cart_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cartid);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    220         U           2606    51765    marketplaces marketplaces_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.marketplaces
    ADD CONSTRAINT marketplaces_pkey PRIMARY KEY (marketid);
 H   ALTER TABLE ONLY public.marketplaces DROP CONSTRAINT marketplaces_pkey;
       public            postgres    false    222         ]           2606    51903 $   productlistings productlistings_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_pkey PRIMARY KEY (listingid);
 N   ALTER TABLE ONLY public.productlistings DROP CONSTRAINT productlistings_pkey;
       public            postgres    false    228         [           2606    51848    products products_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    226         W           2606    51815    producttypes producttypes_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_pkey PRIMARY KEY (producttypeid);
 H   ALTER TABLE ONLY public.producttypes DROP CONSTRAINT producttypes_pkey;
       public            postgres    false    224         Y           2606    51817 -   producttypes producttypes_producttypename_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_producttypename_key UNIQUE (producttypename);
 W   ALTER TABLE ONLY public.producttypes DROP CONSTRAINT producttypes_producttypename_key;
       public            postgres    false    224         K           2606    51318    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216         M           2606    51320    roles roles_rolename_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_rolename_key UNIQUE (rolename);
 B   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_rolename_key;
       public            postgres    false    216         O           2606    51333    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    218         Q           2606    51331    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218         _           2606    51679    cart cart_userid_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);
 ?   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_userid_fkey;
       public          postgres    false    218    220    4689         a           2606    51909 .   productlistings productlistings_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);
 X   ALTER TABLE ONLY public.productlistings DROP CONSTRAINT productlistings_productid_fkey;
       public          postgres    false    228    4699    226         b           2606    51904 -   productlistings productlistings_sellerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_sellerid_fkey FOREIGN KEY (sellerid) REFERENCES public.users(userid);
 W   ALTER TABLE ONLY public.productlistings DROP CONSTRAINT productlistings_sellerid_fkey;
       public          postgres    false    4689    218    228         `           2606    51849 $   products products_producttypeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_producttypeid_fkey FOREIGN KEY (producttypeid) REFERENCES public.producttypes(producttypeid);
 N   ALTER TABLE ONLY public.products DROP CONSTRAINT products_producttypeid_fkey;
       public          postgres    false    224    226    4695         ^           2606    51334    users users_roleid_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.roles(roleid);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_roleid_fkey;
       public          postgres    false    216    4683    218                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            4855.dat                                                                                            0000600 0004000 0002000 00000000053 14640777344 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        12	8	7	0.50	2024-07-02 03:24:39.75276
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     4857.dat                                                                                            0000600 0004000 0002000 00000002770 14640777344 0014307 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Shree Organic Farms	Organic fruits and vegetables directly from the farm.	22.98730000	72.50950000	Ahmedabad, Gujarat	08:00:00	18:00:00	https://cff2.earth.com/uploads/2023/05/16064103/Farms-scaled.jpg	2024-07-01 22:09:29.175815	f
2	Swastik Farm	Fresh dairy products from grass-fed cows.	23.02250000	72.57140000	Ahmedabad, Gujarat	07:30:00	17:30:00	https://ec.europa.eu/eurostat/documents/4187653/16403426/Martin%20Bergsma_Shutterstock_287378714_RV.jpg	2024-07-01 22:09:29.175815	f
3	Swasthya Harvest	Locally grown organic produce.	22.31770000	73.17640000	Vadodara, Gujarat	09:00:00	19:00:00	https://live.staticflickr.com/65535/50881797506_176f3d534f_z.jpg	2024-07-01 22:09:29.175815	f
4	Organic Mandala	Family-owned farm offering organic produce.	21.70510000	72.99590000	Surat, Gujarat	08:30:00	18:30:00	https://www.shutterstock.com/image-photo/thoroughbred-horses-grazing-sunset-field-600nw-1412323913.jpg	2024-07-01 22:09:29.175815	f
5	Farm Fresh India	Delivering fresh farm produce to your doorstep.	22.25870000	71.19240000	Rajkot, Gujarat	10:00:00	20:00:00	https://static8.depositphotos.com/1086305/849/i/450/depositphotos_8495323-stock-photo-american-country.jpg	2024-07-01 22:09:29.175815	f
6	Hariyali Farms	Sustainable farming with organic practices.	22.30720000	73.18120000	Anand, Gujarat	08:00:00	18:00:00	https://media.licdn.com/dms/image/D561BAQGIQhJMe9algQ/company-background_10000/0/1660545021462/frams_by_a_cover?e=2147483647&v=beta&t=v2jdEkSstoRiWxv5eVJzrcIr1DMlGUR5Q_RUpiW-U1E	2024-07-01 22:09:29.175815	f
\.


        4863.dat                                                                                            0000600 0004000 0002000 00000000753 14640777344 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	9	1	50	2024-07-02 00:56:58.643167	f
2	8	1	20	2024-07-02 02:16:33.646703	f
3	9	1	1	2024-07-02 02:19:21.326772	f
4	9	2	2	2024-07-02 02:21:06.535612	f
5	9	1	5	2024-07-02 02:21:06.578325	f
6	9	2	3	2024-07-02 02:27:11.825151	f
7	9	1	2	2024-07-02 02:27:11.867247	f
8	9	1	2	2024-07-02 03:19:00.005732	f
9	9	1	1	2024-07-02 03:19:59.155307	f
10	9	5	5	2024-07-02 03:24:02.298568	f
11	9	4	2	2024-07-02 03:24:02.408019	f
12	9	4	1	2024-07-02 06:15:59.584132	f
13	9	3	2	2024-07-02 06:16:31.72779	f
\.


                     4861.dat                                                                                            0000600 0004000 0002000 00000003256 14640777344 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        6	Fresh Oranges	Fresh and juicy oranges.	200.00	1	kg	https://tacomaboys.com/wp-content/uploads/2020/04/TB-27-8701-1024x588.jpg	0	500	2024-07-02 00:02:19.856283	t	t	f
7	Organic Tomatoes	Ripe and juicy organic tomatoes.	70.00	2	kg	https://i.cdn.newsbytesapp.com/images/l29720230821154142.jpeg	0	500	2024-07-02 00:02:19.856283	t	t	f
8	Fresh Spinach	Leafy green spinach, rich in nutrients.	60.00	2	kg	https://www.bigbasket.com/media/uploads/p/xxl/40200226_1-farmogo-spinach-hydroponically-grown.jpg	0	500	2024-07-02 00:02:19.856283	t	t	f
9	Grapes	Sweet and juicy organic grapes.	140.00	1	kg	https://upload.wikimedia.org/wikipedia/commons/3/36/Kyoho-grape.jpg	0	500	2024-07-02 00:02:19.856283	t	t	f
2	Fresh Carrots	Crisp and sweet carrots grown with love.	90.00	2	kg	https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/usa-new-york-city-carrots-for-sale-tetra-images.jpg	0	505	2024-07-02 00:02:19.856283	t	t	f
1	Organic Apples	Fresh and juicy organic apples from local farms.	120.00	1	kg	https://www.shimlafarms.com/cdn/shop/products/Redapple3.png?v=1675785288&width=1445	0	621	2024-07-02 00:02:19.856283	t	t	f
5	Organic Broccoli	Healthy and fresh organic broccoli.	80.00	2	kg	https://s.alicdn.com/@sc04/kf/A4f577b2659534d3292fd568d359d9cc5j.jpg_300x300.jpg	0	505	2024-07-02 00:02:19.856283	t	t	f
4	Fresh Strawberries	Sweet and juicy strawberries freshly picked.	150.00	1	kg	https://d3fwccq2bzlel7.cloudfront.net/Pictures/480xany/5/8/8/35588_2_1203853_e.jpg	0	503	2024-07-02 00:02:19.856283	t	t	f
3	Dairy Milk	Pure and fresh milk from grass-fed cows.	50.00	3	L	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFLbH-mTn8P736RPcSHkV16rhLF1vZvStQMg&s	0	502	2024-07-02 00:02:19.856283	t	t	f
\.


                                                                                                                                                                                                                                                                                                                                                  4859.dat                                                                                            0000600 0004000 0002000 00000000043 14640777344 0014300 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	fruits
2	vegetables
3	dairy
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             4851.dat                                                                                            0000600 0004000 0002000 00000000036 14640777344 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	admin
2	buyer
3	seller
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  4853.dat                                                                                            0000600 0004000 0002000 00000001360 14640777344 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Karan	Prajapati	admin@gmail.com	admin123	1	2024-06-25 00:01:05.154676	f
3	John	Doe	john.doe@example.com	12345678	2	2024-06-25 00:43:05.961642	f
4	User	1	user1@gmail.com	12345678	2	2024-06-25 00:47:28.964899	f
5	User	2	user2@gmail.com	12345678	2	2024-06-25 00:50:25.399585	f
6	User	3	user3@gmail.com	12345678	2	2024-06-25 02:19:01.066005	f
7	User	4	user4@gmail.com	12345678	2	2024-06-25 02:23:18.561352	f
8	buyer	1	buyer1@gmail.com	buyer1	2	2024-06-26 02:39:06.867154	f
9	seller	1	seller1@gmail.com	seller1	3	2024-06-26 02:39:41.634285	f
10	demo	user	demo@gmail.com	12345678	2	2024-06-26 06:06:50.232887	f
11	Jade	Blue	jb@gmail.com	12345678	2	2024-06-27 00:04:48.226276	f
12	Arti	Kant	artikant23@gmail.com	Akant@23	2	2024-06-28 02:26:38.116068	f
\.


                                                                                                                                                                                                                                                                                restore.sql                                                                                         0000600 0004000 0002000 00000036533 14640777344 0015416 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "FarmConnect";
--
-- Name: FarmConnect; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "FarmConnect" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE "FarmConnect" OWNER TO postgres;

\connect "FarmConnect"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    cartid bigint NOT NULL,
    userid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity numeric(10,2) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_cartid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_cartid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_cartid_seq OWNER TO postgres;

--
-- Name: cart_cartid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_cartid_seq OWNED BY public.cart.cartid;


--
-- Name: marketplaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marketplaces (
    marketid bigint NOT NULL,
    marketname character varying(100) NOT NULL,
    marketdescription text,
    marketlatitude numeric(10,8) NOT NULL,
    marketlongitude numeric(11,8) NOT NULL,
    marketaddress character varying(255) NOT NULL,
    marketopeningtime time without time zone,
    marketclosingtime time without time zone,
    marketimageurl character varying(255),
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);


ALTER TABLE public.marketplaces OWNER TO postgres;

--
-- Name: marketplaces_marketid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marketplaces_marketid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.marketplaces_marketid_seq OWNER TO postgres;

--
-- Name: marketplaces_marketid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marketplaces_marketid_seq OWNED BY public.marketplaces.marketid;


--
-- Name: productlistings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productlistings (
    listingid bigint NOT NULL,
    sellerid bigint NOT NULL,
    productid bigint NOT NULL,
    listingquantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);


ALTER TABLE public.productlistings OWNER TO postgres;

--
-- Name: productlistings_listingid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productlistings_listingid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productlistings_listingid_seq OWNER TO postgres;

--
-- Name: productlistings_listingid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productlistings_listingid_seq OWNED BY public.productlistings.listingid;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid bigint NOT NULL,
    productname character varying(100) NOT NULL,
    productdescription text,
    productprice numeric(10,2) NOT NULL,
    producttypeid bigint NOT NULL,
    productmeasuretype character varying(10) NOT NULL,
    productimage character varying(255),
    maxquantity integer NOT NULL,
    availablequantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isavailable boolean DEFAULT true,
    isneeded boolean DEFAULT true,
    isdeleted boolean DEFAULT false
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_productid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_productid_seq OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- Name: producttypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producttypes (
    producttypeid bigint NOT NULL,
    producttypename character varying(20) NOT NULL
);


ALTER TABLE public.producttypes OWNER TO postgres;

--
-- Name: producttypes_producttypeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producttypes_producttypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producttypes_producttypeid_seq OWNER TO postgres;

--
-- Name: producttypes_producttypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producttypes_producttypeid_seq OWNED BY public.producttypes.producttypeid;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    roleid bigint NOT NULL,
    rolename character varying(10) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_roleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_roleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_roleid_seq OWNER TO postgres;

--
-- Name: roles_roleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_roleid_seq OWNED BY public.roles.roleid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    roleid bigint NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_userid_seq OWNER TO postgres;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: cart cartid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN cartid SET DEFAULT nextval('public.cart_cartid_seq'::regclass);


--
-- Name: marketplaces marketid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marketplaces ALTER COLUMN marketid SET DEFAULT nextval('public.marketplaces_marketid_seq'::regclass);


--
-- Name: productlistings listingid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlistings ALTER COLUMN listingid SET DEFAULT nextval('public.productlistings_listingid_seq'::regclass);


--
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- Name: producttypes producttypeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producttypes ALTER COLUMN producttypeid SET DEFAULT nextval('public.producttypes_producttypeid_seq'::regclass);


--
-- Name: roles roleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN roleid SET DEFAULT nextval('public.roles_roleid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (cartid, userid, productid, quantity, createdat) FROM stdin;
\.
COPY public.cart (cartid, userid, productid, quantity, createdat) FROM '$$PATH$$/4855.dat';

--
-- Data for Name: marketplaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marketplaces (marketid, marketname, marketdescription, marketlatitude, marketlongitude, marketaddress, marketopeningtime, marketclosingtime, marketimageurl, createdat, isdeleted) FROM stdin;
\.
COPY public.marketplaces (marketid, marketname, marketdescription, marketlatitude, marketlongitude, marketaddress, marketopeningtime, marketclosingtime, marketimageurl, createdat, isdeleted) FROM '$$PATH$$/4857.dat';

--
-- Data for Name: productlistings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productlistings (listingid, sellerid, productid, listingquantity, createdat, isdeleted) FROM stdin;
\.
COPY public.productlistings (listingid, sellerid, productid, listingquantity, createdat, isdeleted) FROM '$$PATH$$/4863.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (productid, productname, productdescription, productprice, producttypeid, productmeasuretype, productimage, maxquantity, availablequantity, createdat, isavailable, isneeded, isdeleted) FROM stdin;
\.
COPY public.products (productid, productname, productdescription, productprice, producttypeid, productmeasuretype, productimage, maxquantity, availablequantity, createdat, isavailable, isneeded, isdeleted) FROM '$$PATH$$/4861.dat';

--
-- Data for Name: producttypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producttypes (producttypeid, producttypename) FROM stdin;
\.
COPY public.producttypes (producttypeid, producttypename) FROM '$$PATH$$/4859.dat';

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (roleid, rolename) FROM stdin;
\.
COPY public.roles (roleid, rolename) FROM '$$PATH$$/4851.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, firstname, lastname, email, password, roleid, createdat, isdeleted) FROM stdin;
\.
COPY public.users (userid, firstname, lastname, email, password, roleid, createdat, isdeleted) FROM '$$PATH$$/4853.dat';

--
-- Name: cart_cartid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cartid_seq', 13, true);


--
-- Name: marketplaces_marketid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marketplaces_marketid_seq', 6, true);


--
-- Name: productlistings_listingid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productlistings_listingid_seq', 13, true);


--
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_productid_seq', 9, true);


--
-- Name: producttypes_producttypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producttypes_producttypeid_seq', 3, true);


--
-- Name: roles_roleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_roleid_seq', 3, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 12, true);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cartid);


--
-- Name: marketplaces marketplaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marketplaces
    ADD CONSTRAINT marketplaces_pkey PRIMARY KEY (marketid);


--
-- Name: productlistings productlistings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_pkey PRIMARY KEY (listingid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- Name: producttypes producttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_pkey PRIMARY KEY (producttypeid);


--
-- Name: producttypes producttypes_producttypename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_producttypename_key UNIQUE (producttypename);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);


--
-- Name: roles roles_rolename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_rolename_key UNIQUE (rolename);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: cart cart_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: productlistings productlistings_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: productlistings productlistings_sellerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_sellerid_fkey FOREIGN KEY (sellerid) REFERENCES public.users(userid);


--
-- Name: products products_producttypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_producttypeid_fkey FOREIGN KEY (producttypeid) REFERENCES public.producttypes(producttypeid);


--
-- Name: users users_roleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.roles(roleid);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     