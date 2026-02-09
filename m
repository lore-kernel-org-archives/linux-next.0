Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA66F254B03;
	Mon,  9 Feb 2026 06:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770618660; cv=fail; b=tU5MUyck2v2xtRyGLh0Yyq5fzc4ZHUk38WmBnLHV55QXoun5KFFKiioVcuq1XpVcAw4MM0+LHwxULTf+UnIsahE6hx4GTQJRNfH3M0D725ar8OoxVtpm7oOIIwsDSHCjz5uWUXggZJ8PunrtO2F9E+LYFmLA/W9S0E792+LyDA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770618660; c=relaxed/simple;
	bh=IjfwrjHaivwD00smP+UbHdj4pwmdFiKbo0rxWQ5eAeM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJqBn6+sDiflH9W38Ev6MTnBzrr/6wWWGIP6cmuIXza46idFZal8B1UWccVTcBq/RnkwxOke0Y3v3XzVIWjGVW5NIUVUgHec+zjkLuRfMMlzN+9rOmGbxO3iEwCMbXt+CUW+larInpRKrSVgJT2ZfNXpBCkRiOki95wol6dX048=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DNP9u3d6; arc=fail smtp.client-ip=40.107.208.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DNP9u3d6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqqvYUQsoDUrT7Z7k2VFr5A2bnBSlHMZaaox8yrFQQk6Mtc2DSs0j+o0q60QVWuybTF86JgGUiMdp4InRZQdOkTTZjyqsGtLgPJToRADWwvUWAEFV7jwPCTwSr0yXXk0zSIGGF4ji4QDFMbEMPh30l09szFNWtITpRzTAjuudrP7TrvY2bWWbQtjL867L84usc7GEIZibCe9aTUrBA3IQ562wUDyVjlRMhv9gaSFQ8RhbBT8BXeMQ4xBZHAV/iuFopmcngZnVGEf9Aq7QY0ASqI81a7d89IZeKLUr2BwGtrVwMHaKdCHs/tlFiZiPIZwPyJYmqZ8nVydpBX/tkYFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7m1hu0WLXAksQ0lA5Gmk8+zin8zHMs9B/8q+Inf2yo=;
 b=ElHzBGchkrUmjbJ99Fo9ZRjjayVI0dlFX5tIkUkasNN/SgSxWXUlFx6Viz+sBUn9yj6BabXt2Z1QoU3Hibjdqd9YsCd0YxWlP8dPhh6tYzPm++Lxk6IxjMHAp7c9x1QzXoQ0dKdiB8Ba1es31K+d4U72gVROgbE1DVfhsM/QRdPCg55HnNS/s7IxF2L1AUwJTOKmUxuS2DwPErel9hRCrlQb2YiKoninFRwGqZp4hpo/fNOpkoXeKhqwfMXMcMT0MEE5D8ByuopztonLC/sFnwGTjOutEhfJHdGdPay4cDER/X/XuA+litwwf4C0AzWCRJK4G7lw5rV9cN8uax1e7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7m1hu0WLXAksQ0lA5Gmk8+zin8zHMs9B/8q+Inf2yo=;
 b=DNP9u3d68M4eJpHFt4zyzL2on/23yjSGaaAG95RJb4TqoZBwcLRZX2QcWOBZYKFtxDNVo+qcs2olxRLErDpjJ4uToZ44gES6RKaiPxzh2mOr31GQsKfzN0Q9gfiRipIRVQUYbV1492fptjdEoZq/T0wyAX24BMxxIub4LFdtqBUNmdxZ3urt8NWHt3QPLqddRJxZqvIQq0S2hcFSipNPJNlu92EB0TdolmsDGLALrt+5X5O26OlRhshOoIheMe6QCMnLDIp5NLU1LnJcArLa1+X6db714VhBTiNA8aTDKtAQzs5lZfh9LuWqguVUTq6HkEyBqcijXVbg5J4jSStAUw==
