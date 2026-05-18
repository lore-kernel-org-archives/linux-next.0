Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E004A405C4B;
	Mon, 18 May 2026 19:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131756; cv=fail; b=deyw7gup+BL3kD7LCXygQkabgutqtkgbZwn1NwivfmhyG9ms0b17oZtLidYyp7o+7M8RGkOaJXS92K6iw5hQOrpNTVBy8t7JrJgDjOtZqtprFNpJCo+yzFQ3kDR9hAEBNm+V/dkQd+tNOdJDaLmofOKITUC70clxI+mZoYsxjWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131756; c=relaxed/simple;
	bh=qMPPyvia3hrztuM28IMmuyTYpJgsBVChenrMMQvecTc=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=bF6BqjTmr2Iuvmqed61fx3GgYgqOke2eXjgHcEXnyZ+E4bbpmYUjXKTUF/o9HEFVUn3MFuxgk2Og/z+D9gkHSjKyc2GUeFkbJSEkOcLbgU8U5xaFmCxnbFHyhcxkHs5vrdLJgqGlM1g7fByyiQ0ZGNUVo4IXRobib7apUwW99NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M8trtIQf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DB/szjyF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M8trtIQf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DB/szjyF"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEnEPh606230;
	Mon, 18 May 2026 19:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=75xWo2E3LrNLqxT9Un
	x0k7xBIIrxe5E4t5iEmU5AkNA=; b=M8trtIQfgeJNSCv0bT/HT7yN9fz1TV+anN
	hUr9WTgb8ktVwp/NJwmy6p/fXsTXVCdU5jFVNQ0PMoMaJk25DYX+jFbokT67+a6G
	nG+mTkyRQr9o9xAcWMDQ/l3pFsUuzIJCtWxTDYH5YyPxRyTQFiJwtj1rAqww+tA4
	01BByp1dgOIGVWe2W3b5BnZPglJddHWeFyGqNfrSqVgOzYj4hXbYJjwZ/mS7HRX2
	B9735NOeRKDHrcyXYGc2is4UXxVWLTfhFXKGR6jsmQwMB5xNVQlhiEnvEXcVjtKs
	gBjKQx9Nflxwr+6eNvkesgiX/ZJIeK9y3YjvdDx8d8rb2JDsEMwA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e6h1stw5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 May 2026 19:15:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64IJEg3O012492;
	Mon, 18 May 2026 19:15:43 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4e6f19u3xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 May 2026 19:15:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdMsCxm1MNHDTaewYO7KaVkWOZXHEyZy6uIvIB4pqKZ7G5+tVL8Gia33M83CJ4UdMIQsNkrnD0ppkqdcp5zH8AGpMzja9vK6vNVHRdoCGZ9JQi3LdDfffBA1afyygLslgGQnUxiouHSuNvpF7sVRrgHUZrkdzNNbMkroinJujfv8S6aTQ9hbgOmgQBn6ADTi66ti57KarDB/ctaayPEJz4gdVE5M8S2qeo6325WdNm4QlCGYKG0JqPt/CXsbYjdPbr9PhrjI3K/gpqI0U3py8O4pazrl9wFHDdRhEIx/xq6O08oACJUlo/RjU7d8jgJZ2mOhEnd3zvmEpUjLMb4Tag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75xWo2E3LrNLqxT9Unx0k7xBIIrxe5E4t5iEmU5AkNA=;
 b=lR3FmZXOCqMjsde0RpS5vclEO5pDoaNIEJ4vJGHB2ttTevlztUiRuFYfEZpaeSLvxuCMQG8cvVjnU5vP/IDWm7DJ3lLvQZzZWSkggBhra7cyFQLMGNn174GndeSR5Yajj7mZD9p2VdKsLM6sJTAAOiNugODXwtwkjnrbRYgODUVSPsBrSCw2aSLkkVrWtt33DtraILMxqNA3p+rDGOfeE+ycy9C8EO3//nxru8/VRHmbvW33lwJr8yoeSUjOp/A18bIdl/BD42Wucj9YuyqG1rfuG3guEr516X/TUqi5ei6Na5vK/Ulmf+YCvvJ8Q4t2Hi3hZ+y2LWYK5bgguo00uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75xWo2E3LrNLqxT9Unx0k7xBIIrxe5E4t5iEmU5AkNA=;
 b=DB/szjyFik/OgDiFaEoseWaiadmvRoDCXhEs1IjaGDtxkamjLy4Yt8SAVq7tbLMfxfbi4W7Kb5Cvyd60oAtiaE+FfKfYcAE4B14aVGAEURgGghigzJHJILe3Ho0pxOBxUOJA+0RCzOQ0dw4lMf+Obbd+mtljtxFFi5T2/nIg3c0=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA2PR10MB4652.namprd10.prod.outlook.com (2603:10b6:806:110::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 19:15:40 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%6]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 19:15:39 +0000
