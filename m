Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6147836C5A9;
	Tue, 19 May 2026 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779170564; cv=fail; b=MWy3Ez6ev1rs4Ds/PrLstcj0TylClrxCqcoGnnwW0QCZZgG7Coa9tJgJHxC7JUvADFKtVL2LFh8RACQz3B1BHMdoe2Rvw4G41tTAz6KNNYUXXxA0y1TLbqApV1jxAV7yhZHnSW8CrSixK+GPgU0rxhulnDaHM17WuVCbCq3TqLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779170564; c=relaxed/simple;
	bh=QMKR+3F0SYEXtH03LWySjSEXN8YsoJgK1c1cfgu3yGk=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=Q9KAsv5bZhHufHBI90edizUA2xafvl6v0lOWsAMGaWSHBFzQO9RRGWXqdKESmviith6P99QR3htPvPzUH7Bpu6OSmoB1RX1GF99aVfuTnYT2by/a4GItZ++BiSO1aK9HL1pKJy0z0NhI46mjLovQ/d2CgFCJ8IqPbeeDFEyFjZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W23fNoRx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B6SprbOX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W23fNoRx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B6SprbOX"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IFh2vJ1598419;
	Tue, 19 May 2026 06:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=p2Orozrk3TCtmnlQtM
	13tCbB/R9tf4ilXP9BvSFZ5II=; b=W23fNoRxRcNV7TKphYpQYoKN7gTqQ/9iP8
	PeH6WMAd06J8I4UyoBNB/4MUBtvJn6DOvQUtKkrMoRKMOKKbVFHqmJZMukaNHlZC
	p8ksn+90aBavrBv5gBhF/nljnYxKQ9C7XyUA9ZzmoA7r6ofkzvnWZgNgdiLxaIJn
	maHyMQG7dyHgLe+Zg3r4RZxhh7J5K3i5l94c21Cu7y7RRsL+45G7BRbLANwYTDL0
	iLyE/a6jmih9/0O1ZxS4trmMZ7UNCvX4cizcRcvdC3n0hw21qSC9PGywN/xgUHR6
	6yAHHmNp0ROod/Jr6QKYE5sKMAQn4VnYAxtJmzA1abdX60jNKzFg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e6h2ckdjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 May 2026 06:02:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64J5xvjt023840;
	Tue, 19 May 2026 06:02:35 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012027.outbound.protection.outlook.com [40.107.200.27])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4e84ebubv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 May 2026 06:02:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WN7+lBBuztqnul01TjXj2RA6SuE+2pPqlG2ocQgH3tHEzlWE6CHpvoeT7Jhzsyyz0hCFnDXCZqoEFNVmuJpvCbt8MO1eNNfkWYgKbpin6BQ38Pv6ak1FDZv6BPKHxXWGL+PL+Y3pka4DwhGUUTBWyFiyuk8gVfQeQWd4+C73r3Wuc6C7Wwzi9gGsNtBjN/6ldfKXMyckT0utK3F1ILd+jnx8lHEW4plQMpg568M0o6eB734Yu5Ex4XqXg3pY/OxYAOxvX98LUmsYMr2SzjfmHb0vGVqMK3rk9079FIhWqPDEFhefGxp1tQahwMCDm+BYy628Ya3V6PPwHgxYd83Gxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2Orozrk3TCtmnlQtM13tCbB/R9tf4ilXP9BvSFZ5II=;
 b=xI+6a2gkD96Lo8vQyXqkMBQl/g8BG4drdibLnxc+QfeaV3WyuP6IOS31WiQu2kkWMCM/VgzlEiYVfycQEkR7IEAKwSVkZnVxjeLByke8OfkJG2i3440vyN3Z0xoliudaneunzSUYTNBfK/gN7aCfEYr8jXbBw3BppdvfXy6SZ+YJZ3icJ0P3vqcodcVsk+waREC2+gZUrA5PSe1zT9n2KO9vdP106jssNKwjZK6TBukAPEFKKH6bFN8FKOuvKYL1fafM/eAp8UjF1ynbrMWG5HICW3CKeJNIYj1cSYF5xHwI7EiJkOy4d7XeR4MlZ/OfjIGYiKymT5n8VOsVBhOtQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2Orozrk3TCtmnlQtM13tCbB/R9tf4ilXP9BvSFZ5II=;
 b=B6SprbOXj5VwA+LcKY9qZtRAmp8c8w0xaMxSCbAlFSSmYzR6APMLSofzTzv+NnjoEHVeHwBQlyeddSGPqqvHCSKUN0fKftypcG5qZCjD+lOHmpTBoGT+o3obKpbx+ejjSn/ThjidDMGHUNkmPs8jatHn3ihaWGw+PYbstD5Awo8=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by IA1PR10MB6242.namprd10.prod.outlook.com (2603:10b6:208:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 06:02:32 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 06:02:31 +0000
References: <agr_RxvNtfASfevg@sirena.org.uk>
 <fabba1ab-ceff-429c-af55-92844b179890@sirena.org.uk>
 <87v7cko7fp.fsf@oracle.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Mark Brown <broonie@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>, "Will
 Deacon" <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing
 List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the mm-nonmm-unstable tree
In-reply-to: <87v7cko7fp.fsf@oracle.com>
Date: Mon, 18 May 2026 23:02:30 -0700
Message-ID: <87mrxwndhl.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::12) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|IA1PR10MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 1534ee20-2ab4-4640-2a21-08deb56c36ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OyH4lpaRP0ovtt+IIA+t+BJxAs6g+6BmoMG874/Wwb0GfMasNDoKYrLtMFy8WEj61f6Z8YXWSEyx/x3YujptTA5zM7idS7cRF2JZbgsf+jwRJB01saHeYyX48BQ9VBkEWcXt+t/20NKguanM4SzFZx71k4+2AoUcmylEyGS87b6LGCsCqpgvm7iokoWzvruQ832hbE7urLKLEtyZhQvD23KzsfkMkEtWYs7Tn+r4BrwCbnlM5N3+Lx5drdet0zc7XrxswS0SlalHpRTBzNfZyYfpYDiv/7ZnZ48ExvP3nohXeppiidqClGCtKuQ6ClXTikHUuIhmkb9d9qOgUfNO25KIPLoe5wky+9flAqca9k9z3bPGn0hAiQxvo1tGyMjM93n3gp+YGjU8zFyQhUWEUdmwBaaZCHfqhtVdgbY3a5kvDB8EndJbOPq+1XFNfJVwNwG7K+n0yjTeXSzaNNwoHFWNSsIC/JNeOOm39zXKGZSBUJP8/HMRiUkVEaCFESomhG81lbVrNRZu7uE16+D1fDPLbZUGQfOirPP5J2ZHkJKicDbwdHpIqqUYjc9zCuaPd03onhYcxHMd2W4tqsFpHA/GxRSLynqjHFmf+7tJSytnGlVejBI/fJ//PL2zBGHV9H3nn4jJI3C7ezGrqLj3T9A9Yxd5nbxC9rEG6V5g+5hJgiyEXmtY2c8Wo4zzhbP6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hp6FOWgRNPTwUcyohVluHvfOQAo/h98D9cSbKgXWekxGIbu6QLmDdHaakfIr?=
 =?us-ascii?Q?FNtNzTUXME2SbVt5lyhPc9dLp59zo+ZbUM0AzBWyqkH/MbTY4KsCizMNODHN?=
 =?us-ascii?Q?kqCyQYenX7WAc88GN4KxD4kkOWA3CX2o5ChQN1+1sHJguStRuN1t7CuTRmsa?=
 =?us-ascii?Q?HYTi4exFtJdszEtTlIxiiqADfgH/eBK+sEeftU6xfJdNIfZ045jCtuIPf7Ps?=
 =?us-ascii?Q?9pEud5CdRO9PpsYbzfw+oJuF36sBvmEnVswW8P+v8CIxvH1OEA49jH7ufCvX?=
 =?us-ascii?Q?kGnWQ5qlfyIl/mYxziEocHgPUMtWEEF8hIv82ziHbN7dFbvQiIbQauQuFmV9?=
 =?us-ascii?Q?lcj86AzwVcfC5ZgwkHdNNfs2aVIYvVcF1DmA2hukFYGx+bYD7EaskCKY6NFl?=
 =?us-ascii?Q?/ccSPoMrEuwacgJF330XlYpX2V14TTHmfV8RTo51pm/uuMhE0L5I4ztkaDkY?=
 =?us-ascii?Q?1Uag20UzKyS1IcA0eAUgUzOqUMA8J7RwO5kebXXl/DfUvjPACvFX5sZrD9X3?=
 =?us-ascii?Q?s0Bdi2NK3Spu1qr465L53gNG35XiM4JIq1LEelOo8Gx4RsgjgfX6NL44HgVQ?=
 =?us-ascii?Q?f+ahLl9Z8xbTw8E5vOnxPESEe6PhivFXBzVAuMnj/N2kLyrVPNV93cIqjmEe?=
 =?us-ascii?Q?59qdLhuvQFqGXvSXUXoCTtAW+O14I0Pfq7/XYFcThI6X3w1nAiP2GYXkRo57?=
 =?us-ascii?Q?w+xjrvlsBETNMOl3LbLSWhtCnDT2drgjmgqPeWVJFMF8B5W54XdMUQyf4OeS?=
 =?us-ascii?Q?xFUAbq97C6rEA6zDvtVWKh4JS2Wdvy8QYaKWjR0Dl6yOUXwhgIPQfYLHIh0H?=
 =?us-ascii?Q?Mz9REXzOMUUk+E6fc0w1ppjAIfBt87jlYwRwP4SWxUTpKUAQM9eQyCtoW18U?=
 =?us-ascii?Q?QEHc7jE4XvXq3MoTPVZUV0YV2tSRwP+1a4+ejI6bb7SF10tZJWpQ/LW4kuOC?=
 =?us-ascii?Q?bzY1XpsYfC7WKOzRjJsCGbDUOaTRXTqj7IhrWA+Y7l0Hzzltk3agCDAAa/Bx?=
 =?us-ascii?Q?rpaz+M0QJrg94biuKG1Iy7LDPr/bwSynIwJa7Ai2iG7jQjM9VC9jdMtuZP1d?=
 =?us-ascii?Q?4xyVpgebygQ6podu9RbuIPcV6PNrfN1sczcG1LbrCzx5tvd3rtFmRrwBeCxD?=
 =?us-ascii?Q?MkY4lndjBzoHbaCme4/4BS0RZWjZkG3pJDl6CR1GOD9D+hzUuo8aVobf7Ybp?=
 =?us-ascii?Q?ol3UqLH8FIp9B6I++wnsBfyXUFx+n6KwEFLU3KlZKinzHvykw08j+s5DCz1W?=
 =?us-ascii?Q?dO4mLmVuzuXXPOs1XPRo+wb80CtdMUyNqgg4t9KEnS4XMJpCmhX2/hJVz2Tv?=
 =?us-ascii?Q?XBPZRjz+bD0lXFur70NofCmoL29/2E8h9VJT/XQyt3yCsjdkQSH7bWQomaVy?=
 =?us-ascii?Q?IOxkppVNy4kLFSo45JR1m8vKcRT8+vojvT82aGUOdvcKGdxaFzQdpxEKytAC?=
 =?us-ascii?Q?Gzga8kUljZ0u+CPLg4R8EOa0deMU10/q5pZDMG/xiFxDq4ubYZ6oXy0Ote43?=
 =?us-ascii?Q?ziGI2g/OnhhCBdF+UHv9UoRQhcgrnRafGY/J3DQAdyPo6N5Uo8VGW2e7aNDY?=
 =?us-ascii?Q?1IrqtJ0TKgcKv+WBmkZoAyprg0STcvVsEYT8oxeFWRX/nB21Um9nZHDSiuOs?=
 =?us-ascii?Q?abIbvBVdelIVwSg2kgQWMGLMBSDWFudCSb8qqCzNvueGkZxiNtcieL5XvQVx?=
 =?us-ascii?Q?GvxnJZ/26jMr8kok7tur/Yo+fBnrBBCpZddDOAL/zCUJw2WIguvkOCsma1e0?=
 =?us-ascii?Q?99g/ulavzTT/LHsu70cE28kX/66hwbc=3D?=
