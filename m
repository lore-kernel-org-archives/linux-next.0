Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095613148D2;
	Fri, 13 Mar 2026 00:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362791; cv=fail; b=AJKhlefsTmwxPpd6OTkzUcjxW/UWmjKOdaN55WU0tjwgokNxaOv59fATpPmp1dB0iWatmmrcRrHlzLU/DP9FNU4VuqGceyedpseequ68AiEnxY9yz7Ggt8zBADqqBex/DH5v3ZDqY2KcJQokm7gRkzsuQcJT+kkbmhKZBsTzG5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362791; c=relaxed/simple;
	bh=SzBtPRjCC1WOXhclZqFJD/Ay0ZTW9VHNYsADovBHMW0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YHDR7+4PIjVNrmEoqvbUg7yPZ3uHfSD01+i+qXWFU4wJDWk/JaV1skCRNHJJHnhmkZST4vqYi2LtuANtpFJvhgEc+p6ZO180lUjrm8xwr0fq8eX1fsLqLlfJCKTTkr0cOevVViDq8lNuQo0HWjqxHG0seGxtsBwPO6wjS8wUmmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4xZmfqy; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4xZmfqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773362787; x=1804898787;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SzBtPRjCC1WOXhclZqFJD/Ay0ZTW9VHNYsADovBHMW0=;
  b=G4xZmfqyWocqIXFK4KhCjUqgdwNPMr/uUwzQyCuyy6Bv4tzAarBdsvwX
   ZyezEkuwxEn1VUBXtQRn2olfI7sc4pC5tBZ8Rf7EaPo/PLRO4vog9HqGe
   y8BPQm65XrM+NjzUox7Cnc2kRP1bIJdy1cO8WrAhrDNwXBzruO3VCFfux
   NBcWwqvOxOxU4tCR36haKxdFxGiH9Z2owc2xUad3S3M9CcA3pEvqhcd6y
   JWvX/Fe0wCn1PuurAIAS4R+HMbIkdrfJnzqo5JYRVeTxWJxSW0qekEWg0
   jAPLMKozR4CKz7KZsp2g3XolspD0YlDZCyojv7B7Ht/Vmws88ea8tZ6cA
   w==;
