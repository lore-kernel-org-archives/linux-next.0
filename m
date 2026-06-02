Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B772631F9BB;
	Tue,  2 Jun 2026 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429935; cv=fail; b=OsV2Lr/PUSpamlxV681dqlFyRxRcnZr8jaKTSWSL9R6uocnBh7Ao+hNPT2mvGtbY0+dj5Rf8OGxIlDba5u5kX2yMi4jKoTH8UPJ2wmQJYH2qMdWOjFIfyAXOVOvqkRWaU2oQgGrDlQ5XxtyLChxpAHrdPKtDGVt1AdiHR3x/ZCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429935; c=relaxed/simple;
	bh=ocmIlYtYEPu0D4NKtY020R2fnKf+1ezJ1VqkjpEsAS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MQ9Hi0w+EqxFSwt39qcbquoZ/24iaSTgr4H0wbeTMCiZheByrIdFCkaFiHA3wYIm3ctcNA1K6QF3pMY6EHCj+lAxfkC5xbSZ298H+6U8ZKr7yqIMPkLC/0YonR0vXS8769Q7ZSsiSZCLiWTXi9EXpveeIGxHhvsOUjGKcSWZzU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i/16tJcv; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i/16tJcv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2M8x74+WdwlIL5ew256H5nht+0UKmVCZ8xRvcnIPKK4EbMgZjKNb5jlaiB+jBjQO9n0Ll6nXn0EWXgesufusS6ilL3/mIlSex2tMkBVa5vcuuy3oavvAKDf4XMlht0eKR1WD4GTX0OXHyVcWoRJ6MpWD2v5VQ6SCVzY5RK/YZomXAJKXPHL5+SX4wKbZfho3NcWbk0gDC92nKUxz+2vhvUcXbVop1tMRAeDKpPPZWjHF6jeGQut7r1bjfIGAKebGh6vso1EnXnP3h4FbsoM4NQ0PlRJeM/jxG8Y2hSdyQZ0O2KNgal0arAq3jJvQxDcwGB31z5UYjTklOamV4vi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrRpHWXUpFKnbYpKsteNJATIki3DYlKdQtZFuW28mfc=;
 b=KfqMYSN2IgDZ3miXFiqco+y+30WHojsqR8Y92mh1mijYwALHhAu3g82snDo6nE0f57eC5N1OMLu2E3nVkeNdMVzyasIor/JmD4At9mVX2Xc2/hCQOHA8ycFuDCfEDLcock5t1O2WFstDvJ8n6aOJIROreCy/pbTjwQiGMjpH7XiUdodx0LasdegLh1IXrVeZ4aWy+W/yPeKqV68e889Ka3H2tK5N2VZZGuscE8PLRSSqVk9wqYsmy06LeDnDBQq5zO8kRAodanABxSdx1aG6aT3/6Yrc0+rnb4tvimcr7ncPV4TzjXO9C0C1Y0RKzv4n0pcoKeTpWcd2KPxJ+Igf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrRpHWXUpFKnbYpKsteNJATIki3DYlKdQtZFuW28mfc=;
 b=i/16tJcvXydVHqVNFdgf1FkUVrtMOBLnQUIn4AmgsG30cBcJVTNPb07KQb1IIzP6IywQZANSb/XjSVKAFnydMXBy10ZxDdSuN31WiiDggj9TAIVcnhri7ZBC+YwbW1cni3xx1cCxbKTfZavhD3frter6+R9P87siLk1FJ5KkHPWLRAycxPsdDS3p9eEBDEpF4ZXK6xWE5oYryIUsqv/7hvEDna1JuI4Uj4k59H4Z5KdzwN93evNUUoXGm4f2+ok4r47n6g2PuHt67XYI2ocmUtWENEgLdZQYIf0zObjPtQMwf9LiLaduTLd1ZaAu5cil/uEa/Ir1kjIqy9KE50Q86w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 19:52:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 19:52:08 +0000
