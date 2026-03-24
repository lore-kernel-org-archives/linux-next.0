Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F53EF670;
	Tue, 24 Mar 2026 17:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375020; cv=fail; b=bjI9al4CR01NT29Z1iRIIm/ikaTaa/Os+GFNU/SrlyhT4fAL7fBjeqsofRRxQH+BvEMtHLYoYSj5I/ka2jgYR8grgaI4huudJt18m9/7iG+P9QXN4N9PAeigS57PCinVf2lJ6x4iR2/ejLpujXTfSez/f62jAQESZLy6OBuyKbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375020; c=relaxed/simple;
	bh=Ovp4tuFoTW09FAmRaD9Z9x2RyQ/nYIFwt2CZuoFTv50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nH+UD5b7KtLzTQYPd9AkBMFXZt0iGTeAEAW/d5Gdlsr3glGQkf1MC1mYI0fn6BPDtj0kLclL1c4aKc5KbDu5e1DAABShhly/nHTdqT5vJed4AzkQXzSeP0/CDlXD+F8eF9cTldG6frrXxDsixFzkWp2lNmUmuFVOlzk7ezBdJA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VzztKQzM; arc=fail smtp.client-ip=40.93.196.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VzztKQzM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzeDRokTij+jD5cG3KAzYinkmqF1Hcn4a27CZkDMbIVziRj0tOzuoy+cXDHWrZNEL3DPG5PckheuKUKt5deu27tmxyQEKwwEZHT9E/mh8DhlUKF+SRhkN2X0oq8YuQfDEbu/4sH542xmoSXegnOdpdq3imZZ9jXSZf9iCBxR+KlCX4dlLff2H7WR28NUfCUQTnk+Vvz8W80xLcZ9nzqBfEonK8jTbsHhXiEfjBEhC/G0ph0SeEZAlI6dWx09+Z3nOyeYefrR8sO7VouKcBMTFBYN9gGxqP+0cfyHnJ8ODHVW1lOWhbPKsg5F9HzuTRIH+HPRreuTyos5aRDIwdjQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6p6ik7eiYO0LgcBkfHSTVZtoL+z4Lq3t47nm+N1uZw=;
 b=xaZ02Gn8Oqi9x6o9XQqJV5BYqxTyNNDP9vBD9ZSta8xLyulSHgMVWZX2rv8aX0hA3sB9Q/0/77Duk6QdIO449S5ZcXCBcQjz+316ztEnm8fK4FJ5JGgrhdfV3hNFCpOeyfvdd0L28cDp4rb8xpgKIcrIJ1vKzPdJKcI149z6KFCDR0VGauA2dt8tEcJ1NGwBGyx/u73NqYoNQ2e+HkMkGJsMlDGnU1a/ov2fXR2ufRQBHFAJnsQqx3nvH421fA5DJPvY93Rj0N03h5AMutYdnRLsOEgR8Iq7qQlKamAc9t2bGQxQSk9nCb4tgn86FJeTi8SiwsMdfLs3bMEYpYWHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6p6ik7eiYO0LgcBkfHSTVZtoL+z4Lq3t47nm+N1uZw=;
 b=VzztKQzM+/ngfkM6DVDcqFO5K1sUOas0/I6AuPjmOhIFyisyJ49jCuuMbzuzoFq/M5UFInXOgW29ILYEmiuuvTK4ufNkwTh5ouK2cR85TvvBnc/ApRO7ZQvEtBj1G4miHfhgDEsvmDCIjYyrniAg/L7b9kwA0tDhRKDqfahzVrUKZa9dS2MvlgKjbkjprSwoK/KqFnmi6Yfo9Hu2KNwWTrvTuSKqAb8vCDWrKtqIaSGymLyyW6K1duCE+/QA2x8IiFicxCSTskF8txH67vMLRDMuBUORupUJWyEvW7wpCP5RQUm5C2Pc5zjUA1ektl0bogxx2kd66TGqkTXa1fGxsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by SN7PR12MB7321.namprd12.prod.outlook.com (2603:10b6:806:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 17:56:53 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 17:56:53 +0000
Date: Tue, 24 Mar 2026 13:56:51 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <acLQY_OKG_VZ6L2q@yury>
References: <acKpkuWNBR8_91kF@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKpkuWNBR8_91kF@sirena.org.uk>
X-ClientProxiedBy: BN9PR03CA0715.namprd03.prod.outlook.com
 (2603:10b6:408:ef::30) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|SN7PR12MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 73526309-2769-488d-8db1-08de89cebb1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FNhvjPmblUeVaPEMnv8R7YJgtOYcASH0wgOEZojF6hIMUjSWcjzJ9lpX5bK5f49sqFuQHHhzB+DjfVUPRkRvOW4YIr8RUytjYFmUxgHQfZntKyRY0PGmqtA7D4bqpOg9x8rMo3UEn0vTriQYGK/oNaIhlG8pxYnRpBSJw7WOfW0zTcAz9Ze9tmnFZBA9BLnho7WbRvHc0D5EL2ksgp5xOQW3R+vah4rr1o7iPs0J+vGt8L0KQ8gvOCpk4leWal/9CIQeyYtIoq/Qf32Djeb/EYam0nZO28FiU/5VbCbI7vrpN9u9PH53vjqbKfMz9xLQWIP20daaw4PvYisTWc0JUrphdSd1F1MVjEPDNsj7eI1zg6WWFM4vr/THvBf9FRzKl3OuC5GFBQKUwTgvc4zHquAIw7jtEHXvtvZaL2f8DrCTXSWQPB6VnIm7XhmTiOdAn4hj602BsMpks6QglwTvP9U33RxY+zqB+/tqd559483l6sM+GBljTnXiGNcFqPYQJom1xhP5s1kxrjDvjW2hzGmHgj77IcXfva2MjFgm9nQttzHr3T+EGgQiK1ijtC+ElCAsXFbrOl2r9QgbPWAqJk+yTnfj6UTpn3zU63Zy2VPEUFCmtdPxV4E1pMEp7m72wh4HqtXDvhfYmh2QyWKLVrSxXrrBWRoVkUED2eta9m/Vj0uzw1wXRwpZgaTx3dVC+07pwEEV5J1K39ETOT0ZnXxi9zM2DP6cXbAGU4QrxxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DVJaMQQs/l/ydEiFEpw6FZMHjNXVHZiQ8yZE9bSPqnZmnbzIELN9+L/nz7a6?=
 =?us-ascii?Q?KPSgDxkwtC4/wUiV6vDAwS4XVLEyVTTLEGHctuLDEcR6lpx0/bJPu6AbtdlX?=
 =?us-ascii?Q?DgFcDBFfZBKsxh/9wiD9E87mlEb2XUsPlYwnl+Wla0e2oD9s1BzzCFX749M+?=
 =?us-ascii?Q?QRryBgCjKOxYwU+grmB+gacYnYu3/RddgEASTy7xAYqZj0yyUb1nyc3EW8Jx?=
 =?us-ascii?Q?mZ5vPcLlTPUVUpfCUHTFbOkzR4Hrsvj0m3vyNhlMu/v7Im4qctV2wHodISFk?=
 =?us-ascii?Q?9vnEnd7QPQOMSKeJVAlOcBYt7Sc+XAEWOt5Ix3SRuKLRUTEhJ+fPBwdP+znd?=
 =?us-ascii?Q?Ff2NWz4A2UsJTnvdttYLbezl2xtvjS8uDkyJg0RGYGyzG9+2WZ4KwEWehSIi?=
 =?us-ascii?Q?Ke9dbK4Z97oLnpRfwQXMk0gBSTD2p+vpUhh//tKYhN2kvRXLSCuKKWd8AX0g?=
 =?us-ascii?Q?e0Ct5x/X5nWhb5j9EJc4eq35QKEh8nAu8W/AQNFtHLRjnJphS1l1FJNeci/7?=
 =?us-ascii?Q?+fYubBRkDYfo+C4WY3NtGmmNSnMe004khsIdmjMYi0Cz/twnUsVtL970D2Bh?=
 =?us-ascii?Q?TzayHOoHcQ4asdyVoUQYT19oe89oRdVj1KcS1SrPbOPcXrJ8KxyJwME/azmk?=
 =?us-ascii?Q?LhxZffGKESvNTau18gWg6ZV6+FT/dg+3rX3l9ERDQdVlCs47gu2MkRSsIOdT?=
 =?us-ascii?Q?vRPgxsRU9kXaVQI4rUvxQeMXUoEw+eHC+PLvpe4X4dCrusgc0LU5MwVl35P9?=
 =?us-ascii?Q?GI/H8dFIp9/9JjIUZv4nwytcGjLVjl1hDkrteLp69MaPNrHnp/lVBWr2od0v?=
 =?us-ascii?Q?4eFU5c1PBXZIfTpdHncTVJBqEsJYD2iM2Yfvb2WCnMGZEq6TASD2kQgi34zx?=
 =?us-ascii?Q?vQNukijpTYIgkDiqFBjYoU1HuyZQDu3hqwMF8Ai5w5b3ciQX5ZOqPzDFvpCi?=
 =?us-ascii?Q?9KoirjDc9uHNcnDd+uqRFB879zuF6wHvfPSMy/g7dbhdj/sY7dSiUeMUOZtt?=
 =?us-ascii?Q?n5W3l4X+0ff+jWcmWpsj4tGGyEr8CwlOF1xEFoYcgxEa+pg9aXls9E/oxwp3?=
 =?us-ascii?Q?gG6ga1udB3rUSZrFkcHmxzmxL85gPvwJ3cV4d79PckFNrUAj6PcPLX70IsVj?=
 =?us-ascii?Q?KysaYadYfGJlrqEZr+ZK5qEzY+lN+GiaIrhyJrAywVHl5SPzsX7WiFzXyTEm?=
 =?us-ascii?Q?FMmM1TXsofuFR5sKvpsxhspsvLjt45OSVbKYJNH4IjEzKNS+VX0Ihon7aFtz?=
 =?us-ascii?Q?Qe6j1Aa8s+p1i3BY4g8BckQC8Rz9PH7mHAhsUroCICULGjg+JY2b2NwzY6n3?=
 =?us-ascii?Q?XBblT+kpWr+Vs1uBqJCqCd42imBxrGJB5HDuoE9qUr2KFjI9fu44cjYvIJZY?=
 =?us-ascii?Q?72ueiUh70GtHJ6ND9bcAQ4ZWtQKLZSkVXObeGXhXjFDqT+V5WjffEXHAXm7L?=
 =?us-ascii?Q?JL7U2R1nBWpSm2CsGScQfo0fMw3gOLYc0Ud1U+qKUGmns6n8ETp713fCkyXe?=
 =?us-ascii?Q?G/3CETPYkliJDJYy/6RGRaAkDAqbHmdoJ6Eqq3Bvr6Q9zpUbT24DARx0gb1G?=
 =?us-ascii?Q?+YKFJJgAapVe6vBfuD+GWW9UEzBjefTgo7U7GabrE9lsPTF2fJNA41BVzBbM?=
 =?us-ascii?Q?u+dlq1BIUJ2Tz10/UqgQjM69rKCuLSZlnZC4/BqWj+YX/nhc1zJ8VKZZYFqW?=
 =?us-ascii?Q?zB9+m/oc4HmuF6gDGwuoRZmP1nDe6KQn6g6ZCSVXM+meY055kSQDoTDi7tgf?=
 =?us-ascii?Q?ee1Yw/TzF3jQq4QwxaR8D5X5Jr07pS6whPLN2VSvV+3d2p2KBH+4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73526309-2769-488d-8db1-08de89cebb1a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 17:56:53.0656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0BpIx+Mc29buSIlO13kns7AmfchvcUE3FpJy1yh5mPEZmtPEReHnZpiDkOLcUfDxh+i6rEet0cClcuBUAdafQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7321

On Tue, Mar 24, 2026 at 03:11:14PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the bitmap tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: "__bitmap_or_equal" [lib/test_bitmap.ko] undefined!
> ERROR: modpost: "__bitmap_weighted_or" [lib/test_bitmap.ko] undefined!
> 
> 
> Caused by commit
> 
>   3ceb692949ab9 (bitmap: add test_zero_nbits())
> 
> I have used the version from next-20260323 instead.

Thanks, Mark. Fixed.