Received: from BY5PR20CA0003.namprd20.prod.outlook.com (2603:10b6:a03:1f4::16)
 by CH3PR12MB9250.namprd12.prod.outlook.com (2603:10b6:610:1ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 06:30:44 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::a1) by BY5PR20CA0003.outlook.office365.com
 (2603:10b6:a03:1f4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 06:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 06:30:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Feb
 2026 22:30:22 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Feb
 2026 22:30:20 -0800
Date: Mon, 9 Feb 2026 08:30:12 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Alex Williamson <alex@shazbot.org>, Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfio tree
Message-ID: <20260209063012.GB12887@unreal>
References: <aYlBU4l2YoT8iaBK@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYlBU4l2YoT8iaBK@sirena.co.uk>
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|CH3PR12MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f8d18c-160e-4c5a-7ccf-08de67a4c0c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1RnbURML09kejNsMkZyVUd3THV2SGZkN2JyNzIzdVBQQjRNSnFSSGg4QWRj?=
 =?utf-8?B?UnlxRldYbFVSVUJud0hGQ09saVlrZU01bFFqQzJSREE2VkpGQ1dCSG5reDk0?=
 =?utf-8?B?eGxKcWZYaDVxVXEwK1ppWm16NDRYeVFsNGpKY0FSeCttejlMZ1NJdVBoZ2dx?=
 =?utf-8?B?SXBnOGMyczJPbE9JcnVWdTZwVzU0Rnp5S3I1SUxkb0twYzR6N1J0MGVDOUU4?=
 =?utf-8?B?VjVqank2cUtlR0NWTk00UExQakJvS0tETVIvN2tDQlNEMXIrSHB0NkExY0I0?=
 =?utf-8?B?R05EMU1DemVYbExoRy95bXJ2OE5OT3RWMC9TTDdMbGhaYU5wcDQ5Mlo3MWZK?=
 =?utf-8?B?SWJUK2djcW5OSHgwQnM3bW96Z1cwTDVhKzh1K1BNWlBmOXg5cXpyNWUyYkZE?=
 =?utf-8?B?elhZbEpRL2VPK295aHV2dXFoWE1uaVFVTTJJTm9uazNLN2ZqWGozbitrUWI5?=
 =?utf-8?B?WFVzTm5iTHh5WnUvWGwrcTh5NTkxR3JUV1doaVAzZ2U2dnFJV2tUSWVGUVRt?=
 =?utf-8?B?YmJNMXV1NUdBbngxcXBQVzZ6cUkrbzFXbDF3b2FIUWphU2lhdDZJRUQxTDd3?=
 =?utf-8?B?dERINHBUa2p3MytkQXlDejhOVzRNNDFVV3lxakdIUytQZ2dqZnorSlY1RlZB?=
 =?utf-8?B?dVlTb0F2MXAxdGVoTWJOSWVtQmRIY2c2S2U5TCtZRERKdWF2NTNjYW5sM0VH?=
 =?utf-8?B?RG5oK0RBY2pDLzFkaUxaaGY4cjdGTVhKVVB2T3pxc29vMnIySUwwN3RJdDFB?=
 =?utf-8?B?aXBnRUltZ1pjV0tQWEVDZmRIYWF1WnlVVVYrL2hYNEc5WE5oYmJmdk1NT2Jo?=
 =?utf-8?B?UTAzMFRmNTFCRFBnOU9uOWxvL0lPQVRnU0tTMEhpQWJMRTZ6cWdJczY5djc4?=
 =?utf-8?B?TDIzVDJxY0lvZEF0MkcydmMrcHdIbG54bHo1WE5YZmxIS1g1Q1NNcXNKQkVk?=
 =?utf-8?B?Z1NuMTI4L3kyc2lvVkhnVm5NNWQ2Mmp6UG5uZDAxQUpCeGVXZ3dnbmpPRTVJ?=
 =?utf-8?B?TSszaEFVQkxVSzB5T094cGZXUlNBUDBDOFlCeWIwK2dLWDVZSFV6WVpHUCtt?=
 =?utf-8?B?K2hBSVlwR0haRGlzNHIyaHRGNHlyekhVaGNqbFg0aXd5S2xRdDd2UzdzdUps?=
 =?utf-8?B?UFhKTlJpczNscVBvQ2R3N3hzTVZXTUxvUkJLeVp5aUZRcEd5MVo0UzE1UmVM?=
 =?utf-8?B?cVl4S2pDODF1YW5WUDNWcDZqU3JzcEZlQTJ0QnFSb0E1Z2FmajlpN2NNOHE4?=
 =?utf-8?B?eDNzZ3VqaXdMYnZQZnFpa2VXSkU4Y3laSmpGTUd6djZpMnVXZjlSR2ZySXYv?=
 =?utf-8?B?cmhUYks5eEc2RFFmSFppMGJXNFJLY1V0QkZLY2s4b29YbWdIcjlsQmdUbDBI?=
 =?utf-8?B?aEdtU0JHUVAzNkpMaXFsVFEvZlA0eENzUmhEdDJRMnYrNzBXWjZYcU5rY3dY?=
 =?utf-8?B?QjlOcVFjZjRFdVBMQ2NlS09jYVNyeThlMjhNSzF6UTZQQWJoRTNtalhsT1ZZ?=
 =?utf-8?B?WGY0OTBwQ1BLenRveGpzRGhNWnFZS0xhdUYzbzM4QVdzRXUrSDl3NUxUR2g5?=
 =?utf-8?B?K2k4ZS9KbFNQc0NSSU44V3BoOEVlNDFqQnNvaGl6QVVnMnFSWDJyakI5MFhu?=
 =?utf-8?B?eHlJbEQ1V1JjaWxvcG5BMmtaaGcvZzVqblpuaXNyY1VWTkhNM2JhZnV1U0Fq?=
 =?utf-8?B?TmpRU0lZMXRjNmNlcHk0b3kxNll5L0VPR2EwUkRmZ1RaTVh4VkgzcmlXZ0xI?=
 =?utf-8?B?Q0c4cnRlQVhYbS9KWk9LczZQL3lwbnJZYkxlVisyTFZwNFFoQnJVNVN6dGJN?=
 =?utf-8?B?TFp2bW5RMmwzbmdNQXl3RGh4NFhwOUVGMU53d1RrQTdkek9DaHU2dFRyQ2hZ?=
 =?utf-8?B?N01uSGpTd3lEK3FsM1lXSS8yZ0ZLZFRtSVZHekpTSGwwc1NKMENpT0lNNjk1?=
 =?utf-8?B?Skw1bjdydHdHSEJLL2J0U3ppWXh5MHRqL1o5L2NvVDI1V1lVU2h0d2h4Q3ND?=
 =?utf-8?B?dnFBR3dZTVlTUnYwRHVLZGZPWEZqbUwvZUoxL0ErQVZ4clkrTFQyYldrVGow?=
 =?utf-8?B?RjVJUk1uajlkT0pTM244MHdZektqbHZjc01zTHFWeXkzOGlPai84UGExT0NW?=
 =?utf-8?B?ODBUdHMvbnFCRUdoaW9kZUIrWlBubmdiNHVJeTlhSHA4RUx1THBWRGtqL2Jt?=
 =?utf-8?B?QkZsUkxraXd4WUlFdkpWQk5oT1RNRlQzU25ybllLMWM3NkM3Z1JGcjFVNzg5?=
 =?utf-8?B?KzdUNTRhS25zOFo4SmY2WEo4TGtnPT0=?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CIrHDClvwiDjR1h7CfqqaGPj9uUsaUSnFnYwAdX0NVI/j1O4D+HLtkScTxl41cnB7L2cXLhtlQFiK7inp8ZGwG7IvEa9KMmoQSN1O4f1OtmG8RTeY0dFwvihaXJpWm9mBhUskFsnPwZtmOAZC/f6dwu7aNsCyUs7bk5EQtWJYfTTbpXCshE7KZ/igqhG7pOi91IrwpRSABlszetmziYOc3/TsjMmUXHuTrib+3PikLAfbs4KEMwDSk2xyorDK4kBELYGf919mEErJGZD+dwbVxm9Pwmnr5ipfvKADSfO82Y+Eubwr2xY/mmsYeVpUif5G+ETeZxn7t4YPzGy90a3BCEI55K/accWlfPT1jhpY4Bvo0X0yIMLirf9EugLCB4VmBEp+CoAbyFU3yd+yBD2lbHagO0Oc2N7gL2woTlVBd8SEP04+9jBaZssc3O8rAPy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 06:30:43.8521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f8d18c-160e-4c5a-7ccf-08de67a4c0c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9250

On Mon, Feb 09, 2026 at 02:07:15AM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the vfio tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from /tmp/next/build/include/rdma/ib_addr.h:21,
>                  from /tmp/next/build/include/rdma/rdma_cm.h:12,
>                  from /tmp/next/build/drivers/block/rnbd/rnbd-clt-sysfs.c:22:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~

<...>

> Caused by commit
> 
>   b703b31ea8cd22 (types: reuse common phys_vec type instead of DMABUF open‑coded variant)
> 
> interacting with commit:
> 
>   e6738fe6cad448 (RDMA/uverbs: Add DMABUF object type and operations)
> 
> from the rdma tree.  I have reverted the latter commit (it being the new
> one), really a semantic fixup should be applied - I will try to revisit
> tomorrow.

Thanks for the report. I had forgotten to merge Alex's
common_phys_vec_via_vfio tag. This is corrected now.

Thanks



