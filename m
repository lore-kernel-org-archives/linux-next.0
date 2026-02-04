Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2155E31A551;
	Wed,  4 Feb 2026 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770232462; cv=fail; b=THp6PzEn81aOnN9FpgjhXVYk7fpVAHLdTI9RyDsAnviTjbUjFaDDJtknQAUqcn8vhIo8SZaAv0kRlLZ3iBk3wmFIQ8cz4Fux/W2/POPOT/C2vFxH1+ohEt/Dd/OPrqUCvyCoAIyilUE+7+mQ9oweLOG3Y0RpM9XspnAwz59CXGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770232462; c=relaxed/simple;
	bh=PgULo354dfH22W4CZz0SOTcGoantaBQdg17Dly2nIbE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NYTwhJojLd8N3NQvk/g6JPigNm8ynuapbGoGyQYZ5PEvqU3lQsAhPLtEzTYYg4YtKSl1rKjuvAMbunrZKQUMPWoucLoozI+Xt+R744aXAoPWIAhrY22BjJwsElJHFlIF2Jbn9BoB19AUCTodgvVNPHyUw9sPmnvPtsQgcXWDcMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRiu3zat; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRiu3zat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770232461; x=1801768461;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PgULo354dfH22W4CZz0SOTcGoantaBQdg17Dly2nIbE=;
  b=lRiu3zatAy0Busg+S65DK8IBYq1e/UKtZ0zaDYgpc1zNe9mid1NUNBam
   YfFoe6Q2SCuEMeH/I4cUyXUQkTn7JPbXHGs+/r59BUz3g9J50T416c1Dv
   Zj+eiS/8lW7wPKxMRV6C5QzK2caofvYHlxBkuxfCdprtNPtxeItmSN8k4
   7Otv+wloSHC52FMHU6L3N8mmZ6uaGPGsqfLmaP6aPoWaZewWGCwNObeD6
   6G7KL/c82xWoFPDtzf1tzKfyQ2JzNtAf+4HG5rcqgQew8A7ErweOiPmbV
   Bvgdl7ng4JWhQ4fqj0HL0oT1dQ/PwzqLoFIPiLAVgU3E90K+JtuRcjSRk
   Q==;
