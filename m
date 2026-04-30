Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012027.outbound.protection.outlook.com [40.93.195.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6458946AF2B;
	Thu, 30 Apr 2026 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777566915; cv=fail; b=qd5zjxtqdzdVH+DFtQHzksOD1an0ZpP7QaQQhMXCdySn8wHnaB2G/H6hOukp0gTaCgunkA9iEksFD/O7FF3+1aU5V+XczjEsVfOvQNiaPQujPYwk59nFa2gO3cYuHO+z8Sg4Ij/Nb5OjHF9kLfkTxdA3sUl4R2Be2QEK3ZtaFoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777566915; c=relaxed/simple;
	bh=asoTIRZtdyRgKty57JdwLKvW9P4cI6PL+6Y+9amC32U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n13Rx6Z+RDDVuOM1MQ05wgzB1el/fGP7hwPo7Zx0kpVRakPhfYxwV4CMh9ybWenGbXlM1irOP9W8CFRk17JS7KALdl+HAZ+8xAEdELvkydgbDLpAtULsUO0w8X3bHwtLkE8cBwHBgt4yTFEFp96nRLYm9stqboaL/lolQnElgLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kI0g1j0V; arc=fail smtp.client-ip=40.93.195.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kI0g1j0V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGgYpu+XKnffBgRg0QinFH95BCdtFkC1TAkSxExGQ4ldHr5QAJdSq0fL1jhM28mIMtYLT+13ugFa23XjLj7MWnrEmIZ8Eux8x0YLdsDGhAIQ4SxQN8QoFR1TfZGClIXtYnKbe+VgLRL/+Mnerth5horXvT456Ylxrby4jyWPyqASCsR0A3K1PUIxWlo0SuBrVP2D+/t3jrvajELbWQTQbT6VsRsA78COlC/RVXJ69yqZ0yyOR9B2rmrw6Xv9NjPnzu+ZsoylfeJg57Ac4p1FOspOBVZjen5NkpG65iKdxtp3Cvv734LrA05fAbbChXNeuJ6XGJF6SctB9b4neyrbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf4gMOQ0GZ7EA1WcX0ZLD3m2KYWtG0xN+DIXXrG5J5c=;
 b=TPtQYjp+Czh2JG+vQ8n/E0T78tuXtdG/4RRbJlls94NSDUvqNhjsXPLtjHhxAGZGEKKZAWCIS65075uA3/DJNc3CMA9YZKtgKrj/z4UTiA8lcHCZFCdq3nBX9Y0aanFt0ZG3X3SjHRNJ7PGv66Qzk+28LgQ4+LJX1K85EfKKdXiY6WT6cum4XNqVb9sZXO/WcdE6JouKlBPM0YoIATvvwRfsCjDXmNoWNQ3BUCqI5xT4AhbmfwVjv9h4aFV0jVFwmgS3lbuJmHYrioRfjmIqDY7ZX24N0cuiTo7blylSXhNE7H8QPbIgYN/tAj6ZGjf435Izzq6C9aoWzZ3T1Zqo2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rf4gMOQ0GZ7EA1WcX0ZLD3m2KYWtG0xN+DIXXrG5J5c=;
 b=kI0g1j0VdYkfQF33KjrRiBcJ5gWH7XCjjdXZRXct8DpIMAmV9h7wKTUywPkf3KQ10EKgcEbXjfF5mlrTa6jaTuIrwfuZS1oG9vGgsjmM3BmmHxnKlToGE7V0TyRVVJObHDtSDM2unnlgqV7okO9R6qsgKnTzHz0eBUP+gfgrVH5gOKn0l1MkSuUaZSTGTca0eGKww27t/wHrjX5iZEIwBHd/OUPqxVp74MG9nozAqBeQh0+5Cz7HKJjCcgz5SrM2Ig8gTsHlT2PF2jtCwaD38MhPHbOAZeb8a8zFrIdEBEDUvwfJ7kMssOZTQ+4DtxQ5xymz/LbYnpRKSNLDHF/YPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by LV2PR12MB999074.namprd12.prod.outlook.com (2603:10b6:408:351::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Thu, 30 Apr
 2026 16:35:12 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 16:35:12 +0000
Date: Thu, 30 Apr 2026 12:35:09 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the bitmap tree
Message-ID: <afOEvSkN7XPN5SKI@yury>
References: <20260430070315.4041731-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430070315.4041731-1-thierry.reding@kernel.org>
X-ClientProxiedBy: BN1PR12CA0015.namprd12.prod.outlook.com
 (2603:10b6:408:e1::20) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|LV2PR12MB999074:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b59339-a73f-4a79-641c-08dea6d672fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uMMvY43RKOrI075yQ3iOdDnenVINbltW+hlVZAqJyJN/Ykip9PQ77mole+LL32O265mIvfPl4jzyrWE9iENEwI7cjcGfF1Y6jfAqumM6wD1rwRPyIkaiZcepwWrHfTLKY4aA67CdSSoN2GYUI6YJIker3rGxi8lPKISiLYDsqa8bssLXP0HMosk98+l8dexX8Fl1GR+VVy1sedHaTIR20P6pSp01GHBzdNmvP0y/tv/2zR1Md4lqLRArgV54irX8KDrwshbC8wmai4gEqvH9uGEsrAqqiYjtFRqpM/UjTUfJRUFpOZGWVkgWyvzNqIwcYANnaLV3RUQvdGk3RsT2bG3ocIuzHDqTY2RB5TmbaZMnn0gmlDwyXhlR4+UHDq8aPjLUgOPZvyz5oRus98NEtiT7l1wbKzFHV5F+0bJrAh3KrphxHPiWJhLIYaOLZdT9Q7S90RpZeCZ17ZKuSsA4Q/zpDOB9iLzh/vcsYeMmgFtCwxpcHRFNg4S/YIU/14VuO3+DLVZry9iQbAE2lf4P1P45wp0Rhhpah0wQqbrAPNqlYJ9rOBVdQahPJDOrjHnnikAPuF9JB9KOSyx+oMnH7sCk/NJiwZFoawP/m1XhN3lvqAJ2nhsOn2o5zf1Xv3yW3JGA+TapjLMqj2OUiVRwOBHm2GGcxyRTaNllEemZ/zBR5P3x8SXGnnO1bjV5i3dbz+GleaqBdVPUSJ/WXePQXBnmUIzk1Xa/0kwtz9cQQrE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ydbguNRuNTBfHDWuTHesf/MwKRzGlInnJDSqt3j6P1aIR7GYZilgHy9f0L9E?=
 =?us-ascii?Q?SxaqoWNjHTQ4UjC+qpIFER+BUprFX5aecCBKvM7bqWFwbkgdVroJkNzTFaY+?=
 =?us-ascii?Q?bHqF1FOF8P+FHsJXA/ZaNgW9W8+uk0TyzOq6uUoR0BV39wVP0/Wv+qaXN+Ob?=
 =?us-ascii?Q?W8LCbXE/S50/Kj/qSXtBcfHMnzkwDUoPRoaRJZd+6tNEqAsu9pLue6/v0LgD?=
 =?us-ascii?Q?1okVMYBdZllLyMy1p2UhcDeGQOwLVxKA4kQsgmZtVIeSRZHNXN+Yv09FCg7V?=
 =?us-ascii?Q?gPgsDKOw9kwwx18HKVSK0lUm0WXIhKVn2Ie1WQJBl1uX/3gZMf5Mz9qcxjEL?=
 =?us-ascii?Q?osmlAVdwCCjZfBd0Fp4gl+NRL87YJM7eUCo7PW18r9EmmVaE122KN4hrOTNb?=
 =?us-ascii?Q?oLVFgBpRFTB6OlxMyKumSe1Kz8sGKq0N6tGpolodKnR/Wxj1HdlgIARy+SO/?=
 =?us-ascii?Q?L5qJa6dx29FAl2OdIwJqpgjWxbmEas0b5xExyLQwqGCH1YxLORaA823CYE89?=
 =?us-ascii?Q?t6CY04OLE7hq7x55bbuOyWmalKKEyl6BKwllNZt8oUGXE2G/Seju8+TW7Cwf?=
 =?us-ascii?Q?o5JYxjqG095mK/VkRhdd4cBWeqqcdMHNurhxjhqrWOS4bcjigMevXtyBCNea?=
 =?us-ascii?Q?So89opMH7CfG5hiQZrUFPEwiYklTxUuzJb5tv7BBqyd7//nYkFRf7sKSy3Wg?=
 =?us-ascii?Q?nFujrdtHgOgWvI93W6mwCnpZfWscn+6o0aCqZApIatILOvxpvU2rYOHGymaE?=
 =?us-ascii?Q?/Nnpr8Ph68sYX7/sSFJILUN6Dc86jU5OO1OYdj1kh7pHkM1yKsld0nXj2JbB?=
 =?us-ascii?Q?ycYUGQ37aJh8t3hcwHU4h3eAbxfabNxwK7wAwrnGxOkSuxsAatyzSpNtm6F5?=
 =?us-ascii?Q?FfRd02gs+3AMgbCB9LuJW+7iBrLTX0oX9IEGr73AOIZveArYA1xP1LmcytOl?=
 =?us-ascii?Q?YNLAYDy1eoNLvnxtXixM7FNlkuVUAKc6XZ1xVBHf+r/nBHGDyoUEJ0thgyfC?=
 =?us-ascii?Q?FHydBRnrLKvoSk1xBzKQ9cAblaMr8wSWP2GS+6OttE3diJ7oiH5ghIp9hSE+?=
 =?us-ascii?Q?YNZWUcFDzqHuyK2dMiTkJpa7HjDvdwPZGjNWy/LX1s6ot33LzVqNXzRSzJgy?=
 =?us-ascii?Q?YYCLTQWmPnSaG/RoQOjsVTez8T9/bkXqc26LV6g3QhYlkScAauhkLY3NzYXc?=
 =?us-ascii?Q?H7USgyFTUK8Xz4Cvd5euDUcnH6uTrb85EQ7WzK3MqwKp/25Qw1Hvpvuw4QDN?=
 =?us-ascii?Q?AIvb8PuIwnvJvPc45/aVjk+nEPsLaPvLlg/nqcq/S4/kw9wlSDkKQH7JR/gD?=
 =?us-ascii?Q?pazKT1ZC2dRuU/ITUQ0lFxr4pUXlqroDhfsT1LP/jMd6fVw603D08f7jg4SH?=
 =?us-ascii?Q?A0FhdOuUnEInB1dg8rGLoUGgw4fcSOOIgNHRKHEAPHpxLLrvCp4q1cfQ+u91?=
 =?us-ascii?Q?EfsUHZkU5GDlTBsjOGw/6PGmXsRx4TdejR/d6wCpWoCs74sV3x/OFN6DOGh8?=
 =?us-ascii?Q?74QqttKFiW8GOG3N3jzBVikD/qhoIMVd+oGWFltXa60C4jyHio4VPT5Hb3pT?=
 =?us-ascii?Q?hMGQv99XH1WPoxkxstMff1H5X8OrF91zwXSKREwJ/aQlIMn5AngNV7VKkQPV?=
 =?us-ascii?Q?NmazuU6wUwU+0n0aqfESPk+W2HodwE3hAbqNzKSf1yvTRXpOEt1ZeDCLTeXi?=
 =?us-ascii?Q?d2AtlKKBzmXCuSmQdgq4zrh68TB2sB7kXdGnz5XFODHJHKevEZIE8JpouKJx?=
 =?us-ascii?Q?C94e6NZJYQRngjZgkb4ozbCZTOnYTQ5EuCVzkmTnPIibgXF2bQ1s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b59339-a73f-4a79-641c-08dea6d672fc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 16:35:11.9646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8zHBSvO74A+CzqOJuLG064xgbQ2MKNPGlSIKKcaBvpvlULZTTl28z8wqbjaFzp5+OYrFwQewYunSJF0udq0xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999074

On Thu, Apr 30, 2026 at 09:03:14AM +0200, Thierry Reding wrote:
> Commits
> 
>   aa92c8e0486b ("MAINTAINERS: BITOPS: include bitrev.[ch]")
>   3f50d37ae736 ("lib: compile generic bitrev.c conditionally on the proper option")
> 
> are missing a Signed-off-by from their authors

Thanks. There are some issues with bitrev rework on tinyconfig, so
removing it for now.
