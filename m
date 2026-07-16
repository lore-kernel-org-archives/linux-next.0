Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8693841DDF9;
	Thu, 16 Jul 2026 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207367; cv=fail; b=i+uvIhSFpIL4BZhlVslmznhUfg4pg9ufWxx730iNF2JRnSdiJonmrsJ90YQqd85ct200YdgXw2SYaC5gnF5oeBMJ9KelWUOY0g4MgVGygWzGJHUY8z6tMoL4alPp9ktaDp9T+Oqj+DUdcQ0yPYUIY2SM+fmBUHDSWfpf0DXBI84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207367; c=relaxed/simple;
	bh=nwti2og4sNLJt93BFbPvCI5of1iGbe4wZE376WVedjU=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=Rr9D2PIwMXpFYqPR0LXVLnFd4qg5CjdCBSVHDh9+/1PNJsZOTHYK+aOzSvhZLqlpOZtHMcrU9q2vB9EPD3phLZJeHCmHzp2fyxvBPLkL619hO7cWtyL26ehTd4PXCy+vc09ZdVJMLyzgCZH2x0zVWtHhzf5uLOwJkhnqwrOFUMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M2PK624b; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q1G+P/U3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M2PK624b";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q1G+P/U3"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G33enM3766344;
	Thu, 16 Jul 2026 13:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=mo4IqAVvFvN+OSrXI7
	xOjxCfwQ7qWadYWB6DUtMAytA=; b=M2PK624bOq7/DWYAu+2fG6QFMVud+eADDx
	YFskYDUYprb1VFxnpeyJMfFAMfMkVA0bvORwfzCs9e5nlFY3oiMrMxvsgInSQJBZ
	AHxhOj2oaEj3xFVamV+yCMNIiHjbGFK3zARXsBOrZB2bh9XLc5r+8VHjWdbX0gOV
	r4TiXWosPp9MRkLYyIf1fj0Mu4kMQnsqyQeZh0A+QeXHIKNwvLXypaBDGxoGvb6z
	Zr7ThyuV4XdLWeTPfz59GhIDQpQkmZTm72sozd8uQxNG3OdmVpKG9QA3SB0gE+UH
	O1nOBHSiJCh+0yY51Zxil7ILotQnyPHwDYfv4NqmzFk4w4pOyebw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fbep38mjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jul 2026 13:09:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66GCwYdT036570;
	Thu, 16 Jul 2026 13:09:22 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fbc9ktukf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 13:09:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzGqAHPXpOxJKPnX0ZYezk+pJv079/t0Pwkofps+9FXLfhF6cQ7oQU9qxfSvL1NiYHclChpCU6ECk3GJgVTz61ma1d88W/B4hhOldqqn+9VamaklAoelkX6LHuhiv88joZ7b9n3yaRiD/Dk0n+KAoSCmvxf6C287lQ3B+PZMwr6hKl8AUEHZA6ldjMaxyD5WG3WxQZgiqAynCWdb2498+NCF5SPXAIeFPqK6KVqlaAI2OitKdFXFTQJq1t+LXWLBAfPfXzTKBmV/wQaDCteO0t4C/GpfGDE8LeXMU+nY8YsjLjIp2d1N2hvFtonsyAH8QQe2xyZWEaRBh3rfHY3H4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mo4IqAVvFvN+OSrXI7xOjxCfwQ7qWadYWB6DUtMAytA=;
 b=pSybbVg5Gj9EtmO90H5ep0veFlQBwRJB2H9kH6kz52r0bzXKlV1rhdxZ8s9EDsrzOreGntQHEE3nLhjewVITG2I1GuaB7Jy+aWZk4hiY1riLAm+mrO6noyPLnVD+X4IAXVcRasejqN2/xkawh7R7/L5oeoaYcmFpVv1LAKpZxz8uWNKMVPiJB2D3ikc+PE+w5L+7pJkoX/f9PeguBd0zUycZsxkZqsv/bYsB/Fdf/LayGMx384FXO0A/K0sGmupyc6eyGIKgv2LGyrU0ALNNtmk7wezXi7wvKxrpH2UpZnubz4s4wFRSjUORu3hm064JAlVw2OVluToiWKXEC5J5Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mo4IqAVvFvN+OSrXI7xOjxCfwQ7qWadYWB6DUtMAytA=;
 b=q1G+P/U3943zDussWbKmTdoadGvgk5vnoJX72bQpe/M2Mdiu36y8Q66rPw1SqkNEkVQblqmfqHnD9W8Wa7Q0j8Z4UTjqx1ifuvX1xXtElyIMkcpVuDe9o3k7thFPQK23df+hBcKgXIB1Ixvu+RMzFY+okIvCaZCXgB5hYcdMegU=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by PH8PR10MB997904.namprd10.prod.outlook.com (2603:10b6:510:3d7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 13:09:16 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 13:09:16 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the origin tree
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <c3a949bf-4d78-402b-b474-db92f0613c6f@sirena.org.uk> (Mark
	Brown's message of "Thu, 16 Jul 2026 14:03:49 +0100")
Organization: Oracle Corporation
Message-ID: <yq15x2f84ki.fsf@ca-mkp.ca.oracle.com>
References: <alUAlBfA42zAOZ3c@sirena.org.uk> <alirExca4fzB-fr8@monoceros>
	<c3a949bf-4d78-402b-b474-db92f0613c6f@sirena.org.uk>
Date: Thu, 16 Jul 2026 09:09:14 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0342.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::12) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|PH8PR10MB997904:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a0b594-987e-4cc4-3c62-08dee33b7046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	9UTZh5Nodxalc9gJ/KutPKWivhQyfv/yOFyFLrw+N2M0/IBM4WQ0sS5stQhQUgVtdQgJ3Zb9fhU2c8ytl/e4u1C1xEObW40nBMEni69ArQrHNNLc7sVo46z5S/A+Ox5ZKPxzxw7qks9dE5a9QifHlt0H6ZmS9eraRLRoqFwhsILuZmo4Q7iOH6B1imG8V28ye08rgWyRrpPi4hjmTWoF/PngLn9WuWazcrdK80ZT/0hKnE/7daEYIxRGtQHRtl2TdQcaLHnVOj6Oc/NwjBU1R7BXlrO1Nhaw/T0HgA4ufbpmyruc5Jw3A+8pjYYOcFlWVos7PjJsuSvFkyLk992ITHjAQyXVA/S3lBdhRiZKutWtkFJV4mcX9YKabxZqC/gZi1ZsmFvqy8CJFH5J19EFcYjuBj/Oph2/dF+qBFNzmt77ksqm3XKekywZA2DXmhtAtA/kOV26zo7zmIkCxnNTZaJocQvTWDVbAjM4F/JaJazGOygwaradnxcIx7UjhvSIr6BdlM4umHoSwRcnJfUY753TC4NkHbP89m8EA8zbnWUbUv0Evam5FoDhhKSEfSJqAj7KWtJwcBhER1Z7LCL0HuGsfpDJWDGAI4jzyJ/bLqIsbLrFyf3BnIcbi+CtjNw1+LdrUh1UFP9gIJM78gk/AcP01/E/lGRVehKeg+GMWDE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pM+p21sVzWg46ogkoELK615yoHLruPzuHJOeZnUF+TAk2sDyClvr67KGsfVm?=
 =?us-ascii?Q?ACMBhNxI+ANNKRx/Fc9EZEGjWK44eQ574C30ru4o299XoJAvMpHgZDMKrQs9?=
 =?us-ascii?Q?UDrEr0Ve/Ni9yvcs7ShyniQkBKUmIuM/fKE+U9ikhYCIRLVJWB0abUHGQeFb?=
 =?us-ascii?Q?AxKZgQaF6SMo4mT9hjLtsUyXTxyi/SMBm8TohcOEQXkzq95qMbeRvHiBrYAd?=
 =?us-ascii?Q?mAT4cTcZJBWfIgmShv5MGcQ2YwrwTg+APtcknnmhD8s7wRBDFWK7E2wjDPKD?=
 =?us-ascii?Q?u1PMDddvnX0RECwetPQynG1v+XDBsKRwBhSvyYG7lol8C9YLUrq+RaAEBoX+?=
 =?us-ascii?Q?ckVgWQesgB+UNt54o0vlA/g/OiaxfHFeQlUq2DrvgaIxkOy9lCvrcpXVXHmM?=
 =?us-ascii?Q?4AVPOwK39vtsHXl/jgS8dLk9RiD2yN86AfEZd8Kw9w8pQwD1nyJ34HnFyA6s?=
 =?us-ascii?Q?q5pXraQRG5vXoLUjVPVWf16z9RtY9pcHc7iSXhg/v/P72Tv5Ft6xDBZmw5Sp?=
 =?us-ascii?Q?d8pL2xaGj+YXUT977cjLS0WKuLnpsOXz4+QO2u4D6DzZRk1cO/Q24WAPRMpU?=
 =?us-ascii?Q?7S/QeKdFx4qVGXG10N5hhpaK+T0ZgXXdcH4tAsAafCUXeYOLV7JMyWxCJvmx?=
 =?us-ascii?Q?9gvkX3gGB7+FWeXvto+HCHN19KHfve2J2CwBs+gjqk46h6DEmUc/8jjEybO+?=
 =?us-ascii?Q?RmeU51HBS1wMHq5i1oPxxzTl5IHqVIITbMKorDbO5Np64tkgsGYjiFFMfvaB?=
 =?us-ascii?Q?KRz709EzZGy35fhFPwI88CyInr1Abf6/DJP/gVgITu+V3iIOncF0QBHSTPeS?=
 =?us-ascii?Q?oIF13N4YUOMvC64QFgUqQVxlkcFUkkV2Vb6jd2LaVN/4X/yZ8Q6EkQ1xIfLz?=
 =?us-ascii?Q?FtZR0T2WmSsLpWIJsoJknrjFOlxSKIFeODt23AAWz7OC4qx7zjyH9+peeuPn?=
 =?us-ascii?Q?1sHjTrLkc8J5FQFrSQq9Xro70Y9O3jG0f19pM79oXpxVyqWeDUpm7XFz6kYu?=
 =?us-ascii?Q?/srRc1OkUyhuIg5ywiQQ82YU+eXPuQ3oOOMitsfve9e9WvJskgsVlOJ4luPy?=
 =?us-ascii?Q?m8S1sUKLdsdSPrZJfyiqnYIrEJInCU/6qsxngGerT5V4W9Qf3/rFwFFmIgMY?=
 =?us-ascii?Q?zN2Yqf2ZRMCLYpsJPRou3dHQ0z84HY89vwUx8uUYFw7IDceWQNZRQHtFRL64?=
 =?us-ascii?Q?//Af4KDhk+urH3eN6S1tnK3bD+RGUJzYXS+EB2fZOhpfxVqMXeqJR6CemlO/?=
 =?us-ascii?Q?rwM7iAXQXD3DQCDTxuPDYWhGPZIaEYi03ZM1MbGjSX8fuEghvXPCKbRzi66F?=
 =?us-ascii?Q?5j7PDBL7AgBdcIQ5i5grnLgdUauVhLXiMByKy0P4l2xLWaj79vuZqR7EE+8b?=
 =?us-ascii?Q?+F2WY3nZIA09zmdmg/8I9vNkqPzItUxMpTgbP1glsN5s2nViGcrd+zxj7+a7?=
 =?us-ascii?Q?QfjnlcGjrDsElzMiddjVVCZdoxV5KPP/1Jhs5Peb9sErMnAhlwGwyIYOt+ol?=
 =?us-ascii?Q?SRaRLAXzomhhjxwEFoMF8x6TQ++kA4SiPcfCriLjifTVF4XqcEP91ZwSTsvK?=
 =?us-ascii?Q?kxTURCTyvFqd5lvLLtSZ1XbkmUSKd1rN1q5m/iTTJgjesGXU+ckigob7zwKQ?=
 =?us-ascii?Q?sGaeA55FBuxJn5p+EIFjv6hzOF5V++oFTQUgmR2VRFr27w24YjNAMKw6jfrb?=
 =?us-ascii?Q?nw1G0tN8p+rJ8LnKdw8fZBM4jjTKfcJk9DDI6FiakHuEYh+muvrmC0oTUKOU?=
 =?us-ascii?Q?H4wei+Esz/jX687aIXGSIIQbMxs7BH4=3D?=
X-Exchange-RoutingPolicyChecked:
	O8tfIhefH/XS7yu1gvMBfoxVDd9TszXFUA44FTSMKzEJYVptbcx2niWSfK3y4KimA2vfwCDXP6u7YD3nQk8c+onICWzXw1GjPOUXPHqh+Fed5A7+PTVVyQN1DA7aBa0HxwS3FMLnNep/ugC2Rj7FndxQTpaun+BTAWHSD5PK3nFdPmHwNJe46QhMEygVNdklE+BFBOapZenC8cpBHkjBC6KoGtuZ6dw2MntMhgC+EiYLu+iy5AecA13kHf+wHRiH5SWY5e59LjVqGrhVHdxBR37nI1INSY/xeE2BvmlIAUuihuNDddv5h3Zxmde7zoQKZMmm1rj0THEwKhmpFewN5g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lzcm60XJCJEyhs2ByZ3XPLAN9m6AWGiqsC5Fc92BjSeWA3WzA/oGoPQx+CRlF0JiSKlY6Cci6kNQLa8u9JkrSYFRNXsGpHaCJj8/9vetgx46Z3hvmPCDPSjYL+gjRAmQ//N3ulykGa5snus1Y4T3uyryWRCf9JOQrg20OEuR66HnJg38ZQqaKNsxhxbiCFEkrpYXT826mhm6Rg62p2kSVmAHgxncaVPiIMV43YiVtsPe2eadx/8Xyg5cDsoJ6HI/yLiur1WRSFQjuE6/RO4/YpLED1xR6MpfMwnF4cWgdM/R+JBTi/hlIFju48HbRJ7e9OGZfhEF+r82axhfjQbHNKFxLcJ7Y1xcPyQ9Huxuf75wGC1yA7n4SiWPJD6WpyencA3cztd+7EywPk/lHzUkIBEJ0BSlwRnOjSOifh7kXDk3bHJL1ol+Lx5VlI3VBuivmvAdwh8NE6bCi0wK23xogKlO7jk0QY1R1Lh6aHHa0GvWywwu7mWeLzf1HqEWw39a06NAF+0TdIc718C76YY2kB8IP1jRjS37Jyt8Px680xlFxqzKA1zIXCja7+1YjzA6zI9R8fXwQIWmaXPTDNJ21IPhwCiSuVR1fFcMMCPGetI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a0b594-987e-4cc4-3c62-08dee33b7046
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:09:16.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lidFw3mt47kbSV9fL6I3PfZiAhTnRfUGP8NXMUmFhkZcmhfxg9MkQy2/UiGDesyTfMDyO+cLxf7Aq6P8w/SW3vqk02MdDu7auGTntaG3BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB997904
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=936 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2607160134
X-Proofpoint-GUID: uQtcVeLQcFRKJITvNLhRY3xEjh8YdFke
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzNSBTYWx0ZWRfX9D8VjxC0AD3s
 TpnbhYGgru+eOcXQMBb/mkkSndaBesGlpvBZO9HhfSCqYQzqO7Ew/vSlL2IHpcoK6YgAO7ybaT6
 9/7TGxKlSwfnFmievTQ8mxA9TpBH1k1ByAVhUuYSuoQxdGfhF0M2
X-Proofpoint-ORIG-GUID: uQtcVeLQcFRKJITvNLhRY3xEjh8YdFke
X-Authority-Analysis: v=2.4 cv=dYawG3Xe c=1 sm=1 tr=0 ts=6a58d803 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=kz4-KFSQ7HH0njDw:21 a=xqWC_Br6kY4A:10
 a=RAioF0-LDSMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=Eu1k77Y2QwwLcxYk0U4A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12218
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzNSBTYWx0ZWRfX48sYq8wdwprj
 voTiZPfdy/l0P3AuZ5tcdBXW5p4erpconeHwXwb4blwb9dRpqoBQGnm8cLK3PFuVUlA32dDdHcB
 ddpHV95h27qur1XqdbtvLBNTYnV3+RGrNfpvGccU9zfIKRfV74C57BGnotFdZim0eMibPs8V+9G
 Xz3QwBCK0Ln669mlpYYyRqgmxWSsZb6MoHKHL3JNeOeq5AGXLgqBm6CNBWlRhoDoq3lUXlUZQ0Z
 7JnTo3LPjBOw5rZv9HpGihPVXpH8DLeji6QLvXv2TWS7o03PWZSnpPS6uaymK6HB9vKNt1BqFMV
 tMz5LwWCw8/fj8Wjr1/gUH4TR0ZN+NxcrvG4HgHgrcLCmiUkK6trYzZT5RAJrKhDNKoXbVZXK61
 GErb/svVpdEKXPLtPAsWW7uMRGfAew5fmGVA3GeN+et0Vb2Cz8W60xYqqvvUTjfFyoXVL4BmvfF
 Z2wZLZAtlcIyI06c7sWjdzYQ5ah8ro08PRQfD3AE=


Mark,

> It's also got an arm64 allyesconfig build failure which is what's
> keeping it out of -next, the submitter of the offending patch asked for
> their patches to be dropped but I've seen no response from Martin.

I've been traveling for a couple of days. Will resolve this later today.

-- 
Martin K. Petersen
