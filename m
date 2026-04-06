Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012013.outbound.protection.outlook.com [52.101.43.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C589640DFCB;
	Mon,  6 Apr 2026 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775496628; cv=fail; b=bBUA4cah6UF+y6SeBP6mcR/NfVuQhM6ibeSsJB2tIOAaMfDn5eCXnPX4wiWmEAsvvBQgyb2r1Z0YJvPS08RaI6dV77yiQi22RmoJzZ7wFxwoZ5fndeD/sxJNecjRWwkZevR80il7iI4nkTi+yozqB3Ge05q9gc8x9eex6a4fitA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775496628; c=relaxed/simple;
	bh=2bXsSvlbjQ72+UAw47HK7LYYpzXLhTp8s0346zK0WN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bU8cWhT9ljnu3F8W5Z0sPotHpFWgLggew6gtEpMAuYSqCWbtLwnjJ2ymv8xaRHuZXnB1qabrkiqoqcrW/QjEXm9nuSTWZv8h1+oeBK3ndEOLIUKjEVgSUc/dhzM4ftDQ7Frr+OLyXP0+HpusSn6Cv06XBI0yYUlvqk6q75qoFts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mcUXiLYD; arc=fail smtp.client-ip=52.101.43.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mcUXiLYD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OknwoF1948nRB+lBhXAYjZ/j25W4JnnUpXeyKYZQ0/+P4BTxsCTxWO+yRKCdcifYClGAm512XJGPTRspWdJJiqeitUQ4XAS9vnOC57d1Esbw5JaSct7m+U/1kkLCxiIa+SW4XBtmm42lIyMcJ/J+czOPmTOidOBD3bKDcDZ9KJH6nU+HwMkKS69qNrPNeTTe9JhEEPT0KEitb74AsiviLEXNe1V4GVi8RFdSluXh/1v9+LI14VXGaScz85vpE13wQtjTYX1POVgVxEuO+L+aCoeIJ91q57ygww/dZERE/BbNz74R7TgvCCLxbD6IMLSc2VtgqYrM5lDfdWF3GOUbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmlqwTI96wf2m6eDalnr5t3FEETXBjLwGuX2OftfV2U=;
 b=MB7zCUoAYGmaSb0MSQTVBb1pcPZnTP1aohN+mN7CBVmLu6ywXwpOyQFADkjB7aN3yUxFhNL0k5GI0rozl9RNCaNM+hcR9aroKsc8Z0foDRKenfXghohs/dIkV7UgaNtfKEcadBUU4JcC+pUBhcCsoaAvCUGvlRgN+O1N++gaORiEAn2YZKlFg+1Opco4xRNC++ABXUZXifbLxOS4cR5tSRBXI9uOokHVoRZIrwR+XLZVXe7mSOHBJnEYkAFdjlZxwfXhiZCkb3ocpbM8g29yiXSjqc5m1Zk+73MJcrNVbN8V3tzjydNewKq8sKdczj9ZI2iBcgc68IvWzxR2IpQ7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmlqwTI96wf2m6eDalnr5t3FEETXBjLwGuX2OftfV2U=;
 b=mcUXiLYDTYSoDdoI3XopVGg4EU7khHTchAcbp7W3tIAuLV57mUrH6Cu2F4IBQdcdGb4mOd35vbvOnOZYJOAuwFK+ZH0ZulAOCtaStSQAYwVe/nbt3ilDWw5nFTpDo0VlFcmpMdE+N3LwPgRq54FZTsoqlKW0XsF9U250qy7BmJxL6rsLF1UujcflGwNf6CHLgBkBLxZwFHx6TKCM5vKhRBLV1gaAVJBrs+qEBwo3fbSWe6AgMuLi1MCQ40SBrRjTs4Zlfjrb1c+D4b7QsQUUVfxFDpK1xDzVqlYHPuFVFyRSG+qtN471SQZCfvbjRSnBbsO/b1Al5aN8wVbtcdZUCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 17:30:20 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 17:30:19 +0000
Date: Mon, 6 Apr 2026 14:30:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rdma tree
Message-ID: <20260406173018.GO310919@nvidia.com>
References: <aa6qqi-GmXZXxubE@sirena.org.uk>
 <df6f8a58-5c8d-437e-aad6-fee85a89f5e6@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df6f8a58-5c8d-437e-aad6-fee85a89f5e6@sirena.org.uk>
X-ClientProxiedBy: BLAPR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:208:32d::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: b156ed47-c7be-4ed5-e207-08de94022c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7SVDbSw2gSgquZnVxOaGUGoOq+HF4eb14mZ/q+eO9sjL0mg08HPSXEaOxeVtqIOIV1WpdZUY1nA9M96jkSeglzGwjYcvRu8ZnGcizHAHeTH+zFA6bmzMFzn7EQEDzun/iUI6AzPoyNVJJEQWwUfNLUYB5vIP31U6oWuRMXFC/9j2Hx9+cju4SjX87aeyDD2/M+SQscsiqmpLSpcV52wEZhoNc9OnP1o223i9/67rv3JEAx5h4vAay/RueHSn5KuzTDRsZYftFjqK8YwuOdQvZx3q0B+XOjDKKcWqCoLIHxJV+1qE9f0CaQNn9/mZbQKyGFbwlAl2+mR+FhyTCC4aAhOEe+TmJYmX4v2JZzskeE7EXxWWCBvLzPjdCui8P1YU23pVqU86TH5o4K4f7coltnXbEngjDImFi5sZAeEDuNZFGjue3dMbPNBx0VTn+XUM8n0qpMIAF2rIFewu7ivuF2qYVeDdC7UCNBVotUOxwobp+l1AyRnmXUfC0DqfCyn50hm5hvbRn8/0fX6boWzo85vDRYqjHgSJ2C4CgyofRpJ2t6XwWFofzEyELSs14UHbEadZnZ4X9x9ltR0P2n7VHVbhgDG0hjdX7b+iTlE1yVWHZEwalz76xXzFTJNmMlxDTlGtAQKMN1YfDuyixXPRbnqYTyJ/hsp9ErMs8izgHSa3JOWveEKG8a9Xt9oTHLpxR7tb1osExqbbae/tRRWQT3hQu/2m7oRDQt02ZX8N9ow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b48/mmU1N55HN2gta4gxZWse508sDtjbe/df2WFSn7bDMPjcAuKkBzGahZCA?=
 =?us-ascii?Q?SGSFjnkOKuam7qbYJJR6Hyor8RPH2Kuf5ADriJPxQds97WWgKwgNVVrlB0DD?=
 =?us-ascii?Q?j93ao+AaHEhC2o/gyRiG6fsXWq8sX+AX+i1IRuPMPdQQNewgGbySSVenlJhk?=
 =?us-ascii?Q?K15oVryI63EqWJs2juuJ90kuidxdV/fIt3Na9bIyI9y78FDcNs+4phqIJmMs?=
 =?us-ascii?Q?WTgyi6sD/k/aZx21MqfFGP+SbKiMrZxfQZYJMwVavGqdrhy0t+kMwe3lQg5H?=
 =?us-ascii?Q?pnj1nN9BRmNY1c2dZmqM7NbiN/klBYaCU9XNIPph8WwHPai0khtGztwO4QX8?=
 =?us-ascii?Q?BYE85pUzZStMWyRtEQHEoyC8/zuUwsgV1A5p1ZkIJxtU5ddTSAWibw8t0gco?=
 =?us-ascii?Q?4llCMBXgpvgON98GDrZO/M84iaD/IOU1XO+dqVOjxBWA4HOo3SZap6we8ELg?=
 =?us-ascii?Q?kUvPJKDrSVR19ziPMFf/47p+Dh+rbdYrpXiJLEDpAdd/w2feofBuXkhY+seZ?=
 =?us-ascii?Q?gNaqHXeuTQgj8STQpVRzQGfucZ5Ic9l0VZiuEbxIHI6AiA6IiiyAunPNLeeq?=
 =?us-ascii?Q?ByqM0smYy0u7rF+6HJea1WP9x+DVdUTftxW7EFaB0fGk/EPevjdghBCnP/Zu?=
 =?us-ascii?Q?Ixi2eU3UvzLfJwP9+Q2Jeaqrf18zXqRkR1EnKuKh4Kuq114ljQq39O+WGlja?=
 =?us-ascii?Q?uW/Cc7OshTRvrL9nByFei22jEIDy056J+G9dHiNrnif0S+1RTv3aPkdQmuLc?=
 =?us-ascii?Q?DM7pCmUxZJB2VwFBMHYPSBuppqUGqKKEkgSh0/qWjZcHWpxtW4FvdMJX5r37?=
 =?us-ascii?Q?tXdYlfivAZLRIopWys16y6Xql3osxCZ5ghfwfMt7xBjptkPzwb3V2ULN5CGT?=
 =?us-ascii?Q?sU6+bksDa4vVVDuGcJ6hFl3KdHGNU5NnomujyBN2PmutXIZIkjyDzzCqqnXm?=
 =?us-ascii?Q?/q+ex40fnYwp7+fRy9fByJUCl5tTeROfTVi1HZDvgnybTQWDBRLSniSh6XNz?=
 =?us-ascii?Q?Lr9wAeH515OkVZDUl+aAgd1WF0bHaG+hSOrBzgDhzN/NuG3oTC3OgLQ1CJSM?=
 =?us-ascii?Q?YgCPZoTJLRW/dA0jTDD87zoK4NIikyJqOEU3nl21S8mxfL1f3UMyrFO7sJkJ?=
 =?us-ascii?Q?HVPRDHm0kPMXOQNdyvJNawEcc5xGA/O/CQ1PkOK1UUOkJv0nr+hgPcjAmp3G?=
 =?us-ascii?Q?hT2SxbudoL3Xn1IrigYmdK7EvopSMRLKutkMxTE8V864qWJyz8yi1i0yYbcl?=
 =?us-ascii?Q?e7zkye6djILaBo5dCPmq07uPuketSvrF5Yxveqy2BqAxhTMHRMjLSTdkxXNi?=
 =?us-ascii?Q?VNd4aa27mrZtu6AqC09sZ4lcoFd5L72SAMbmBOiIhX1YsMXM0aiut2K+ZOTF?=
 =?us-ascii?Q?woTppRFm8OshSPKDw8AkjpE3kLIfA7qDqTZ8H7UW18LzXvYeopPx7UolCjiT?=
 =?us-ascii?Q?h08jbsUR41TQR0ESjtz6T1iqrXoDQFyuzZ0zmAt8EpohS5tq5Rw7zOkXq5HR?=
 =?us-ascii?Q?UDpWD9o9dpjLcpst5xvhIIjibXE7dtTqY3TYakRaS2wcsYC4++d/WNSlDyp/?=
 =?us-ascii?Q?fpT8JgspRbN45Hnc0OBvf00QYAXaxGJE5WpolT5F+1p/fBDpDAc7LDyuqnqp?=
 =?us-ascii?Q?YBmUjVMoFb5NPrV8Hf6rIzVRkv9RKoYff52pal9ebsx9QSEUryH9e6daiNIb?=
 =?us-ascii?Q?GXey90TsBYLC201uPENmuqKesBwcSYaQxVYAHR8vrrGJL7qS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b156ed47-c7be-4ed5-e207-08de94022c8b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 17:30:19.4111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQ8O/BcOS239gUUzSVHZMKp8aXK2yQdMm7W/+KWw/E8ONLaAipua175aJs+e/UG+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653

On Mon, Apr 06, 2026 at 05:38:14PM +0100, Mark Brown wrote:

> > are missing a Signed-off-by from their committers
> 
> This issue is still present today.

When Leon fixed the previous mistake with rebase it caused all of
this. filter-repo isn't good about not changing commits it doesn't
have to change, so it isn't so useful when merges are present.
rebase -r will reset the commiter for other commits.

Couldn't find a built in alternative and got tired of this, so I ended
up using AI to build a script based on an commit editor I already had
to fix it. I've included it below incase anyone else finds it useful
someday.

$ python3 edit_committer.py refs/heads/k.o/for-next \
        "Jason Gunthorpe" "jgg@nvidia.com" \
        v7.0-rc1 \
        eb15cffa15201b 485a21c14b4133 9ed273bbe66370 \
        0edac801a2693e 4e99362444a2f6 f0579e330b7736 \
        9db6a217ba5ddf ce150a8376e1ee d59f007207b394 \
        ac4bb15208d1f0 12c73bee531336 ac593f5b66c9d1 \
        6df3a6414d7364 42d2a291ef4748 f1cac281b42456 \
        4ac738c6a7b906 715eccd4798ec7 ea08d8cb8b5203 \
        8e886928a19d70

 Processing 2536 commits from v7.0-rc1 to 69db255d5faf
       8e886928a19d -> 38a6e5579d0d (target)
       ea08d8cb8b52 -> b51caeb24aad (target)
       715eccd4798e -> 1de9287ece44 (target)
       4ac738c6a7b9 -> dbf6491bb98d (target)
       f1cac281b424 -> 14badc323ed7 (target)
       42d2a291ef47 -> 4c379ba04c11 (target)
       6df3a6414d73 -> 5ebe8832ef90 (target)
       ac593f5b66c9 -> b33d860a13b4 (target)
       12c73bee5313 -> 3f6b103c4bf2 (target)
       ac4bb15208d1 -> 0cee3acab27a (target)
       d59f007207b3 -> bc30311e492e (target)
       ce150a8376e1 -> bed686d8dcd4 (target)
       9db6a217ba5d -> 613713f251c8 (target)
       f0579e330b77 -> eee6268421a2 (target)
       4e99362444a2 -> 13f9a813eee5 (target)
       0edac801a269 -> 1234a9d8aebb (target)
       9ed273bbe663 -> 3d4a42360c33 (target)
       485a21c14b41 -> cec5157b6c73 (target)
       eb15cffa1520 -> a06165a705ee (target)
       8db7b7d9ba17 -> 1dc469f669fe (parent changed)
       33960c206db2 -> 553dfa8cbd0c (parent changed)
       e86b2bf1c311 -> 797291a66ce3 (parent changed)
       932f1eef09ec -> ff85a2ebacbd (parent changed)
       f39003e8fa8c -> 3a0b171302ee (parent changed)
       5c3f6de46d6a -> 4707bf5f6c86 (parent changed)
       353b3bbdb2c4 -> 2afa8b9f5ff8 (parent changed)
       76ae14db9058 -> 1b50f42049d8 (parent changed)
       120ad1fd5914 -> 56521f587704 (parent changed)
       ba8c700185d6 -> 786ee8ddf47a (parent changed)
       e2849b392974 -> 679eb25de4ee (parent changed)
       2ad64eeaefd2 -> 0fed679e0862 (parent changed)
       1487bad4ea51 -> 6be4ca0ab3a2 (parent changed)
       5122be2a19aa -> 5aeb6e039972 (parent changed)
       4ae130ccec08 -> 9d6ba4ced734 (parent changed)
       dfd4d5a38e65 -> f3cf74933c9c (parent changed)
       a8f6ced534c0 -> 2bb02691df65 (parent changed)
       cdb802af06d6 -> 5aa437c93d90 (parent changed)
       ffdf34ca1a47 -> a60e3f3d6fba (parent changed)
       c8cc77c8418f -> 13f2a53c2a71 (parent changed)
       e5ef99e3401c -> f1327abd6abe (parent changed)
       a7a49104859d -> e01027cab38a (parent changed)
       a2347bc64b89 -> 6c45efd8f9bb (parent changed)
       ada307fd98db -> ce68351be075 (parent changed)
       b8934c5c3f83 -> dc76086a2d94 (parent changed)
       f0c62197416b -> b247ed6f60bd (parent changed)
       c291b1133360 -> 2b2f078236a4 (parent changed)
       d8d84ea1abcc -> 345f842771ff (parent changed)
       933153ef70b8 -> e69609c5d469 (parent changed)
       f9616c93912e -> 2f49e1590344 (parent changed)
       09220f0b8388 -> adc09d7fbbb9 (parent changed)
       b5bc2b6ef6fe -> e6fd24917897 (parent changed)
       997f21ed1e93 -> 179b32095854 (parent changed)
       578cb2be0db2 -> 911e5ca3e169 (parent changed)
       f968d01f47d0 -> dbeb256e8dd8 (parent changed)
       74e2711bb2af -> cef2842c922c (parent changed)
       7a8b545a8012 -> ae638288b202 (parent changed)
       e81275b67f59 -> 8d7573b19402 (parent changed)
       092585a85a19 -> e910d98dc440 (parent changed)
       7fde9cc10f60 -> 54b3bce97211 (parent changed)
       56f6ff43f486 -> 3268330fa84f (parent changed)
       4698e4c4a163 -> c8f9a7a96e9a (parent changed)
       d21477adfa80 -> 530b251b0f7a (parent changed)
       9b4e46b8cce6 -> f899787095cd (parent changed)
       fda720ddb439 -> 0453bf09a68b (parent changed)
       ab214eefaac1 -> d5c8f2f39907 (parent changed)
       03f4c8090204 -> 604caebc7f06 (parent changed)
       7186189cfa22 -> 676b570707be (parent changed)
       16d0d9d4e2e9 -> 67820de31679 (parent changed)
       5af7526eeb73 -> 69309e17293c (parent changed)
       a9cd442a5347 -> 8e3e07cca004 (parent changed)
       69db255d5faf -> fdcbddcd3aa1 (parent changed)

     71 commits rewritten
     Updating refs/heads/k.o/for-next from 69db255d5faf to fdcbddcd3aa1

#!/usr/bin/env python3
"""Change the committer on specific commits without altering unmodified commits.
"""
import re
import subprocess
import sys
import tempfile

IDRE = re.compile(rb"^[0-9a-fA-F]{40}$")


def git_output(args, mode=None):
    o = subprocess.check_output(["git"] + args)
    if mode == "lines":
        return o.splitlines()
    return o.strip()


def git_read_commit(commit_id):
    """Read a commit object and return (raw_keys, desc_lines)"""
    lines = git_output(["cat-file", "commit", commit_id], mode="lines")

    keys = []
    itr = iter(lines)
    for line in itr:
        stripped = line.rstrip()
        if not stripped:
            break
        # Indented lines (e.g. gpgsig continuation) belong to previous key
        if line.startswith(b" "):
            keys[-1] = (keys[-1][0], keys[-1][1] + b"\n" + line)
            continue
        kv = stripped.partition(b" ")
        keys.append((kv[0], kv[2]))

    desc = list(itr)
    return keys, desc


def rebuild_commit(keys, desc):
    """Rebuild a commit object and return its new hash"""
    with tempfile.NamedTemporaryFile() as f:
        for k, v in keys:
            f.write(k + b" " + v + b"\n")
        f.write(b"\n")
        for line in desc:
            f.write(line + b"\n")
        f.flush()

        return git_output(["hash-object", "-t", "commit", "-w", f.name]).decode()


def get_commit_list(ancestor, newest):
    """Return commit IDs from newest to ancestor (exclusive), topological order"""
    ids = git_output(["rev-list", "--topo-order", newest, "^" + ancestor],
                     mode="lines")
    return [i.decode() for i in ids]


def main():
    ref = sys.argv[1]
    new_committer_name = sys.argv[2]
    new_committer_email = sys.argv[3]
    ancestor = sys.argv[4]
    target_prefixes = sys.argv[5:]

    if not target_prefixes:
        print("Usage: edit_committer.py <ref> <name> <email> <ancestor> <commit-prefix>...")
        sys.exit(1)

    newest = git_output(["rev-parse", ref]).decode()
    commit_ids = get_commit_list(ancestor, newest)

    print(f"Processing {len(commit_ids)} commits from {ancestor[:12]} to {newest[:12]}")

    # Process oldest first
    commit_ids.reverse()

    commit_map = {}
    changed = 0

    for cid in commit_ids:
        keys, desc = git_read_commit(cid)

        # Check if this commit is a target for committer rewrite
        is_target = any(cid.startswith(prefix) for prefix in target_prefixes)

        # Update parent pointers if any parents were rewritten
        new_keys = []
        parents_changed = False
        for k, v in keys:
            if k == b"parent":
                old_parent = v.decode()
                new_parent = commit_map.get(old_parent, old_parent)
                if new_parent != old_parent:
                    parents_changed = True
                new_keys.append((k, new_parent.encode()))
            elif is_target and k == b"committer":
                # Rewrite committer, preserving the date portion
                old_val = v.decode()
                # Format: "Name <email> timestamp timezone"
                m = re.match(r".*>(.+)$", old_val)
                date_part = m.group(1) if m else ""
                new_val = f"{new_committer_name} <{new_committer_email}>{date_part}"
                new_keys.append((k, new_val.encode()))
                parents_changed = True  # force rebuild
            else:
                new_keys.append((k, v))

        if not parents_changed and not is_target:
            commit_map[cid] = cid
            continue

        new_id = rebuild_commit(new_keys, desc)
        commit_map[cid] = new_id
        if new_id != cid:
            changed += 1
            label = "(target)" if is_target else "(parent changed)"
            print(f"  {cid[:12]} -> {new_id[:12]} {label}")

    new_head = commit_map.get(newest, newest)
    if new_head == newest:
        print("No changes needed.")
    else:
        # Verify trees match
        diff = git_output(["diff-tree", "-r", newest, new_head])
        assert diff == b"", f"Tree mismatch!\n{diff}"
        print(f"\n{changed} commits rewritten")
        print(f"Updating {ref} from {newest[:12]} to {new_head[:12]}")
        subprocess.check_call(
            ["git", "update-ref", "-m", "edit_committer", ref, new_head, newest])

    return 0


if __name__ == "__main__":
    sys.exit(main())
