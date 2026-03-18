Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00BB1C3BF7;
	Wed, 18 Mar 2026 02:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773801456; cv=fail; b=lYV4clPAE+OzH2z5uU/y8h+uUk5VrQkCE3/g5uiGwGrIlAuzJdoi972nEqmACAMmiwGaz0ND1qZxIb7P9+mz5W5dZkIyN/NpTHgR/6WN2bwOovx4pwSxGAELhCfYMSsf7cG0aNnaQa0OaxbzzxhAuUswbsEUYBtxyenBZZvJ5hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773801456; c=relaxed/simple;
	bh=O8uP6EJdFlTWFFC8yOc+CtSmVaIq5xH5f35hFoI2PdI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kSxalI2QGuswEinVi+C8lJ0+8M00tg6PmCeuMlk1xztkCpd3/a5bRoyLTMYxLOxTouxsu9DTY5OlFQbXwwOZCq/5HL63LVeSCl2qM9bWKBIXLdQKrt/4J2+AtSCJsqoCiKrRAknVJbY3fmfNgm5zUJVCGRF59xvv4BmKmxog9no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AzYZ93XX; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AzYZ93XX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5teZr7uczRAdP2b2mV5vNdpgmMLxvJx1vjT12jDrSuUcfq5e5dw+GrdO+5KAVxDCKtGU9s4WSajHxxXWnmfrjZMuecesiMkWasZFIgj2g/YrkQVLpyEY0YKP3NlBCOJoLxo7ZHzVAn94tl/iLJdnU+VmMbwaX3rMIHoWYEKBUJja2e7nD10tBthhkglFFjgXm312vf0N/C0QbWtyCOr8KbWpn7DNi0AIXuQ+EUdGo+UTgSosWQqdpc88LWnUEDp2/MvaicgBi0v4c6PsbFkY4dIqbcbCxbmOVeU91d93q6Yhj6ogBk90lPkMcoSJXwymg+5cTZRKUfoL6/sav24Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8uP6EJdFlTWFFC8yOc+CtSmVaIq5xH5f35hFoI2PdI=;
 b=UrmjMEJFkBy/g7IgNkAHjgvFDL8IcvQ2Ngn3W1PDDavgdjWu0vsZ9RkVL+zAZ+jjO4X3ecPQf8YXkt8dHATFiHiVuWWYjhPqsY0OYqSOZj61cf4zK+N6fo2fbPn1mPLyIWnFtvSnPe4yjlkdRWMD1/oF9dnHnb62bkPVwSawd2W9B+AbCNq6MtpTR0Yk0YHI+t2Di/6E1pYVeQ4LoDhYom3Ym74d+OEniIbW9pk2PQ8nDc4/ofnA6YBGbt+7rNZyFMC+3Y8KBwkAfBzGwa2n6zcwpYHyryJdiMaFv3Gi1FaE/r/a+OL+zzcwpbBKf4AT1rYX5uIc+PZlqmllwrf2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8uP6EJdFlTWFFC8yOc+CtSmVaIq5xH5f35hFoI2PdI=;
 b=AzYZ93XXcFUYiZNRL4aAehRM831JS0x2GZSFUkdp3bD+7qwSIgPuVcjKwEg3RhTYKcT73uU98XrEYFISMRVIUSqT4gKC6w2b6sbu+qR7SbId01J54IEJAKLf8j/+6RlmW16mXrpMi0JrE+ZVVOvz6yG1ALi1+XRqlputUgerDSTkuGTe1wAu5EXMMZxJ0hD7fIM0yCha13ZXGDrf7zqVGc5HGqKInMCNfrjLCcB3OmGqXPs8/woZEKqwS2zvsAzWtVJoiljH7WBhOVMYOO7gsqwH/bR//kAERUQ/R0y85fb5OlofEpvxZ9L64qovKvQJk/dYWbztwGggUtz7zOzLTg==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7792.eurprd04.prod.outlook.com (2603:10a6:102:c0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 18 Mar
 2026 02:37:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Wed, 18 Mar 2026
 02:37:31 +0000
From: Frank Li <frank.li@nxp.com>
To: Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the imx-mxs tree
Thread-Topic: Missing signoff in the imx-mxs tree
Thread-Index: AQHctoAraC4cXoHhEECEI4vp46MV7w==
Date: Wed, 18 Mar 2026 02:37:31 +0000
Message-ID:
 <PA4PR04MB93661D2CF450E72E301B6158884EA@PA4PR04MB9366.eurprd04.prod.outlook.com>
