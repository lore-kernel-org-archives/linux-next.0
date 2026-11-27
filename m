Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795800202;
	b=F68DwdCMm61/ODO8FoEfy2x9llp3r1zd2dy97cX9TDUhrjZD1TvuBKKmSD9Mfg0hQUb/
	 1QI6mZ7ZriUJveIM9hWwYBwN4JCa6EIhFpm4desNYHns5gLx2j514NwsU0t9uwHg9FAnL
	 fIqhdFOfcrSWs70gHhPCuBg8yCAt9D+0lcG+XBPSs1Dg3DXrMJnPLYEw9ORWyPzbWd5fd
	 3b0Ci/fAiNn9PH536wTlMZBOo1Cp20b/+s9fLb+rZ0juzXCIDstwldpgLEPi4QT1nVLes
	 U3UdlSgIv+Vh+jRdUc54hFCGCqox4hSCly5YlbsX0opxjh8LviaaJGSMn4f8PDwCbTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800202;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Content-Type:Content-Disposition:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dKrcF/BE+AnurhfwTvuaT3dP25FVB/ky+ffz2y1cSs0=;
	b=rOIFvLk+ziw27OG+fivZOQeU59vjmEwpbgEKajn2sG0uNmWv0VWc7Nm+HMpFyYfwzIhi
	 VUa91tozsbHx7q4PqQa0dq2ZL2EquRYxDMwESrq6w6iOAZJxsBBgsDSF/AUqt6h1Z02KI
	 ruNzRP8B7wuHplNkF58BXFSdwJ5/lnK9YJBx9Cs1oK+j/QHMVboLVJsMah1XYWx1f06nt
	 DaQowG+AtwmBd7Kf4oz54pb0kxdhBaqdeh8s34DGkhl51aq2Oprr6brk+905RHekViYm9
	 jb+A+hESiVqY49aCm0gbOdMsLweRrIsKwnau8LyPsgxbs/HrVZjepRYk/bvBMAYWkgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mxGPRVOH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.7
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010007.outbound.protection.outlook.com [40.93.198.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA5A606A31E
	for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 17:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA5A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mxGPRVOH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYEmMSCN5jh23qCV6FjhHlc2UMm+fepBZ6nRNy/Kk4Af2djZ/aNE9ckxfciBQeOB00lJmrpmmUgFTWEn3RZMG5IRxWwPwQX8+hcHrOvVb+vFix2Vf1dseqQY+hgPUs9aVJynku0XrC3LBcpGnqqL8PKBgYSlniyYuoP6BNiXT6uR8V4kCI7j9OnuC5+iJcQdJH3MmyFo/+sLO27z8X8h0vES3WE2vkTpYSC/egvH0C/W2jmumoDSXUKRnAIdIQf8pIh+jMVE3KxPU4iLiOp7b2k5wJVSxNU7zEEOA4040NAK928QnF76sGOV9cZbFdgOFNBBBSroQSwxZMgtge8/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKrcF/BE+AnurhfwTvuaT3dP25FVB/ky+ffz2y1cSs0=;
 b=iyCdZd0IRQ12yhhtaA8FfGyzNryt5Y4QtC4dD6p5WgU296hYLUdqP9Aw3v+E6LuKcVscUlK/p7ilzLRWy/2/25yca2IX9P6owpjyNRwrj55YGgIwgYnHJPy7EknlomAxoxTFG/3MVm3hf3ripaYQrtHakhlupf/t7vTy6q7D8YbkFaKImhLeODiUdGbQmLDV2NIiIX5t1baWgZvuKAceBb1KIhz7FkOc31xge0xxlz/fmH/k6THHidc6r13G1jWtoRnUUfIJHkjggKWxS7bVhGtWALV0jmBmPFVBfxlq66omvWx15P1e2rc3IE8JFzNR6MjX2fdUNMyJoLH9n8VXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKrcF/BE+AnurhfwTvuaT3dP25FVB/ky+ffz2y1cSs0=;
 b=mxGPRVOHlZ/kQIg+Kjk4KKuqM52DQcyRl29DSpN188bk5wlOJOf8FmeymaEyuMWFPERkpgyBonOrQZRw5P+F1jnbFhDb9iiiGbPterEulBSThZrfy5W78JjcEEFC8sQPtXLWKKE4CqwjmnS3SVzqp48glw1bVhQJ9JUasflxMhvs/kjSr8rO5eGl77xXw/a/OcwYueCbkhOvp1APBJha064/PtUP5Qd1XdTQjMiBWvaVIT71pz7gpV49QBqafZnFT7b+rnkUDl7PE1zhvbXY4ZL3jcB/XALHkuknqLT/sFV/A3hyMevoglz8Bwf/LSDB/2nDI1CHGz+0szD2JhfIGg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by CY5PR12MB6249.namprd12.prod.outlook.com
 (2603:10b6:930:23::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 17:23:18 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 17:23:18 +0000
Date: Fri, 27 Nov 2026 13:23:16 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Subject: Please add tsm to linux-next
Message-ID: <20261127172316.GP114472@nvidia.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="89sP1ULv0VDZAhth"
Content-Disposition: inline
X-ClientProxiedBy: YT4PR01CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::24) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|CY5PR12MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 564bdef7-d18f-4353-3372-08df4cab2083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261009223027099003|18002099003|10067099003|56012099006|261026140227099003|11063799006|261028144727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	2+CKfq/6BMSiracbM5SPgTXJwb3L+/u5zU+oPdwDYPh0b2W+89vnH3is4M8kPPuM7WB7HxyuipIbnx+W2/HWTrsYMGqPhMkmGi8eq0dsqiPUTjIF6mf4EjadQ67zZc55PkFXqhUWS3TD7yrYU5SzCF5uXkTY02WawhbvFAMwrJWBnltgfd2cp0Kw9tqKs7WEuQoPEyPQbcpz98I4/djDRsEjUP2geheiGmYQJNoI1Iz9jvSVFIWLtYmo1iQkIfon+6OcEbPCrSfi77pUFKavykFj0CbPMroxWfsIch23M/qc2ourT477Wu4wvrAzcydwh7esiF81rLO5Ayw5J9mgywFWZXI0hXzBmXh2SIXvSu13FfCjUTOwtIZzj6bNrOk48PXRm1olkSYp6SibiruZd+Uwgdyjr+xsv7jr4le4jAa+Y8hneBc0BZw+uV9V1whmcGvkXzu9dU/hNE7Ygivuztd6ahfcGErJ26r2o8anwljOxTmA+KUgsAaBzIUn217sQ9tRU8Zp6ausn0uLsdmnP5/ttfJ57QfeYFxbwE3Q/VsFdntOinSAlCI53GLx12lnkKjuTzEIz+sxrmF44VZQ/4G/bPZNLg1OctB7ZzN2YtZaIfRn9rSCSLpY07UVLDv4PDX0GD2kUl4iFoaH5A4aaM/ViCvzrbkkGD57vWl8s5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261009223027099003)(18002099003)(10067099003)(56012099006)(261026140227099003)(11063799006)(261028144727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QmdsRQhaXY0ubb3Ovf2hmc+IQxfGDAUN6+2aGnZAbkW4C3KPbIB8BkgU6BhV?=
 =?us-ascii?Q?IkLLP/4xfBCWt5ucgMWVuamr1TVaHDV2H1zs5GQoWGHF20r51SbhBsh6ouw6?=
 =?us-ascii?Q?lsbw2Ji+1PQ8VNfYC05NLu3kjUiYe9tQ2tStuKXgZ+IM1vcSjcTmnlxu4EX2?=
 =?us-ascii?Q?V/vwHSl5zHIu5by5WS/iJgCQCHa8QSRAT3xQjcNZNldbCPhwKf83YRWG/C25?=
 =?us-ascii?Q?Uv910yI1U8Cn6AW/9Vr8TmQsc5a1dIW9NpQWCTetFTSurCijGp0o5vpgsjrl?=
 =?us-ascii?Q?OJAz9VhiMbC7MQ9WX3rnE9Pn1+DwPLxIsAQ1ohazeZI6q8Bzb8xzwvA2PBCj?=
 =?us-ascii?Q?xQbk6czzVuTChf8/18kakFHpG9z0DxPunF3EXgF+kg80pjM9f8AoFMJ1DjBf?=
 =?us-ascii?Q?bS5MY0FKGIwRljk+TfNLHOHMOPZOXxW8V7irfYMorG6JoKkFzf5HDXP+zKHo?=
 =?us-ascii?Q?WM4dihGWvHOJxq+hcS6ICPa/CRIumDdDMMv3ColMnX0YcfMOGfaI56K4ZvAy?=
 =?us-ascii?Q?nvjBbpK9tMQFXgEukQU03ApmY04rO3aGbyGFuEOuRzgmzLwdV+dUsu/1QeSc?=
 =?us-ascii?Q?ORI8Kmhf6kHLdCL6N+ycMLBf5LSsZUzYsE1na/a9DSdc+qE6bmYsKxNaLK32?=
 =?us-ascii?Q?yWiaG/v9MLANJt/60iv+OsciNor93hqcmB05S6u8RIvoKsqWFLHcIZBIoGb2?=
 =?us-ascii?Q?4UkfYVDJfTFANSMrSj6TgA5spmkbMN0ZzS1Y24MLVSjtDzTcmcAqQB3Vhm/b?=
 =?us-ascii?Q?WDPOraty2AWdIw/hkaTRCDuASGqghLbWcXLAqz8WdviBKWrgFDyvDbbZfFRl?=
 =?us-ascii?Q?BcmCe7NUns/rJ81RGNrAqfFEJ8peV1fq+r4JbZGYtHnpQDgeLqfe0zzbMaZz?=
 =?us-ascii?Q?rdLZ2HeLKdkOrub3vaFFYc7qL0YMK7TsP9f7RAmg4x+ygIMrVgWSz31whRLl?=
 =?us-ascii?Q?oH0K4Vv/PA8dJNlsyzE3OFyKpzKCbvrH2LT6somRa+OBujQOR+K6OJYJBLNx?=
 =?us-ascii?Q?NU0BKQovmjh4TjBScHVNk3luaHgFiD6YVC0x5qaZOYM1uaQLc/rv6lbEPMdY?=
 =?us-ascii?Q?gaPyL5kdD64VYGyIvKBic+LG5jd81IRr2asoVw0BG6CHE3w3o52m2443KIh7?=
 =?us-ascii?Q?zoWPITWxxsSV6Y+HMHURdRH4BW8HrMChAW7rNYkVPvR8enZ4advsbSkquSP0?=
 =?us-ascii?Q?EMx+O5N6m1QdOQFfNjGWp3JDqd5zo4ZrQ3Lo7MOFrezQUrIq1M0YU5Q5Mc41?=
 =?us-ascii?Q?mWlC6oLIKbcFTxMiXfIZcPB6zuzMJdN5QRtTXh9Q4Q6oJDMiUh4ps34+5KPo?=
 =?us-ascii?Q?7y8RZs4bWAsmmVoCM0aAxOb5qsQhytYBTRh1NhZV7eIC8bBY8iRsUyEg7Tsk?=
 =?us-ascii?Q?3/+xCxBNuLhm8k0cFEjEIGtdj3B6oVBjD5SLERewB0t/TWcazenUEq7T7SnY?=
 =?us-ascii?Q?x17BZ3EDMyBnp7fq65kRf74gzJJNARxdUpRTGhSdanlFwYOzzg0yAaUSEq08?=
 =?us-ascii?Q?0yG472nuB492hbOoXA71Bd4F5QUbjoYzaxcJndPC0s+cA9YcPT1pMImV2kmW?=
 =?us-ascii?Q?/J3bSpvSN3E2yzXMtczKXZA/+VjeEKFydIM8UB1Vv9MezUB4bHyHOOxavlf2?=
 =?us-ascii?Q?v+ZGTxYmt9aAJqpFCVkPNC10fX2mrYtfkM10weaLtWZZXY7hnIkQiFPTY/sm?=
 =?us-ascii?Q?YM88rHWjeOGU+LxxdFeUZTBsPH/tTK7aMXrbKIQFmQH6pFLy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564bdef7-d18f-4353-3372-08df4cab2083
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 17:23:17.9370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSsFXraEVPtO1Aa872qzZbcCrEJT/h5bE/cGLi39JARegH02s5UzKPNdDf8MvUUW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6249

--89sP1ULv0VDZAhth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

Can you add the two git branchs for the TSM tree from:

TRUSTED EXECUTION ENVIRONMENT SECURITY MANAGER (TSM)
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tsm/linux.git

This would replace the tree that DanW had under

https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/

The two branches to pull are for-rc and for-next

Thanks,
Jason

--89sP1ULv0VDZAhth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRRRCHOFoQz/8F5bUaFwuHvBreFYQUCawm8fwAKCRCFwuHvBreF
YUKWAP9c31d2jHqOaMhc0K+x75fOeOwTUPK+npPRU9HfX2p3nAEAzyyxcRxFbZqQ
DQJ6PAgY9RNOrdhW22vgDKwnUJBuUgw=
=jAks
-----END PGP SIGNATURE-----

--89sP1ULv0VDZAhth--
