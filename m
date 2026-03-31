Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B7B3630B5;
	Tue, 31 Mar 2026 04:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933190; cv=fail; b=ivcwe17/FD/5g6Ecg0thRaGRhmyzjPN/YZVu51YPFegMebyPXcErncDlT6hspyhbOuLZBPxIu02rjMhAq8ez93sOsAZC04Du4v5qFlTvWaNuyNRBvMr8muS3lbC5tepTFKaebVPE5jfo9Vit9gztn1XT28FRbNa6ihljtNTa+Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933190; c=relaxed/simple;
	bh=uJJcD7QWNCem7hWFkfg+2H4WCYnSM48MpgB++T0pS40=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOCsZgYI8UQv1tpkGLs9XnBOCeicwK1Iek++2PdFktl1ytHvufbzbdxR259YIvUmZ/UQWjrjqVmMXcGMpelD5BYbltqcvELdAHnmbRus4Bt/M9P2lJgVyM3KZDT3/dZx18mVtXzQ1xqI1XwmOdQigNs2gJ55tSjUqBGUdBpNU0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=STeBwHq2; arc=fail smtp.client-ip=52.101.43.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="STeBwHq2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZvSwox3qzbYRIjClN3y5wxzy06Eo7Ybm3hNtaFKh3bKRZ7kuoJ0t+3cx8txa5jQ9tGlyzkkP+EdeRuN0gsChBbdm1oNUOmgrcchABtXRqthNCynz3FQA6M/VFvIvYgzintf7dAXpAkZuDo0ggdoP8kzpA6N8rRJJ4vN3aIeNk++0WHKr7FncXPQa94NO3ZWUFwSLS1n1IZzwpheoS3BbFZi4FAGr+4jsHaymTeXTSIVPLgBV1yN5F+K2wVcfeLuudEa0l3gd0f9JGB+n2i+ypGffgM0hQSn7Av04tTeRMVcoDvzJM35HrM86EgNXfnQb1uFuVrRQk+sldU7Td7G/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ee+lP6GBzeFD8HYRZe76HksWXVWBltH0ATXEjuy+eHQ=;
 b=lMIRiAmYrHtMHJIAmAe9n06Ld0abIvm7VKIz+kcLomYeyI+NHUuKSTt0ooKROccwgXCFMXXPGGmuYFmEQw94eDO3uD2e3XnMWcxByPI1EogRIgARD6r7ZtVIPxMJggMx6ewLoo32QjZXYJRuPVhRtcLZpmvT13YMsU5m3EI2GZWfSeZcFcZelzCx+P8DQm7mBQu+m9Ao5/i82CgYgfUo9L6G6clhRyok4XUpOSXQYGMwXR8+yGaysrpJnjtYiVwdlj/VAS6fMhlN6PLdqqcBqRf9PONIBfCYhtpZYtMXOV3tSomP8XuKMhdKKhMO3fw1OqPXINBbZtWcIh4k9AXhfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ee+lP6GBzeFD8HYRZe76HksWXVWBltH0ATXEjuy+eHQ=;
 b=STeBwHq2WB3DMP/dh69rP4rPGQ7g5yTWnguuscNa3hC8/f5kjVcwdJ34cf4FmS+1wcZpcKXlxD00W/FYmpmZYtN7rHw6plw88J/ZpdDyzr6pkhCSFojBHAF1XBka5UMxr5Tv4g87QMiWw/uT3JJrML7BpDUoWK2LDIekBbawQm+9Bk4oBul0pna0/9dlmWtbLwOl5AHUR1fZA7l38qHxQNnIKuRi5n4PEbxmyTp7cWeBXVA+wap5PD8UuGcPreT5QSfCPhm9p3ENIxfPv+oxBmF7mrvM66ZST+JJb5idwPjfW34oEMhLlqoTCsFbTW/L4JhS6FwrQMVZINiKMzje1A==
