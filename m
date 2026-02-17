Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020079.outbound.protection.outlook.com [52.101.61.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA38281368;
	Tue, 17 Feb 2026 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771351962; cv=fail; b=aU6onTX6UyR5lPlV+wf2C8yMCgfmSYRcuAU5n177hUqIYRxorarGh3Y6EUxodCdIoWlOgWyS/eQphG7YIZkUZhXJ9hbuRg2dA12hNfBjWFQXPeFm/CnnNhDwKZKGXO8KmYzX1YShljizLVBTQG0iJbcQOuQLQXm93194FSfmQuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771351962; c=relaxed/simple;
	bh=t3UXVz0XpvqX5D/A3UaeC0R/yyiz6u49AjoD+FyWIl8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kdiY/JJAywgAQyYKJ2L9FCEkPBr4onJ/J72AaXdu+eJMKbxx4YVt+LeOq6WxwKOGqsDsfTG2KPRNSrt0SjwF4Hg67rjqeB8fKHXIYUEB+5D33aYgSHjJtVcPC/wGMRrUHpEPXzZ7TQg4AbwpVI9BZdeYo8IoCt77rAldxnZhkv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=Dh5EG1/K; arc=fail smtp.client-ip=52.101.61.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="Dh5EG1/K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeTSDlwW+fe2ffvDQlbzZO8QebwySG9LHD/OVtZ00ZDP2a5bxhh4UbtHQuFhxAcrfKCcFq9ISlGgGL8tBqNg3Nh/41j7T/FgL8Np3Cr5WkyKvvD17qiyxAZzzAYHKd8AilWYeATs2nMn3K39NWZ0sNYAwyvzMFLf2kEc4g4VNkp7KFM2ULp+vYMkKDpUAXsZ0h9ejkcPdXYNtz7tX1yvGc+efewdangMkoaL7KK95Ag5IDqbN16wLeJhFgv0nMASO6VSm4jiv3ZcUvT3t+KDvK57l59u/vyIvYT9JuuX8Xff2zXn4imIXYSORO9xjPUt0UWwx97uaz1KUMeOemiytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qACjuv8tfPiJ7kLQvIyK7RnZZg7eMIFbj4xchhvXp6I=;
 b=d+a5zZ2sAVaujqZv3nPV4Kvn3w+qramSBctBHwuK+uLq6mxza6NqddkFemiU3LtpTazjo/3MNVsVT/KPzsjqQYby9Pe+YvzG9FTpdVh9FkrnXGXGyacXJDyP5fna8HbLXxliyXt0pVf6eSig5rNkJIu3/abXli2yjr5uM+pczIH5nAx09ncj/7Spin2+8Pnl4p0/rJMzHGEbIshxgaBk1sDmrkZ923+r+BEBwvQbKQeVNQyLASafLN4imCpgNn8UJrJdaeP1sU6VRa4Dxu499A/gdUqFdzXxK8YvyO7y4bAmm05IUPDGY+sXwIRuPHMNRMB5hsw26kwSkrHs9TERjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qACjuv8tfPiJ7kLQvIyK7RnZZg7eMIFbj4xchhvXp6I=;
 b=Dh5EG1/KWe38FOwxHMiBT1cxzWqu1ExL6qv41fRdv4qYNOmw2as87tbpE9IzeO1EQmquAe3wkOriHfLrNGFpIFZOyJnsXanmu326SxJgyZ8/oN8gYI+x6xFDLFe+6vVX5QMdi0VKDkkI9ArWDbPBj3/0Qpbpb1Uxa0kVSsntw9A=
Received: from LV9PR21MB4757.namprd21.prod.outlook.com (2603:10b6:408:2ea::16)
 by LV9PR21MB5260.namprd21.prod.outlook.com (2603:10b6:408:2ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.6; Tue, 17 Feb
 2026 18:12:38 +0000
Received: from LV9PR21MB4757.namprd21.prod.outlook.com
 ([fe80::2412:1f0f:2a56:5895]) by LV9PR21MB4757.namprd21.prod.outlook.com
 ([fe80::2412:1f0f:2a56:5895%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 18:12:38 +0000
From: Steven French <Steven.French@microsoft.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Namjae Jeon
	<linkinjeon@kernel.org>, Stefan Metzmacher <metze@samba.org>
Subject: RE: [EXTERNAL] Re: -next status as at week one of the v7.0 merge
 window
Thread-Topic: [EXTERNAL] Re: -next status as at week one of the v7.0 merge
 window
Thread-Index: AQHcoAfd8nl/1VlY7EGRd54p6ikMRbWHMGng
Date: Tue, 17 Feb 2026 18:12:38 +0000
Message-ID:
 <LV9PR21MB47574A2FC9B8D1D4986C45A8E46DA@LV9PR21MB4757.namprd21.prod.outlook.com>
References: <56867107-7db2-4c93-b8f4-f732fc780c35@sirena.org.uk>
 <9fd209e1-e9f7-446c-98cc-e8f3aa17077b@kernel.org>
In-Reply-To: <9fd209e1-e9f7-446c-98cc-e8f3aa17077b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d58af66f-2583-4041-8f58-620eb0ad30ad;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-02-17T18:07:10Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV9PR21MB4757:EE_|LV9PR21MB5260:EE_
x-ms-office365-filtering-correlation-id: fc1adace-ff44-4687-a53f-08de6e50220d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ScMSHfvsAd47o5Ksi75bs0uIsteiq7aXP5qShLFxxgddSUcuSw/5to2Vq9LB?=
 =?us-ascii?Q?vxQLqi2s1acv1GIufQDh2qGrQRcd5qgiihUkULzFUhI30NVhcPyHLSI/TwKr?=
 =?us-ascii?Q?wRxknZQ0mNhOW+e9wrBpIyJ7MoQnlgcIkGJlfB+Lq63ev6EwQZGm3reRxB4Y?=
 =?us-ascii?Q?5rPD9CuC8s+0QBO+IOshGy9CEyz1CYW8QEB9pQctwb+rn2Q+3wtIO2xRT2Lv?=
 =?us-ascii?Q?8/iSUMnVCzHmomKSLn+Qt6cT8xZeUXuTIosIapQaaGZOtCKmPNymbnsfstRe?=
 =?us-ascii?Q?X3O+mBRV2UsyCHKXGgpf1rQjHHBeBf6L+tqhz9rmGpKpUWy1XOlTJ1kZAe0m?=
 =?us-ascii?Q?BsMPcSLPXCXX5RAKNAivM2TOf1a/6JK4xfdKIztw8AenlR0mVOv9NEk+zbIl?=
 =?us-ascii?Q?R3OfOs5y08NPTLHIXu6XERVIpzNKvh11QOl71QnJkGoUL1JjC4MLdAyKls+k?=
 =?us-ascii?Q?jlFUdcIdpPYl+UFNRsEy71iIVc2MRVs7ykeI7L5bGbn0GHQrwmAA38j44Y/N?=
 =?us-ascii?Q?e89P4lZccgl0LRdOxWGLE8e9d/qUZpTxO4xB/Sj/st3u2hz5EN97FbpMjorM?=
 =?us-ascii?Q?ZNGgJAFvRskT4gmRPbZGtQ9hNunXwBv+W+9QHjTfAub7HNyLvO1cKOHZ68n9?=
 =?us-ascii?Q?yYE/992aXshE4oCksAkE+XZKDC/JKarPJlqvtRtrksjDr/sNb+J6Ry/npxuZ?=
 =?us-ascii?Q?l1bB+ZRCShWuuxo0g5O/pc/1iWRybZulHJYnHrQvRcbWegRPvpdF6l+TAE8g?=
 =?us-ascii?Q?AG4+v74rvGEp6/Sv04LXI2fd81HqOte5a1zTnpX4HIvI6yUXzdbaxs/04VFZ?=
 =?us-ascii?Q?SZh9qMyGeFhsWCoFGV/1rXaE8HCLkPSb50S8RahXrQkUlJ8y1FmqFLR6nDte?=
 =?us-ascii?Q?N9tncJZZM56/QhQnFk22eStHlm9cuEMLb5URbvNBaeE4L6kQMnCze7/1q32O?=
 =?us-ascii?Q?Lk1IeausSxHg3innbVwfLe5jZOjhjBDJgmeUdHYI+9gUCQbhLnrIH+wTay0f?=
 =?us-ascii?Q?A8t2Z/hOdvGWhS4kjZBt8qoq0sM03Neb43qizsh5UsNJUCPwlcInhR3+9awW?=
 =?us-ascii?Q?Er3w8cOPNQcb9Trn/vLaKLDnhQDLqDVvL2UNhKIr+OvoBudVl4b4rvjpiSEQ?=
 =?us-ascii?Q?++CMqIAjwaYqWjXxIWuyceN0BKZNJlvwX8fTm/tWYAh8Cq90gKeQfuwUyaaA?=
 =?us-ascii?Q?NpKyBuvlHFiRry92PB+H+f1E2K1Fen1142nJomhbEzURwpwzukUXd/S2OFdu?=
 =?us-ascii?Q?x/ALkSGoZjCclRQyPjXIVX2Lrui5VZLTIbIIRjyeRQOSFo46gATho+MpY9IC?=
 =?us-ascii?Q?OBWEBwkX9AO4cpke/t7GptEqxGBeM9YF6LtMRmTaKM0C66KYRxQBEJFScoz1?=
 =?us-ascii?Q?Pgvx30+Ae2QcXMtKUQZIUJDlMQoc/6KkQegmTUas3PoRRXuEqLPDynKT9cT4?=
 =?us-ascii?Q?aIM/yKVqA5Q+tDdxx0jgMpc9GrRNYEtfx6t6VdSGA9xKLK77POJ+TgG9QAwF?=
 =?us-ascii?Q?87W5LeLHYioOq3HECwk54wr7YuLiAqmLeeQfCzr4GF6BTR8wYxKeTm+LsT39?=
 =?us-ascii?Q?RXvbMTM+g9+B92xrnfi1Ph+sERoN1auuH2+Uk1hapV30m1FMc1TlLo4CwQiV?=
 =?us-ascii?Q?r0jWeFBSZwzfpApNn6QNwzc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR21MB4757.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?myZuJlP8+nQGIKor4H+ria8QnrwPwt5yQxN5TpdpuZ+rcAHYy9dtu7bVBav5?=
 =?us-ascii?Q?b0C/0wQCkxUudeof2LqlSnTC8MLgljdoVhEm812cQq4dLx0wXmhkk723Ipoj?=
 =?us-ascii?Q?9s7ncjC85RAsDX4m1aCsGhDghVPdlTGRLOk0oK5JbwHvrRFrZaBPvR9gm1UO?=
 =?us-ascii?Q?fJDknUaG8ZBKjqgbARD3quqs0zdYK8oobGcn8lsJ/YvlfXR3v93iWqnJx89F?=
 =?us-ascii?Q?ZJf0O+HIMdmWHOAphYN1D6KCgxlulgnWJtWOQMNB82B27gV1YkRMFTjTq6J7?=
 =?us-ascii?Q?uYd+I4Dg/DMgvSAUHg2R3wG52FTP39TKB9mC+cA6tcCG2o+zJNkApB3oZzW4?=
 =?us-ascii?Q?DjFi3lVB6jWZGO+3yYA6JCuLtmJ2PjFBv95+iIWB8PpLaU1IV0idQQLWbHCh?=
 =?us-ascii?Q?8zckz0n+hVQMXFGJUKepOXA4601/dK1ff2cKytBsU8Voxn7oS4vYXYeTJaag?=
 =?us-ascii?Q?/qDWYRKv0cuH78Qu86+7TFHY2X6i/FEwFP8wDe7sBfz9pbO+s08HIeIslctx?=
 =?us-ascii?Q?i4wPNFxsBncCdIY5kHWJRIobHVYqHLHIMtv5MUzu6HBBoFEe6aWoQQBY39Wh?=
 =?us-ascii?Q?KAou5QPcmP+JqTLVHoL0QQfKv4l9xpQEKl6xEaCF01pydSb7/QxGJLnFFERI?=
 =?us-ascii?Q?G5eI2HN3U0rkeK28WmPulbrQ0LYPnYU9ru7YI8/IiTY31K7yPbgQboDRmgBq?=
 =?us-ascii?Q?GnLhirFRd4jyZpVjxyESqfUcHqhglo3knM6agrGXHUV1wRJ3StXv+p/RT51I?=
 =?us-ascii?Q?fRAamFOfVauvhK88NdqeVpUzh28ypapSGAqA1ffP44rA9q8ebMY4bQuzSQ0Z?=
 =?us-ascii?Q?w1E6kNqME852IeKALGxQGRHUWl3KN/XCzAZwCVso5G3BR3gVW59Ot4DAyfKB?=
 =?us-ascii?Q?95+tp9+TX44RVpKB2Xc9e1QPjlExNhKoPCfcSmFI2yIruNjnoCATlFCOUt6V?=
 =?us-ascii?Q?oQEvZmKKWgCZwqDz0xfkR8PJZZJ5G2qMJ8KDHnCcwjOjuNAu5MXTsTKMs3tf?=
 =?us-ascii?Q?4GQAv8hugvZ/ChDjIwp3KPhfpAiH2j6BHW3jAVPNMuGfdaXfDJJ3ZczoQd+Z?=
 =?us-ascii?Q?MhyiHWM7KjZFLdGCWJp8gJKZqZMRu1bCwBH/c8HmFCoVRTpjZGnR7FyNjvFA?=
 =?us-ascii?Q?P0OXP7JRuySH79EpL9jA9fGWOr1O+czA8Nx7cCAFtte+KtSeOmdUL7/vLXuh?=
 =?us-ascii?Q?b/O0cnuPQLCG7DtfpImoYBALGixU29BLHBR5g5Mpf28nqPQIl/ks/PDL3Wjx?=
 =?us-ascii?Q?0e9AfS3dQW6VfwdpGBFDamzBim9lWnxKCMBTT/PwMKRlzdJ47S6PcFaqWuJC?=
 =?us-ascii?Q?hCsHS9/RPeJa46NyBLncKvYRB5Iqz+HYBF9jjDDb2TauPXvvOrANENmHA2+A?=
 =?us-ascii?Q?SPvYCvjLqvOu4J6KHqaG9DaBmteZvOEKsNX5OaDsGhl4beoz7UKtu3fKBLT0?=
 =?us-ascii?Q?NBaJWP1HFKqQ8RU3+o4mWo1jmzCV2uvCdqlQWmkn8DSKVdEDsNcJWsxwpfNM?=
 =?us-ascii?Q?KdVuHk0Von7ZZcAo55iu+AkZfgcfw9BIcbYm3DTSafEjpxzFSzgj3HnjE4E1?=
 =?us-ascii?Q?/CfZEYhmrY/VmQWXiddWctDsiK4saPvy25i5FwJf4MIToUXF1HYimlBQC6sO?=
 =?us-ascii?Q?TY4IlsQoRLRTFpx1goylSKE5+cUOZ631mrI625c/m58qvbprKgeuQgqhGFAB?=
 =?us-ascii?Q?nYDB2oS9Z9t+hVcSSkNDgSY23Q6FrkdtvS/shR5HL9C3Y+JxZfR4HRcTLTtD?=
 =?us-ascii?Q?Z27xRq7VppLsMoCau2PhxBWSlDT0v3HS8l9yW39hPoAPHGPl5o2AvZc1Widw?=
x-ms-exchange-antispam-messagedata-1: mi4mcFbf+nX6cg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV9PR21MB4757.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1adace-ff44-4687-a53f-08de6e50220d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 18:12:38.0783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rrYBEJxnCvSjsmBLW0b+TphIQvTnRC+mp+7Lne0QuH9WO0rNq8/MQ0eKfvbvYM8TRXsHzEneAj/VeyrQSVrnfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR21MB5260

> And there is a bunch of warnings from LKP about ksmbd tree:

Metze has been addressing most of the warnings promptly.

> I see entire page of commits "committed 11 hours ago", so this entire wor=
k might have never been in the next for this cycle thus never actually inte=
gration tested?

This large series has been in ksmbd-for-next for about a week but had been =
going through testing for longer, and most of the changes are fairly narrow=
ly scoped to the new smbdirect (rdma) module and much are small incremental=
 patches for the moving to common code for smbdirect (from server and clien=
t).  There are at least three devs independently running (xfstests etc) tes=
ts against it and test results have looked good so far.  Most of this smbdi=
rect work is being driven by Metze so adding him to cc:
-----Original Message-----
From: Krzysztof Kozlowski <krzk@kernel.org>
Sent: Tuesday, February 17, 2026 6:21 AM
To: Mark Brown <broonie@kernel.org>; Linus Torvalds <torvalds@linux-foundat=
ion.org>
Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Namjae Jeon <=
linkinjeon@kernel.org>; Steven French <Steven.French@microsoft.com>
Subject: [EXTERNAL] Re: -next status as at week one of the v7.0 merge windo=
w

[You don't often get email from krzk@kernel.org. Learn why this is importan=
t at https://aka.ms/LearnAboutSenderIdentification ]

On 16/02/2026 16:52, Mark Brown wrote:
> Hi Linus,
>
> Trees being held at old versions:
>
>   mm-nomm-unstable    next-20260213 (trivial -Werror thing from today)
>
> No trees have signoff problems.
>
> Merge summary:
>
>   Non-merge commits (relative to Linus' tree): 2227
>   2029 files changed, 83194 insertions(+), 35136 deletions(-)
>
> Top 5 trees adding commits to -next:
>
>   146 ksmbd

And there is a bunch of warnings from LKP about ksmbd tree:
https://lore.kernel.org/all/?q=3Dksmbd+f%3Alkp%40intel.com

and looking here:
https://github.com/smfrench/smb3-kernel/commits/ksmbd-for-next/

I see entire page of commits "committed 11 hours ago", so this entire work =
might have never been in the next for this cycle thus never actually integr=
ation tested?

>   26  ntfs3

I think this tree was requested to be added just a day before, so might hav=
e the same problem - lack of wider build exposure.

Best regards,
Krzysztof