Date: Tue, 2 Jun 2026 15:52:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Mark Brown <broonie@kernel.org>
Cc: Alice Guo <alice.guo@nxp.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the imx-mxs tree
Message-ID: <ah80YTF1Df2_qcyK@lizhi-Precision-Tower-5810>
References: <ah7uaEyP7mLUYLqf@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah7uaEyP7mLUYLqf@sirena.org.uk>
X-ClientProxiedBy: PH7P221CA0076.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: d84ebf79-54f0-43aa-e791-08dec0e06dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|38350700014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6SRfSjLg8HS1qKoyiBzzeO+U3k7xKgkObvzjNEpTWFHJ5WTukrUyS3hSH98EydVRR4fd5qgmafmHbi9UxBXWKzUjK70Gu747KrpShTv6Xzds4S/PalKXyRNsPO6dlBOnrCGuMxzrS/dOQ9Wk7/FH8OF8Ack2g7/08y8V9JjF3YQrefTi2UL5wA/xWvKkqdJDUQxx4H87vtFMn0kMGJ+0H5mJxXfbhLLHDqDwtppisj6YZrHTSJ6gaRAaRQ3PpRp4TevVa0ATMPuCkU2rzEi7m+W1isASU/ZT7nYb/0yANRj1ma2eyD1ZX1t833W88av1G8mNCUN2RSDCy2w2BLtxVxnSOteX5b6kuP1oXtrOGtFM2WjR29qiSVj77ecZ6qoMvJqDWLghXU4Wy8av7WzavL2qQDK2F1VbuxUGmSx+Leh+vCoMCTo6k0YcCdcuXg9iojUSOEmuik7dzq4rQ8uAMstO3gGYPo7/y4i3uBGs+xQfBF1GiNPJIM3HMvnEFICxkRjkGlSmTuNR64vABXGuwl3k5VHQ/ZMEMjzhM42Lp4Exidcv+PmQmt/oY3CjqKajnsXZUMnPTst9LYeheR/M8U3e7FHRz0j74y7QlEdyeK0PhDtWx70vBhBXZrK1ci1h1PxxIgM+hJVFScS7YR3xw1InN0b1hmAmMQK75DRnu+LpdD+9v0rxd4S0hMjSZovutBg8of8bl9bSlHUXqR/WHYHA+YEseVyyhJNakkoEa93N2sZP8USiDVUb3xCrBswM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aVo3/Rfr1qTayBNhaSAXHHLdnDJzlVi6A+hBBG2jjTpJbTAwCwmcqb3+ZIyu?=
 =?us-ascii?Q?1ubB4JQOGwLCi5THuOr3I3/tJ0KS8MtCMiHxju2TS964si9ZXparqKkUfVZQ?=
 =?us-ascii?Q?vcnLcG5K3pXx41GIdA4J7D+7kzW1oRKhxwiZkJT2LnWbXwT02I3seAJb/HSV?=
 =?us-ascii?Q?0H9NVQkNvEyBN3fJT5dVd+ZDGKCCTtXE11qLU0NgnGvm8Wr/otgvSsMEapeg?=
 =?us-ascii?Q?NW48sD1Ilu96GbmhYDMmvIEkCkTe3x53NIhYYcbXENoeusFcIFtt7skuFvSE?=
 =?us-ascii?Q?xl6KLDvWJvtw56Mx+SA97JxjMW9heaq69Rc2S3hXcBinV6+GN5na8ural5Mu?=
 =?us-ascii?Q?O0XhisxeLCKvJJe5N8zk4rJ/H0SmihehHJj756J/+Nmmw7GPvMFLI3xtEC9m?=
 =?us-ascii?Q?4y0GPTMePt6BKM2DK3h7Y/1WoRORASjWt9qflugJdSFUgggHWUd1XCNbozrL?=
 =?us-ascii?Q?C6i1w0l0viGdEmekgWqybQYJYLrcDAHAfPTLnN9At/mw/dTmsK5QeoU29MX5?=
 =?us-ascii?Q?dw4EIP3ExGIKDYqhPe5rgPdHO3yBkF/tCMcZgVZ0YgRmFDeTpOPJay2on+v3?=
 =?us-ascii?Q?fHX3t3qjvL3/6RUgs+BjOHXIsahLArV+T1o58j3C/2+CEhiNmqMyP4mS+i43?=
 =?us-ascii?Q?apaAc5xDR0/+sJuF6lIVdb89v5lIMvkMQbYE7Z0KoK3Fp8uQ9hrzrwkFLZen?=
 =?us-ascii?Q?7PTrd7VErX7wRh4pM/UTHYOtzjV4U2qb4DUW2BQsnYsadt1hTxbu8Sy9NDzK?=
 =?us-ascii?Q?ZrABX2Lu18uChYJdXENy8WN9so8GKpeik/fvyJv8ku+8AaUujoyLQKyLo2+6?=
 =?us-ascii?Q?OlAYYE9TJvMlLKdvOxCTJdbnkZgNrCS7BOADBhv5f9VO/dpqBg3/w2LvB0nF?=
 =?us-ascii?Q?Nlb/3Q3tnE475arDm8P74+381JsncWmgaYJDJd0sBMpqWwJCcgKGBftyhrac?=
 =?us-ascii?Q?us9wj338bAVChhIYnfTRkBUWebfKZsgGt0uD9f0SkiPBbvjbSWjSZK8eJ17S?=
 =?us-ascii?Q?fhy9R1MqHUi7nJcGw+NSl+grHTdgcLoTK7o2ZDgyuBqXAT+BFMLd3vLq32ep?=
 =?us-ascii?Q?CK84CEoDOtD6kbl0nzQo+ko8ATTNxlBWEaAyB6fMkGgxBaC+mD8yCdGZNbzt?=
 =?us-ascii?Q?4Fpv31cr3343EDWoGWT2cbv+st0daPf9tBeGDII4lCn4NN3Gyv139SZ6twiM?=
 =?us-ascii?Q?r+XaYPogFplYS1X4U/KVezBhLX2BZt75g7jYchbDlww+tuvN6Lwgn+fHCMBe?=
 =?us-ascii?Q?gqDL7DS/gFUc/98Gsb93lpZ4WicK3PNol+8RmACV0JBDYXxRk7IWLHr4dSmo?=
 =?us-ascii?Q?XBPmj72wzfjWbuadHTi7a46qK2jCllK58njra6JINtODmTNoZmVA6FidUjaO?=
 =?us-ascii?Q?VlF4xotNG0Y28sTFHxi9W7eWYwUpUZHLSpeoFhE+hsxyoieKougiZr36elXh?=
 =?us-ascii?Q?pJOcoeXxpYOIOxIEwwfFT3jx+dnaOtMurUxUQguHxzqgDDWkFlFOpOaddF+V?=
 =?us-ascii?Q?U8KxrMbCGlm+FY6f8XjXggQEozsxBYBtDrTh79oUxdw3bhyfHApI6dSGADTA?=
 =?us-ascii?Q?zE0wF/i3RLaA2gfNRYgvke/DlmKztPcQ3Lf9cckfcudum4PMHpr3e26ZJP3G?=
 =?us-ascii?Q?ah3cIOOgFqc88Jlq4pv6iqe4aeO83m59crRt97LJWLG5BntdExzrTjNVl8NL?=
 =?us-ascii?Q?2TI0T3+8zRW0QrXCHoc4ET2UPfIsx4tnGs4rYp9w5cPFdHVt6HXMvBH+aTnl?=
 =?us-ascii?Q?nNnNjgbVSw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84ebf79-54f0-43aa-e791-08dec0e06dab
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 19:52:08.1446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADkft5VPLXhdjX6GVhnNYZqIGbRB74TBqDnhd4m200BtuKDCiSUdEFPJc4RqocOJexaFzhEBffQ7+nZW8oc4BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9185

On Tue, Jun 02, 2026 at 03:53:28PM +0100, Mark Brown wrote:
> Hi all,
>
> After merging the imx-mxs tree, today's linux-next build
> (arm_multi_v7_defconfig.log /tmp/next/x86_64 allmodconfig) failed
> like this:
>
> Error: /tmp/next/build/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:337.14-15 syntax error
> FATAL ERROR: Unable to parse input tree
>
> Caused by commit
>
>    3d016a3272010 (arm64: dts: freescale: add ULP watchdog nodes for i.MX platforms)
>
> That's not a ;.  I have used the version from next-20260601 instead.

Sorry, I just fixed it. It was caused by "arm64" tag actually touch "ARM"'s
code. I have not found it during applying patch and missed test ARM build
for this branch.

Frank