X-CSE-ConnectionGUID: T85KwiLDRiSrEuAs40Y+Fw==
X-CSE-MsgGUID: ZOFhIpHJRP+Gzr76/+AO/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="59000914"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="59000914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 11:14:20 -0800
X-CSE-ConnectionGUID: 5rKiR4lpQyOwyP8F4oXo2g==
X-CSE-MsgGUID: Dn3BUL67SvCcSP1CH2ncBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="247845987"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 11:14:20 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:14:19 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 11:14:19 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:14:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVzylNz8vvziZFiv9N55j/ln0SV3RE9fg2WcTYTp62JPgPfgbDw6AGPU9+bLdvt6oUuBKHXhyqSYBeryidN2QVznRdm5VyKRlUzX/ZlAbBVRwfgeqhCZ0onDmevadxbN33dWQUD/jukkFJKbDag13S039sUThrC61RrWEvoZNkeVlBwERjJad5F1v2oOr41SoU6IzKppc+RaGJoW/C97snIek4u7DHL7hoh0Hs47FbGbPI3Q6GaIIdb8VYnRs8ngVzFxhNTjA9RvlK3N1fOTrwYXFGMIYSxJFiRtF1Q+2KTzmvKv+Ut81vvgtVzpdqZfilyfl/+45yifSnY3U9TlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAUvDcOAhEl71QlMOZuGXW7/bSWS6v40deaWpVrybQw=;
 b=LkaqBV/sDk5gf4cmdG10YOpniOKmCo5zOooRC/ayQWu/ZTfw8tNoYAV7z1oWKLo51ZmCRmq97pyzmtfYe7sgGluJEvusFi4ss7m7/DmjW/l+oi5TknS2mdJnWAVPQNxxYTPQYMweXEgDWc+iT4UDM+5+VKL1+rNf9KqVrKRjSwANocCWfzI1y16SS4biuhk3YizjcBPhZ7eZaFRSw52+5K4/ea6LuBUf+clr8BQkhbgvrpRX6wREPgRGNgd8KFkT4Zsndw1ShAKwM7+Xhy3uqUc+mk6AF4YkNA4yhuBTesSASWdCs9XUh/Sd17FJR0cFXrgsKNwRgY9ZOs1o11jRPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF9E162731D.namprd11.prod.outlook.com
 (2603:10b6:518:1::d3c) by PH8PR11MB7069.namprd11.prod.outlook.com
 (2603:10b6:510:217::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 4 Feb
 2026 19:14:11 +0000
Received: from PH3PPF9E162731D.namprd11.prod.outlook.com
 ([fe80::1340:c8fe:cf51:9aa2]) by PH3PPF9E162731D.namprd11.prod.outlook.com
 ([fe80::1340:c8fe:cf51:9aa2%2]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 19:14:11 +0000
Date: Wed, 4 Feb 2026 13:17:31 -0600
From: Ira Weiny <ira.weiny@intel.com>
To: Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>, Li Chen <me@linux.beauty>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the vhost tree
Message-ID: <69839b4bdf198_58e21100f@iweiny-mobl.notmuch>
References: <aYNVXlLl98EbCBBO@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aYNVXlLl98EbCBBO@sirena.org.uk>
X-ClientProxiedBy: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To PH3PPF9E162731D.namprd11.prod.outlook.com
 (2603:10b6:518:1::d3c)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF9E162731D:EE_|PH8PR11MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 7720dd0b-551e-46fc-a08e-08de64219414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LkaQWHKA+VEw0eJtOvua2rXZiJ4aHxI/Y+3ttcCfQCbPGgHig2oyoqq+p+wX?=
 =?us-ascii?Q?xaRxW7h/I0ig0sJ6/hVcN+AUQFeqC2uvTrTW4Fh8Z2fXGWvmuI4N7mON5RLL?=
 =?us-ascii?Q?e7VJ+3aFXq4Srq7TRPrQwS2yJT2UDWY7sfDSmVuJms0bag1cYpZ7/262G6GQ?=
 =?us-ascii?Q?SaNWloZY8pOARy92P8KMq4ik8WSkJR87hOrIO5j/38XlC5hG+UfHn+KpBa1r?=
 =?us-ascii?Q?ZvB4vIPDhHsfEPV9lCqu/y+qfX+4JOUcmtKfnPj0FfxeAM74f2h+23WNDaeC?=
 =?us-ascii?Q?bBhTOUT9oCAKDXFSz7IolB8yLxnn+foiXPPXhOkX34Rm1W5N9ft8/00vXEF2?=
 =?us-ascii?Q?jqWGwS1KUVCsMDVDX+6dOwyhZ+2Q5utx10FyPoUtDaW59z0QCOg6tATq2/BO?=
 =?us-ascii?Q?43l71JbKFn371zhIXdNJPosSEw/1ATBpizb5cOPzlp+0SOjvF55Cfaup5Pt1?=
 =?us-ascii?Q?1qt/gequWyGwLpnMYM2b9CQKKYfmt4L2CWTXVHAKHxOa3HVQcOqILfjy3cm0?=
 =?us-ascii?Q?ovW1jFJRJ2p8nmrk7UmH2bDafqtBJBKP+ROchUKUbYqnqkhSjKBGGtdA0T6H?=
 =?us-ascii?Q?6ecnzUzLlKpmOw/SPpLbj+i8IKPVihVSvPqkMZdHufebjc1VYWglBGVi+VMS?=
 =?us-ascii?Q?sreeM9xmGD3PVH1Dvhc8H1n/XUkHGGRiP0f3yZMQNavHfgaHqh5LtXDAN0I6?=
 =?us-ascii?Q?Q5fMVBlSnBjNjYbumB6x+L7kL/q8gEgz58ATvsZcqGVQgbsso01bTRqoaiN2?=
 =?us-ascii?Q?2fXRVI2iX9ud7pY0ttJZAKpwyxxJzC+u+e6hYtDS+XEx353qKsS4HtOzLOeS?=
 =?us-ascii?Q?REEGwyKFjyeTaPu3/O2VEGqSypi1RIitAZn298Z7s3nUVUF30MzDawzJfkX9?=
 =?us-ascii?Q?AG0nYgUG1J4XWyhP3FLXjlbuYXlPpEPNWLCQC7SbvmZQUvwVGNXfn3Gp1PyD?=
 =?us-ascii?Q?jfc1V6OjJODtmVJUx2I1gu118/ZYp9GC1QM5UUkSwia3gqfjzISKcCtey7vF?=
 =?us-ascii?Q?iNY3SzwLKIKqfAQqlVtDCT/Ykls41BirMymnPKQeONtVdNKQIbH+mXB0et19?=
 =?us-ascii?Q?a//n76GC5zywUa8nncYBs1KJmA41AA/S48tYYcbLWFadg1+GfKqOVHXoOKS0?=
 =?us-ascii?Q?EpXLQQr50GhJl34FlrCYAFeVmXz3+h9CTbK9eHRlEYK9ojaNrcteUgkqfCxt?=
 =?us-ascii?Q?v4TVuVZQhl6S5lNQHRxTEenxrcwL9x9Fuk9dYGFYAKyf/zAUnxi25G8WTbQV?=
 =?us-ascii?Q?gIps73fGroBmYZaYG6tqN8fxVx4BqAfSt3WA8znpuwjTZua3kuBSAMf7HtR6?=
 =?us-ascii?Q?yRCWet1IntLx1AjiYFUlYR5GE+ruZ3eJsZXzaQWsRWciXCjZLJPJ5mJ+BxC7?=
 =?us-ascii?Q?J3WMD0S0YBll/4cxTH/VhpPfXhmiei235oZ86L7KhvkF/0HO4SM838PnI4+o?=
 =?us-ascii?Q?yRADOa8kLi4ZeLeud7n3ZEdb0vc54SPcc+oAfqMOCK5Gp2LG2cCVB+VMwqAW?=
 =?us-ascii?Q?L2iRYWkkb/zhPTVdB8+Zk8LZM+K4HwLgW60E7bJNV/vaUhFFTxNjQJoarOnG?=
 =?us-ascii?Q?0xhz2idSHhLQ3dp1cuY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF9E162731D.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EHUtQAHe4jlrO2jkg6gpxi+YHdgtwN5JZ1rgJlvjhcv50KCnrwgcIqGau/wc?=
 =?us-ascii?Q?1FQOlPhi2GTW2xp/z/0zZbx0zdcMDbDqVIC6nLZuMf0iNaRAZg2XxArhH9up?=
 =?us-ascii?Q?Ann/QlfpV7dsQdo5vNoo7SvH3TU6BNLKQw0gwQMeJ/fbNUNMOnoy7UflCxe0?=
 =?us-ascii?Q?hG6/TqiO26+iJRB5EiAFqQZtaq/DF+oJZ/kfsBUGO45rGD8MOY/4lDPluh3R?=
 =?us-ascii?Q?01w9bc1AfnSPaI2hNmYFpRNsEB5nYmiLWvrr6Mjl8QSphX6kWbfWYOF8W2/u?=
 =?us-ascii?Q?13Heo/KSBnstaSNyx1m+TUC4pnPD7F4irkbcPEr8LF4Jt6KvLjs9IMJlcYkS?=
 =?us-ascii?Q?3FtImFU4Fgg90rTtJn4jEV9mOVcq04CNhNAkKAON7UX+7t22zPf9zb4xf4Sf?=
 =?us-ascii?Q?1Ih3uqVr6YcwmIGWmJ7fmf8HV9m5J6AkaeIFT8J9uBG500j6sQWVVftHnfHA?=
 =?us-ascii?Q?WSt8jPe3dL0PaAkMWLHmLX8TqeQFW0Vk4cIplT393UdZ+RrRrTmu6m28+kwQ?=
 =?us-ascii?Q?omruAXP67JPJysDpUHR9jhCdBgLcjdz9IuHLnN03f6MaHx0Adu3/1sm0y3CY?=
 =?us-ascii?Q?RqxePzUu827UwvTtlmtt6P/q/BxYif/pZ+ExzvCwoa1yVTUUebsFEjAel5Os?=
 =?us-ascii?Q?NARmZJKupRsH9zdTI96dKqVSyhIKpRXCc8JkUwGIml52vqhW9NoIo8bQOsaO?=
 =?us-ascii?Q?PeqtO7Vo0HslO8bQnmxuAX0DwoFW5GYgd5DY10gogYDn9yBgn5I4lTlKtj2C?=
 =?us-ascii?Q?vqN2bwBahC2kkYnIpE3P/Jdnqb/tMctWkm9luSJBIUn+uULyOsCi07qSDZj7?=
 =?us-ascii?Q?OmjhcTW9xtsYnP+gJjg1SIkChd8XX8Wd2c4vGZBlrLplp/Kb/La6G+ELT6SJ?=
 =?us-ascii?Q?taHSK869dJ7pYAQUx0AJfaHrzuAFKFupx7huYKbXLfy3WsGdZ/ciWQT+2z8/?=
 =?us-ascii?Q?CJG3DxD0ZgTWZsMKrA295q0KWIYSJIQ2U5+MigmmAe+iQX612uKneJmDjjE6?=
 =?us-ascii?Q?KewypEaJ49XZjJX4+ZcvmSg+tEDQWJv9m5oglr+g2oXAUE5SZE6BxRdkOv+b?=
 =?us-ascii?Q?aUxMKvWv47fox//+QEB/iPzxd6uWKlG/6RVamgnSw9ZWlfM9paDDi2KvfS8v?=
 =?us-ascii?Q?oDYAegs+RLuIcwSLQgiSFVk9QbVI6UxMz1EZ00t4GfNARwCzPzILfIXzXgzI?=
 =?us-ascii?Q?fb7+mZn9dHIC4G67mVZboLXVT6n0k38wnglVh9pK/dQNk0UttlxjFYa+ggAE?=
 =?us-ascii?Q?Q7nzoRZio2fkJNbDMTvrGbuw2btSF1+x8dt0if1yFpkwR2WFJHTuO0mrnqzL?=
 =?us-ascii?Q?7Te4I0wm4gE9/hcoMCXP3PaWXCjGMv8vjsF0yhTFqh0bGNjCq3+4yV4BTjXV?=
 =?us-ascii?Q?Cj9JfRSYZ1TvZHwhM9Ja0+jd1f4fo9H+Jn/k/MldD/xRg4pDO8L2ehZE/4uQ?=
 =?us-ascii?Q?oq+IHVyAmkEmkZvueVvy5xtiHOgoDL7IosjVpiywUuVZKpD4Ig+6tlH9H0Vf?=
 =?us-ascii?Q?8PR9mHNOTbMLjhLdcDM9wZN++DYAcNvDZrjysNXfLwpeYGyZ2+xfyFQKKsXJ?=
 =?us-ascii?Q?BHEvzzo8H5xf3QSMUfQ70u8vNHzeOvK+DSdPbkXLKtzT864BzJf+sUbiTnEP?=
 =?us-ascii?Q?iPszUpTlFuTGzgmMTULk/xCOzzS/rkCbaq48FG7/5PCOipkIQHSPW7ESqqST?=
 =?us-ascii?Q?bSPSwbjzJoDheNQreWtPrclFtkWsNAx7yrS/2Rd3s2cDr56CnW5PI6SoCbQZ?=
 =?us-ascii?Q?VxXHz3ApdQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7720dd0b-551e-46fc-a08e-08de64219414
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF9E162731D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 19:14:11.5604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2XFJ9PZjXkOWT3+EawSECEVOiuwRmGc0r0V4TP7oFF7DMy/Euisuy4+sHuCQNFFXFSUYxV/KuyFAojmiBqpDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7069
X-OriginatorOrg: intel.com

Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the nvdimm tree got a conflict in:
> 
>   drivers/nvdimm/nd_virtio.c
> 
> between commit:
> 
>   b381542686726 ("nvdimm: virtio_pmem: serialize flush requests")

Michael,

I assume you will drop the v1?

Ira

> 
> from the vhost tree and commit:
> 
>   c4ae8ec088db0 ("nvdimm: virtio_pmem: serialize flush requests")
> 
> from the nvdimm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> (note that the changes to add out_unlock are dropped)
> 
> diff --cc drivers/nvdimm/nd_virtio.c
> index 827a17fe7c710,af82385be7c6a..0000000000000
> --- a/drivers/nvdimm/nd_virtio.c
> +++ b/drivers/nvdimm/nd_virtio.c
> @@@ -44,8 -44,7 +44,8 @@@ static int virtio_pmem_flush(struct nd_
>   	unsigned long flags;
>   	int err, err1;
>   
>  +	might_sleep();
> - 	mutex_lock(&vpmem->flush_lock);
> + 	guard(mutex)(&vpmem->flush_lock);
>   
>   	/*
>   	 * Don't bother to submit the request to the device if the device is


