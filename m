Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE042316E;
	Tue, 20 Jan 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911829; cv=fail; b=TmQGagCxSxFTHIl5AP6ZyCm4FkDrUHllU+o3hOmjNRqz7OpTsdPUnNKD8BWX3yqkLJnahuWbRHNITMKrXSAE5lSRdwZ182ZWWjvtTjnvNxYaGB7qOZdxRLlsRe+f7P82C9P8B7/LV4dv/smyKgZMIcvx0dR+5rX4yJqK1XdC4WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911829; c=relaxed/simple;
	bh=vYnsSzntwf10eTWYh/oPXNxWofrrcBdXgFyE8JlX5U0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXDXLEWX+nHYf+Rp+Sqx97eicwXZkZdIYHclMPnGJ99JZzuJEu7mMLR90ZnEtA1J4ZGAfGerBY1VROhZqL4LFTOXhA1M/bd0q8lFx4qEf8i2JR9gIJoSLq4lbZgCGF4iZv9kXbVS8OsljhpQgaLv56W8vxEPKpcWrAlrqN3yjG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aLRCnoh0; arc=fail smtp.client-ip=52.101.62.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aLRCnoh0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PE45v/9ANv1EAt7nTn/W9JfEbmmK9RwOa+6SV20rNalKL0Fg/d0UlrsvkgWe2KjaFB03OUxsI9n/dkQqNucwSytaO9e3XvJkRuB+oFzkNVCF5SL5mFrE7cjT5ABYrIJQXePOts4/pM9K/V/WnwgEJ5RZkAsyLOcKtMYA8Njd6eBIGCmvrJ5/pNhpY7zZsLvXiOlJNSjk4Ph1kd+3N8mIqzlWcVOVsLP3i8h/AnPermZCM6RKLzTA39maSPJrK/qZsS8jJ5moCgypNTu6rEZq0qqDFtq1ffWU7KKFIWc/P/rZeyZlNYKrnzR08KrVQ/CU1WInMRkc57pwi5d5hF+Fpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jK6dN6dro4b2DNK1+S8Mt5YYfJkioMQa288jeJjBThU=;
 b=yxM4Om6u6vjlmu4/avcwNwZldsmWfR6php0Po5GFMwNaWv+WJpfiydU6mXCFiWmCO9ZJFiYXBj84kXir2bYIPR/SumhZfBTVyjvzXwwUl7jRPlNYvVDWBD2D20Tu83wm5BuKRfhWrxhrUt2c+M3VK7G2GPCdbRI8UAPJ880wCiRNB1TMh8J6ffv6AAkf50bxFDMaPDiuCF4gKkvBN2XIC/enc7SmmRf4EEWfkEmNxIYTFS4OSkti7Eoso3+aMQoeg2KONF1bJxu3qFhhKc8yKpIYcnYYN4nUzO1UppobSw9BL8VhaUxJWmmy6+HjfT0t/3ArZCKXKXNLBUH96wKJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK6dN6dro4b2DNK1+S8Mt5YYfJkioMQa288jeJjBThU=;
 b=aLRCnoh0YOawMiPzjQEDZC/QXn211n1gtOvcOv2f/zjaxlSiCGmS5va9S9j5NBmGPv4DYEVFYOItq4/WuBtaSw7eKpfbgTptJrlwnz7IaJXNHMBXxkZWfoXjknYQoUnnOILUSaNnQn25wc6TYmGFKwALcNVGTzcgu2Jnylx7UU8=