X-Exchange-RoutingPolicyChecked:
	d7bcorQm0JVvMTlKEZ1zCuKSY5XDSYvmzyP/rpsW59D/xt2Y07hbo61omn8KoqkxutwsaGZ+s5UT/KPpZKM+fxHdJyDjSbKHmClpOGbR50woFUifAcg3x9Q3P47E99KVP8T0ayi4pW+89wuBn72wVWbw0/N5qJr5sg9ckuwxddb+dB/8fagsErLJP6Kl/MSd2OKe7JZfXbZGLkQWAaw8V6w7YTsy45FI9BiqEt7rE36rGBIPLhxL6a0E39JLNUTnKQ5/yCRmr6gIEnsNTLAFeQc1rkxTsddgN2GGWpsrxFazyHOSiXBpygoLhUyaGYcYZ5K3ZFBTfTTCWiRwJ6FNtw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xGJwdTFUEcDWqhEz9WGzKPcCXMHmKNmTtrzvVdk7AwwepBaQqJ2odYePjxalDVUx0HogbVQ4/t6Sp8sGMyasiinYJNXcIyX4nvbQS9VYIbKrbOR4UvVmrP73ISFlJ252QQwhCixyRoQC8sk2n8Ir9S2vVeMSvUOTBmI5KPHcMCullI2kEZTKH3C84lPHG+TG0o9vqWd8xhocIbtOlF33dLKkaFbDnxvDByqmkSV32fe0OmkoHvdIWtzVgScYBDVI9okY47mWYjz5a1L4uPuHWh63K/14tsoHGT0XOsIOJU/URnalKU/a8Ii8H1hdOMemGQRtNhLr+dUlADuSi72pIvxUvh8jz/X/8kyCaj2KeWbdchjODgX3G4jmXY3ThXFZVdY4PpVKCky3vt25zbw8womaXcD0O/2XCvjG34zZx+O8mT1LgAWrfT/UJMATd8U5cnBXiYDZEsBdwhl1dE+/hgwxnyCK8rHlaI3nh3iSC8m79zqTR5pAPrFYgELPbB5MDhjCIaRXLhTVIRE3WX7x1rP6N1g8+82u+XOStM51JmPCyJq1M5BnpJFXaA6ZdyzpFzR641bAGP3VEIV/YTYBNdCCSm51bBN6QJJSMfjlo/g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1534ee20-2ab4-4640-2a21-08deb56c36ef
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 06:02:31.7945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNBMWzBUZ976bDtZjMQdkD33PhTpOMzB3ScE/DJv0WYm0FRvqk/ucsfCFfjGVm3RToKXR1sb7vCQuoDJCPI4li7RRW2P1LcaP3nG8vN8RoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6242
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605190056
X-Proofpoint-ORIG-GUID: gYPy2dOWdP4778PcLMFWsRD7IHLoHxK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1NiBTYWx0ZWRfX5ejaA+ZvpJ/F
 ZvWmXC2T9bo6NUROU4zhqPvnUZ6vfz+dgz5PXah4o70SkMjjSwVWeshFyUcmXaA9yXBmEUw4LOk
 4CHb1lz6i6sYZWIiTFWsQsQKPDMK7By7aTPT4LyDh178/c7mLzI89+Yar5ZXyqScUbujSVU1Kri
 NYjofRVjSKirQjpVL0htoTOpVliP17XanxOdZnpC7NrXQjoeEAHq+DWVbHyQq0LuyOgQ33lVAHg
 +IbhXXjlqlfUSszgJSzbsNAt1Oz//Zcmi/2dV5wwcNEA0CTfHgIZMlCvI8Jp93iViD1VwfI6AtD
 r/twF1zes0VEJSAjU5O/L2Z4S0+SohhVnqv+uXEdi1nak0zlzfNgepGfnDuBOL9pzz5A9vHKj4i
 XFXr1X61CoQWU2PdGwMhnelHQseKn6NbrY/TGIqgcx0ZajpBgRChd8TtRN/GeDZ2Afs8PLnh4bx
 StqLQqUFyWdlUFeud+5Ihol5ndEKPsOJB8NzV1LY=