References: <aa6qnpEoSaiP4B--@sirena.org.uk>
 <aa6_zUCpS9vnREJg@QCOM-aGQu4IUr3Y>
 <21389946-95a4-42b4-9ad2-190eba25a5a2@sirena.org.uk>
In-Reply-To: <21389946-95a4-42b4-9ad2-190eba25a5a2@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9366:EE_|PA4PR04MB7792:EE_
x-ms-office365-filtering-correlation-id: a91d7082-8da4-4627-3d4d-08de84974df8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 jtO+rpyUav/EnPMTnbDFTUPbHIy9a4xtDwLdDiJuEYQZDb+hqYMRrWYyIr6vt2ubNSICHbQvi/MdAkKecijnz4wOin8UjuAzbvNQG9lhGqMMIka+/uO0xLFN29ifC0Ud1Zm8vgMaS0G21d7U7FGojBJs/vuBx3InixWzJqOgQdgV3DbGu/qNlV/js8KSU9mJl5vgEMsY6sZ3J0KtZUppn7VA2SRALwZH+VQcun3yE4hlyuXLbwV0jL5FG1KRQ+sazyWVE9p0OvbLPux3ziG3vKi7qgPvfYzxkCFKCe77m8BCoJCzqfqjqrNL0KUrv/5QCBIVx4EobZuo9O4eWl0KQzMUQomS1MmZ8LEF8kO2VqXuE9XCp64lSisYqOp6UQHAkvGaozwZMie0hra/YTrPPy/ebHrAIUvpzp9TjzMJV5D26CdbwCLPw1Yi80LOjmqOPTlqeGMsvDd73jUC/4ToRnJUutQLwPYCYm3bbLZB2vp3lHeqpT/MRdInZ4TYXYrwrcTn5qGOqozeA2q6w7dWC3u1iCyY1HhM3F89h0VamAKuPHYmwHTFibEbqeGRnw45v6fN1f3ISj+/0UsJindjwCAOw5hYBESkf8UCmHn0Ib7wJXmd+yGii3Lt40TY579VLrpS7S6zZQsJzERKAxAZYJAyGOvY3rJK4OmiJy0Oh3x3JpnN+0shgBf0YK7rIC0OHCYj8kM3x4zpaEWv6xREMmw4PQ8OdPB0F7RBLIzAEqOH70LkcJx7gHBiE7VZZ5IDFLp8B/7/TNV52MvGLqvS4iH2qoaDi8DaLzoz+9KlpCg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jwpRaJ3ctS8SBXaf9yeM4NeyE9kp38D5cOTZVlus7Ov7KiEwopmDMerZsDq3?=
 =?us-ascii?Q?+US7UJYhwrfH+pTgB7OZi3/M1MG7Lzl4mVqUI+5+CewiT6ak4tHaSaUIRWTi?=
 =?us-ascii?Q?aiAV85Vvlnv8n00MSLlFsZK2MvNypmC7UICdLjLPt6DqxIQ0m2xiolmQ0lV+?=
 =?us-ascii?Q?6wuRuJ3TvdZRRTpNfCk1lJ7BHmXD5LgkpFNxYCXTYfCd7pXkOR7huOBUA1bs?=
 =?us-ascii?Q?yOolT36ZgEcNIZeT55VMWg6E9PC3F/l6oPdSj1t7y/EPkSqZqF0C3qDUKAnw?=
 =?us-ascii?Q?m/cdZKq2+aU0i6yErCJ4l12DeDjd+ALoouPmsJ6gkewireRTZPrLSNMN6kg2?=
 =?us-ascii?Q?IRV8DH2BLUI7bEJKfVYfVEx8LqNm+Rcc1PCSl0mX05rM4qPXn2ifgqDDhIzA?=
 =?us-ascii?Q?LMDhqfIjIUerK8hrIB7aEDS9D4yc55nBsBs3NV7gFRa2lPW4+XZ1C5LNYWtF?=
 =?us-ascii?Q?bDJVQMH3BDxPAdq4sHVip1i3chbag4MpB0vCRhjy3Vu2tgpbRfEp+gEaCAc1?=
 =?us-ascii?Q?moXrfDvndjo8sgIBWm5qaiT/qM1Gf23wkdIe4Z+aNJMO01yzJfys3K73jdaK?=
 =?us-ascii?Q?Kge9UhKKB9nUOTdaHCUaGAAgaXO05c8eFVsWM/Ti4p9fL+QwsN8lOIyXYVfU?=
 =?us-ascii?Q?lCzOUg22iByuWMwJbWaKFV1uQjx2pPwvnq5KNqsogtzJkWvmGQWWI2OWijq2?=
 =?us-ascii?Q?o3fgD8x6s9SiycTsi5eaFnTDWpBvkgB3qN0JodY/pzVuE75mV/YtxqOVijY8?=
 =?us-ascii?Q?Xcwbs3Rckq5qFvDIgeHdZMgsfdZuGGGSVnpSTOKTcNZxA4CC9VI7M1UpKIAP?=
 =?us-ascii?Q?mLwcx0oOqTZJLLxdoB7E9rZJlb2G/R+d/pdJILnmKlvHnGiwVZGqqYz7R3M1?=
 =?us-ascii?Q?bUhd3eLNOSsGg6iaD6DIpXP2FleOnRUpTmsYwqaKfn38Akx/KNJbHwQwGaAn?=
 =?us-ascii?Q?y8zVjoMvEFRHln98zrQ3WJoHPMyF9WTEzt4eHzViuTAZ/i2/DS58IDsi6ERx?=
 =?us-ascii?Q?GQUcQBJ0VE+S2hx0w1bVXvogIf7hKSEkT8UdnCF2qSvWWLcMUJAeWa8J3UIm?=
 =?us-ascii?Q?ggNotT+v/m6efZfciaXMeQ6Mt7haJIsEeIRpA0eau6V/UmbTCZx0Bb+ErdCb?=
 =?us-ascii?Q?fymYjInHiP5YrjIXs1r7n6xdSzOFriHljNfpEL4xvYkemrLTHqOqtnYsmBsn?=
 =?us-ascii?Q?ZoVDBOHbEkEO120zZ22+ZOR8yRuEtTchOgi38WyohN8b3GO7ny6izldjbFQ/?=
 =?us-ascii?Q?0o1LuRxIXq/HmKEZ6urqgjH7BB6kPNvX1ipMoDoPw3en6wwHAHdT5iIiY+E+?=
 =?us-ascii?Q?5X8b445d4Bl6MB3uMe+v2U/XyVQM9dcqyNWD+FNslSxl1x85ZIwKPuM8NLfI?=
 =?us-ascii?Q?SnagSQPXAAAYeYgGSB5Xye6NlN4SfxRMTWEcUvp9F/mmf8pXxcZLvOWfQlPv?=
 =?us-ascii?Q?u3Mh9RNAp3lD7u7HROWVl/l4U/zLGIghQUmykTfrD2+P6U/pKFNYh65yebmA?=
 =?us-ascii?Q?smbi6uFAiPaez2BaDIwQ3MAp+5Vt5npPT91qnJKrq2CTU4EV4SrN4bpUNiWD?=
 =?us-ascii?Q?DghlPnqvv8VMyGTam2JHX2jyk5GpRhs8CFY7v0T7XdHRTPICnHE67BpR8iQs?=
 =?us-ascii?Q?CUfH2uX/mBusF3QCBd782608a8xogy3/ZU2x9YUwQUG6CJu4rmbpBal+YW3p?=
 =?us-ascii?Q?1AhsBuKUlc7Tx/qdAfAg2daDtFNHup/K4fZ0VspNHDWClTLU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91d7082-8da4-4627-3d4d-08de84974df8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 02:37:31.6203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PRt7RQuIKXa/WgoPV1c6UYONhMP4JtDULOG7kO6TnnkLKw9n9Jc/OjctiK2a610MHAei9dW/sW/So2WI93ez6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7792

>=20
> On Mon, Mar 09, 2026 at 08:40:45PM +0800, Shawn Guo wrote:
>=20
> > Could you update imx-mxs contact to be Frank?
>=20
> Done (looks like everything except the fixes tree was already up to
> date).

Sorry, I missed these email because some email filter wrong filter
to wrong folder. I will update my filter. =20

Frank=20
