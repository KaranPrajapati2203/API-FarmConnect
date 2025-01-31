toc.dat                                                                                             0000600 0004000 0002000 00000060646 14643456734 0014473 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP        '        
        |            FarmConnect    16.2    16.2 O    !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         $           1262    51311    FarmConnect    DATABASE     �   CREATE DATABASE "FarmConnect" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "FarmConnect";
                postgres    false         �            1259    52217    cart    TABLE     �   CREATE TABLE public.cart (
    cartid bigint NOT NULL,
    userid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity numeric(10,2) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.cart;
       public         heap    postgres    false         �            1259    52216    cart_cartid_seq    SEQUENCE     x   CREATE SEQUENCE public.cart_cartid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.cart_cartid_seq;
       public          postgres    false    230         %           0    0    cart_cartid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cart_cartid_seq OWNED BY public.cart.cartid;
          public          postgres    false    229         �            1259    51756    marketplaces    TABLE     
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
       public          postgres    false    220         &           0    0    marketplaces_marketid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.marketplaces_marketid_seq OWNED BY public.marketplaces.marketid;
          public          postgres    false    219         �            1259    52235 
   orderitems    TABLE       CREATE TABLE public.orderitems (
    orderitemid bigint NOT NULL,
    orderid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity numeric(10,2) NOT NULL,
    price numeric(10,2) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.orderitems;
       public         heap    postgres    false         �            1259    52234    orderitems_orderitemid_seq    SEQUENCE     �   CREATE SEQUENCE public.orderitems_orderitemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.orderitems_orderitemid_seq;
       public          postgres    false    232         '           0    0    orderitems_orderitemid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.orderitems_orderitemid_seq OWNED BY public.orderitems.orderitemid;
          public          postgres    false    231         �            1259    52145    orders    TABLE     {  CREATE TABLE public.orders (
    orderid bigint NOT NULL,
    userid bigint NOT NULL,
    totalamount numeric(10,2) NOT NULL,
    orderdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    orderstatus character varying(50) DEFAULT 'Pending'::character varying,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);
    DROP TABLE public.orders;
       public         heap    postgres    false         �            1259    52144    orders_orderid_seq    SEQUENCE     {   CREATE SEQUENCE public.orders_orderid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.orders_orderid_seq;
       public          postgres    false    224         (           0    0    orders_orderid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;
          public          postgres    false    223         �            1259    52198    productlistings    TABLE     Q  CREATE TABLE public.productlistings (
    listingid bigint NOT NULL,
    sellerid bigint NOT NULL,
    productid bigint NOT NULL,
    productmeasuretype character varying(10) NOT NULL,
    listingquantity numeric(10,2) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);
 #   DROP TABLE public.productlistings;
       public         heap    postgres    false         �            1259    52197    productlistings_listingid_seq    SEQUENCE     �   CREATE SEQUENCE public.productlistings_listingid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.productlistings_listingid_seq;
       public          postgres    false    228         )           0    0    productlistings_listingid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.productlistings_listingid_seq OWNED BY public.productlistings.listingid;
          public          postgres    false    227         �            1259    52180    products    TABLE     �  CREATE TABLE public.products (
    productid bigint NOT NULL,
    productname character varying(100) NOT NULL,
    productdescription text,
    buyingprice numeric(10,2) NOT NULL,
    sellingprice numeric(10,2) NOT NULL,
    producttypeid bigint NOT NULL,
    productmeasuretype character varying(10) NOT NULL,
    productimage character varying(255),
    maxquantity numeric(10,2) DEFAULT 500 NOT NULL,
    availablequantity numeric(10,2) DEFAULT 500 NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isavailable boolean DEFAULT true,
    isneeded boolean DEFAULT true,
    isdeleted boolean DEFAULT false
);
    DROP TABLE public.products;
       public         heap    postgres    false         �            1259    52179    products_productid_seq    SEQUENCE        CREATE SEQUENCE public.products_productid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.products_productid_seq;
       public          postgres    false    226         *           0    0    products_productid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;
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
       public          postgres    false    222         +           0    0    producttypes_producttypeid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.producttypes_producttypeid_seq OWNED BY public.producttypes.producttypeid;
          public          postgres    false    221         �            1259    51313    roles    TABLE     g   CREATE TABLE public.roles (
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
       public          postgres    false    216         ,           0    0    roles_roleid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.roles_roleid_seq OWNED BY public.roles.roleid;
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
       public          postgres    false    218         -           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    217         Y           2604    52220    cart cartid    DEFAULT     j   ALTER TABLE ONLY public.cart ALTER COLUMN cartid SET DEFAULT nextval('public.cart_cartid_seq'::regclass);
 :   ALTER TABLE public.cart ALTER COLUMN cartid DROP DEFAULT;
       public          postgres    false    230    229    230         F           2604    51759    marketplaces marketid    DEFAULT     ~   ALTER TABLE ONLY public.marketplaces ALTER COLUMN marketid SET DEFAULT nextval('public.marketplaces_marketid_seq'::regclass);
 D   ALTER TABLE public.marketplaces ALTER COLUMN marketid DROP DEFAULT;
       public          postgres    false    219    220    220         [           2604    52238    orderitems orderitemid    DEFAULT     �   ALTER TABLE ONLY public.orderitems ALTER COLUMN orderitemid SET DEFAULT nextval('public.orderitems_orderitemid_seq'::regclass);
 E   ALTER TABLE public.orderitems ALTER COLUMN orderitemid DROP DEFAULT;
       public          postgres    false    231    232    232         J           2604    52148    orders orderid    DEFAULT     p   ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);
 =   ALTER TABLE public.orders ALTER COLUMN orderid DROP DEFAULT;
       public          postgres    false    224    223    224         V           2604    52201    productlistings listingid    DEFAULT     �   ALTER TABLE ONLY public.productlistings ALTER COLUMN listingid SET DEFAULT nextval('public.productlistings_listingid_seq'::regclass);
 H   ALTER TABLE public.productlistings ALTER COLUMN listingid DROP DEFAULT;
       public          postgres    false    228    227    228         O           2604    52183    products productid    DEFAULT     x   ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);
 A   ALTER TABLE public.products ALTER COLUMN productid DROP DEFAULT;
       public          postgres    false    225    226    226         I           2604    51813    producttypes producttypeid    DEFAULT     �   ALTER TABLE ONLY public.producttypes ALTER COLUMN producttypeid SET DEFAULT nextval('public.producttypes_producttypeid_seq'::regclass);
 I   ALTER TABLE public.producttypes ALTER COLUMN producttypeid DROP DEFAULT;
       public          postgres    false    222    221    222         B           2604    51316    roles roleid    DEFAULT     l   ALTER TABLE ONLY public.roles ALTER COLUMN roleid SET DEFAULT nextval('public.roles_roleid_seq'::regclass);
 ;   ALTER TABLE public.roles ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    216    215    216         C           2604    51325    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    218    217    218                   0    52217    cart 
   TABLE DATA           N   COPY public.cart (cartid, userid, productid, quantity, createdat) FROM stdin;
    public          postgres    false    230       4892.dat           0    51756    marketplaces 
   TABLE DATA           �   COPY public.marketplaces (marketid, marketname, marketdescription, marketlatitude, marketlongitude, marketaddress, marketopeningtime, marketclosingtime, marketimageurl, createdat, isdeleted) FROM stdin;
    public          postgres    false    220       4882.dat           0    52235 
   orderitems 
   TABLE DATA           a   COPY public.orderitems (orderitemid, orderid, productid, quantity, price, createdat) FROM stdin;
    public          postgres    false    232       4894.dat           0    52145    orders 
   TABLE DATA           l   COPY public.orders (orderid, userid, totalamount, orderdate, orderstatus, createdat, isdeleted) FROM stdin;
    public          postgres    false    224       4886.dat           0    52198    productlistings 
   TABLE DATA           �   COPY public.productlistings (listingid, sellerid, productid, productmeasuretype, listingquantity, createdat, isdeleted) FROM stdin;
    public          postgres    false    228       4890.dat           0    52180    products 
   TABLE DATA           �   COPY public.products (productid, productname, productdescription, buyingprice, sellingprice, producttypeid, productmeasuretype, productimage, maxquantity, availablequantity, createdat, isavailable, isneeded, isdeleted) FROM stdin;
    public          postgres    false    226       4888.dat           0    51810    producttypes 
   TABLE DATA           F   COPY public.producttypes (producttypeid, producttypename) FROM stdin;
    public          postgres    false    222       4884.dat           0    51313    roles 
   TABLE DATA           1   COPY public.roles (roleid, rolename) FROM stdin;
    public          postgres    false    216       4878.dat           0    51322    users 
   TABLE DATA           k   COPY public.users (userid, firstname, lastname, email, password, roleid, createdat, isdeleted) FROM stdin;
    public          postgres    false    218       4880.dat .           0    0    cart_cartid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.cart_cartid_seq', 19, true);
          public          postgres    false    229         /           0    0    marketplaces_marketid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.marketplaces_marketid_seq', 6, true);
          public          postgres    false    219         0           0    0    orderitems_orderitemid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.orderitems_orderitemid_seq', 15, true);
          public          postgres    false    231         1           0    0    orders_orderid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_orderid_seq', 15, true);
          public          postgres    false    223         2           0    0    productlistings_listingid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.productlistings_listingid_seq', 5, true);
          public          postgres    false    227         3           0    0    products_productid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_productid_seq', 14, true);
          public          postgres    false    225         4           0    0    producttypes_producttypeid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.producttypes_producttypeid_seq', 3, true);
          public          postgres    false    221         5           0    0    roles_roleid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.roles_roleid_seq', 3, true);
          public          postgres    false    215         6           0    0    users_userid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_userid_seq', 13, true);
          public          postgres    false    217         r           2606    52223    cart cart_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cartid);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    230         f           2606    51765    marketplaces marketplaces_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.marketplaces
    ADD CONSTRAINT marketplaces_pkey PRIMARY KEY (marketid);
 H   ALTER TABLE ONLY public.marketplaces DROP CONSTRAINT marketplaces_pkey;
       public            postgres    false    220         t           2606    52241    orderitems orderitems_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (orderitemid);
 D   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_pkey;
       public            postgres    false    232         l           2606    52154    orders orders_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    224         p           2606    52205 $   productlistings productlistings_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_pkey PRIMARY KEY (listingid);
 N   ALTER TABLE ONLY public.productlistings DROP CONSTRAINT productlistings_pkey;
       public            postgres    false    228         n           2606    52191    products products_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    226         h           2606    51815    producttypes producttypes_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_pkey PRIMARY KEY (producttypeid);
 H   ALTER TABLE ONLY public.producttypes DROP CONSTRAINT producttypes_pkey;
       public            postgres    false    222         j           2606    51817 -   producttypes producttypes_producttypename_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_producttypename_key UNIQUE (producttypename);
 W   ALTER TABLE ONLY public.producttypes DROP CONSTRAINT producttypes_producttypename_key;
       public            postgres    false    222         ^           2606    51318    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216         `           2606    51320    roles roles_rolename_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_rolename_key UNIQUE (rolename);
 B   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_rolename_key;
       public            postgres    false    216         b           2606    51333    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    218         d           2606    51331    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218         z           2606    52229    cart cart_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);
 B   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_productid_fkey;
       public          postgres    false    4718    226    230         {           2606    52224    cart cart_userid_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);
 ?   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_userid_fkey;
       public          postgres    false    4708    230    218         |           2606    52242 "   orderitems orderitems_orderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);
 L   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_orderid_fkey;
       public          postgres    false    232    4716    224         }           2606    52247 $   orderitems orderitems_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);
 N   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_productid_fkey;
       public          postgres    false    232    4718    226         v           2606    52155    orders orders_userid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);
 C   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_userid_fkey;
       public          postgres    false    224    4708    218         x           2606    52211 .   productlistings productlistings_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);
 X   ALTER TABLE ONLY public.productlistings DROP CONSTRAINT productlistings_productid_fkey;
       public          postgres    false    4718    228    226         y           2606    52206 -   productlistings productlistings_sellerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_sellerid_fkey FOREIGN KEY (sellerid) REFERENCES public.users(userid);
 W   ALTER TABLE ONLY public.productlistings DROP CONSTRAINT productlistings_sellerid_fkey;
       public          postgres    false    218    4708    228         w           2606    52192 $   products products_producttypeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_producttypeid_fkey FOREIGN KEY (producttypeid) REFERENCES public.producttypes(producttypeid);
 N   ALTER TABLE ONLY public.products DROP CONSTRAINT products_producttypeid_fkey;
       public          postgres    false    226    222    4712         u           2606    51334    users users_roleid_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.roles(roleid);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_roleid_fkey;
       public          postgres    false    218    216    4702                                                                                                  4892.dat                                                                                            0000600 0004000 0002000 00000000005 14643456734 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4882.dat                                                                                            0000600 0004000 0002000 00000003220 14643456734 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Kalupur Market	Organic fruits and vegetables directly from the farm.	23.02470000	72.60270000	Kalupur, Ahmedabad	08:00:00	18:00:00	https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/d3/c2/93/popular-market.jpg?w=1200&h=-1&s=1	2024-07-01 22:09:29.175815	f
5	Vasna Market Yard	Delivering fresh farm produce to your doorstep.	22.99960000	72.56000000	Vasna, Ahmedabad	10:00:00	20:00:00	https://www.treehugger.com/thmb/Ih1TNwrrqqzayy8NZ4XWK4aTK4s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/assorted-fruits-and-vegetables-at-the-farmer-s-market-in-vienna--austria-695527058-67c93b8f4ce345d097380b046b4e05a2.jpg	2024-07-01 22:09:29.175815	f
6	Naroda Vegetable Market	Sustainable farming with organic practices.	23.08270000	72.64860000	Naroda, Ahmedabad	08:00:00	18:00:00	https://seoulsearching.net/wp-content/uploads/2021/01/img_7592b.jpg	2024-07-01 22:09:29.175815	f
2	Jamalpur Market	Fresh dairy products from grass-fed cows.	23.00950000	72.58250000	Jamalpur, Ahmedabad	07:30:00	17:30:00	https://images.unsplash.com/photo-1572402123736-c79526db405a?fm=jpg&w=3000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fG1hcmtldHxlbnwwfHwwfHx8MA%3D%3D	2024-07-01 22:09:29.175815	f
4	Geeta Mandir Market	Family-owned farm offering organic produce.	23.01700000	72.57360000	Astodia, Ahmedabad	08:30:00	18:30:00	https://cdn.pixabay.com/photo/2024/02/19/07/54/farmers-local-market-8582783_640.jpg	2024-07-01 22:09:29.175815	f
3	Shyamal Market	Locally grown organic produce.	23.02040000	72.53000000	Shyamal, Ahmedabad	09:00:00	19:00:00	https://www.schwab.com/sites/g/files/eyrktu1071/files/Getty_635946862_2x1.jpg	2024-07-01 22:09:29.175815	f
\.


                                                                                                                                                                                                                                                                                                                                                                                4894.dat                                                                                            0000600 0004000 0002000 00000001211 14643456734 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	12	4	0.75	150.00	2024-07-08 21:10:50.987576
3	12	5	0.50	80.00	2024-07-08 21:10:50.988417
4	13	4	2.00	150.00	2024-07-09 21:29:14.689367
5	14	13	3.00	30.00	2024-07-10 00:15:35.423503
6	15	13	1.00	30.00	2024-07-10 02:06:17.764295
7	15	4	2.00	150.00	2024-07-10 02:06:17.765533
8	15	5	2.50	80.00	2024-07-10 02:06:17.766202
9	15	6	0.75	200.00	2024-07-10 02:06:17.766838
10	15	7	0.50	70.00	2024-07-10 02:06:17.767488
11	15	8	0.25	60.00	2024-07-10 02:06:17.768148
12	15	9	1.25	140.00	2024-07-10 02:06:17.768737
13	15	1	1.50	120.00	2024-07-10 02:06:17.769252
14	15	2	1.75	90.00	2024-07-10 02:06:17.769697
15	15	3	2.25	50.00	2024-07-10 02:06:17.770195
\.


                                                                                                                                                                                                                                                                                                                                                                                       4886.dat                                                                                            0000600 0004000 0002000 00000002034 14643456734 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	8	60.00	2024-07-04 00:11:32.454383	Pending	2024-07-04 00:11:32.454383	f
2	8	210.00	2024-07-04 00:11:48.449109	Pending	2024-07-04 00:11:48.449109	f
3	4	60.00	2024-07-04 00:24:30.541626	Pending	2024-07-04 00:24:30.541626	f
4	8	885.00	2024-07-04 00:37:21.564878	Pending	2024-07-04 00:37:21.564878	f
5	8	135.00	2024-07-04 02:08:27.261104	Pending	2024-07-04 02:08:27.261104	f
6	8	70.00	2024-07-04 03:21:11.369975	Pending	2024-07-04 03:21:11.369975	f
7	8	130.00	2024-07-04 03:21:44.33102	Pending	2024-07-04 03:21:44.33102	f
8	8	100.00	2024-07-04 04:00:50.905698	Pending	2024-07-04 04:00:50.905698	f
9	8	182.50	2024-07-04 04:22:46.41501	Pending	2024-07-04 04:22:46.41501	f
10	8	37.50	2024-07-04 06:19:58.505006	Pending	2024-07-04 06:19:58.505006	f
12	8	152.50	2024-07-08 21:10:50.985897	Pending	2024-07-08 21:10:50.985897	f
13	8	300.00	2024-07-09 21:29:14.688289	Pending	2024-07-09 21:29:14.688289	f
14	8	90.00	2024-07-10 00:15:35.421881	Pending	2024-07-10 00:15:35.421881	f
15	8	1355.00	2024-07-10 02:06:17.762595	Pending	2024-07-10 02:06:17.762595	f
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    4890.dat                                                                                            0000600 0004000 0002000 00000000335 14643456734 0014277 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	9	1	kg	5.00	2024-07-07 22:41:26.166446	f
2	9	1	kg	5.00	2024-07-08 21:11:38.09993	f
3	9	2	kg	7.00	2024-07-08 21:11:52.09145	f
4	9	13	kg	15.00	2024-07-10 00:53:05.255717	f
5	9	9	kg	18.00	2024-07-10 02:14:03.441657	f
\.


                                                                                                                                                                                                                                                                                                   4888.dat                                                                                            0000600 0004000 0002000 00000004170 14643456734 0014307 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        13	Potato	Fresh and organic potatoes	20.00	30.00	2	kg	https://m.media-amazon.com/images/I/313dtY-LOEL._AC_UF1000,1000_QL80_.jpg	500.00	515.00	2024-07-09 23:45:13.548534	t	t	f
9	Grapes	Sweet and juicy organic grapes.	126.00	140.00	1	kg	https://upload.wikimedia.org/wikipedia/commons/3/36/Kyoho-grape.jpg	500.00	518.00	2024-07-07 22:09:06.648856	t	t	f
5	Organic Broccoli	Healthy and fresh organic broccoli.	72.00	80.00	2	kg	https://s.alicdn.com/@sc04/kf/A4f577b2659534d3292fd568d359d9cc5j.jpg_300x300.jpg	500.00	500.00	2024-07-07 22:09:06.648856	t	t	f
4	Fresh Strawberries	Sweet and juicy strawberries freshly picked.	135.00	150.00	1	kg	https://d3fwccq2bzlel7.cloudfront.net/Pictures/480xany/5/8/8/35588_2_1203853_e.jpg	500.00	500.00	2024-07-07 22:09:06.648856	t	t	f
6	Fresh Oranges	Fresh and juicy oranges.	180.00	200.00	1	kg	https://tacomaboys.com/wp-content/uploads/2020/04/TB-27-8701-1024x588.jpg	500.00	500.00	2024-07-07 22:09:06.648856	t	t	f
7	Organic Tomatoes	Ripe and juicy organic tomatoes.	63.00	70.00	2	kg	https://i.cdn.newsbytesapp.com/images/l29720230821154142.jpeg	500.00	500.00	2024-07-07 22:09:06.648856	t	t	f
8	Fresh Spinach	Leafy green spinach, rich in nutrients.	54.00	60.00	2	kg	https://www.bigbasket.com/media/uploads/p/xxl/40200226_1-farmogo-spinach-hydroponically-grown.jpg	500.00	500.00	2024-07-07 22:09:06.648856	t	t	f
1	Organic Apples	Fresh and juicy organic apples from local farms.	108.00	120.00	1	kg	https://www.shimlafarms.com/cdn/shop/products/Redapple3.png?v=1675785288&width=1445	500.00	510.00	2024-07-07 22:09:06.648856	t	t	f
2	Fresh Carrots	Crisp and sweet carrots grown with love.	81.00	90.00	2	kg	https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/usa-new-york-city-carrots-for-sale-tetra-images.jpg	507.00	507.00	2024-07-07 22:09:06.648856	t	t	f
3	Milk	Pure and fresh milk from grass-fed cows.	45.00	50.00	3	L	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFLbH-mTn8P736RPcSHkV16rhLF1vZvStQMg&s	500.00	500.00	2024-07-07 22:09:06.648856	t	t	f
14	Onion	Fresh Onions	27.00	35.00	2	kg	https://www.allthatgrows.in/cdn/shop/products/Onion-Red.jpg?v=1598081871	500.00	500.00	2024-07-10 02:27:16.519667	t	t	f
\.


                                                                                                                                                                                                                                                                                                                                                                                                        4884.dat                                                                                            0000600 0004000 0002000 00000000043 14643456734 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	fruits
2	vegetables
3	dairy
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             4878.dat                                                                                            0000600 0004000 0002000 00000000036 14643456734 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	admin
2	buyer
3	seller
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  4880.dat                                                                                            0000600 0004000 0002000 00000001472 14643456734 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Karan	Prajapati	admin@gmail.com	admin123	1	2024-06-25 00:01:05.154676	f
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
13	Ramesh	Rathod	ramesh@gmail.com	12345678	2	2024-07-09 00:21:54.543974	f
\.


                                                                                                                                                                                                      restore.sql                                                                                         0000600 0004000 0002000 00000047640 14643456734 0015417 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitems (
    orderitemid bigint NOT NULL,
    orderid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity numeric(10,2) NOT NULL,
    price numeric(10,2) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- Name: orderitems_orderitemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderitems_orderitemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderitems_orderitemid_seq OWNER TO postgres;

--
-- Name: orderitems_orderitemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderitems_orderitemid_seq OWNED BY public.orderitems.orderitemid;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orderid bigint NOT NULL,
    userid bigint NOT NULL,
    totalamount numeric(10,2) NOT NULL,
    orderdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    orderstatus character varying(50) DEFAULT 'Pending'::character varying,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_orderid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orderid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_orderid_seq OWNER TO postgres;

--
-- Name: orders_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;


--
-- Name: productlistings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productlistings (
    listingid bigint NOT NULL,
    sellerid bigint NOT NULL,
    productid bigint NOT NULL,
    productmeasuretype character varying(10) NOT NULL,
    listingquantity numeric(10,2) NOT NULL,
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
    buyingprice numeric(10,2) NOT NULL,
    sellingprice numeric(10,2) NOT NULL,
    producttypeid bigint NOT NULL,
    productmeasuretype character varying(10) NOT NULL,
    productimage character varying(255),
    maxquantity numeric(10,2) DEFAULT 500 NOT NULL,
    availablequantity numeric(10,2) DEFAULT 500 NOT NULL,
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
-- Name: orderitems orderitemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems ALTER COLUMN orderitemid SET DEFAULT nextval('public.orderitems_orderitemid_seq'::regclass);


--
-- Name: orders orderid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);


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
COPY public.cart (cartid, userid, productid, quantity, createdat) FROM '$$PATH$$/4892.dat';

--
-- Data for Name: marketplaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marketplaces (marketid, marketname, marketdescription, marketlatitude, marketlongitude, marketaddress, marketopeningtime, marketclosingtime, marketimageurl, createdat, isdeleted) FROM stdin;
\.
COPY public.marketplaces (marketid, marketname, marketdescription, marketlatitude, marketlongitude, marketaddress, marketopeningtime, marketclosingtime, marketimageurl, createdat, isdeleted) FROM '$$PATH$$/4882.dat';

--
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderitems (orderitemid, orderid, productid, quantity, price, createdat) FROM stdin;
\.
COPY public.orderitems (orderitemid, orderid, productid, quantity, price, createdat) FROM '$$PATH$$/4894.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (orderid, userid, totalamount, orderdate, orderstatus, createdat, isdeleted) FROM stdin;
\.
COPY public.orders (orderid, userid, totalamount, orderdate, orderstatus, createdat, isdeleted) FROM '$$PATH$$/4886.dat';

--
-- Data for Name: productlistings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productlistings (listingid, sellerid, productid, productmeasuretype, listingquantity, createdat, isdeleted) FROM stdin;
\.
COPY public.productlistings (listingid, sellerid, productid, productmeasuretype, listingquantity, createdat, isdeleted) FROM '$$PATH$$/4890.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (productid, productname, productdescription, buyingprice, sellingprice, producttypeid, productmeasuretype, productimage, maxquantity, availablequantity, createdat, isavailable, isneeded, isdeleted) FROM stdin;
\.
COPY public.products (productid, productname, productdescription, buyingprice, sellingprice, producttypeid, productmeasuretype, productimage, maxquantity, availablequantity, createdat, isavailable, isneeded, isdeleted) FROM '$$PATH$$/4888.dat';

--
-- Data for Name: producttypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producttypes (producttypeid, producttypename) FROM stdin;
\.
COPY public.producttypes (producttypeid, producttypename) FROM '$$PATH$$/4884.dat';

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (roleid, rolename) FROM stdin;
\.
COPY public.roles (roleid, rolename) FROM '$$PATH$$/4878.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, firstname, lastname, email, password, roleid, createdat, isdeleted) FROM stdin;
\.
COPY public.users (userid, firstname, lastname, email, password, roleid, createdat, isdeleted) FROM '$$PATH$$/4880.dat';

--
-- Name: cart_cartid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cartid_seq', 19, true);


--
-- Name: marketplaces_marketid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marketplaces_marketid_seq', 6, true);


--
-- Name: orderitems_orderitemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitems_orderitemid_seq', 15, true);


--
-- Name: orders_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orderid_seq', 15, true);


--
-- Name: productlistings_listingid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productlistings_listingid_seq', 5, true);


--
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_productid_seq', 14, true);


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

SELECT pg_catalog.setval('public.users_userid_seq', 13, true);


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
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (orderitemid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


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
-- Name: cart cart_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: cart cart_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: orderitems orderitems_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);


--
-- Name: orderitems orderitems_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: orders orders_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                