References: <agr_RxvNtfASfevg@sirena.org.uk>
 <fabba1ab-ceff-429c-af55-92844b179890@sirena.org.uk>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Ankur Arora
 <ankur.a.arora@oracle.com>,
        Mark Rutland <mark.rutland@arm.com>, Will
 Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing
 List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the mm-nonmm-unstable tree
In-reply-to: <fabba1ab-ceff-429c-af55-92844b179890@sirena.org.uk>
Date: Mon, 18 May 2026 12:15:38 -0700
Message-ID: <87v7cko7fp.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:303:8e::26) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA2PR10MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e03d3ac-15aa-4c14-b225-08deb511d915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	raMUQgPBt4XKVCwJAtGygNzXazjCmr0+XY6xmGnI1glgI0dIBl8YQGtfcQ2rhgXtIhXBb9A3sTKB1Zcv9SKsTPI+zDixP+P1kn22Lxi+73If0XT3HrYeBfWVnvFzs7lhjV/xa9nhk2jt322rDCIqUxXADzDFVNDZG8gVDrqGPhyxJRUi/KOttnILG8l+Y3PnvR0y3Orr87daZxFkV4/wft2tvhQQy2fVC1Xy6rOeCGhCT6q0D7rEx4V9VQJzybzgafDxAMYmCyu+qrTyYwjP/Y/HK72v2txRs4MgX0ay/xGiSm/DwAPHJ+WWJ5rNU4lXHGALb8g/N/x41EBNI4pHm6yhIknkcqW1L2E7tHC6RUKz/lSiqb4E+CrCNE2axC0jP/aHpptTJgR/mYjXNSEzJYk26tHkGFCGv2WzRG1EdVby0ZU4oPAknenW87rs94zoy4Ofs5NnbwM7a3IEL51JfQ+0MpfwSeShEpjd8Ix+dZgiDyqO51Wr/t+A1pMboH8DZJET+Sv3LpnoItRmvuV3CuS0SitbBnN2ZqG0enDPUaCZAvNlnltsR3GVsecR3uOE65WEE/ra+L5Yd1Afnkqc6NtCK3iwzMQibHcXXdhPjl5J19yukHBtY1LDcvTbw1cvT7O9266wUsl1da2LWckjkqrrdNEn+Z9ebZ9XMyvNscpMpTmnLjqgI5cE0Gu9lja+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vxXcvlItuZBRZXTI/UfZIaX7cOAM6nCbdbmSHgfYadQ2s1/P+h8hEE24fNj4?=
 =?us-ascii?Q?OcfgdhjN1V6mgr5tXaczZXOYjTNKcQeKX8fNnxwBviZ8mUpwBdtavyWmiqft?=
 =?us-ascii?Q?fjSzovjfH4yfYdMOrReOnDRTo0MO6lnfsvQ8YEJbDE/hySsCpgX9CwuEVlai?=
 =?us-ascii?Q?Gdg3bjxsBMkShz9fxi3brh8CfBWJOs6Gtjoc+bdHJVsxux5j6rmMwmNu7rS9?=
 =?us-ascii?Q?N4n3cm+Kskyhg6trzXU249IIS9PBuqhyrxIsIxiSCRb5fVsHmzo3OtftpNc4?=
 =?us-ascii?Q?Db51n/73bOlTBGz1Y+VdJxMKJ4kFtzAv4XfJjNuJFQX6KtmY22iN15HFr4b8?=
 =?us-ascii?Q?il/xf5I7x9SOYlk9juI6poypeBlelnEUznR6z3FIx4RfIF+R7RkhBo3jnyqk?=
 =?us-ascii?Q?pIjN9MPFN8JNk4zPfvEFo58gnKMFv1tvbbBiuZ89F8m/ElEk+Cd0Afw+8Z59?=
 =?us-ascii?Q?W0veHxbVdfth27Rr44PestIVgb9J4UCrv0DkyQU+jQtR/1tQEiPhd50nwxt2?=
 =?us-ascii?Q?I7LqN+ZTlXWCDIYMFQAWBPB4wuMXgb7PzdL3cuNT58ksx+55ABYT/f1uu1Ku?=
 =?us-ascii?Q?8WlpUsxJ55azWoYcUz1OpLtoTeoz82jZI56eP3XFRdABqL6DTywXqrpNxTX2?=
 =?us-ascii?Q?FBCOuCZwR93STopwb/EjWit3Jx1zRLBc20/msPRp9eN+KmnSFjIalr1XnF/D?=
 =?us-ascii?Q?qfhGy6RSZoj8cum5zRQwA6h9ak4ctmcv/tNo9T3/2UrWSq2Sj7KLyWhqGesw?=
 =?us-ascii?Q?fvsHiG1UVxH9OoCcdMogLdpEGmlh+bRu0J4izKO7VnJ5/yB1wWNHwU8lJNz7?=
 =?us-ascii?Q?FYyLgQwSEDAQz6muKZX2iESUdfEpEAjFNd1awMam0pm0W3iQsWWBmvdSeFdO?=
 =?us-ascii?Q?PagzHFaBpQRQ1OB9X84ZLgDXC3Z8y0cK26JRxnoiarLZD7e4D2EdWY5D+hgd?=
 =?us-ascii?Q?FTw4XHaA9SaYJEpLpdo6KfiZ45zqDdUo8eCjD3BfriA1mC0TiJfaFE/Lwh0y?=
 =?us-ascii?Q?OVZMEqSE38udRe91UASXS1NVu2AnvOZz59SmcsQImXV+I6pLt6mH0vIJ7b5O?=
 =?us-ascii?Q?oLT3g/Ias7m9hu7PjLnvCXY6GwtEtLsSyMX6aFJfEfWqDr1Q5v7P3fHHGC6f?=
 =?us-ascii?Q?ilcqUMDGGmlb51eMf/jewGOt0f1Noezh+64a/BW22duiYKM4MZfNtyyRJJbb?=
 =?us-ascii?Q?E0OokHRvgsZZzkBAy4/W6Pp46cxuOUIzAY8CvC4jLcZ2y8VyxXTaLpuHvXa/?=
 =?us-ascii?Q?bhSezWK66vs7gEunlOXmkOW9z+8RdqYXUIa4SlUS6Cs6sXkelUMOIiC9RS6E?=
 =?us-ascii?Q?fjQvjWoukpCEBky8JGCpoEQhVhWl9x4K/kg2LlaUZvg+oEDTattMx0EwPntU?=
 =?us-ascii?Q?S8Ma49PXwYCMIaVgU84T4STeoNbYSeLTE6CvVbtkDm16V7tk2X4Pne7rnbx+?=
 =?us-ascii?Q?7x/G/Ks2IljXaPTFjnrhJFrIFiELXKgUA5yeCOLfHjiRfwFw5UYy8cD4qKtb?=
 =?us-ascii?Q?qmRHD2xXKLfzTfFbYsWOdnja8PGoFFd/OrYe2RjUq/aCU6xWQMPJmazEnn9+?=
 =?us-ascii?Q?H9GJ+9QpRtOMCNsXd/oPH1KTVxoOSgsNvQLMMCBlNlSkzAKrLd8mXBx9gPpp?=
 =?us-ascii?Q?VGRB2GofoYrJlwtNMBlPkxtw4CP6guXqMXOz4+E2fMR0S5WHaoiCIAMFkp5Y?=
 =?us-ascii?Q?junfHSYOY5pI6LKJojRyEp2DuEXdS380lC/5sYW3Vse0yU+11MxQyspJtEju?=
 =?us-ascii?Q?MizHHEsaQTE95ket2Gt/MjSRSzaAtyg=3D?=
