--
-- PostgreSQL database dump
--

-- Dumped from database version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)

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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO timesheet1;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: timesheet1
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO timesheet1;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: timesheet1
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO timesheet1;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: timesheet1
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO timesheet1;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: timesheet1
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO timesheet1;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: timesheet1
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO timesheet1;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: timesheet1
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO timesheet1;

--
-- Name: coins; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.coins (
    id bigint NOT NULL,
    name character varying,
    publisher_name character varying,
    market_cap character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    token_id character varying,
    user_id bigint NOT NULL,
    description character varying,
    ticker_symbol character varying,
    chain_id integer,
    terms_of_services boolean,
    social_media character varying,
    total_supply numeric DEFAULT 0.0,
    market_caps numeric DEFAULT 0.0,
    percentage_change character varying
);


ALTER TABLE public.coins OWNER TO timesheet1;

--
-- Name: coins_id_seq; Type: SEQUENCE; Schema: public; Owner: timesheet1
--

CREATE SEQUENCE public.coins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coins_id_seq OWNER TO timesheet1;

--
-- Name: coins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: timesheet1
--

ALTER SEQUENCE public.coins_id_seq OWNED BY public.coins.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    coin_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL,
    like_count numeric DEFAULT 0.0,
    parent_id integer,
    content jsonb DEFAULT '[]'::jsonb
);


ALTER TABLE public.comments OWNER TO timesheet1;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: timesheet1
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO timesheet1;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: timesheet1
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: holders; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.holders (
    id bigint NOT NULL,
    coin_id bigint NOT NULL,
    wallet_id character varying,
    amount numeric(40,20) DEFAULT 0.0,
    value numeric(40,20) DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.holders OWNER TO timesheet1;

--
-- Name: holders_id_seq; Type: SEQUENCE; Schema: public; Owner: timesheet1
--

CREATE SEQUENCE public.holders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.holders_id_seq OWNER TO timesheet1;

--
-- Name: holders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: timesheet1
--

ALTER SEQUENCE public.holders_id_seq OWNED BY public.holders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO timesheet1;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    block_number character varying,
    transaction_event character varying,
    contract_address character varying,
    sender_address character varying,
    amount_in character varying,
    amount_out character varying,
    coin_token_id character varying,
    price numeric,
    transaction_hash character varying,
    "from" character varying,
    "to" character varying,
    last_price numeric,
    market_cap character varying,
    "timestamp" character varying,
    coin_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    holder_id bigint,
    coin_id bigint
);


ALTER TABLE public.transactions OWNER TO timesheet1;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: timesheet1
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO timesheet1;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: timesheet1
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: user_followers; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.user_followers (
    id bigint NOT NULL,
    followers_id character varying,
    following_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_followers OWNER TO timesheet1;

--
-- Name: user_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: timesheet1
--

CREATE SEQUENCE public.user_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_followers_id_seq OWNER TO timesheet1;

--
-- Name: user_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: timesheet1
--

ALTER SEQUENCE public.user_followers_id_seq OWNED BY public.user_followers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: timesheet1
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    user_name character varying,
    wallet_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    bio character varying,
    user_token_id character varying,
    chain_id jsonb[] DEFAULT '{}'::jsonb[]
);


