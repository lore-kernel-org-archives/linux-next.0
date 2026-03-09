Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8EA3AA1BC;
	Mon,  9 Mar 2026 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056446; cv=fail; b=V9+jjbi3lV+8p/f4ml3MQCUjM4gm/A5YVq+ds0BWjVBsrZ0eR46btZnuoxShcoh3ubZ0irDrH7whtmzIzg45I+TwB8G1YDSk28IfUZHuOwhJ5G1zowxHvzFGHlnE6o3XCEK1I37D9UourAbKfmNbtdh78edxqKGRFM/YYE+5svY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056446; c=relaxed/simple;
	bh=ZAolHdeOj9o/1e4sQlO8gQOZcnU3X7VRrQ8zDQ3Q39I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfJnFTrVtbHHwUEiLArIlj9Lj8cTlRGi3KY9uOonQj5Wx2YETJ9WDaS8QrRemRaJTAxbjhKAr3CZWURTH/FLU/Ek8Kh5Y3HGkgcsMYKaqkhWfYVa6Y5LuWIS5QS0Ib3w7uhQzhw1jISj1t4u0KjgSqLcEs6SuGm5xUr6QUXYV90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fQlpuRbp; arc=fail smtp.client-ip=52.101.52.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fQlpuRbp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgUvdrzW/KVP9dx8R4IcuafV0NJbNkYnYAY+4XSTl6HeBl/9OaKsv3gasX+dpIq+8Qm+DkGPOjzkcTR0pD1mPftLTkNvWE05vrDJmkH6U6dqrfJDJ5dZFE+AmxG1MBvRCabB2tNeMUpFcBizrQbbBur7gjQ0+DbSrazblQemXIdfmuf8YnTalJjPpRvEzwQJHUyxULWy3OIcBhCMG4L96ZiEhvmEfPGuTv01nuIUc5hEbxwIiPaAj7zfpGneaIrp6w0KqrPDxAXq4UUQll4Fr9NuQxg2DJdtku4GanuANRQnH9ndR+EQwBMX1Ht4MwVTZSqwaiqEZ8ypcjLl+B+PFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cRmC1tKvmMs7d1q9TzOy0neqWkSZujzM9GZuMLdBfQ=;
 b=WuqvwrrKwlTVxOze9t0TCEZMM77TAYBBgPPrGlTILXBCoa61Ki6BBOLckmpsWt0Gxksh74PebQXTDwoYFIy8wdw/u3/ovQZwO8VL7/9m8Le7hQ2rNeMS48VRFDj+CPc0kc1SwQSsGyyrNyhJoEJXMUWtGgsCDpYAPhdWMd8ePdF2sZgxcURLddUR6m0dcRoyDI5PYcz+g5idpZFFMAbu5Uck/bfKP4EDHKesbCt5SElPOJyVL/+Ml5lbvyTP4GPOl6eztbrjAlTYnGA7ChaM4v5cx5FGr9uM+agrDQ+Mt90A4s4cciSUmxbG/ApV0rlaW7jdLSK4cjxMSnZ2+aOU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cRmC1tKvmMs7d1q9TzOy0neqWkSZujzM9GZuMLdBfQ=;
 b=fQlpuRbpMTLJq7xmP5kjFEmZb84x4/S5YHsx5Ol618CG7lulJw6fICCMF6gIN/94UCGsfK8jlJOLPL9aZx1XVdgUZPzSEm1gA4An8QXVXi5ey9s3T2o2/J54yPZsUy1Usni2N9bAq2Fsztz+d6BFCF2KxuNJvqjRGCaFn8j759TjmweHdIl9JF3Q+QdHO87vVGCqTbaxpvzQSygW7ta8jfZqr8ejnsbtqNolVedXacYWtX9btDh4wXvhWrH+qQrtrQARyKw+GvtboVxcjfVm6CKyXrXPjNhs27BDskJHRyKecSx8YI6R/4DhenkQK6W+gozxS9Be7gLhpC1qDGDVAw==