X-Exchange-RoutingPolicyChecked:
	Wc2bqLG7SggljWQbqj9IhLufE5H+BEyKoqiiyrEuoSVRXXQvqH1mPY+ckPk4oYRTlnXegU67clDzY5L6kPemFjQhp05rKH5uTdpuuUudblsrOj1IkBKS8GlKA+p5mNDnaAlr48aw8FwtZGQ3MAigkOvk+P61TRh/S75fstBJmJOk1WcrN/mvfxqqGN2RotHzbb0+EQEKenUkcoD5ycbT+5n00oq6YL73dsnWIoFB3Exob/OYosZP3nsP10MmwoMEpweVbWohydEdAEq+7JKA5oo93X2hgZMi4EPU+dGVeWm0//C0YgyCU5EcN1ctAXtCh8pHiqOmZtqqHoQ55ll6aQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	73YgVbaIuflq+6I3+sKH2P9VmvOpDB7WrAU0eWOB3OSg6pByn9ompS4zNaPLz3VtezyDOUptIvSIpJtnnYncDUGNbDWTsLICuLEEXlXLeSvy+iO1kPIyEcCcluUdtgUSENz0X+3o5w91KhCAJFH2UoCrwdRck4jIHsBYhv1f5FrHop2Ca6KaoViiDO4Aqw1z5otJAscI2w963bJg6LptuhtJDd10qDMq1DcecQZpbxxu+AZKTjOUAaNPBkZglXJN4u2A0BsBoMAX67NjGV5OqFcAyRs8v2HbAasNEemF1QnlQiESl6eEpC9muMFHLSbF1P0YqAd1Q1ujODun+TQxHgdmtwOV7hL9n/g0TirTsnsrN7yZqr6xJycELFHWtPZLsKUrGx6LkrEva/kWgnugW+OEnbJf5fzaMGufSPYCpxJvb2RveiPdZes37gAvoHlG/81cafRPhYDv9zTRbDu36oJVwGG0FRjo/pwVSfsXZQ8Drecn1Wl3jkhnoqIySHCt3oCtrghhaeQe190Gt1RE8U7D4qgyCzCVvSa4NIy3cPBa8a6wiTITH/Nby3UlZ0RA9Hns2XdLxVTFX9S4T2KoJ5iNP2g1VNR+OQFcwUfB/CI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e03d3ac-15aa-4c14-b225-08deb511d915
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 19:15:39.6139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVsBMzh0jfpiO+tfKg+GAFZIjHdCuYUvw+TukskEW3dkJrBPGDbBxyRXPPNdrX+LeMzmTD63mglW5uyR3BwU85gyJswfmYKbgt8TRvjwIuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4652
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605180191
X-Proofpoint-GUID: PQO--aiO8K9XF7kNDNkkBoNoxIdKv-7o
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=6a0b6561 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=VwQbUJbxAAAA:8 a=pO8nEHUzacvN9XlQ_9AA:9
X-Proofpoint-ORIG-GUID: PQO--aiO8K9XF7kNDNkkBoNoxIdKv-7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE5MCBTYWx0ZWRfX7b7AR+vgprZW
 7ddiTsYwJ0tJtX125PdEw7M2IHscgxTigD984Yb4Fs5zjTTuiQQoGSwNrtyfN49tiSMDmCU5okD
 FpSoTJ1ofRUbF8Qto9YQcc5DB9DHx2k0xST/yKEixcUEMTllDHk2G9QVcGR0ZNlLozqF/bUv8QC
 fZ7WktlvqkxNPWP6FaO3fAwmh4HWXEdP1I86wo34o87VG1sLN+AMgmgOZ8Ow8AXY/jNheg+BF2H
 XS/T9aL1M2UnnwwflO9t2k65W3HUoIqqVjDl0g3dSky10TK8s0H36W+LCMEQSxVjaIAyIM99fBo
 zVZW5qgBqbk7BoDL4D8NgdVIY3/beWJ/EkJXvsYJiRFItno/kY/PukfOfREQSTabvLXRJrB0NN2
 eNrILPZv5758u4vkn/TyIJs588pIe+qUG9h10lGZgF2mmePcV3mM6yRI/Bw3n7CpvDdSlaIZbvq
 kbHx5Qemu26Ve+DC39Q==