Received: from BN9PR03CA0084.namprd03.prod.outlook.com (2603:10b6:408:fc::29)
 by SN7PR12MB6981.namprd12.prod.outlook.com (2603:10b6:806:263::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 04:59:44 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::ea) by BN9PR03CA0084.outlook.office365.com
 (2603:10b6:408:fc::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 04:59:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 04:59:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 21:59:35 -0700
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 21:59:34 -0700
Date: Tue, 31 Mar 2026 07:59:29 +0300
From: Leon Romanovsky <leonro@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Jason Gunthorpe <jgg@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the rdma tree
Message-ID: <20260331045929.GX814676@unreal>
References: <acE_P6P7vp0LmTHT@sirena.org.uk>
 <999d3ed6-bab5-453a-aeae-d33b1a958d32@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <999d3ed6-bab5-453a-aeae-d33b1a958d32@sirena.org.uk>
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|SN7PR12MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: 0528c750-dd8f-478f-a855-08de8ee2532e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ltJlvLR8Hai3hX2u9b/rrvLgu2eZEFmK/GeNbmhWMcP9JXp7b+W6J5oP6wPXOIxi7QOxZTNcGJ0W31OmbFpktZJwszv5mqPw9oXY/ScXtdL8TlO7A9G0fO5yAct/+wY7UAB2hzKi+/MuS7zOLKPXACY5re3mDFwewYm9SFHdUajosEYQDPhWRtPdB9b3zQnhIdXO29TZafLeo2yJoK0v8n47o2aCausEmL/U8XwzJLvdr2AnPOCTikZpM7VOBjutsjnvyqx6u283IIGHjg5RGKD0BMdT7OGcBWbY5nRK5mrG1sWd01tTaIay3CbfYZ/mBu/U4yDYEAoTH1t4UsiW6If+PsXjHxS/UujhWtBK5Qgoc+/VLf6AHSO6U+vllEs8vOBrC2nSbgMaIbQIiC/DdeA7Dk9o3Qe7TVAMBYj2DYvH+5E37COMaAA1yS2KS31wGRoO2FgJVacnE31N8ThK6LdQW7L2DpoNZpzeWYrC8paKzHipvorFCPXOdRpG4W7n3/d3/xaghJvFYoZrIjVecaE1Iz3k8f0pH2UAha1FvC8xQOMk7J147EHZSt/e3kWyR+LMLkoS1NHcnfAhtKi2Wa54cBXoKVI+1PofEUWtehqSvmZRiqHRzSvHug67M+xG5JaI8sIdzXIQr34JUP0md/RgwOjFdUm/YVTbiQozIAo1eKtceRN/+md5dcIR2a8r3fI+L+XtDUns3nTtSUmDwy9BNiLVtxKhg1nYGaRi32U93zE6myLKNRg73IOQ1GyDVB/ovf5OaW4Q4liDZ5tdDw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U9EGWO0eHKHmIhCZe7cG2zIUk+Rve7xTKfRpTDEANNTBnS8CAsFpRPwRenGuwgZdI6iZltyzFwXvLo7wnpqXOIyqKiuMAffCC6dwZ9SXRMG0aUVkA5dNbgkTw4cdrvgLfI8hyMYdfIbF6d3gmH6DPZpBa1089YL//S0TQhWamTtBOrwEN93xRat3GjrX1nCIAUCEgGx+tm3myhs25E74y4ZF41EvnMfy885Jn8AUeh4dDp4GBqSEYE0diFhvVzurjUBO/eoNuki99+svP1fNjw7Bydh3sTHYm5r5t77covzlZGnxIvd7Q5UryfjFj0mzP/5ZPoam+Lc9L+JUGjmAYus9xwSIkrIiUZ1uhh5//tjXmArlxHCZ/eteKS+WLvOcccWvohKn4Aj4BraIf1mkPZn/blAKLAOcmW9JSXR8Q7LB7jmxjtnwidELELdTLaO7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 04:59:44.0745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0528c750-dd8f-478f-a855-08de8ee2532e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6981

On Mon, Mar 30, 2026 at 11:10:59PM +0100, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 01:25:19PM +0000, Mark Brown wrote:
> > Commits
> > 
> >   c50be61e277e1 ("RDMA/irdma: Add support for GEN4 hardware")
> >   333ad1665dbc4 ("RDMA/irdma: Provide scratch buffers to firmware for internal use")
> > 
> > are missing a Signed-off-by from their committers
> 
> This issue is still present today.

I fixed it,

dfd4d5a38e653 RDMA/irdma: Add support for GEN4 hardware
4ae130ccec08d RDMA/irdma: Provide scratch buffers to firmware for internal use

Thanks
