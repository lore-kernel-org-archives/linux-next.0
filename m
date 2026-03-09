Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013014.outbound.protection.outlook.com [40.93.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B665332633;
	Mon,  9 Mar 2026 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060503; cv=fail; b=PcwXKj7GNbFcsd3L22grnhfs4wJgMUG9Z/1CN+n7IU2MxsYTwje0a4PKTjDhcATzSKOZKkUnAI282NXnkoLTQbXtKuccyM54idta9/61UG4ZlDoY1Xci/r5DwB3Db7rE4GH7xbK57I+PEqXvWL1VtzNCFxQjABUmCAUJDwWfTf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060503; c=relaxed/simple;
	bh=QIamQ0r/FpAYE0PGbv7HhG3gnI2hnzuQc2lj/sEzX0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WD9ijVAE8eRyI4LSuk5wNVgyBTqC0iDTKQua5w0A3ZMqZidwLAR3aNgufG40MdRoj3IZz9/3OOo3FMIzWZcNLLBOPZ827KpzCjYlVTf8g9gv9NXqfLH6w232LaGRwVlDHEgW5GBc+EVAavK8HoP++eMeMS6gXJOw7qBxbv34dwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ASPCnGBm; arc=fail smtp.client-ip=40.93.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ASPCnGBm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTFajAYX639zfQHcRcQBaDuqiD3QJbuMO8ZNYr34YMxg38pQaFvPH6xfgHwxEWL0+ixrWcDBXzUUnk4sXfVFtwHj61RaPCvBvHE7nMaKUgup72a7tahVqWv+E8QM6gcsMYTvK2ecLWY3TjCRRMcQXL4Jvi2d0TXpT3+dsB6NSJIgMvJqwlFMHRYK99skMeV9t5Zwq6nLTRGDF4KqmpGep9lKCOma2giai7sEMH32QNmjEZ6Qg9w6C63MdecmtIFhZTuSKzdyGxxnQzu/HDZE5O8my9pfHsEy04zl/8rhQ3QIm3RegGzD7paKQOSt1O3ArJ2UzBOoPKKxqMz8tuFw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FRpCxiyU1VKZ5wMaiWnrGbm4DDTsWzd4uZV+EP2GjE=;
 b=rueRo0kxAZ7s3Xyt8KwrU8Q5ILhVqLSJtkzY0tIxGm2zh/meThMu5VzAa+us9V90QF1uVeFPCuUmEVEhVdLz/a6rDjT6o58IgHniyYyfuHXzHldToSJRtDMVQv7tQk1SOQCg44RK4eoUIeS+s5f3SlI6VnTI2RwfTQPMksz4tndpro/J9pdliiMoTtBy5hJcKCEn1Hi1vZ9gVizKq3qBC28PSxBLviQ2qB7lbOaMZXnKfb3M70S3ta6p2PVzZfXcaXImMO/Ynd27kEoiK6OGmLgMeayvfIzL2WyROCRpre9xPKd/jqcJWL2nQU74H+q9J3KqUUkYb2HpBYlRGvQWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FRpCxiyU1VKZ5wMaiWnrGbm4DDTsWzd4uZV+EP2GjE=;
 b=ASPCnGBmbjdi2KunnkCv9LHXoqhsXksov3FGydFYx3TAcWhMmWeitsvSfqZ5p9dCpK7LwuyJn0S81Big7L4n9FtBNE94C/Dk5XBVy3qqvHizDvb8tjFfJ1hrINs22y+LsXUQhSPKeGe0bf30knsIQsKRJCweb/wKNHZIgkkyAAmmEMruZ6kdd0VUP96tBXWMmKtErJiHGu7CQjupk4CB0QeEh1vCa2ivlGXZPSe5lwqk2dB6ZKWqVVaGUKMW2Iy8TwD7jGPK6ycNnr2eJfcfm5tTMjnIU7+pbzQ27l//GRr39v6CXEhac9FLuTr0Es1WxfV1kiAd0xHqDLzfVqf3Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB9734.namprd12.prod.outlook.com (2603:10b6:8:225::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Mon, 9 Mar
 2026 12:48:19 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Mon, 9 Mar 2026
 12:48:19 +0000
Date: Mon, 9 Mar 2026 09:48:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rdma tree
Message-ID: <20260309124818.GD3717316@nvidia.com>
References: <aa6qqi-GmXZXxubE@sirena.org.uk>
 <20260309114020.GU12611@unreal>
 <f41b2391-d202-4d2b-96d0-4f9040003a35@sirena.org.uk>
 <20260309115226.GV12611@unreal>
 <091dbc25-06d6-4847-af50-6349f1acbf17@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <091dbc25-06d6-4847-af50-6349f1acbf17@sirena.org.uk>
X-ClientProxiedBy: BL1PR13CA0450.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::35) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB9734:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ace9c6-2918-4475-33b4-08de7dda23fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	vdCZ4Gy6D6eDV5BCwm1KzEINwmTz+21Tu7DNlaMuhv9yDcGwXoqskwuSrJInfziHPozAWFd8lHY/as8Fu98e4tgiRu3K2+alhTMwx4dIvkmi79k+fZBDf0pbaN8Abq4ia+ryNO1FC58goKd0XHhCnT5bqaK77xt/4ZeoDPkdVwuJccXFGZp+30jDiJ1EyMcDTZCGyXyCA6XIc24XAGgvR3kuU5KXxuLod9rGcRnm8Uwi6LJu4WGAGbkdAJp2KI7dWADB0rs5YRgv5mSqx5n7JFBDD5GkWCtH17yaBXZ6V5TCHjuukgb40AFL/Llz8M/zCamTzF8JEmJPrU3cV3LhRNM3J2qWy/BcQR61Cvu0WD1L3VhrzQtUfkRStBl3XfXtwlBQOsfBYsCsu9oQhrTYTJGsjaROC+tD9ZmKt0dbSf3hiVF4MZpb/dX/09wXMSGiSYXte8Wm+WmYcAClnoeVX3yrsai8UeMKXksVUhl0KQWV/DH9ibQKUIHpUcf8FPaFapYx018z4NI7n5uBrNY39ZVlCS2H/1a0fXBxhOf+tKZwznBXf8ymmZWTpDV9Jbe1afwcxqHy/rb5v+XxocvgFVR/uK8xUukfhBw77j9JiepkwuDb3WxlVpDtA2Qs7PZ+lIuoKeNug9oWMRofcBY/EsLStiQ8jwIZpjCFPAjpLo3XQFgjd9WV/R3+ku10TQg3luuR4/L1A2m6aU6dtvQHl4WFksprZWNLvGS8+LYnrdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lin4MgKeuLkmJiFNakfx71PSDG9YdQaaq4rEEsvYW1vgP9DWrIUTpvAo1eyH?=
 =?us-ascii?Q?/b1i5R+sKX5pcqQrDi+rdJVX7mfeKU5u84VWlV6lfSTg57eJV/YSPrndIIb0?=
 =?us-ascii?Q?pCcsLdPcjRuKTNee9Sagi9BEpqPYsYjMAfo9BIiMy/mIBWtroaOmu1CZ+1uA?=
 =?us-ascii?Q?LuITuIGCuLfzE0vBf8u5QH6NVhill6yKMa6QERZPzzJxwo7Q5LLjEVNgd5Z7?=
 =?us-ascii?Q?u3QKujiv+s7qT6EqbORtE7RmaanTQvkt+aXDh+uWTdoyvCwqDlHtKNK3mCeU?=
 =?us-ascii?Q?KKyChYItbMWUlbrtaDuY4fT2VFwuKE2VEwgqRbqFbqQln1zoYwkyB85k8dsz?=
 =?us-ascii?Q?J2VietHVwYF43aPIjUXuSB7qRW/EWtZVuHjYuHjnyje9q/IXfUM8n1zIWwnM?=
 =?us-ascii?Q?mZFaZoTQ2qkw9CBglCOAhY17hwQKSS2RMpm39k/aNy4lujNwuylRvGV//GCr?=
 =?us-ascii?Q?niCYUJnWK/3a/idRd2hZ2jrEKYKjqNy2r2p4sofzgsIsk3o1zogu2eikHSmN?=
 =?us-ascii?Q?dBBFP5IgtYA2MGwtFdkG0RoVU89hwrVMqB/HnsKLqlr4xN7nQ35o5hlaxu6A?=
 =?us-ascii?Q?OUf+Er2QRXn8BmyxDV+qJVCaC9Z8l9Ad3IBa43TE9HekyA1b2N7906PmcNyy?=
 =?us-ascii?Q?GRwIRXqiJe5C1z9dT+toLQ7o4F70Nf15bOZOJhGJJFAe1OUvOOTWSynqX/cn?=
 =?us-ascii?Q?oA9WqiaeHMUpd7W4YExm83wnYt9vaDio5X/XDjoyKSMPQGbK2hsLAIUxRr1P?=
 =?us-ascii?Q?FrXsdPlt+zKJR9RM87aFCF6CMQ69K0ypoxSYkUaQ7YX3DyL4LlBF/w1+sKp8?=
 =?us-ascii?Q?1t35ikv5FUSf/LQ1bSdLzEp1OFtSliR0XSHqj0hMibg9SiAaWecUd1r8lW1P?=
 =?us-ascii?Q?GAWbJflA06Woi9jO95uUPBu2ro81/OLEnMtGMrELNIOH7aeyMUZU0P5tJroC?=
 =?us-ascii?Q?jvDmqp+F6DgLCM7NnffsXgF0uF9yT3fROn89ZnNUg5VK5rmKazqV+q5CWona?=
 =?us-ascii?Q?yajrL3R+BIeMdfq/+2nCk1Z8anTxy+S5ZyeLR8wIZYZI1jzLaD5fTkJhVPJV?=
 =?us-ascii?Q?uFv3/XzxX7rvHupMqvsymc6idYvFmcjHHAecCZS7ikEmrIoPiqxs5l0ndkur?=
 =?us-ascii?Q?Vf2GOug5/EYmJ1BvJvw4ElxSEv3NcM0/bqXl+Syid5/dzjEdokYaGdP6KFqk?=
 =?us-ascii?Q?NFxSvq+VWcJma7mn/AKnZY5t+kv/1o6h9xaiRBEEscuvDAHA5lQFrmqwlUtT?=
 =?us-ascii?Q?lJrmlqu/L18FIlwcCJEjLIPlE5vVbqiPzmFhCh62rOLBpWlNZ2LMBFi6QFnM?=
 =?us-ascii?Q?oWrQqd5yhojZ+BM+vC3YLRuH6r0IOkXIWloM/fp1yzED9xdILejzYBG3MyQo?=
 =?us-ascii?Q?/lZo/aznpcQmVcLu+ueirGCSPYvbrLtRak+Vmpu/kpB85WG0LvtNU676PtKt?=
 =?us-ascii?Q?/8xVKBryOyWOybkl7suFOtyITqv0z+v0fqcmVg9tHbEVjlUpySCSsjDB8KJn?=
 =?us-ascii?Q?9CqEmnkqupzwwQW3BDJAgkeKPAVXGBc7pMIUvqCRNluuMEE8B/anHRgtkOqh?=
 =?us-ascii?Q?GyTHnJt+6700pT1dJ2Yy8mCrxobYVEsxGhv0gaGsfYhAKvJwrd0CYYGuSVrK?=
 =?us-ascii?Q?QVJOLsYNtiUH5NML5CtzokDCLziMLAgU9gd/lGoUATcvsGBepgkN4i1tv0Mo?=
 =?us-ascii?Q?TnqEJQHYnC0pNWGpxj9E4Ubt2L01/rfmd2+uZl+aj32T08XbM2FUfu9e/Xl9?=
 =?us-ascii?Q?MNmXionCiw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ace9c6-2918-4475-33b4-08de7dda23fe
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 12:48:19.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xkW3ykdVXIuIer5WSU8XngQvZ0AYXh/79U00uO0W4IEswiDXRUYhm1HA/jfWuoX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9734

On Mon, Mar 09, 2026 at 12:43:16PM +0000, Mark Brown wrote:
> On Mon, Mar 09, 2026 at 01:52:26PM +0200, Leon Romanovsky wrote:
> > On Mon, Mar 09, 2026 at 11:46:07AM +0000, Mark Brown wrote:
> 
> > > No, I see signoffs from Sriharsha and Jason but not you and it's you who
> > > actually did the commit (see above, git show --pretty=fuller).  Did you
> > > by any chance rebase a branch where you'd pulled something from Jason
> > > (or which Jason had pushed to)?
> 
> > Jason applied, but I rebased that branch to drop patch which was taken
> > by mistake.
> 
> Right, if you do that you need to add your signoff to the rebased
> commits since they get rewritten during the rebase making you the
> committer.  Nothing looking at history can tell a rebase happened.  git
> rebase has a --signoff option for this.

I have to say we have tripped on this issue alot over the years :(

Jason