Mark Brown <broonie@kernel.org> writes:

> On Mon, May 18, 2026 at 01:00:07PM +0100, Mark Brown wrote:
>
>> After merging the mm-nonmm-unstable tree, today's linux-next testing
>> (arm64 kunit) failed like this:
>
>> [11:39:24] Failures: smp-cond-load-relaxed-timeout.smp_cond_relaxed_timeout_succeeds
>
>> Note that we are running on an arm64 host with access to KVM so the
>> above should be running with KVM rather than being emulated.
>
>> Caused by commit
>
>>    0403c34571d1d (kunit: add tests for smp_cond_load_relaxed_timeout())
>
>> in that it's adding the new test which fails, I didn't investigate the
>> quality of the test.  I do note that there's some related functional
>> work also from Ankur that's also added by the mm-nonmm-unstable tree but
>> didn't investigate that either.
>
>> I have used the version from next-20260506 instead, the code was in
>> next-20260508 but I belive Thierry was emulating.
>
> Actually these patches were introduced in next-20260427 so I'll need to
> go back to next-20260424 instead, sorry (got confused by the tree
> rebasing).  It looks like something in the more recent versions made the
> issue more promienent.

Hi Mark

Thanks for the report. The failing test case is using a kthread to
toggle a bit which the test depends on.

The first test condition succeeds:

  KUNIT_EXPECT_EQ(test, (bool)(result & TEST_FLAG_VAL), succeeds)

so the bit did get toggled. The second condition (runtime <= timeout_ns)
failed:

  KUNIT_EXPECT_EQ(test, runtime <= timeout_ns, succeeds)

Possibly because the we got scheduled out while running the test. Not
sure why the test started failing now. I'm guessing the VM running the
test isn't under CPU stress and the like.

If that can happen then I should relax the second condition.

--
ankur