ALTER TABLE public.users OWNER TO timesheet1;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: timesheet1
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO timesheet1;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: timesheet1
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: coins id; Type: DEFAULT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.coins ALTER COLUMN id SET DEFAULT nextval('public.coins_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: holders id; Type: DEFAULT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.holders ALTER COLUMN id SET DEFAULT nextval('public.holders_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Name: user_followers id; Type: DEFAULT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.user_followers ALTER COLUMN id SET DEFAULT nextval('public.user_followers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	profile_image	User	1	1	2024-08-28 05:38:05.409299
2	token_banner	Coin	5	2	2024-08-28 12:11:57.574876
3	token_icon	Coin	5	3	2024-08-28 12:11:57.595284
4	token_banner	Coin	6	4	2024-08-28 12:33:40.343046
5	token_icon	Coin	6	5	2024-08-28 12:33:40.353757
6	token_banner	Coin	7	6	2024-08-28 12:58:05.758497
7	token_icon	Coin	7	7	2024-08-28 12:58:05.774266
8	token_banner	Coin	12	8	2024-08-28 13:34:35.333646
9	token_icon	Coin	12	9	2024-08-28 13:34:35.348014
10	token_banner	Coin	39	10	2024-08-28 14:12:44.64021
11	token_icon	Coin	39	11	2024-08-28 14:12:44.654083
12	token_banner	Coin	40	12	2024-08-29 06:27:55.03979
13	token_icon	Coin	40	13	2024-08-29 06:27:55.055544
14	comment_image	Comment	1	14	2024-08-29 07:38:13.78168
15	comment_image	Comment	2	15	2024-08-29 07:46:51.674323
16	comment_image	Comment	3	16	2024-08-29 07:46:55.309419
17	comment_image	Comment	4	17	2024-08-29 07:49:19.328869
18	comment_image	Comment	5	18	2024-08-29 07:50:13.15338
19	comment_image	Comment	6	19	2024-08-29 07:50:14.319541
20	comment_image	Comment	7	20	2024-08-29 07:50:15.242469
21	comment_image	Comment	8	21	2024-08-29 07:55:03.259104
22	comment_image	Comment	9	22	2024-08-29 10:29:49.154576
23	comment_image	Comment	10	23	2024-08-29 10:48:04.92688
24	comment_image	Comment	11	24	2024-08-29 10:57:13.343925
25	comment_image	Comment	12	25	2024-08-29 10:57:14.456097
26	comment_image	Comment	13	26	2024-08-29 10:57:34.910301
27	comment_image	Comment	14	27	2024-08-29 10:58:11.082382
28	comment_image	Comment	15	28	2024-08-29 11:15:21.991312
29	comment_image	Comment	16	29	2024-08-29 11:15:23.063469
30	comment_image	Comment	17	30	2024-08-29 11:15:38.772073
31	comment_image	Comment	18	31	2024-08-29 12:18:35.281276
32	comment_image	Comment	22	32	2024-08-30 13:32:39.296625
33	comment_image	Comment	23	33	2024-08-30 13:42:41.237916
34	comment_image	Comment	24	34	2024-08-30 13:45:31.63098
35	comment_image	Comment	25	35	2024-09-02 06:51:16.011971
36	token_banner	Coin	45	36	2024-09-02 12:14:00.776416
37	token_icon	Coin	45	37	2024-09-02 12:14:01.75821
38	comment_image	Comment	26	38	2024-09-04 13:51:55.271626
39	comment_image	Comment	27	39	2024-09-04 13:52:45.045339
40	token_banner	Coin	68	40	2024-09-04 15:40:14.720362
41	token_icon	Coin	68	41	2024-09-04 15:40:16.048347
42	token_banner	Coin	69	42	2024-09-04 15:50:25.422036
43	token_icon	Coin	69	43	2024-09-04 15:50:27.354413
44	token_banner	Coin	72	44	2024-09-04 16:36:40.234945
45	token_icon	Coin	72	45	2024-09-04 16:36:40.252034
46	token_banner	Coin	73	46	2024-09-04 16:56:50.482596
47	token_icon	Coin	73	47	2024-09-04 16:56:50.495412
48	token_banner	Coin	74	48	2024-09-04 16:58:35.949314
49	token_icon	Coin	74	49	2024-09-04 16:58:35.960551
50	token_banner	Coin	75	50	2024-09-04 17:21:14.821589
51	token_icon	Coin	75	51	2024-09-04 17:21:14.834948
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	ProfileImages/20240828110805_1iVlT94rEfNXd8fvgAwh_profle.jpeg	20240828110805_1iVlT94rEfNXd8fvgAwh_profle.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	3462	ajvHYPBK0qNpMEYa7GFDPA==	2024-08-28 05:38:05.408092
3	TokenIcon/20240828174157_O1Xxgj6avDflTamqHZQg	20240828174157_O1Xxgj6avDflTamqHZQg	image/jpeg	{"identified":true,"analyzed":true}	local	3462	ajvHYPBK0qNpMEYa7GFDPA==	2024-08-28 12:11:57.594198
2	TokenBanner/20240828174157_nmjGpNT8wYwgENOnZV4Z	20240828174157_nmjGpNT8wYwgENOnZV4Z	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-28 12:11:57.573762
4	TokenBanner/20240828180340_UxrQyAZL1LH3hqW4YNy4	20240828180340_UxrQyAZL1LH3hqW4YNy4	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-28 12:33:40.341518
5	TokenIcon/20240828180340_GUV2CD6ZEXPEvSVo4JgB	20240828180340_GUV2CD6ZEXPEvSVo4JgB	image/jpeg	{"identified":true,"analyzed":true}	local	3462	ajvHYPBK0qNpMEYa7GFDPA==	2024-08-28 12:33:40.352806
6	TokenBanner/20240828182805_Pyny9GxHyI3GpqpdM6zU	20240828182805_Pyny9GxHyI3GpqpdM6zU	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-28 12:58:05.757381
7	TokenIcon/20240828182805_FUJJ0TP3320gy72N2mu6	20240828182805_FUJJ0TP3320gy72N2mu6	image/jpeg	{"identified":true,"analyzed":true}	local	3462	ajvHYPBK0qNpMEYa7GFDPA==	2024-08-28 12:58:05.773179
8	TokenBanner/20240828190435_Ei3ypEoFu37cdiGkyBAZ	20240828190435_Ei3ypEoFu37cdiGkyBAZ	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-28 13:34:35.332473
9	TokenIcon/20240828190435_C13zeqodK6V4FA0537wE	20240828190435_C13zeqodK6V4FA0537wE	image/jpeg	{"identified":true,"analyzed":true}	local	3462	ajvHYPBK0qNpMEYa7GFDPA==	2024-08-28 13:34:35.346756
10	TokenBanner/20240828194244_MxjwlyBtC1HhJx9nZy4o	20240828194244_MxjwlyBtC1HhJx9nZy4o	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-28 14:12:44.639032
11	TokenIcon/20240828194244_dMu3cRhWXz3Fcvwc0Jfo	20240828194244_dMu3cRhWXz3Fcvwc0Jfo	image/jpeg	{"identified":true,"analyzed":true}	local	3462	ajvHYPBK0qNpMEYa7GFDPA==	2024-08-28 14:12:44.653209
12	TokenBanner/20240829115755_jwwrrPISrghec7dyIt72	20240829115755_jwwrrPISrghec7dyIt72	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 06:27:55.038637
13	TokenIcon/20240829115755_wj9pKtX9kJtOigFlfZni	20240829115755_wj9pKtX9kJtOigFlfZni	image/jpeg	{"identified":true,"analyzed":true}	local	3462	ajvHYPBK0qNpMEYa7GFDPA==	2024-08-29 06:27:55.054484
14	CommentImages/20240829130813_Gfp0lbWkIyoJZZXsS0E2	20240829130813_Gfp0lbWkIyoJZZXsS0E2	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 07:38:13.780432
15	CommentImages/20240829131651_tazmj3SqcSa4Rp3AkE0P	20240829131651_tazmj3SqcSa4Rp3AkE0P	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 07:46:51.672526
16	CommentImages/20240829131655_4RW14c3ottWMeNzVHUnQ	20240829131655_4RW14c3ottWMeNzVHUnQ	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 07:46:55.307411
17	CommentImages/20240829131919_P3aBT30M1304w6uv2p3R	20240829131919_P3aBT30M1304w6uv2p3R	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 07:49:19.327771
18	CommentImages/20240829132013_rwnnCNE26GvuTbmYAIuZ	20240829132013_rwnnCNE26GvuTbmYAIuZ	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 07:50:13.149815
19	CommentImages/20240829132014_ECugZfnVdRBxoTVnTXLb	20240829132014_ECugZfnVdRBxoTVnTXLb	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 07:50:14.317882
20	CommentImages/20240829132015_ftji6HjGVvnVeY08sS6a	20240829132015_ftji6HjGVvnVeY08sS6a	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 07:50:15.240751
21	CommentImages/20240829132503_MbZH2SZsBxS6CjAsZ3Ny	20240829132503_MbZH2SZsBxS6CjAsZ3Ny	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 07:55:03.258088
22	CommentImages/20240829155949_6k1uAQ5oxPOlAqWZFBeq	20240829155949_6k1uAQ5oxPOlAqWZFBeq	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 10:29:49.151292
23	CommentImages/20240829161804_SmU1g64BonG1NGwSRyBy	20240829161804_SmU1g64BonG1NGwSRyBy	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 10:48:04.925947
24	CommentImages/20240829162713_VJ8OfQRGYvzliPaN4O9H	20240829162713_VJ8OfQRGYvzliPaN4O9H	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 10:57:13.342776
25	CommentImages/20240829162714_M33br3xO5dpv7HbdMc4P	20240829162714_M33br3xO5dpv7HbdMc4P	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 10:57:14.454835
26	CommentImages/20240829162734_QArPX6kI41rNJ4N3wYd9	20240829162734_QArPX6kI41rNJ4N3wYd9	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 10:57:34.909277
27	CommentImages/20240829162811_QQSVTZpPsfcMsZMT0wQz	20240829162811_QQSVTZpPsfcMsZMT0wQz	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 10:58:11.080693
28	CommentImages/20240829164521_wrl4ynvxvJsK8FkaY332	20240829164521_wrl4ynvxvJsK8FkaY332	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 11:15:21.990134
29	CommentImages/20240829164523_l4wuWBr4SBte38PpTFpw	20240829164523_l4wuWBr4SBte38PpTFpw	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 11:15:23.062556
30	CommentImages/20240829164538_xS2390rEXkpcIFLa6CYN	20240829164538_xS2390rEXkpcIFLa6CYN	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 11:15:38.770529
31	CommentImages/20240829174835_b9N0jLuxnj11mBOHHP8J	20240829174835_b9N0jLuxnj11mBOHHP8J	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-29 12:18:35.280085
32	CommentImages/20240830190239_eAMkEe2GExDlqEPfVsgP	20240830190239_eAMkEe2GExDlqEPfVsgP	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-30 13:32:39.295507
33	CommentImages/20240830191241_sijZNebkakyuA4c8TiOC	20240830191241_sijZNebkakyuA4c8TiOC	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-30 13:42:41.23505
34	CommentImages/20240830191531_DdU2nggNCozubZGpHfxW	20240830191531_DdU2nggNCozubZGpHfxW	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-08-30 13:45:31.62907
35	CommentImages/20240902122115_CSMybBN9k6jftV8mDlYe	20240902122115_CSMybBN9k6jftV8mDlYe	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-09-02 06:51:16.010853
36	TokenBanner/20240902174400_cBAfD2htRHVXT9Uwi68y	20240902174400_cBAfD2htRHVXT9Uwi68y	image/jpeg	{"identified":true,"analyzed":true}	amazon	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-09-02 12:14:00.775269
37	TokenIcon/20240902174401_jAdM21adYFY0LhHuLUO1	20240902174401_jAdM21adYFY0LhHuLUO1	image/jpeg	{"identified":true,"analyzed":true}	amazon	3462	ajvHYPBK0qNpMEYa7GFDPA==	2024-09-02 12:14:01.753897
38	CommentImages/20240904192155_zzDsaZeYgJRkjiJZSrC4	20240904192155_zzDsaZeYgJRkjiJZSrC4	image/jpeg	{"identified":true,"analyzed":true}	amazon	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-09-04 13:51:55.270625
39	CommentImages/20240904192245_WQjbFFyeClgNCkdzs1ZO	20240904192245_WQjbFFyeClgNCkdzs1ZO	image/jpeg	{"identified":true,"analyzed":true}	amazon	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-09-04 13:52:45.0436
40	TokenBanner/20240904211014_CwHGvJ5y6TNMgeiUfFJl	20240904211014_CwHGvJ5y6TNMgeiUfFJl	image/png	{"identified":true,"analyzed":true}	amazon	1479	qVrkxXhVuh0vqXmgpiZziw==	2024-09-04 15:40:14.71828
41	TokenIcon/20240904211016_tbX3JwCs1w7azxWov91k	20240904211016_tbX3JwCs1w7azxWov91k	image/png	{"identified":true,"analyzed":true}	amazon	1479	qVrkxXhVuh0vqXmgpiZziw==	2024-09-04 15:40:16.045394
42	TokenBanner/20240904212025_dqDfYoRnRD8uD9CVsr6k	20240904212025_dqDfYoRnRD8uD9CVsr6k	image/png	{"identified":true,"analyzed":true}	amazon	57038	FmkfL9y/kyzJeEfXN300gQ==	2024-09-04 15:50:25.420176
43	TokenIcon/20240904212027_6CcWIRMRG7a8pOZmU7vQ	20240904212027_6CcWIRMRG7a8pOZmU7vQ	image/png	{"identified":true,"analyzed":true}	amazon	1555	a7Qs0a18LpU3soMKFTjFog==	2024-09-04 15:50:27.353308
44	TokenBanner/20240904220640_1rQK5khuWtH85BvVPFI7	20240904220640_1rQK5khuWtH85BvVPFI7	image/jpeg	{"identified":true,"analyzed":true}	local	38437	4uFEqCdhHLIcY59UTnqK2g==	2024-09-04 16:36:40.233254
45	TokenIcon/20240904220640_I9p8ovOvpW0WUSXUYOda	20240904220640_I9p8ovOvpW0WUSXUYOda	image/jpeg	{"identified":true,"analyzed":true}	local	30821	ikAvECChl9xbCXP1f3q4ZQ==	2024-09-04 16:36:40.25095
46	TokenBanner/20240904222650_7VPcK1rNbxudzWaPBmmM	20240904222650_7VPcK1rNbxudzWaPBmmM	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-09-04 16:56:50.480516
47	TokenIcon/20240904222650_mRqcyKBOUmvBN48aQsHN	20240904222650_mRqcyKBOUmvBN48aQsHN	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-09-04 16:56:50.494426
48	TokenBanner/20240904222835_tTrRLHGHHoJQawSXXifD	20240904222835_tTrRLHGHHoJQawSXXifD	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-09-04 16:58:35.94817
49	TokenIcon/20240904222835_0qNZbaaJTGpm7bCKbJqN	20240904222835_0qNZbaaJTGpm7bCKbJqN	image/jpeg	{"identified":true,"analyzed":true}	local	4623	9X2jZ78H5sFwx1NTMswkgw==	2024-09-04 16:58:35.959615
50	TokenBanner/20240904225114_dPS0prBDFDWqPCCJMWwW	20240904225114_dPS0prBDFDWqPCCJMWwW	image/png	{"identified":true,"analyzed":true}	local	57038	FmkfL9y/kyzJeEfXN300gQ==	2024-09-04 17:21:14.819632
51	TokenIcon/20240904225114_MO0mLzl72YzJkp0pgQGc	20240904225114_MO0mLzl72YzJkp0pgQGc	image/png	{"identified":true,"analyzed":true}	local	1555	a7Qs0a18LpU3soMKFTjFog==	2024-09-04 17:21:14.833765
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-08-27 18:49:44.104473	2024-08-27 18:49:44.104481
\.


--
-- Data for Name: coins; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.coins (id, name, publisher_name, market_cap, created_at, updated_at, token_id, user_id, description, ticker_symbol, chain_id, terms_of_services, social_media, total_supply, market_caps, percentage_change) FROM stdin;
1	test514326463254	\N	\N	2024-08-28 10:26:20.240818	2024-08-28 10:26:20.240818	123wedfcv2345	1	qwase	TFA	11155111	\N	{"add_website":"","add_twitter":"","add_telegram":"","additional_links":""}	0.0	0.0	\N
2	test514326463254	\N	\N	2024-08-28 10:28:21.22942	2024-08-28 10:28:21.22942	123wedfcv2345	1	qwase	TFA	11155111	\N	{"add_website":"","add_twitter":"","add_telegram":"","additional_links":""}	0.0	0.0	\N
3	bitcoin	\N	\N	2024-08-28 10:47:44.265896	2024-08-28 10:47:44.265896	hjhjhjkhkjhk454	1	\N	@	1212	\N	\N	0.0	0.0	\N
4	test514326463254	\N	\N	2024-08-28 10:50:01.97955	2024-08-28 10:50:01.97955	123wedfcv2345	1	tfa	TFA	11155111	\N	\N	0.0	0.0	\N
42	formDataToSubmitformDataToSubmit	\N	\N	2024-08-30 11:15:16.204138	2024-08-30 11:15:16.204138	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	1	formDataToSubmitformDataToSubmit	formDataToSubmitformDataToSubmit	11155111	\N	\N	0.0	0.0	\N
43	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	\N	\N	2024-08-30 11:15:46.105636	2024-08-30 11:15:46.105636	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	1	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	11155111	\N	\N	0.0	0.0	\N
44	test44	\N	\N	2024-08-30 11:22:07.757424	2024-08-30 11:22:07.757424	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	1	test44	test44	11155111	\N	\N	0.0	0.0	\N
5	bitcoin	\N	\N	2024-08-28 12:11:57.542832	2024-08-28 12:11:57.626761	hjhjhjkhkjhk454	1	\N	@	1212	\N	\N	0.0	0.0	\N
49	fdffdf	\N	\N	2024-09-03 17:59:37.679981	2024-09-03 17:59:37.679981	0x955D264E0221E47116E57375d0A10C17CbD29a3B	1		xfgdfh	11155111	\N	\N	0.0	0.0	\N
6	bitcoin	\N	\N	2024-08-28 12:33:40.322887	2024-08-28 12:33:40.371744	hjhjhjkhkjhk454	1	\N	@	1212	\N	\N	0.0	0.0	\N
7	bitcoin	\N	\N	2024-08-28 12:58:05.737101	2024-08-28 12:58:05.796427	hjhjhjkhkjhk454	1	\N	@	1212	\N	\N	0.0	0.0	\N
8	test514326463254	\N	\N	2024-08-28 13:34:08.210395	2024-08-28 13:34:08.210395	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
9	test514326463254	\N	\N	2024-08-28 13:34:19.078153	2024-08-28 13:34:19.078153	123wedfcv2345	1	3	TFA	11155111	\N	\N	0.0	0.0	\N
10	3	\N	\N	2024-08-28 13:34:26.40654	2024-08-28 13:34:26.40654	123wedfcv2345	1	3	3	11155111	\N	\N	0.0	0.0	\N
11	3	\N	\N	2024-08-28 13:34:35.027848	2024-08-28 13:34:35.027848	123wedfcv2345	1	3	3	11155111	\N	\N	0.0	0.0	\N
52	webkorps11	\N	\N	2024-09-03 19:47:49.296735	2024-09-03 19:47:49.296735	0x89F402C317521D46112B5AE6C317D7649A5Fc334	1	webkorps11	webkorps11	11155111	\N	\N	0.0	0.0	\N
46	test2	\N	9565764.0	2024-09-02 12:35:15.833362	2024-09-02 15:37:01.826385	0x62787c34BfAC7793eB70f46E1aa04b719b969241	1	demo test1	test2	2121	t	{"one_website":"www.goggle.com"}	0.0	1903269989281886000000000000000.0	\N
47	Test1	\N	\N	2024-09-03 08:54:53.210463	2024-09-03 08:54:53.210463	4545545345324gfsfffg	1	demo	&qwe	2121	t	{"one_website":"www.goggle.com"}	100.0	0.0	\N
12	bitcoin	\N	\N	2024-08-28 13:34:35.301396	2024-08-28 13:34:35.372981	hjhjhjkhkjhk454	1	\N	@	1212	\N	\N	0.0	0.0	\N
13	3	\N	\N	2024-08-28 13:34:42.008592	2024-08-28 13:34:42.008592	123wedfcv2345	1	3	3	11155111	\N	\N	0.0	0.0	\N
14	3	\N	\N	2024-08-28 13:34:49.71406	2024-08-28 13:34:49.71406	123wedfcv2345	1	3	3	11155111	\N	\N	0.0	0.0	\N
15	3	\N	\N	2024-08-28 13:34:56.230287	2024-08-28 13:34:56.230287	123wedfcv2345	1	3	3	11155111	\N	\N	0.0	0.0	\N
16	test514326463254	\N	\N	2024-08-28 13:39:48.084816	2024-08-28 13:39:48.084816	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
17	test514326463254	\N	\N	2024-08-28 13:39:50.458452	2024-08-28 13:39:50.458452	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
18	test514326463254	\N	\N	2024-08-28 13:39:51.255161	2024-08-28 13:39:51.255161	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
19	test514326463254	\N	\N	2024-08-28 13:39:51.878437	2024-08-28 13:39:51.878437	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
20	test514326463254	\N	\N	2024-08-28 13:39:52.056091	2024-08-28 13:39:52.056091	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
21	test514326463254	\N	\N	2024-08-28 13:39:52.242844	2024-08-28 13:39:52.242844	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
22	test514326463254	\N	\N	2024-08-28 13:39:52.439602	2024-08-28 13:39:52.439602	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
23	test514326463254	\N	\N	2024-08-28 13:39:52.618736	2024-08-28 13:39:52.618736	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
24	test514326463254	\N	\N	2024-08-28 13:39:52.803538	2024-08-28 13:39:52.803538	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
25	test514326463254	\N	\N	2024-08-28 13:39:52.953259	2024-08-28 13:39:52.953259	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
26	test514326463254	\N	\N	2024-08-28 13:39:53.139632	2024-08-28 13:39:53.139632	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
27	test514326463254	\N	\N	2024-08-28 13:39:53.326683	2024-08-28 13:39:53.326683	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
28	test514326463254	\N	\N	2024-08-28 13:39:53.519694	2024-08-28 13:39:53.519694	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
29	test514326463254	\N	\N	2024-08-28 13:39:53.698831	2024-08-28 13:39:53.698831	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
30	test514326463254	\N	\N	2024-08-28 13:39:53.866629	2024-08-28 13:39:53.866629	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
31	test514326463254	\N	\N	2024-08-28 13:39:54.039225	2024-08-28 13:39:54.039225	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
32	test514326463254	\N	\N	2024-08-28 13:39:54.259578	2024-08-28 13:39:54.259578	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
33	test514326463254	\N	\N	2024-08-28 13:39:54.417055	2024-08-28 13:39:54.417055	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
34	test514326463254	\N	\N	2024-08-28 13:39:54.613513	2024-08-28 13:39:54.613513	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
35	test514326463254	\N	\N	2024-08-28 13:39:54.77736	2024-08-28 13:39:54.77736	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
36	test514326463254	\N	\N	2024-08-28 13:39:54.934264	2024-08-28 13:39:54.934264	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
37	test514326463254	\N	\N	2024-08-28 13:39:55.105082	2024-08-28 13:39:55.105082	123wedfcv2345	1	test	TFA	11155111	\N	\N	0.0	0.0	\N
38	test514326463254	\N	\N	2024-08-28 13:41:07.372527	2024-08-28 13:41:07.372527	123wedfcv2345	1	tesr	TFA	11155111	\N	\N	0.0	0.0	\N
48	s	\N	\N	2024-09-03 11:04:47.308553	2024-09-03 13:08:56.245079	0xfA0C4C47C40e0f4baC390D03e36277079D7d4FA3	1	dewd	ddd	11155111	\N	{"add_website":"https://www.webkorps.com/","add_twitter":"https://x.com/atwebkorps","add_telegram":"https://telegram.org/","additional_links":"https://telegram.org/"}	0.0	0.0	\N
53	Saloni	\N	\N	2024-09-04 07:24:50.1489	2024-09-04 07:24:50.1489	0x75d2dfeab84cDE37aD5e9dA570Fd70D62D6492ea	1	Saloni	Saloni	11155111	\N	\N	0.0	0.0	\N
39	bitcoin	\N	\N	2024-08-28 14:12:44.619316	2024-08-28 14:12:44.676566	hjhjhjkhkjhk454	1	\N	@	1212	\N	\N	0.0	0.0	\N
54	TIGER	\N	\N	2024-09-04 09:05:26.555174	2024-09-04 09:05:26.555174	0xBFaFBeca89e77f37BaeC54954c1D3CcB409BE858	1	This is tiger coin	Tiger Coin	11155111	\N	\N	0.0	0.0	\N
55	LION	\N	\N	2024-09-04 09:15:37.468042	2024-09-04 09:15:37.468042	0x51216247C2ed433fBFb1460Ac0984F32A030d665	1	This is Lion Coin	Lion Coin	11155111	\N	\N	0.0	0.0	\N
56	DragonCoin	\N	\N	2024-09-04 09:54:01.787786	2024-09-04 09:54:01.787786	0x13C88705927AC8806d866332a7FD4BA92C80F40D	1	DragonCoin	DRC	11155111	\N	\N	0.0	0.0	\N
40	bitcoin	\N	\N	2024-08-29 06:27:55.011734	2024-08-29 06:27:55.076634	hjhjhjkhkjhk454	1	\N	@	1212	\N	\N	0.0	0.0	\N
41	test9	\N	\N	2024-08-30 11:11:58.957672	2024-08-30 11:11:58.957672	0x5a85c4728F2570F3Ecd739824906A2F0015fA254	1	sdfgh	test6	11155111	\N	\N	0.0	0.0	\N
57	DeathRobot	\N	\N	2024-09-04 10:00:12.057915	2024-09-04 10:00:12.057915	0x3d758A42bA81DDF93Da6B365B93754389651A2C2	1	DeathRobotq	DRD	11155111	\N	\N	0.0	0.0	\N
58	Saloni	\N	\N	2024-09-04 11:08:01.78173	2024-09-04 11:08:01.78173	0x968fd94781079E79107e35c9eb963Caff158dbB5	1		Saloni	11155111	\N	\N	0.0	0.0	\N
51	Amul	\N	\N	2024-09-03 19:41:49.80132	2024-09-04 15:50:49.440295	0x3100994512507913B5b24401Edc51AFA3A518035	1	this is Amul token for testing	AmulToken	11155111	\N	\N	0.0	6260018639329000000000.0	32.89
59	sunny	\N	\N	2024-09-04 11:33:14.731207	2024-09-04 11:33:14.731207	0xFe476B3e93Da3612f20C3964BEd32AC81987e419	1	gcftyc hgvcygv	sunny	11155111	\N	\N	0.0	0.0	\N
60	ELE	\N	\N	2024-09-04 13:02:38.411572	2024-09-04 13:02:38.411572	0x07aD5619428516466ccf3dc68CE76b3426C273EF	1	Elephant	Elephant	11155111	\N	\N	0.0	0.0	\N
61	LionsCoin	\N	\N	2024-09-04 13:26:25.477245	2024-09-04 13:26:25.477245	0x7E65C63253DD2a3252FC1BCcD9D931ac81061961	1	Tiger Token	VKTest 	11155111	\N	\N	0.0	0.0	\N
62	Automation-AccountM	\N	\N	2024-09-04 13:49:37.774947	2024-09-04 13:49:37.774947	0x6368764EBc15E86f13489343905F65684BD975a7	1	test tes 	testM	11155111	\N	\N	0.0	0.0	\N
63	Automation-Account	\N	\N	2024-09-04 14:00:26.157412	2024-09-04 14:00:26.157412	0x2f2F1f97B8fafeE237015e278711154aa5d4b10c	1	fghg	sadgsgd	11155111	\N	\N	0.0	0.0	\N
64	monika	\N	\N	2024-09-04 14:14:13.763013	2024-09-04 14:14:13.763013	0xC9fF320b9AEA8b3E56db6255A13c466069F45b9D	1	dsfgchavjdfk	zacadcfa	11155111	\N	\N	0.0	0.0	\N
65	Gold Coin Token	\N	\N	2024-09-04 14:29:25.920815	2024-09-04 14:29:25.920815	0x4cbF1Dc6CDbDd950aF119b044a950B547D19213a	1	This is Gold Coin token	Gold Coin	11155111	\N	\N	0.0	0.0	\N
66	Rabbit	\N	\N	2024-09-04 14:58:03.158168	2024-09-04 14:58:03.158168	0x6980207BeA5E147459b7DfE7Cf2DE530c8D07e55	1	This is rabbit coin	Rabbit Coin	11155111	\N	\N	0.0	0.0	\N
50	formDataToSubmit	\N	\N	2024-09-03 19:36:01.303203	2024-09-04 15:01:37.798751	0x489aDb9fA549d1dB19354c4971A30461317F4817	1	formDataToSubmit	formDataToSubmit	11155111	\N	\N	0.0	6260018639347000000000.0	32.89
67	Rabbit-2	\N	\N	2024-09-04 15:22:15.73238	2024-09-04 15:22:15.73238	0x6CA10369BfdF7F47De857cA00A9A6E96423cF359	1	This is rabbit 2 coin for image	Rabbit-2 Coin	11155111	\N	\N	0.0	0.0	\N
68	test try coin	\N	\N	2024-09-04 15:40:14.697969	2024-09-04 15:40:16.713745	testnbcdmnbvjdfkjhvbkf	1	dcvgnfbd fgbb	zacadcfa	11155111	\N	\N	0.0	0.0	\N
69	test try coin 2	\N	\N	2024-09-04 15:50:25.403767	2024-09-04 15:50:28.015589	dvfgh rfegt	1	cdfvhnb. s ggt g	copy	11155111	\N	\N	0.0	0.0	\N
70	Sun	\N	\N	2024-09-04 15:51:14.078176	2024-09-04 15:51:14.078176	0x46c5C8fD2E1b0AbfdAf80316Eb8ca37386bd19bF	1	Crypto boy	sunny	11155111	\N	\N	0.0	0.0	\N
71	DevendraCreation	\N	\N	2024-09-04 16:36:24.51046	2024-09-04 16:36:24.51046	Testing coin	1	demo	&qwe	2121	t	{"Website":"https://webkorps.com/#/","Telegram":"","X (Twitter)":"https://x.com/atwebkorps","link":""}	0.0	0.0	\N
73	litecoin	\N	\N	2024-09-04 16:56:50.464524	2024-09-04 16:56:50.514875	dsdsfsfdf	1	\N	\N	111511	\N	\N	0.0	0.0	\N
74	litecoin	\N	\N	2024-09-04 16:58:35.908667	2024-09-04 16:58:35.987327	dsdsfsfdfjhkh	1	\N	\N	111511	\N	\N	0.0	0.0	\N
45	bitcoin	\N	\N	2024-09-02 12:14:00.749608	2024-09-04 17:11:47.532481	hjhjhjkhkjheretwetrtretrey	1	\N	@	11155111	\N	\N	100.0	0.0	\N
72	SUNNY	\N	\N	2024-09-04 16:36:40.219627	2024-09-04 17:12:49.939424	0x2F0E2Fabc93366C90aAc6318d457D602CEb98D8a	1	This is sunny coin	Sunny New Coin	11155111	\N	{"Website":"","Telegram":"","X (Twitter)":"","link":""}	0.0	3289106279000000000.0	0.02
75	test try coin 2	\N	\N	2024-09-04 17:21:14.805123	2024-09-04 17:21:14.855418	dvfgh rfegt dfbhjd	1	cdfvhnb. s ggt g	copy	11155111	\N	{"Website":"https://google.com","Telegram":"https://t.me/com","X (Twitter)":"https://x.com/test.com","link":"https://discord.gg/","Discord":"https://discord.gg/tis.com"}	0.0	0.0	\N
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.comments (id, coin_id, created_at, updated_at, user_id, like_count, parent_id, content) FROM stdin;
1	10	2024-08-29 07:38:13.758207	2024-08-29 07:38:13.807053	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
24	10	2024-08-30 13:45:31.617174	2024-08-30 13:45:31.652528	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
2	10	2024-08-29 07:46:51.660747	2024-08-29 07:46:51.696531	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
3	10	2024-08-29 07:46:55.295747	2024-08-29 07:46:55.337576	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
4	10	2024-08-29 07:49:19.308659	2024-08-29 07:49:19.354248	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
25	10	2024-09-02 06:51:15.990404	2024-09-02 06:51:16.042592	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
5	10	2024-08-29 07:50:13.128409	2024-08-29 07:50:13.189888	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
6	10	2024-08-29 07:50:14.306823	2024-08-29 07:50:14.338294	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
7	10	2024-08-29 07:50:15.229186	2024-08-29 07:50:15.26425	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
26	10	2024-09-04 13:51:55.250453	2024-09-04 13:51:56.604016	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
8	10	2024-08-29 07:55:03.238339	2024-08-29 07:55:03.285494	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
9	10	2024-08-29 10:29:49.098976	2024-08-29 10:29:49.207614	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
10	10	2024-08-29 10:48:04.916276	2024-08-29 10:48:04.953468	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
27	10	2024-09-04 13:52:45.033623	2024-09-04 13:52:46.372999	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
11	10	2024-08-29 10:57:13.322853	2024-08-29 10:57:13.387763	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
12	10	2024-08-29 10:57:14.447393	2024-08-29 10:57:14.479505	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
13	10	2024-08-29 10:57:34.902171	2024-08-29 10:57:34.925297	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
14	10	2024-08-29 10:58:11.067475	2024-08-29 10:58:11.102588	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
15	10	2024-08-29 11:15:21.926897	2024-08-29 11:15:22.018245	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
16	10	2024-08-29 11:15:23.055337	2024-08-29 11:15:23.087228	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
17	10	2024-08-29 11:15:38.759299	2024-08-29 11:15:38.789704	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
18	10	2024-08-29 12:18:35.26051	2024-08-29 12:18:35.306595	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
19	10	2024-08-29 12:36:52.01634	2024-08-29 12:36:52.01634	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
20	10	2024-08-29 12:37:17.665542	2024-08-29 12:37:17.665542	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
21	10	2024-08-29 12:43:07.435072	2024-08-29 12:43:07.435072	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
22	10	2024-08-30 13:32:39.27624	2024-08-30 13:32:39.322581	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
23	10	2024-08-30 13:42:41.213722	2024-08-30 13:42:41.276014	1	0.0	\N	{"text": null, "user_name": "@_QP1FsI"}
\.


--
-- Data for Name: holders; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.holders (id, coin_id, wallet_id, amount, value, created_at, updated_at) FROM stdin;
1	45	87fshjhje545sdf	100.00000000000000000000	1000.00000000000000000000	2024-09-02 12:14:02.253179	2024-09-02 12:14:02.253179
2	46	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-02 12:35:15.864483	2024-09-02 12:35:15.864483
3	46	\N	0.00000000000000001400	0.00000000000191693200	2024-09-02 12:49:42.025358	2024-09-02 13:48:34.703694
6	46	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.00000000000000000700	0.00000000000031949800	2024-09-02 14:02:52.815633	2024-09-02 14:04:15.409422
4	42	\N	0.00000000000000000000	29580.00000000000000000000	2024-09-02 12:50:03.45814	2024-09-02 14:28:11.111951
9	46	hjhjhjkhkjheretwetrtretrey	0.00000000000000000100	0.00000000000015974400	2024-09-02 15:37:01.838527	2024-09-02 15:37:01.838527
5	46	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.00000000000000000800	0.00000000000047924200	2024-09-02 14:02:52.801343	2024-09-02 15:37:01.855439
10	47	87fshjhje545sdf	100.00000000000000000000	1000.00000000000000000000	2024-09-03 08:54:53.236327	2024-09-03 08:54:53.236327
11	48	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-03 11:04:47.31895	2024-09-03 11:04:47.31895
12	49	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-03 17:59:37.69708	2024-09-03 17:59:37.69708
13	50	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-03 19:36:01.310915	2024-09-03 19:36:01.310915
14	51	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-03 19:41:49.810344	2024-09-03 19:41:49.810344
15	52	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-03 19:47:49.307965	2024-09-03 19:47:49.307965
16	53	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 07:24:50.155694	2024-09-04 07:24:50.155694
17	54	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 09:05:26.561751	2024-09-04 09:05:26.561751
18	55	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 09:15:37.475638	2024-09-04 09:15:37.475638
19	56	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 09:54:01.793183	2024-09-04 09:54:01.793183
20	57	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 10:00:12.069272	2024-09-04 10:00:12.069272
21	58	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 11:08:01.79145	2024-09-04 11:08:01.79145
22	59	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 11:33:14.741916	2024-09-04 11:33:14.741916
23	42	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.00000000000000000100	0.00000000000000003400	2024-09-04 12:19:15.831242	2024-09-04 12:19:15.831242
24	42	87fshjhjeuiuiuiuiuiouiohj	-0.00000000000000000100	-0.00000000000000003400	2024-09-04 12:19:15.844118	2024-09-04 12:19:15.844118
25	60	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 13:02:38.419589	2024-09-04 13:02:38.419589
26	61	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 13:26:25.485961	2024-09-04 13:26:25.485961
7	42	2020	0.00000000000000000000	0.00000000000000000000	2024-09-02 14:02:59.706364	2024-09-04 13:44:43.856583
8	42	1010	0.00000000000000000000	0.00000000000000000000	2024-09-02 14:02:59.718248	2024-09-04 13:44:43.868774
27	62	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 13:49:37.781259	2024-09-04 13:49:37.781259
28	63	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 14:00:26.165695	2024-09-04 14:00:26.165695
29	64	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 14:14:13.772712	2024-09-04 14:14:13.772712
30	42	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000.00000000000000000000	62665696880170000000.00000000000000000000	2024-09-04 14:19:39.141953	2024-09-04 14:19:39.141953
31	42	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	-10000000.00000000000000000000	-62665696880170000000.00000000000000000000	2024-09-04 14:19:39.157551	2024-09-04 14:19:39.157551
32	65	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 14:29:25.927118	2024-09-04 14:29:25.927118
33	66	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 14:58:03.163817	2024-09-04 14:58:03.163817
34	50	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	1000000.00000000000000000000	6260018639347000000.00000000000000000000	2024-09-04 15:01:37.805159	2024-09-04 15:01:37.805159
35	50	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	-1000000.00000000000000000000	-6260018639347000000.00000000000000000000	2024-09-04 15:01:37.818282	2024-09-04 15:01:37.818282
36	67	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 15:22:15.741	2024-09-04 15:22:15.741
37	68	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 15:40:16.677613	2024-09-04 15:40:16.677613
38	69	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 15:50:28.002618	2024-09-04 15:50:28.002618
39	70	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 15:51:14.086312	2024-09-04 15:51:14.086312
40	71	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 16:36:24.540497	2024-09-04 16:36:24.540497
41	72	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 16:36:40.258971	2024-09-04 16:36:40.258971
42	73	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 16:56:50.501973	2024-09-04 16:56:50.501973
43	74	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 16:58:35.976281	2024-09-04 16:58:35.976281
44	75	87fshjhje545sdf	0.00000000000000000000	0.00000000000000000000	2024-09-04 17:21:14.841864	2024-09-04 17:21:14.841864
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.schema_migrations (version) FROM stdin;
20240819093021
20240819121731
20240820075151
20240820075314
20240820080538
20240820122552
20240820130445
20240820130730
20240821063333
20240821095206
20240821100713
20240821100827
20240821102839
20240821103611
20240821134730
20240822063517
20240823073109
20240823114026
20240830074602
20240830075003
20240830084816
20240830100431
20240830132128
20240902105340
20240902123404
20240902144619
20240902192749
20240903073531
20240904084452
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.transactions (id, block_number, transaction_event, contract_address, sender_address, amount_in, amount_out, coin_token_id, price, transaction_hash, "from", "to", last_price, market_cap, "timestamp", coin_name, created_at, updated_at, holder_id, coin_id) FROM stdin;
1	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	test44	2024-09-02 06:28:17.417582	2024-09-02 06:28:17.417582	\N	\N
2	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:20:30.973747	2024-09-02 10:20:30.973747	\N	\N
3	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:20:36.597459	2024-09-02 10:20:36.597459	\N	\N
4	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:20:36.618696	2024-09-02 10:20:36.618696	\N	\N
5	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:26.206239	2024-09-02 10:36:26.206239	\N	\N
6	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:26.258041	2024-09-02 10:36:26.258041	\N	\N
7	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:32.439885	2024-09-02 10:36:32.439885	\N	\N
8	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:32.569843	2024-09-02 10:36:32.569843	\N	\N
9	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:35.667335	2024-09-02 10:36:35.667335	\N	\N
10	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:35.672707	2024-09-02 10:36:35.672707	\N	\N
11	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:40.815748	2024-09-02 10:36:40.815748	\N	\N
12	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:40.817828	2024-09-02 10:36:40.817828	\N	\N
13	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:45.522163	2024-09-02 10:36:45.522163	\N	\N
14	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:45.619222	2024-09-02 10:36:45.619222	\N	\N
15	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:49.528307	2024-09-02 10:36:49.528307	\N	\N
16	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:36:49.544941	2024-09-02 10:36:49.544941	\N	\N
17	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:37:27.400986	2024-09-02 10:37:27.400986	\N	\N
18	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:37:27.402858	2024-09-02 10:37:27.402858	\N	\N
19	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:37:52.046898	2024-09-02 10:37:52.046898	\N	\N
20	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:37:52.057532	2024-09-02 10:37:52.057532	\N	\N
21	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:38:05.109717	2024-09-02 10:38:05.109717	\N	\N
22	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:38:27.376716	2024-09-02 10:38:27.376716	\N	\N
23	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:38:27.398414	2024-09-02 10:38:27.398414	\N	\N
24	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:38:30.844669	2024-09-02 10:38:30.844669	\N	\N
25	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:38:30.846022	2024-09-02 10:38:30.846022	\N	\N
26	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:38:50.02611	2024-09-02 10:38:50.02611	\N	\N
27	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:38:50.038747	2024-09-02 10:38:50.038747	\N	\N
28	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:38:54.151534	2024-09-02 10:38:54.151534	\N	\N
29	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:38:54.171982	2024-09-02 10:38:54.171982	\N	\N
30	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:01.306735	2024-09-02 10:39:01.306735	\N	\N
31	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:01.309599	2024-09-02 10:39:01.309599	\N	\N
32	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:19.631588	2024-09-02 10:39:19.631588	\N	\N
33	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:19.782129	2024-09-02 10:39:19.782129	\N	\N
34	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:19.887861	2024-09-02 10:39:19.887861	\N	\N
35	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:19.980495	2024-09-02 10:39:19.980495	\N	\N
36	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:20.094616	2024-09-02 10:39:20.094616	\N	\N
37	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:20.203447	2024-09-02 10:39:20.203447	\N	\N
38	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:20.305852	2024-09-02 10:39:20.305852	\N	\N
39	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:20.387382	2024-09-02 10:39:20.387382	\N	\N
40	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:20.425486	2024-09-02 10:39:20.425486	\N	\N
41	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:20.621349	2024-09-02 10:39:20.621349	\N	\N
42	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:20.718018	2024-09-02 10:39:20.718018	\N	\N
43	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:20.792023	2024-09-02 10:39:20.792023	\N	\N
44	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:20.900117	2024-09-02 10:39:20.900117	\N	\N
45	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:21.010896	2024-09-02 10:39:21.010896	\N	\N
46	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:21.097683	2024-09-02 10:39:21.097683	\N	\N
47	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:21.199326	2024-09-02 10:39:21.199326	\N	\N
48	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:21.513494	2024-09-02 10:39:21.513494	\N	\N
49	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:21.769627	2024-09-02 10:39:21.769627	\N	\N
50	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:21.798563	2024-09-02 10:39:21.798563	\N	\N
51	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:21.849362	2024-09-02 10:39:21.849362	\N	\N
52	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:21.922645	2024-09-02 10:39:21.922645	\N	\N
53	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:22.027705	2024-09-02 10:39:22.027705	\N	\N
54	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:22.105246	2024-09-02 10:39:22.105246	\N	\N
55	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:22.228301	2024-09-02 10:39:22.228301	\N	\N
56	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:22.336759	2024-09-02 10:39:22.336759	\N	\N
57	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:22.545392	2024-09-02 10:39:22.545392	\N	\N
58	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:22.646672	2024-09-02 10:39:22.646672	\N	\N
59	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:22.747637	2024-09-02 10:39:22.747637	\N	\N
60	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:22.847345	2024-09-02 10:39:22.847345	\N	\N
61	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:22.946294	2024-09-02 10:39:22.946294	\N	\N
62	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.049623	2024-09-02 10:39:23.049623	\N	\N
63	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.249271	2024-09-02 10:39:23.249271	\N	\N
64	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.358507	2024-09-02 10:39:23.358507	\N	\N
65	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.464937	2024-09-02 10:39:23.464937	\N	\N
66	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.574838	2024-09-02 10:39:23.574838	\N	\N
67	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.618237	2024-09-02 10:39:23.618237	\N	\N
68	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.671169	2024-09-02 10:39:23.671169	\N	\N
69	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.725809	2024-09-02 10:39:23.725809	\N	\N
70	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.773362	2024-09-02 10:39:23.773362	\N	\N
71	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.854596	2024-09-02 10:39:23.854596	\N	\N
72	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.909632	2024-09-02 10:39:23.909632	\N	\N
73	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:23.951082	2024-09-02 10:39:23.951082	\N	\N
74	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.080586	2024-09-02 10:39:24.080586	\N	\N
75	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.191925	2024-09-02 10:39:24.191925	\N	\N
76	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.21781	2024-09-02 10:39:24.21781	\N	\N
77	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.275652	2024-09-02 10:39:24.275652	\N	\N
78	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.388386	2024-09-02 10:39:24.388386	\N	\N
79	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.486406	2024-09-02 10:39:24.486406	\N	\N
80	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.595074	2024-09-02 10:39:24.595074	\N	\N
81	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.710577	2024-09-02 10:39:24.710577	\N	\N
82	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.801437	2024-09-02 10:39:24.801437	\N	\N
83	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.901474	2024-09-02 10:39:24.901474	\N	\N
84	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.940605	2024-09-02 10:39:24.940605	\N	\N
85	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:24.993112	2024-09-02 10:39:24.993112	\N	\N
86	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:25.096676	2024-09-02 10:39:25.096676	\N	\N
87	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:25.20285	2024-09-02 10:39:25.20285	\N	\N
88	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:25.309674	2024-09-02 10:39:25.309674	\N	\N
89	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:25.407929	2024-09-02 10:39:25.407929	\N	\N
90	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:25.648091	2024-09-02 10:39:25.648091	\N	\N
91	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:25.720492	2024-09-02 10:39:25.720492	\N	\N
92	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:25.775968	2024-09-02 10:39:25.775968	\N	\N
93	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:25.920866	2024-09-02 10:39:25.920866	\N	\N
94	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:26.02394	2024-09-02 10:39:26.02394	\N	\N
95	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:26.142655	2024-09-02 10:39:26.142655	\N	\N
96	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:26.342689	2024-09-02 10:39:26.342689	\N	\N
97	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:26.429941	2024-09-02 10:39:26.429941	\N	\N
98	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:26.532183	2024-09-02 10:39:26.532183	\N	\N
99	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:26.746063	2024-09-02 10:39:26.746063	\N	\N
100	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:26.842082	2024-09-02 10:39:26.842082	\N	\N
101	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:26.942283	2024-09-02 10:39:26.942283	\N	\N
102	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:27.050197	2024-09-02 10:39:27.050197	\N	\N
103	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:27.154844	2024-09-02 10:39:27.154844	\N	\N
104	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:27.298689	2024-09-02 10:39:27.298689	\N	\N
105	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:27.352226	2024-09-02 10:39:27.352226	\N	\N
106	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:27.455448	2024-09-02 10:39:27.455448	\N	\N
107	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:27.558841	2024-09-02 10:39:27.558841	\N	\N
108	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:27.667368	2024-09-02 10:39:27.667368	\N	\N
109	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:27.774212	2024-09-02 10:39:27.774212	\N	\N
110	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:28.313509	2024-09-02 10:39:28.313509	\N	\N
111	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:28.500191	2024-09-02 10:39:28.500191	\N	\N
112	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:28.588405	2024-09-02 10:39:28.588405	\N	\N
113	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:29.045538	2024-09-02 10:39:29.045538	\N	\N
114	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:29.529515	2024-09-02 10:39:29.529515	\N	\N
115	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:29.641091	2024-09-02 10:39:29.641091	\N	\N
116	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:29.761368	2024-09-02 10:39:29.761368	\N	\N
117	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:29.912722	2024-09-02 10:39:29.912722	\N	\N
118	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:30.0322	2024-09-02 10:39:30.0322	\N	\N
119	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:30.81954	2024-09-02 10:39:30.81954	\N	\N
120	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:30.967288	2024-09-02 10:39:30.967288	\N	\N
121	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:31.04891	2024-09-02 10:39:31.04891	\N	\N
122	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:31.666398	2024-09-02 10:39:31.666398	\N	\N
123	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:31.915014	2024-09-02 10:39:31.915014	\N	\N
124	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:31.985765	2024-09-02 10:39:31.985765	\N	\N
125	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:32.694422	2024-09-02 10:39:32.694422	\N	\N
126	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:33.627378	2024-09-02 10:39:33.627378	\N	\N
127	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:34.034443	2024-09-02 10:39:34.034443	\N	\N
128	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:34.222917	2024-09-02 10:39:34.222917	\N	\N
129	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:34.533671	2024-09-02 10:39:34.533671	\N	\N
130	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:34.62558	2024-09-02 10:39:34.62558	\N	\N
131	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:34.666918	2024-09-02 10:39:34.666918	\N	\N
132	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:34.727206	2024-09-02 10:39:34.727206	\N	\N
133	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:34.939767	2024-09-02 10:39:34.939767	\N	\N
134	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:35.625378	2024-09-02 10:39:35.625378	\N	\N
135	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:35.670432	2024-09-02 10:39:35.670432	\N	\N
136	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:35.816944	2024-09-02 10:39:35.816944	\N	\N
137	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:36.070994	2024-09-02 10:39:36.070994	\N	\N
138	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:36.371174	2024-09-02 10:39:36.371174	\N	\N
139	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:36.680557	2024-09-02 10:39:36.680557	\N	\N
140	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:36.891777	2024-09-02 10:39:36.891777	\N	\N
141	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:36.980681	2024-09-02 10:39:36.980681	\N	\N
142	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:37.098852	2024-09-02 10:39:37.098852	\N	\N
143	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:37.200324	2024-09-02 10:39:37.200324	\N	\N
144	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:37.544879	2024-09-02 10:39:37.544879	\N	\N
145	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:37.585883	2024-09-02 10:39:37.585883	\N	\N
146	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:37.694773	2024-09-02 10:39:37.694773	\N	\N
147	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:37.826562	2024-09-02 10:39:37.826562	\N	\N
148	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:37.94259	2024-09-02 10:39:37.94259	\N	\N
149	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:37.986029	2024-09-02 10:39:37.986029	\N	\N
150	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:38.063103	2024-09-02 10:39:38.063103	\N	\N
151	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:38.200739	2024-09-02 10:39:38.200739	\N	\N
152	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:38.311965	2024-09-02 10:39:38.311965	\N	\N
153	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:38.635372	2024-09-02 10:39:38.635372	\N	\N
154	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:38.729454	2024-09-02 10:39:38.729454	\N	\N
155	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:38.875732	2024-09-02 10:39:38.875732	\N	\N
156	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:38.960797	2024-09-02 10:39:38.960797	\N	\N
157	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:39.045825	2024-09-02 10:39:39.045825	\N	\N
158	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:39.129456	2024-09-02 10:39:39.129456	\N	\N
159	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:39.290618	2024-09-02 10:39:39.290618	\N	\N
160	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:39.564923	2024-09-02 10:39:39.564923	\N	\N
161	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:39.644887	2024-09-02 10:39:39.644887	\N	\N
162	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:39.961464	2024-09-02 10:39:39.961464	\N	\N
163	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:40.263641	2024-09-02 10:39:40.263641	\N	\N
164	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:40.566714	2024-09-02 10:39:40.566714	\N	\N
165	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:40.703697	2024-09-02 10:39:40.703697	\N	\N
166	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:40.906913	2024-09-02 10:39:40.906913	\N	\N
167	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:40.981563	2024-09-02 10:39:40.981563	\N	\N
168	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:41.109513	2024-09-02 10:39:41.109513	\N	\N
169	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:41.392466	2024-09-02 10:39:41.392466	\N	\N
170	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:41.50552	2024-09-02 10:39:41.50552	\N	\N
171	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:41.598949	2024-09-02 10:39:41.598949	\N	\N
172	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:39:44.798176	2024-09-02 10:39:44.798176	\N	\N
173	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:02.402927	2024-09-02 10:41:02.402927	\N	\N
174	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:02.476005	2024-09-02 10:41:02.476005	\N	\N
175	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:06.377087	2024-09-02 10:41:06.377087	\N	\N
176	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:06.432609	2024-09-02 10:41:06.432609	\N	\N
177	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:22.435675	2024-09-02 10:41:22.435675	\N	\N
178	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:22.663139	2024-09-02 10:41:22.663139	\N	\N
179	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:23.149183	2024-09-02 10:41:23.149183	\N	\N
180	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:23.300485	2024-09-02 10:41:23.300485	\N	\N
181	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:23.428282	2024-09-02 10:41:23.428282	\N	\N
182	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:23.481058	2024-09-02 10:41:23.481058	\N	\N
183	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:23.59826	2024-09-02 10:41:23.59826	\N	\N
184	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:23.793628	2024-09-02 10:41:23.793628	\N	\N
185	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:24.879242	2024-09-02 10:41:24.879242	\N	\N
186	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:25.05032	2024-09-02 10:41:25.05032	\N	\N
187	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:25.201064	2024-09-02 10:41:25.201064	\N	\N
188	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:25.360449	2024-09-02 10:41:25.360449	\N	\N
189	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:25.626101	2024-09-02 10:41:25.626101	\N	\N
190	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:25.766843	2024-09-02 10:41:25.766843	\N	\N
191	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:27.125495	2024-09-02 10:41:27.125495	\N	\N
192	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:27.70581	2024-09-02 10:41:27.70581	\N	\N
193	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:28.271008	2024-09-02 10:41:28.271008	\N	\N
194	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:28.526773	2024-09-02 10:41:28.526773	\N	\N
195	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:28.644753	2024-09-02 10:41:28.644753	\N	\N
196	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:28.697038	2024-09-02 10:41:28.697038	\N	\N
197	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:28.904309	2024-09-02 10:41:28.904309	\N	\N
198	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:29.037576	2024-09-02 10:41:29.037576	\N	\N
199	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:29.427867	2024-09-02 10:41:29.427867	\N	\N
200	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:29.540706	2024-09-02 10:41:29.540706	\N	\N
201	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:29.623879	2024-09-02 10:41:29.623879	\N	\N
202	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:29.725917	2024-09-02 10:41:29.725917	\N	\N
203	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:29.787211	2024-09-02 10:41:29.787211	\N	\N
204	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:30.0305	2024-09-02 10:41:30.0305	\N	\N
205	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:30.157321	2024-09-02 10:41:30.157321	\N	\N
206	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:30.460132	2024-09-02 10:41:30.460132	\N	\N
207	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:30.687496	2024-09-02 10:41:30.687496	\N	\N
208	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:30.743577	2024-09-02 10:41:30.743577	\N	\N
209	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:30.848151	2024-09-02 10:41:30.848151	\N	\N
210	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:31.064916	2024-09-02 10:41:31.064916	\N	\N
211	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:31.162285	2024-09-02 10:41:31.162285	\N	\N
212	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:31.471688	2024-09-02 10:41:31.471688	\N	\N
213	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:31.513817	2024-09-02 10:41:31.513817	\N	\N
214	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:31.722832	2024-09-02 10:41:31.722832	\N	\N
215	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:31.811986	2024-09-02 10:41:31.811986	\N	\N
216	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:31.876377	2024-09-02 10:41:31.876377	\N	\N
217	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:32.18084	2024-09-02 10:41:32.18084	\N	\N
218	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:32.248639	2024-09-02 10:41:32.248639	\N	\N
219	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:32.387275	2024-09-02 10:41:32.387275	\N	\N
220	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:32.432308	2024-09-02 10:41:32.432308	\N	\N
221	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:32.485141	2024-09-02 10:41:32.485141	\N	\N
222	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:32.594856	2024-09-02 10:41:32.594856	\N	\N
223	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:32.630748	2024-09-02 10:41:32.630748	\N	\N
224	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:32.690611	2024-09-02 10:41:32.690611	\N	\N
225	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:32.794296	2024-09-02 10:41:32.794296	\N	\N
226	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:32.85395	2024-09-02 10:41:32.85395	\N	\N
227	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:33.012629	2024-09-02 10:41:33.012629	\N	\N
228	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:33.109042	2024-09-02 10:41:33.109042	\N	\N
229	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:33.2133	2024-09-02 10:41:33.2133	\N	\N
230	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:33.410623	2024-09-02 10:41:33.410623	\N	\N
231	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:33.512217	2024-09-02 10:41:33.512217	\N	\N
232	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:33.590388	2024-09-02 10:41:33.590388	\N	\N
233	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:33.658378	2024-09-02 10:41:33.658378	\N	\N
234	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:33.797152	2024-09-02 10:41:33.797152	\N	\N
235	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:33.920065	2024-09-02 10:41:33.920065	\N	\N
236	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:33.968127	2024-09-02 10:41:33.968127	\N	\N
237	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:34.042794	2024-09-02 10:41:34.042794	\N	\N
238	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:34.158655	2024-09-02 10:41:34.158655	\N	\N
239	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:34.236423	2024-09-02 10:41:34.236423	\N	\N
240	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:34.333744	2024-09-02 10:41:34.333744	\N	\N
241	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:34.699868	2024-09-02 10:41:34.699868	\N	\N
242	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:34.748222	2024-09-02 10:41:34.748222	\N	\N
243	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:34.840673	2024-09-02 10:41:34.840673	\N	\N
244	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:34.949433	2024-09-02 10:41:34.949433	\N	\N
245	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:35.051903	2024-09-02 10:41:35.051903	\N	\N
246	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:35.142231	2024-09-02 10:41:35.142231	\N	\N
247	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:35.255013	2024-09-02 10:41:35.255013	\N	\N
248	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:35.370647	2024-09-02 10:41:35.370647	\N	\N
249	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:35.554581	2024-09-02 10:41:35.554581	\N	\N
250	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:35.672393	2024-09-02 10:41:35.672393	\N	\N
251	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:35.785879	2024-09-02 10:41:35.785879	\N	\N
252	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:35.852391	2024-09-02 10:41:35.852391	\N	\N
253	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:35.942257	2024-09-02 10:41:35.942257	\N	\N
254	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:35.978339	2024-09-02 10:41:35.978339	\N	\N
255	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.030829	2024-09-02 10:41:36.030829	\N	\N
256	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.076523	2024-09-02 10:41:36.076523	\N	\N
257	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.116176	2024-09-02 10:41:36.116176	\N	\N
258	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.147442	2024-09-02 10:41:36.147442	\N	\N
259	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.202314	2024-09-02 10:41:36.202314	\N	\N
260	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.241567	2024-09-02 10:41:36.241567	\N	\N
261	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.297097	2024-09-02 10:41:36.297097	\N	\N
262	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.352124	2024-09-02 10:41:36.352124	\N	\N
263	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.517332	2024-09-02 10:41:36.517332	\N	\N
264	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.64247	2024-09-02 10:41:36.64247	\N	\N
265	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.816925	2024-09-02 10:41:36.816925	\N	\N
266	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.86342	2024-09-02 10:41:36.86342	\N	\N
267	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.92111	2024-09-02 10:41:36.92111	\N	\N
268	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:36.965683	2024-09-02 10:41:36.965683	\N	\N
269	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.006255	2024-09-02 10:41:37.006255	\N	\N
270	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.05451	2024-09-02 10:41:37.05451	\N	\N
271	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.109943	2024-09-02 10:41:37.109943	\N	\N
272	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.152443	2024-09-02 10:41:37.152443	\N	\N
273	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.191998	2024-09-02 10:41:37.191998	\N	\N
274	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.232741	2024-09-02 10:41:37.232741	\N	\N
275	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.300752	2024-09-02 10:41:37.300752	\N	\N
276	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.342426	2024-09-02 10:41:37.342426	\N	\N
277	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.467416	2024-09-02 10:41:37.467416	\N	\N
278	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.556852	2024-09-02 10:41:37.556852	\N	\N
279	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.648223	2024-09-02 10:41:37.648223	\N	\N
280	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.68314	2024-09-02 10:41:37.68314	\N	\N
281	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:37.905418	2024-09-02 10:41:37.905418	\N	\N
282	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:38.216335	2024-09-02 10:41:38.216335	\N	\N
283	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:38.424508	2024-09-02 10:41:38.424508	\N	\N
284	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:38.535972	2024-09-02 10:41:38.535972	\N	\N
285	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:38.578631	2024-09-02 10:41:38.578631	\N	\N
286	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:38.645942	2024-09-02 10:41:38.645942	\N	\N
287	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:38.722264	2024-09-02 10:41:38.722264	\N	\N
288	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:38.761312	2024-09-02 10:41:38.761312	\N	\N
289	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:38.840322	2024-09-02 10:41:38.840322	\N	\N
290	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:41:38.989879	2024-09-02 10:41:38.989879	\N	\N
291	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:44:39.272216	2024-09-02 10:44:39.272216	\N	\N
292	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:45:32.117247	2024-09-02 10:45:32.117247	\N	\N
293	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:45:50.519394	2024-09-02 10:45:50.519394	\N	\N
294	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:45:51.620815	2024-09-02 10:45:51.620815	\N	\N
295	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:45:53.937029	2024-09-02 10:45:53.937029	\N	\N
296	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:45:56.753283	2024-09-02 10:45:56.753283	\N	\N
297	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:45:58.154708	2024-09-02 10:45:58.154708	\N	\N
298	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:46:05.235718	2024-09-02 10:46:05.235718	\N	\N
299	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:46:05.377817	2024-09-02 10:46:05.377817	\N	\N
300	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:46:44.665168	2024-09-02 10:46:44.665168	\N	\N
301	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:46:50.085273	2024-09-02 10:46:50.085273	\N	\N
302	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:47:12.942926	2024-09-02 10:47:12.942926	\N	\N
303	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 10:48:32.378437	2024-09-02 10:48:32.378437	\N	\N
304	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:00:50.260139	2024-09-02 11:00:50.260139	\N	\N
305	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:00:50.264872	2024-09-02 11:00:50.264872	\N	\N
306	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:23:48.560824	2024-09-02 11:23:48.560824	\N	\N
307	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:32:42.569749	2024-09-02 11:32:42.569749	\N	\N
308	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:33:17.693456	2024-09-02 11:33:17.693456	\N	\N
309	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:33:48.510301	2024-09-02 11:33:48.510301	\N	\N
310	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:38:08.652769	2024-09-02 11:38:08.652769	\N	\N
311	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:39:10.901126	2024-09-02 11:39:10.901126	\N	\N
312	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:44:30.365866	2024-09-02 11:44:30.365866	\N	\N
313	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:45:00.458958	2024-09-02 11:45:00.458958	\N	\N
314	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:46:44.736705	2024-09-02 11:46:44.736705	\N	\N
315	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:47:52.482841	2024-09-02 11:47:52.482841	\N	\N
316	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:49:07.376218	2024-09-02 11:49:07.376218	\N	\N
317	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:53:17.199525	2024-09-02 11:53:17.199525	\N	\N
318	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 11:58:10.978711	2024-09-02 11:58:10.978711	\N	\N
319	98765	buy	2345	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	1010	2020	2627.0	9565764ETH	76535456	test121	2024-09-02 12:41:01.547901	2024-09-02 12:41:01.547901	\N	42
320	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 12:42:23.991652	2024-09-02 12:42:23.991652	\N	46
321	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 12:45:31.227182	2024-09-02 12:45:31.227182	\N	46
322	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 12:45:35.739047	2024-09-02 12:45:35.739047	\N	46
323	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 12:47:44.397083	2024-09-02 12:47:44.397083	\N	46
324	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 12:47:47.516557	2024-09-02 12:47:47.516557	\N	46
325	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 12:49:42.013197	2024-09-02 12:49:42.037012	3	46
326	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:50:03.443465	2024-09-02 12:50:03.467902	4	42
327	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:51:15.443492	2024-09-02 12:51:15.46449	4	42
328	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:52:04.491834	2024-09-02 12:52:04.52093	4	42
329	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:52:59.050241	2024-09-02 12:52:59.075002	4	42
330	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:53:51.856611	2024-09-02 12:53:51.879467	4	42
331	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:55:48.203289	2024-09-02 12:55:48.220759	4	42
332	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:56:02.143876	2024-09-02 12:56:02.160737	4	42
333	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:56:17.03924	2024-09-02 12:56:17.061448	4	42
334	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:56:51.544257	2024-09-02 12:56:51.563055	4	42
335	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:57:57.994006	2024-09-02 12:57:58.015679	4	42
336	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 12:59:35.901288	2024-09-02 12:59:35.927544	4	42
337	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 13:05:13.518468	2024-09-02 13:05:13.532237	3	46
338	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	hjhjhjkhkjheretwetrtretrey	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 13:15:09.426726	2024-09-02 13:15:09.450285	3	46
339	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	hjhjhjkhkjheretwetrtretrey	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 13:15:10.619564	2024-09-02 13:15:10.641961	3	46
340	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	hjhjhjkhkjheretwetrtretrey	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 13:15:11.991776	2024-09-02 13:15:12.015391	3	46
341	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 13:34:27.193398	2024-09-02 13:34:27.34679	4	42
342	6594145	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000002	0.000000000000159746	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023554	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d8a7	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	9565764ETH	76535456	test2	2024-09-02 13:48:34.675669	2024-09-02 13:48:34.698715	3	46
343	6594147	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000003	0.000000000000159748	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023556	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d9a2	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023554	9565764ETH	76535456	test2	2024-09-02 14:02:52.781605	2024-09-02 14:02:52.820117	6	46
344	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 14:02:59.685892	2024-09-02 14:02:59.723606	8	42
345	6594149	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000004	0.000000000000159750	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023558	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a4	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023556	9565764ETH	76535456	test2	2024-09-02 14:04:15.37761	2024-09-02 14:04:15.413747	6	46
346	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 14:05:19.873036	2024-09-02 14:05:19.914601	8	42
347	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 14:08:36.950631	2024-09-02 14:08:36.976348	8	42
348	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 14:16:15.465758	2024-09-02 14:16:15.488971	4	42
349	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 14:21:25.343952	2024-09-02 14:21:25.367436	4	42
350	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 14:28:11.072174	2024-09-02 14:28:11.097307	4	42
351	6594143	sell	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x62787c34BfAC7793eB70f46E1aa04b719b969241	0.000000000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	hjhjhjkhkjheretwetrtretrey	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0.000000000000023552	1903269989281886387995432134567	76535456	test2	2024-09-02 15:37:01.815276	2024-09-02 15:37:01.85969	5	46
352	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 17:00:38.053919	2024-09-02 17:00:38.10752	8	42
353	\N	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-02 17:03:15.069664	2024-09-02 17:03:15.159708	8	42
354	6594143	buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0x5EDBeBc38C9062b3Be1Da36A2Fa190b8E722E0aA	0.000000000000000001	0.000000000000159744	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	0.00000000023552	0xd772f04ee47cab9c7fbdd5c947a665cbaeba6cdc047bc2588098e37b3cd1d5a8	87fshjhjeuiuiuiuiuiouiohj	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	34.000000000000023552	9565764ETH	76535456	test2	2024-09-04 12:19:15.794563	2024-09-04 12:19:15.849017	24	42
355	1234567890	buy	wert97634567xcxxxfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-04 13:44:43.83465	2024-09-04 13:44:43.873498	8	42
356	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-04 14:06:25.009895	2024-09-04 14:06:25.04112	8	42
357	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-04 14:06:59.147403	2024-09-04 14:06:59.166052	8	42
358	1234567890	buy	wert97634567xcfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-04 14:07:16.042071	2024-09-04 14:07:16.087966	8	42
359	6631693	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	1000000000000000000	158004443873869928266769	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569688017.0	0xba62dff8e94b9df0b8f2e4f4b44fb0805b55e2131099bc5707286bb169b20712	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569688017.0	6266569688017000000000	1725459451	formDataToSubmitformDataToSubmit	2024-09-04 14:17:31.707169	2024-09-04 14:17:31.707169	\N	42
360	6631721	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000	1579811682128	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569688017.0	0x5e240a4713a77b4ad171fe5d87b648000058e55ca2151751811ccab02401d67a	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569688017.0	6266569688017000000000	1725459579	formDataToSubmitformDataToSubmit	2024-09-04 14:19:39.121899	2024-09-04 14:19:39.162962	31	42
361	6631819	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000000000	1579811679800912966	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569706480.0	0x1827d9e306532959ab3fd1217fa12c7c605b5ce9ca1f6d18b30ff50dd29b0fdc	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569706480.0	6266569706480000000000	1725460945	formDataToSubmitformDataToSubmit	2024-09-04 14:42:25.329519	2024-09-04 14:42:25.329519	\N	42
362	1234567890	buy	wert97634567xcxxxfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-04 14:43:12.376232	2024-09-04 14:43:12.403242	8	42
363	1234567890	buy	wert97634567xcxxxfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-04 14:43:29.467035	2024-09-04 14:43:29.503689	8	42
364	1234567890	buy	wert97634567xcxxxfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-04 14:43:50.877482	2024-09-04 14:43:50.914967	8	42
365	6631852	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000000	1579811677471362	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569706498.0	0x1b2c78a74971feaf40c8401a80d59bd0aa847e869c0179af1e45735db66ce4c7	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569706498.0	6266569706498000000000	1725461426	formDataToSubmitformDataToSubmit	2024-09-04 14:50:26.382667	2024-09-04 14:50:26.382667	\N	42
366	1234567890	buy	wert97634567xcxxxfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-04 14:50:45.007455	2024-09-04 14:50:45.035512	8	42
367	6631852	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000000	1579811677471362	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569706498.0	0x1b2c78a74971feaf40c8401a80d59bd0aa847e869c0179af1e45735db66ce4c7	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569706498.0	6266569706498000000000	1725461710	formDataToSubmitformDataToSubmit	2024-09-04 14:55:10.811792	2024-09-04 14:55:10.811792	\N	42
368	6631852	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000000	1579811677471362	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569706498.0	0x1b2c78a74971feaf40c8401a80d59bd0aa847e869c0179af1e45735db66ce4c7	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569706498.0	6266569706498000000000	1725461710	formDataToSubmitformDataToSubmit	2024-09-04 14:55:10.849146	2024-09-04 14:55:10.849146	\N	42
369	1234567890	buy	wert97634567xcxxxfg	00100	IN	986	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	23552.0	123456sdfghjk	1010	2020	2627.0	9565764ETH	76535456	Test1	2024-09-04 14:55:47.967415	2024-09-04 14:55:47.99605	8	42
370	6631852	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000000	1579811677471362	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569706498.0	0x1b2c78a74971feaf40c8401a80d59bd0aa847e869c0179af1e45735db66ce4c7	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569706498.0	6266569706498000000000	1725461873	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	2024-09-04 14:57:53.395737	2024-09-04 14:57:53.395737	\N	42
373	6631852	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000000	1579811677471362	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569706498.0	0x1b2c78a74971feaf40c8401a80d59bd0aa847e869c0179af1e45735db66ce4c7	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569706498.0	6266569706498000000000	1725461895	Amul	2024-09-04 14:58:15.436296	2024-09-04 14:58:15.436296	\N	42
374	6631896	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	1000000	158146493970	0x489aDb9fA549d1dB19354c4971A30461317F4817	6260018639347.0	0xef19a50cdf52a6effc7b6b8ae654acbe8b9399caec9956019c7f72c6b36b2351	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6260018639347.0	6260018639347000000000	1725462097	formDataToSubmit	2024-09-04 15:01:37.776528	2024-09-04 15:01:37.824234	35	50
371	6631852	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000000	1579811677471362	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569706498.0	0x1b2c78a74971feaf40c8401a80d59bd0aa847e869c0179af1e45735db66ce4c7	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569706498.0	6266569706498000000000	1725461873	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	2024-09-04 14:57:53.408801	2024-09-04 14:57:53.408801	\N	42
372	6631852	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000000	1579811677471362	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569706498.0	0x1b2c78a74971feaf40c8401a80d59bd0aa847e869c0179af1e45735db66ce4c7	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569706498.0	6266569706498000000000	1725461895	Amul	2024-09-04 14:58:15.426559	2024-09-04 14:58:15.426559	\N	42
375	6632049	Sell	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	25000000000000000000	155097596620304	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	6266569414334.0	0x814ed2b864c45d948a8d4c5ea45bc7d335c0dc76d08a3a69fbe8f80f9d79a001	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6266569414334.0	6266569414334000000000	1725464269	0x8f260EF6CD6eE2762811909D4A2B1DE68B8C6c0E	2024-09-04 15:37:49.472111	2024-09-04 15:37:49.472111	\N	42
376	6632106	Sell	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	100000000000000	619741846	0x3100994512507913B5b24401Edc51AFA3A518035	6260018639329.0	0x1a32737783e7620df6f4fbafd397f7d4d0ec7204d81388c20943e098b5cbe5f5	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6260018639329.0	6260018639329000000000	1725465049	Amul	2024-09-04 15:50:49.419294	2024-09-04 15:50:49.419294	\N	51
377	6632140	Sell	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	10000000000000	61974186	0x3100994512507913B5b24401Edc51AFA3A518035	6260018639329.0	0xecc208181638af3944a57305c63f2103af953733e9abb4dd951fd7cc32d85dc3	0x5edbebc38c9062b3be1da36a2fa190b8e722e0aa	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	6260018639329.0	6260018639329000000000	1725465565	Amul	2024-09-04 15:59:25.511359	2024-09-04 15:59:25.511359	\N	51
378	6632442	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	1000000000000	300993702766449015152	0x2F0E2Fabc93366C90aAc6318d457D602CEb98D8a	3289106279.0	0x52055aaf07383a7cc77569d73f6fff72a7aad81d924a143dde997db43b8b87b3	0x4e845af4f9f05b5d90534aa8b9a64af0797a940f	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	3289106279.0	3289106279000000000	1725469969	SUNNY	2024-09-04 17:12:49.914441	2024-09-04 17:12:49.914441	\N	72
379	6632442	Buy	0xD8152192FEDb47Fec4A19982f8E4Fb5C49efA42D	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	1000000000000	300993702766449015152	0x2F0E2Fabc93366C90aAc6318d457D602CEb98D8a	3289106279.0	0x52055aaf07383a7cc77569d73f6fff72a7aad81d924a143dde997db43b8b87b3	0x4e845af4f9f05b5d90534aa8b9a64af0797a940f	0xd8152192fedb47fec4a19982f8e4fb5c49efa42d	3289106279.0	3289106279000000000	1725470149	SUNNY	2024-09-04 17:15:49.077855	2024-09-04 17:15:49.077855	\N	72
\.


--
-- Data for Name: user_followers; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.user_followers (id, followers_id, following_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: timesheet1
--

COPY public.users (id, user_name, wallet_id, created_at, updated_at, bio, user_token_id, chain_id) FROM stdin;
1	@_QP1FsI	87fshjhje545sdf	2024-08-28 05:38:05.376635	2024-08-28 05:38:05.428012	\N	bh899dfdsfs	{}
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: timesheet1
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 51, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: timesheet1
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 51, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: timesheet1
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: coins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: timesheet1
--

SELECT pg_catalog.setval('public.coins_id_seq', 75, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: timesheet1
--

SELECT pg_catalog.setval('public.comments_id_seq', 27, true);


--
-- Name: holders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: timesheet1
--

SELECT pg_catalog.setval('public.holders_id_seq', 44, true);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: timesheet1
--

SELECT pg_catalog.setval('public.transactions_id_seq', 379, true);


--
-- Name: user_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: timesheet1
--

SELECT pg_catalog.setval('public.user_followers_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: timesheet1
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: coins coins_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.coins
    ADD CONSTRAINT coins_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: holders holders_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.holders
    ADD CONSTRAINT holders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: user_followers user_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.user_followers
    ADD CONSTRAINT user_followers_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_coins_on_name_and_token_id; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE INDEX index_coins_on_name_and_token_id ON public.coins USING btree (name, token_id);


--
-- Name: index_coins_on_user_id; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE INDEX index_coins_on_user_id ON public.coins USING btree (user_id);


--
-- Name: index_comments_on_coin_id; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE INDEX index_comments_on_coin_id ON public.comments USING btree (coin_id);


--
-- Name: index_comments_on_parent_id; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE INDEX index_comments_on_parent_id ON public.comments USING btree (parent_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_holders_on_coin_id; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE INDEX index_holders_on_coin_id ON public.holders USING btree (coin_id);


--
-- Name: index_transactions_on_coin_id; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE INDEX index_transactions_on_coin_id ON public.transactions USING btree (coin_id);


--
-- Name: index_transactions_on_holder_id; Type: INDEX; Schema: public; Owner: timesheet1
--

CREATE INDEX index_transactions_on_holder_id ON public.transactions USING btree (holder_id);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: coins fk_rails_11662b2e74; Type: FK CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.coins
    ADD CONSTRAINT fk_rails_11662b2e74 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: holders fk_rails_22d80e9b25; Type: FK CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.holders
    ADD CONSTRAINT fk_rails_22d80e9b25 FOREIGN KEY (coin_id) REFERENCES public.coins(id);


--
-- Name: transactions fk_rails_5d0e6e57d8; Type: FK CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_rails_5d0e6e57d8 FOREIGN KEY (holder_id) REFERENCES public.holders(id);


--
-- Name: transactions fk_rails_8f513cce91; Type: FK CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_rails_8f513cce91 FOREIGN KEY (coin_id) REFERENCES public.coins(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: comments fk_rails_9a2bd4a853; Type: FK CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_9a2bd4a853 FOREIGN KEY (coin_id) REFERENCES public.coins(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: timesheet1
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