X-CSE-ConnectionGUID: 6lVigoTrRXqjZ53obSa28Q==
X-CSE-MsgGUID: xGmVwIFOQ62+faK52aKU5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74550276"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74550276"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 17:46:26 -0700
X-CSE-ConnectionGUID: MHP/qqrIRnuxxMxFbkFHUw==
X-CSE-MsgGUID: YGvAOj11SoWRitzPuYjM9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="225695838"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 17:46:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 17:46:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 17:46:24 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 17:46:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SH1G/IFwbxflvnGJptalWZ2X/ApLHWI4d7+PoY8haL/+W3WIIbaaDFEmKZYU+Xn4Ow8HeWMz85ec/aQ0oGo+dIwz62o226OYVEsAqZu04FhfQE68oC0UFJvvp9dcnKsYbG+zq+IrjNxoIvRpX5zqKbW1pMJIREty6o3WoVfyr+ASDEFJ6y51FTkj+/HPIoswGmuqPs+7tejAaqt8xuv7ICCirLVa34jpUh2/d3+I/uWgY1tZ7QNxUkKPSUQhwRRkdAmkL0qjfVUr4tO3rvUu+sOxrggE+SnQEygZuNXWhDC3YkmkBy4sj8ofUTWH58oLaSn8NWprKEmr5QN73GJEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIxMgLfQtKSEm7BEbNNCZ4QOWB7QEUKzLzDPVmmdFhk=;
 b=bAeC6KlU6d4KEIdmCgPnc2YxEQpoYbtHm53buIrOD0ISqQl0zB2xao2YKIs5xn/qViXdisVsBntMZETXB3AAN0Tjp86JzJc7n/44U8KFdGm5Z4xMr/ZQaRT6ZHaNIqLuxkmWA0zbMK23iId6+MhPbn8c+ke4r6VPTQmqOj1aRZqYCe8DyiCMPeOuZe2aupGc67L3NO5FjsmJcG4UFuIyoRTwU818ICqew0X6jtW09wDyYQmYtT8RsKNixm1GJTeLCxD8DKl6tZ3CDH4YU+EN0xtX3Tn/T0ud1bECPPnNp+JqZHGy1V9+DI9z7oaOsB9zRp/WEBTHxQCqQeDKn7vtcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7025.namprd11.prod.outlook.com (2603:10b6:510:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 00:46:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 00:46:14 +0000
Date: Thu, 12 Mar 2026 20:46:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <abNeUQkKe5FV1TE9@intel.com>
References: <abFpM1FHgzgARB88@sirena.org.uk>
 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
 <abGv-5kXSCtOTO8M@intel.com>
 <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
 <abHMaBe4Wo_PH4uR@intel.com>
 <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 98151995-0eb0-4315-054c-08de8099edd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BIfDHoojx248QievJJPh+WAdqvlYj1n0RSrzy6t9Gl1OqGCA9qU6iKvFfs5iUgotF7p3I8xlGOuEMQCxXz302V1K8tRuyDk90OhrIphNE9RSSNnocXKy5PpiTOHG9iPjmVjT16H9mUm/k6z202x5q0vDSLwIEi01RJ5R+YWPxrky0V9NcUTN8faTsTKs3ZiKWzshguzJb1lbT8DNTTeAvOl69RNXomx/hoof+EQhH3EgF4IhWHwU3RRYPYgbA34gKp4ZPYx83HmCH3JSmyPA4P3Q7J8sIfScS9oNG2RVFP1PKlc5sL0cXv8JTRUGs8fgipi+fTS25eKCGO90SrNcpqvlj51ltGUeGmXactrueSGVhMP26X1/MEj1BhknY/v4K6ICG5NlamFd/g7/kZB1u9BxEiEiBqfinwCfnJqkU7miUgyX2CuqiDVaic10ABhc1n7V7JWwpUHrDwucAlZcb+MSEmFAML+jVNPxJ0Uzo1dVcWB81mbITqibHSAZLPScqk4DMcyKCvJUtpt1BD11tHOeszIvSpsxDamzVOUXUBgqshp9CTFdX838uBocGUQrY9uDz2v2iSbAgQGdVAm9HzP/1sv0B2rjdw6lSd6lLgaZo3j2gU47WO+wJ+Bq89aiRfiP76ql9VuaF5DS8dXBP3uGCNlpNlubEeB04BG0dV7/lkwh/SpLURzUwc8L28Mk+z39ncMDfsWdXQdqUGIKRZ2kuVVr7sa6byf2BR6b4RHHL6rHDiVZbGfeccJ5JhaN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OekXei0+8u5s+sX3HXhTqdNuT51i9bC1OQ30u+6DnlmLtT2cZHGaXyjFTr?=
 =?iso-8859-1?Q?ohIp5vomz+DozHmTjwy3Z7AGQFyloEVFJDTCdXp8QqRSCbcg9lG9gNMzTJ?=
 =?iso-8859-1?Q?tJ8CeN1z+7AHC0Bqn5eJoOjyFSOwFwVtxuTMTrEwxTY4XF25py+guPyYbM?=
 =?iso-8859-1?Q?SitVNvEesSW0Gs3tEKgsgpysTkaisg1hXfElUbvqCKW2FqdYCI9+OpvNGS?=
 =?iso-8859-1?Q?RJ7VQfSuDkkx6lMr8aOtpKXekuwFJcTNWTuiCPbQp0F0CIVT+dFLXXzjKZ?=
 =?iso-8859-1?Q?NyISbwFEX8iqwyJG7CTNgfz0C/cN9cc/t3oHH50hGKaOCqJYDf/weOXnxk?=
 =?iso-8859-1?Q?XrxGS65BugRpLilZDS3DJVKnHplg2lJ1cdXKPNRXKZB5CSskRjIcEJdnih?=
 =?iso-8859-1?Q?9oawohyO9wZngkOKX1R2O9JMgxWkIGO2flStJq0YLFT807nNTgXyfnCz7w?=
 =?iso-8859-1?Q?MgAQuVhEmiSqw2W9nYkqV85oHRuepI+bt5rVetVR3Mk8NPOBCaH4T2dwdI?=
 =?iso-8859-1?Q?koeq32dhdekZOjVbG6N0JywW3P1L+tdl7jjrhic/BSRb8S4OQV+GLZULT5?=
 =?iso-8859-1?Q?VfZFKcRYuiGpESX7JGTqwGTVJ6EtbLkq+kTuFETC3RFuXCxXd495Ua12hS?=
 =?iso-8859-1?Q?mhTA8TQ7hA14Mc2nCAkpO0RdL+8PizecNWiwMyqou3vO1d8eIDpa7T+9HZ?=
 =?iso-8859-1?Q?YmbvF9IkzMpKx5WaRpZA/CuNg2za3PtekQlnzB6nu5zpm+bttydJxHUmkQ?=
 =?iso-8859-1?Q?GaLSM/jStrfAm6JXaqiMsYHBDfEWu4c+ErlujRuX4n2toylbBHUh5rxLFi?=
 =?iso-8859-1?Q?VPMHtcvOFbwHgYS0hwl/bCrgURhVCkQQ0jXxZwE6Q9D1ayhmpSutRAetVJ?=
 =?iso-8859-1?Q?K0p2+yaJwe/FdtwlM9pep7kiN7LSie/nUZnY4mhzMoEXjwB3FElR3ALPaL?=
 =?iso-8859-1?Q?gCqZqMFGCv0vxhkM/H3I0DYjh74DWH8c11iHRyIl0B7AUFXpB3OZn8I4AS?=
 =?iso-8859-1?Q?8Tn7Br7HwRN64ISEDaG4oUMN+QcSaLq9LiDGRkhpwMGmID/ReceYWoQ+LP?=
 =?iso-8859-1?Q?9c5UhU8p3betcGyI4iuC3p/IG7wp3HkokFWnTii8egXz58AbXS/6SrJ1ua?=
 =?iso-8859-1?Q?f3zWpT8VaoGOagsFa4cmQFJm0r2Mnj0PtdQwzmn6gKF+h8ZJ00399sS+/G?=
 =?iso-8859-1?Q?+p85PvaOu2LbIlEbCv0Oeegqpuk4DX4em9EMgOiPagKH2O0e8QK14FokJG?=
 =?iso-8859-1?Q?D8fivWW+b7+ijprU6r3bPvzhR4CpX9U77FMXcl8cZlUAMBzgpbUYpna7uA?=
 =?iso-8859-1?Q?DoXHaskfhbH9XobcgIGSskD1nFKk6rolW5rA8RBzcT6GZjQaCLv6SuSEDt?=
 =?iso-8859-1?Q?77RtUBnebHziYO2RZ5bg7oZjCM4QXmVLS/MwhJ4ifE4i8b8cVJ383j//5T?=
 =?iso-8859-1?Q?/8WEwVL7fMSEFsCKeunvvOg0oBvxbYdSpgXX+MwpPj3urwyRh5vt2O9xGb?=
 =?iso-8859-1?Q?UgKZPEgf9K9WVrme47P8a5p3krQFMikR45cruGskfrqLpka3FLbmTfp5ot?=
 =?iso-8859-1?Q?IvVWOt8IKj2pF9aFAbA9g2lhGvpwn7G9G4t5TtNCc2qRzyPt9tpOVfXSyH?=
 =?iso-8859-1?Q?SvNosVsoj7frVjwlkXiajpYMa9fYBmudogoZwz/WII1moPppM0SUYHmlF1?=
 =?iso-8859-1?Q?7hPjQdMClmjwnq3VqDw53K+M3jd3nK8CdygeHk3trGzg1+bLwYOIXMfpMj?=
 =?iso-8859-1?Q?fuzagxAtUlHwxBI9FMGp/iB8clpWbUQtWyOK4lWP7ctvfLQv90ycD9+FeD?=
 =?iso-8859-1?Q?CPXeTIqmXw=3D=3D?=
X-Exchange-RoutingPolicyChecked: R1bS22nvEERtPqngIv/Vf76F+iUk3y9yqfRCnBJYd8cFdnH6idDp1Xyk6km1gvK+hJoZ3oVuCuAj6fukGUFcyMErwNk7hqCnUYVrH0SEU4B9NzyRHaZIlurP60hB2xyDbOiT1udnfI6sLaQWvCqR7PW58DtD1S4YlXOgWpYyX92dTHx+CZ6qbId38aFshd/04ulxn5xQLl/Pl4eggxzHpM6olT36gim4lOuErux3RTTanRLsoHrH5lSHgHAiF1vfUZkQVLyZJ9bXKM6slmInRwPB9GU4Xh4gH+wLHVozbVadoJkINc5fQvteF9lMM7T84yE0MiekjWqWKxQdyR92cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98151995-0eb0-4315-054c-08de8099edd9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 00:46:14.4895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZUQhGctENzD8MSNeNtWbxYxSsw1poWEl+eguMt8B6sXT8NUvRFu3wLYLB2N0NYfigBblssgZH5+DreQrDanAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7025
X-OriginatorOrg: intel.com

On Thu, Mar 12, 2026 at 09:47:26AM +0200, Lionel Landwerlin wrote:
> On 11/03/2026 22:11, Rodrigo Vivi wrote:
> > On Wed, Mar 11, 2026 at 02:16:22PM -0400, Souza, Jose wrote:
> > > On Wed, 2026-03-11 at 14:10 -0400, Rodrigo Vivi wrote:
> > > > On Wed, Mar 11, 2026 at 01:16:22PM -0400, Souza, Jose wrote:
> > > > > Hi Rodrigo, can you help me here?
> > > > > 
> > > > > I think this issue was because
> > > > > https://lore.kernel.org/all/49dc20448a12f3e03f5f8347540d167a281b8987.1772042022.git.jani.nikula@intel.com/
> > > > > was merged in drm-intel-next.
> > > > > 
> > > > > If it was splitted into a i915 and a Xe KMD patches and merged each
> > > > > to
> > > > > its own tree I think we would have avoided the issue.
> > > > > But I have not looked at that whole series to understand why that
> > > > > decision was made.
> > > > > 
> > > > > I don't know how to fix it, maybe rebase drm-xe-next on top of drm-
> > > > > intel-next and then a new commit fixing 0e07b16371b6e.
> > > > > Not sure what is the best option, can you help us here?
> > > > This explains why the patch was not applying cleanly.
> > > > This is the reason why we should never ever edit the patch directly
> > > > when merging.
> > > > 
> > > > If this is breaking the drm-tip build as well we should immediately
> > > > revert the
> > > > patch. But I'm considering this anyway.
> > > > 
> > > > The alternative to that is:
> > > > 
> > > > Jani needs to do a drm-intel-next Pull request towards drm-next.
> > > > Then Sima and Dave picks that up.
> > > > Then Brost do a backmerge fixing the build issue in the merge commit.
> > > > Once we fix it we let Mark know so the branch gets re-enabled in
> > > > linux-next.
> > > > 
> > > > Let's revert and re-attempt after drm-intel-next and drm-xe-next are
> > > > back in sync?
> > > drm-tip is not broken, Marteen fixed it in drm-rerere.
> > > 
> > > How long would it take to do this sync? If this is less than 30days I
> > > think we can revert and wait, if that is okay for Lionel that is
> > > working in the feature that depends on that patch.
> > We are in -rc3. Jani might be sending a PR in 2 weeks from now.
> > So, we might be in sync in 3 weeks. Worst case 30 days.
> > But it can be speed up with the help of the maintainers I mentioned.
> > 
> > Lionel, what do you think?
> 
> 
> Is there no process to deal with kind of merge issues quickly?
> 
> If someone comes along and changes the bitmask macros again, do we have to
> wait another month after that?

we should not had edited the patch while merging. That was the problem.
It should never had happen. It should never happen again!

> 
> 
> -Lionel
> 
> 
> > 
> > > > 
> > > > > Thank you
> > > > > 
> > > > > 
> > > > > On Wed, 2026-03-11 at 13:08 +0000, Mark Brown wrote:
> > > > > > Hi all,
> > > > > > 
> > > > > > After merging the drm-xe tree, today's linux-next build
> > > > > > (KCONFIG_NAME)
> > > > > > failed like this:
> > > > > > 
> > > > > > /tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c: In function
> > > > > > 'xe_lrc_ctx_init':
> > > > > > /tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c:1554:43: error:
> > > > > > implicit
> > > > > > declaration of function '_MASKED_BIT_ENABLE'; did you mean
> > > > > > 'REG_MASKED_FIELD_ENABLE'? [-Wimplicit-function-declaration]
> > > > > >   1554 |                 state_cache_perf_fix[2] =
> > > > > > _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
> > > > > >        |
> > > > > > ^~~~~~~~~~~~~~~~~~
> > > > > >        |
> > > > > > REG_MASKED_FIELD_ENABLE
> > > > > > 
> > > > > > Caused by commit
> > > > > > 
> > > > > >    0e07b16371b6e (drm/xe: Allow per queue programming of
> > > > > > COMMON_SLICE_CHICKEN3 bit13)
> > > > > > 
> > > > > > I have used the tree from next-20260310 instead.
> 
> 