Received: from CH2PR17CA0024.namprd17.prod.outlook.com (2603:10b6:610:53::34)
 by MN2PR10MB4238.namprd10.prod.outlook.com (2603:10b6:208:1d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Tue, 20 Jan
 2026 12:23:44 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::1a) by CH2PR17CA0024.outlook.office365.com
 (2603:10b6:610:53::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 12:23:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 12:23:43 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 06:23:40 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 06:23:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 06:23:40 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KCNeam1194320;
	Tue, 20 Jan 2026 06:23:40 -0600
Date: Tue, 20 Jan 2026 06:23:40 -0600
From: Nishanth Menon <nm@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Michal Simek <monstr@monstr.eu>,
	"Arnd Bergmann" <arnd@arndb.de>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Michael Walle <mwalle@kernel.org>
Subject: Re: linux-next: manual merge of the xilinx tree with the ti tree
Message-ID: <20260120122340.ihocaulsyli54h4h@talcum>
References: <aW5KbYimWKx7obE9@sirena.org.uk>
 <723362a0-579a-4ed4-ad90-dc5eea4ae902@amd.com>
 <c9d3063a-a652-4db9-8e62-3be34ccb27ef@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c9d3063a-a652-4db9-8e62-3be34ccb27ef@sirena.org.uk>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|MN2PR10MB4238:EE_
X-MS-Office365-Filtering-Correlation-Id: 84444ca2-6fe2-42a1-c80d-08de581ec045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yP2B1e54G3+pm33sq0ngEffaHsDyKLf2rl1AyQPDpR8dFrXVqsvocV36FRlZ?=
 =?us-ascii?Q?nXaX99MHbxaOxr7R13MjBUrBXsQ55n9dQLpqkx24YWo+v5o7q55MXMEoT2My?=
 =?us-ascii?Q?o5TZN9qwwBz/mYzR5e5Cgt7vMp1f/EhkcTe/mnS7yz25lkk6iig+siqgkWGt?=
 =?us-ascii?Q?ADYFzAmOlT/wX1X3Z9HDjKcJNQdOAAT9Sb1ILTFCd/hh5eG6xEED+C+sH/xj?=
 =?us-ascii?Q?xKQOqzv6Y9FiqDvWfCwYlVsdRhczO27ioRVL7dlCjhM4QNtaGSgsY32QjOlo?=
 =?us-ascii?Q?0SkLeysWDjyGoDQUsnQNgjPL/Zavig898hS14Wi2TQjOlED1eS3liOQUs5sX?=
 =?us-ascii?Q?N61Uvh7PMpndQzxH40ivY9dJdFVejENXiTFOQdR0QcNrkXduGFFQME4oGPbO?=
 =?us-ascii?Q?AVwUB9umbKrgPYPABWUO4dVZT5tZ06BdGUrdZB8MLUvCKaUjbNcSOtINFaB/?=
 =?us-ascii?Q?vMkIt4fSyn+wq/y1Mhn1lDqTDOvZN0Q63UBS44AUasjPl3U7tWRvN5oQsvbx?=
 =?us-ascii?Q?5fJPPBtbzwGi/4W+x5Ty1D7ecpvxwPOHd7EThirOx+2bxGGKYnn31kwyFUwv?=
 =?us-ascii?Q?RNqyZ2TgB0FMEn7aeLIbO2Ya6IXFS7pdp/qet3I6BoHlB2IOh+RuKEDL/5PV?=
 =?us-ascii?Q?XCYPuObABLc5+RMLZUs+1Kzd4yJJXDn4Cj0rwspa7l83/VNW01AnvHqyaefs?=
 =?us-ascii?Q?rlpC9e/BuSS2OQDLnHlysaXHuwpczOQnx9sIcaJEMKbtYKC+aqTvCAQBM0oM?=
 =?us-ascii?Q?RuiF3kafAToXgz7W9mvRj6aLgbZa9Vl6AzoWBSm/ZnIvMDackW6y00/7qmGo?=
 =?us-ascii?Q?xe8zXsBiJR4M9Ap8j9TgGijFriV1XEBSGJBzfvK3izT0zBCznAH4i9a6O8D2?=
 =?us-ascii?Q?uOn5HgRE1tEYF8YIQpI0UqExOWgaNoVjLhYNysoGRCUgrDWiXjgIrt7jwUQ+?=
 =?us-ascii?Q?QMNzF9DiclH8DDsuEC7ZBcegrQTkKLuK7yk3AbRDYK+v7jRT/xu3qPAXI+z+?=
 =?us-ascii?Q?BJoKQkGVz5U1csLlBFJhgUU6SJU2nQg9UreAEo2y+JJwXN9RX/El8ViZVYut?=
 =?us-ascii?Q?jCNcjy4UWVfKUxY7soHHx8aS1UCAdMeJ70JfTbDfQgWXiXY3LJMmdm5NS+TB?=
 =?us-ascii?Q?cPVGPxjseseQnGPMaXUNTA+LQURVzDwoTrgHWt7+r1GZgfHQURdg6zuVXs2l?=
 =?us-ascii?Q?5oH0BbReg/jwKMMZBw7bZnBumLHL9ak0wyL143g9tD14/59H62EfYacQt2p6?=
 =?us-ascii?Q?pDVdsD9MxzDx2NEmmrlgnQPBZ059P3ILd4C76MO3dxU5PbqDhK5ANXvmtdnN?=
 =?us-ascii?Q?+b3QSslcV6O8A58e0gODSzNTAYalSN0SbyHj4CdEWzZftA5jDOskPsx2hohh?=
 =?us-ascii?Q?QQtty06K0ZnxXENzP4KtKRERD+0qC1Gx91EcJ3Tp39xIbZyMos/BPIBFuCwZ?=
 =?us-ascii?Q?f+7RzhnIhmxaHg6EoRVTm7ADxehXe7ERz0xulsgOjAwtA3jz32wz80ophQ26?=
 =?us-ascii?Q?JUUJxxDLOYOxHzKDk5L+D465fRynWIvUReZFPrZYPygv2Ob8XMpoxWxGgMJZ?=
 =?us-ascii?Q?iu83sW9+jjuB7b+xsBLMUtE72URLShO4JrblYtY/cZCO/gd1HMrpqUUOpA66?=
 =?us-ascii?Q?WNduqRL3uYauWgxQQPyPePZSaK/DcPw4IHyiRPhpc5Mt?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 12:23:43.0275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84444ca2-6fe2-42a1-c80d-08de581ec045
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4238

On 15:21-20260119, Mark Brown wrote:
> On Mon, Jan 19, 2026 at 04:17:46PM +0100, Michal Simek wrote:
> 
> > I have sent merge request to Arnd today. My 2 patches are in Linux-next for
> > a while that's why it is new change coming from that second tree.
> 
> The merge order is fixed so it's just a question of which tree was
> already merged which shows as the conflicting tree.

Thanks Michal, Mark,

Yep, I did anticipate a minor conflict here - headsup: I have had to
squash patches today based on additional comments, but the conflict
resolution should be the same. Will add the note in my merge request.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