Received: from CH0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:610:32::10)
 by IA0PPF170E97DF1.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 11:40:41 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::b8) by CH0PR07CA0005.outlook.office365.com
 (2603:10b6:610:32::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 11:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 11:40:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 04:40:24 -0700
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 04:40:23 -0700
Date: Mon, 9 Mar 2026 13:40:20 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Jason Gunthorpe <jgg@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the rdma tree
Message-ID: <20260309114020.GU12611@unreal>
References: <aa6qqi-GmXZXxubE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa6qqi-GmXZXxubE@sirena.org.uk>
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|IA0PPF170E97DF1:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e36642d-519f-4d4b-31b9-08de7dd0b163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info:
	9adVzIq7ZQNWTv76gOGoLc/9q1IF/u3nBuyyo9CXQ+ANEVVLk7FyrH4p4MKouCh3eUDVMd5jRyvhWFHKJdE93NjCRZ5cB/N+3+XAYIqIIv48WpZjwbMDuttnq/snxBVzCt/btxJ0H3kb9GkuY4IZZfKJuCZ98XXTDr0K+bWIye9AkGr8J03/Krs2YJdhLNEuSPQIN6HDWiWYEW2/jMoMUP1UiMbu4gtkL8ReN3B0UR3IK7NecemcZebPzkdm1AXhJ7wNXwgu/NuXuar77wYX4BIYIPi4bYMGSm38QJ9P0+9TPB5nGsRm38GM2EFe+dox70rLGOxs4SLBJI0xCirofWrBCxxvSQwI00RnZYJtZIHUXvN0GonPIMuXMNwvM3vtsC81DKmDchrHdCilNQDCMSJrihkjZdzR+4uUQx4xiAKyK0xetM1LhB6ESPIed3tXhHltGaaVPnzm4gOEACNVgWo6Pxjowk+uZCmfE2VigKEIyBL5QA+jVUk1Eid9jEpmRwt3R+re/x/1EA/mfS2Rp5FtxTUSSuFut1EczOgNh9kseox/haBwBisRJYGmx1DZ1B/aClgfY5Je+XBML18Rn0sHxBMRKCGv8dfvjXJb4fuN5jfcrH7CqQZtBIT7Rq3fODCD7PvB2c8rJcVa4TAM9YKtU2sH5n8Z5LhPZji4+wtk+6Gr4sz7Bxwrk0i/REhx1/mk+CGV5WIkrNE7UiAFMvatHvi+BkeLSo11cOlj8iZmTgw5vnWcwMft6/U4bodvRMWLenAtJI1ufOe2m0ufvQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lMwsIA9jyMKyztWnZ/EAQeKk9bQuA8P8Xpkz/V3hZ2HErHonpSzhgoR7AxlL90c8AvQmKYoVk7WXcXlW+oEczJessgIMUZEkcJtfgcG+C0or5kLINJDuNkDnQAmLXX6cHCF/HLbaKnzn9lAi7loSzN1kHS8QxNw9bNb1xi5tSHLB6jayKNpPH8eOUPR0P6JL4o95z/eJYa2Ol9M5SL+xtaSTajyEKkfxt2+uIY4aDrFWzx7y52fiGduO0ZPjtjD9uPTigIhuk0Q4CogrMPjGR1lWFh2uF34NkWsImnmDmZ4Te7dbZLBhNox4SpaglpNfp8i8WNvleCNAjZX/exsrU5uKU+jJ2hhhn2bVesVM4xxRALwFuioJ4n8uoRsA/R6lix7c26kNAuZlMHLxY2vTePUprRFM09HtQ6daqPUbtocpvXJ99pu+b/JIXf8V6HTV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 11:40:41.4539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e36642d-519f-4d4b-31b9-08de7dd0b163
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF170E97DF1

On Mon, Mar 09, 2026 at 11:10:34AM +0000, Mark Brown wrote:
> Commits
> 
>   eb15cffa15201 ("RDMA/bnxt_re: Support application specific CQs")

➜  kernel git:(wip/leon-for-next) git show eb15cffa15201
commit eb15cffa15201bd53d1ac296645aa2bc5f726841 (rdma/for-next, rdma/HEAD)
Author: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
Date:   Mon Mar 2 16:30:36 2026 +0530

    RDMA/bnxt_re: Support application specific CQs

<...>

    Link: https://patch.msgid.link/r/20260302110036.36387-7-sriharsha.basavapatna@broadcom.com
    Signed-off-by: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
    Reviewed-by: Selvin Xavier <selvin.xavier@broadcom.com>
    Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

<...>

> are missing a Signed-off-by from their committers

Signed-off-by exists.

Thanks