X-Authority-Analysis: v=2.4 cv=Ws4b99fv c=1 sm=1 tr=0 ts=6a0bfcfc b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8
 a=K4efPF_LkDCI9KWps3kA:9 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:13839
X-Proofpoint-GUID: gYPy2dOWdP4778PcLMFWsRD7IHLoHxK_


Ankur Arora <ankur.a.arora@oracle.com> writes:

> Mark Brown <broonie@kernel.org> writes:
>
>> On Mon, May 18, 2026 at 01:00:07PM +0100, Mark Brown wrote:
>>
>>> After merging the mm-nonmm-unstable tree, today's linux-next testing
>>> (arm64 kunit) failed like this:
>>
>>> [11:39:24] Failures: smp-cond-load-relaxed-timeout.smp_cond_relaxed_timeout_succeeds
>>
>>> Note that we are running on an arm64 host with access to KVM so the
>>> above should be running with KVM rather than being emulated.
>>
>>> Caused by commit
>>
>>>    0403c34571d1d (kunit: add tests for smp_cond_load_relaxed_timeout())
>>
>>> in that it's adding the new test which fails, I didn't investigate the
>>> quality of the test.  I do note that there's some related functional
>>> work also from Ankur that's also added by the mm-nonmm-unstable tree but
>>> didn't investigate that either.
>>
>>> I have used the version from next-20260506 instead, the code was in
>>> next-20260508 but I belive Thierry was emulating.
>>
>> Actually these patches were introduced in next-20260427 so I'll need to
>> go back to next-20260424 instead, sorry (got confused by the tree
>> rebasing).  It looks like something in the more recent versions made the
>> issue more promienent.
>
> Hi Mark
>
> Thanks for the report. The failing test case is using a kthread to
> toggle a bit which the test depends on.
>
> The first test condition succeeds:
>
>   KUNIT_EXPECT_EQ(test, (bool)(result & TEST_FLAG_VAL), succeeds)
>
> so the bit did get toggled. The second condition (runtime <= timeout_ns)
> failed:
>
>   KUNIT_EXPECT_EQ(test, runtime <= timeout_ns, succeeds)
>
> Possibly because the we got scheduled out while running the test. Not
> sure why the test started failing now. I'm guessing the VM running the
> test isn't under CPU stress and the like.
>
> If that can happen then I should relax the second condition.

Thinking some more, the condition is much too strict.

Instead of:
  succeeds => (runtime <= timeout_ns)

A better check would be:
  !succeeds => runtime >= timeout_ns

I'll send a patch to that effect.

Thanks

--
ankur
