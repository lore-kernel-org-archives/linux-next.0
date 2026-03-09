Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013028.outbound.protection.outlook.com [40.93.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6360A1D5147;
	Mon,  9 Mar 2026 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057172; cv=fail; b=JdHslwbG5i2Ec1c8v60qcGTbXXMdejpItL3Y4lB4Zt0/lJBl9PeHx8X2Hrh53CW6/OA+8efJy/dG6VmwYxgWCKmk0ybEiQm7dPJgo0SrSOnVs7xP9h/lWnbNeWRSGu1L8emMq+5imH7w2JcGDGbgMQCnBi2NyTOZRxHuFnOz1oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057172; c=relaxed/simple;
	bh=DntIir7hRCGNJxya2eZZpDTFdOlYgKVTn2bY6VxKKtc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtatxYvxKXhUGxE4b7EQ7Peq7HSeZHT5QXA5SCEzb2Wvqf57iUp/4tAe7femkGsxyGqYCTb2pluBw78kp1XltNzctpQWXP9oMQMtyz8tFDjL+3VjE6tiPEkoFVegi3qZhzn7E6c8qkVjT9spO8qsgHvx2xKmi1GV6743EFVrG7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V7wSOiAZ; arc=fail smtp.client-ip=40.93.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V7wSOiAZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evPnK1PM5AIJwyx4/jmAiVunTODimsFjgoYTaz8qt6t4hHm5zI44RjLRz3b+zQNInXAMid48XQGjM8erEiWnP8ZbkThqW22jXmWDWuEFUPT2MbOksyPfGwuU0DKzE5VgH8NqT3s87WwFohBgl1/sR3ojsotKYmyUzdVdAsG5nhjildVvvalJqK+QhXbduF5/bsvSVW1dKmsBn8oXWaGofAxK3irNCNw7msrGyHNUFyrU7eaTEZxIA/EkF3X6FxZwtrexDDjLFBQTXNDo76irQFCc4wY1PrM9sReA0ZZFBgUO09ViC0HVh3vj+++Q7BuJIp3E8F1cJwO6pdr2frfCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeEOvS/tttLBBb5APuhgJkugBOQbayWnaMyQ619AcJ8=;
 b=entarxSZnvmrWI+l3gu1t18UNCJSM32AVMSQ2R/iUVIUSV25nAfImFM4zc2/x+9kOM4+2lU5ixXIGNiqni3IgURibjDhy5AO73PbF0xCvzK5X3h2cIraDAPH+C23VDErx26aH16/FewJGYh2LfgzI2AV1kx2cmLUV8Aei09/OdmJZSijBPh8yYEbGfyGnwExx3uI2odJ8/TvYoP53Tmr6Z9boZdok0NIjvrHO44ZUE0OH25adX7cL+fjjh1E2P+b1PWfW+2honhj1bMbR/BpJYy8FqiPzpuAKALBoWiU1GImXuYx+/HdjSUCmIL383cC6zveLIUCua8C/benkF+ldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeEOvS/tttLBBb5APuhgJkugBOQbayWnaMyQ619AcJ8=;
 b=V7wSOiAZXY0XNPMKChPxCMLmD6a/OVH3+s4adkZFlw7EbgY/0nP+e28W5jR+qiXkEYJXD4H1BQtaQ2hu9SLlm5iLTxPU3glPZbbgRxt7MhG9TFzTKH9IHKJS7Ch0RH+iCVjMoZbjQTaVN1dSe9bi0ZQ7CyetDLg7yxpXgzwEaHCrXx7m0jGScFw8N6+1prlkfxxns1U4AcrDOwHN0ed3frbOGM/gdHPEWQgji3BFyqbCrA609g1CO+SA+WBYG0Q8SE4CvRjrOW54VYmuS1J8ELkC2AN0FKsb6t6JzSnhwL1jkRM7R/5/10PEyRBN7cvdWQ8JVe0BS9s5Nfyzz8Y4+w==
Received: from BN0PR04CA0058.namprd04.prod.outlook.com (2603:10b6:408:e8::33)
 by LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 11:52:45 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:e8:cafe::12) by BN0PR04CA0058.outlook.office365.com
 (2603:10b6:408:e8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 11:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 11:52:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 04:52:30 -0700
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 04:52:29 -0700
Date: Mon, 9 Mar 2026 13:52:26 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Jason Gunthorpe <jgg@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the rdma tree
Message-ID: <20260309115226.GV12611@unreal>
References: <aa6qqi-GmXZXxubE@sirena.org.uk>
 <20260309114020.GU12611@unreal>
 <f41b2391-d202-4d2b-96d0-4f9040003a35@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f41b2391-d202-4d2b-96d0-4f9040003a35@sirena.org.uk>
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|LV3PR12MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 0786f30a-e640-4431-827f-08de7dd26122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|30052699003|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	RTsNLhSoLirgYxI9626CR96AJS2I7juXa1qIw/1XSaviC9dVJf1FoVeU5VR4kQw9JkMWPwuNm7jEtUEafo9Nm9fCcnT4FpPVqzSGyDWm6rBwaS+GPtf04PNTYuO+2CJ6o4a27sCiUFnPC+z1Nt4yY5BdJFZKhMP9LVXadTvr7LUl74z/UjVZe/2jrYvRipMtLxtgF9RnGIKAc8R/FIqUZwZ6sty1WDw/N0wkBMoxtEQZ4luyxfbO5kUv1TebGbo8wUpzPrxoazESEhYtbfK9Mk88R3rs6ZheqaTXxA8MTCDsypAj6+/Jr5pkRNHoMtnmPDygZ9n0jdOw/7lWGRkgcqJQ+GsOgG5ZjYfOAbhO7FJ8VoNGZJPKLbcS5rYZZGzNk6X01pjd2uHu208Eg60sJzn1Ao8jTQwx1Oc9e2CL0GhL+TbjQSlm1/FUMcEk5CBBICWzElTTBRyvmlDxdYE3ftdr7nLtOC15UtFF8bdhyi6EnNruWUIHPniZwnuivjtd0McARYT4djZozLs34u60v2+ibZK3ntufyti2h4SALSlyJjUhfz24jsF4IXnTcAPtiMS/t/o2+Dlg/RI+M8wuUndi+ETlqCmkIJnoksGA0sOIETM87PR0HjWmBASCFmmfufgSrYg+2VaIWMivvwla9mi3P0do3GwlSWuUbUPcpO+Xf+Lk7Abz0CPqfCFyZIRsfKGygy5x+GfGZDzQQPH/OCVQNxI0kSdR0BjrGadQYaFHU5bJcCqEASkGo0er52ZG6zs/L4Jm453Biy06r07WIg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(30052699003)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yPUvU6LPQVKsnp6GTrl15WmD/fC33yiZg1IczSlig17CPhtPmZcTZtYTFD3ThniA4IDX6uLPnEiZwhGGQVBzuTiFoSEToUFsOJmWZguhRUYihz3MFU6g6F6HFNxDQzPJgaLw8hLqiywUEqpCpTeIl9E6je1RWuEtnwNiLZaiwPSLN0abCBJflI9ayrWcPz7/IOGvIFDejNB6C2lDrZcEJFjSAgHRLs0encj6Zlixre4tHYqKPTyWw9lTFfZysFizUjnc7uZuZIQk+bIt4116Bz1HVTtPYKdesPa51ws4hPBYyiyeP5FskFhiPteTdNr4mVm2VHnaX+teFw/JmULP6ZwOVeb+TE0A03aEj/Epg3Kw8qSY5Wo1jn6R7EczPNNhZuqzEewjZzO8lMPMUE7a7tVJ2Em5K+D16624Gq208xbounfAVtNMLHhFPC+J3RKv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 11:52:45.7674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0786f30a-e640-4431-827f-08de7dd26122
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9412

On Mon, Mar 09, 2026 at 11:46:07AM +0000, Mark Brown wrote:
> On Mon, Mar 09, 2026 at 01:40:20PM +0200, Leon Romanovsky wrote:
> > On Mon, Mar 09, 2026 at 11:10:34AM +0000, Mark Brown wrote:
> 
> > >   eb15cffa15201 ("RDMA/bnxt_re: Support application specific CQs")
> 
> > ➜  kernel git:(wip/leon-for-next) git show eb15cffa15201
> > commit eb15cffa15201bd53d1ac296645aa2bc5f726841 (rdma/for-next, rdma/HEAD)
> > Author: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
> > Date:   Mon Mar 2 16:30:36 2026 +0530
> 
> but also, more relevantly:
> 
>   Commit:     Leon Romanovsky <leon@kernel.org>
>   CommitDate: Sun Mar 8 06:20:25 2026 -0400
> 
> >     RDMA/bnxt_re: Support application specific CQs
> > 
> > <...>
> > 
> >     Link: https://patch.msgid.link/r/20260302110036.36387-7-sriharsha.basavapatna@broadcom.com
> >     Signed-off-by: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
> >     Reviewed-by: Selvin Xavier <selvin.xavier@broadcom.com>
> >     Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> > <...>
> 
> > > are missing a Signed-off-by from their committers
> 
> > Signed-off-by exists.
> 
> No, I see signoffs from Sriharsha and Jason but not you and it's you who
> actually did the commit (see above, git show --pretty=fuller).  Did you
> by any chance rebase a branch where you'd pulled something from Jason
> (or which Jason had pushed to)?

Jason applied, but I rebased that branch to drop patch which was taken
by mistake.

Thanks
