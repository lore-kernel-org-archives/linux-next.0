Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE8123C50A;
	Wed, 11 Mar 2026 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773252619; cv=fail; b=b6xVWd0LvWdf4pkRMp2bWU5MxInoFqJ2iWk0SkaWAFT+wyTPUF2b6Miihc2blqRZG0K55IkoJVRr1mYty0YpXDuHncZyKQkCozm9EF1jZGf/19J44vIulDRirgnqygUeaf32b36+PJjB6X5TIPwXY7YswbzEVWcwQqPxMecmRaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773252619; c=relaxed/simple;
	bh=qvzH2et/ghyOg49SdZwlwhrMT0+NlpbxYAPIDx1lPnQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ks5F/3AYc9G3cc8W0K7aHE+G9YFppHdN5SUsytRQVhsacCq5DxjxuwT26qnTczCZZNhpaADx4N6rJX/YtPSeNwHMLM3flzgbeCGa8Ynec+kTGQ0L5/orn7OvJJuFK3FWNl5Afk/ujYLnY3ObvCatcDGJ8qqRUDKeuYEv8uW1JCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2EM1/ZT; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2EM1/ZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773252618; x=1804788618;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qvzH2et/ghyOg49SdZwlwhrMT0+NlpbxYAPIDx1lPnQ=;
  b=N2EM1/ZTwrDNPX5z1snB8eSj8RASeCXdkXT6okijm/v5xhp54blRr8hE
   ggc7pQ/Y5bLFyyY9XBmZoFOVbV9I034ZwQiWmpHmaaLaZZdunR4DuMnCb
   a/B5aSH8C456NnP8jw2nzw/S+vKqoI/OJ2IYMXj66qQtoZTTSBjQMKFVd
   mGWAFkHHdTk9EcmzgEwhZ2Mm5pmvgTQ6Qbs0SCBMlWmnjbwCHL64GiXNG
   gkg8q5RBWrfpU0mb4+j/rHZ/B5+Febqw6KtjNJdRz//APX0TOTRrihiig
   CR/ugXHacQDcmnO2fLjd3URvFjVkWBKG/wGxgxlhficoaNJqp73JIJf2S
   A==;
X-CSE-ConnectionGUID: i0mo5XmOS8Skf9XpXN9Knw==
X-CSE-MsgGUID: QvrUdmmmQzqCXFu0eGM+nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99799855"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="99799855"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:10:17 -0700
X-CSE-ConnectionGUID: n6yyFMDOQD+ITQfXjbRT/g==
X-CSE-MsgGUID: BL/zPeJNTW2j63XYwsahNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="258461820"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:10:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:10:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 11:10:16 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:10:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaR5eToq44C1Vl345KoTZ1Ucevrp9qKhSdZ+GbGQNUNwXwAJH+pJbM1Oqmeq2kOp2ktd8KAPWyDlEYdyhhIb6aWYCHfct25NCgrs1VdkhfHRd+sVu7Iilm0ulvZBp957brG/fk4LmDt/HQQPg7GConoE4SFxiPP9V32eMrLYPdxaDx2NwdAmQC2cGyb3i6xdag2kYc10jdMii1HxzwxZGLDMJsFsITQX8EagBsi7ZSDLOq7Xeua4uRHQ7114OjltZPbb4qoWdVe8dFGAmzhKPyfvPczpqBvWpAocQ7/CAnD3hu9s7ityDz5EWUrsJ2q4JV1QpkTsuuQ6Yscze3K9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcAjICJifC9wn/IPPiLVnuFdDy0E3KXSgs50UycPFw4=;
 b=AHlSCS6KQ9tCFShTDqnw7xkpa8JZzIfQ+N8cOUqyDC9bcSXwBQB3EZ/mwxpvPzwh5HAY3N7OdTVGrvsKjr5W1nV+fI2ARi5mxBQInMryxkNzn97RFtnm+HK8U8U6ZBIk/P5ASbZYWFaVgZ6SofwDqN1LW7mAEcOuB5IZlZ9WsWrc5yraSQrT39kjX4KJuFb1EOhZs98YU9TvWXMW9L3SLvOJ2YFCcr2jJEcMtD4uTbtR3jkPKBdL7CQjoZyBgMOR5nd7wxk5NSbN5waxgJodVzA+vtF4zgT/+0hhop6Tlv2l1P0/6d+1NxYWi4On5axLcii8NDWXJEwdD82pWabxRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB6873.namprd11.prod.outlook.com (2603:10b6:806:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Wed, 11 Mar
 2026 18:10:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:10:07 +0000
Date: Wed, 11 Mar 2026 14:10:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <abGv-5kXSCtOTO8M@intel.com>
References: <abFpM1FHgzgARB88@sirena.org.uk>
 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
X-ClientProxiedBy: BY5PR17CA0067.namprd17.prod.outlook.com
 (2603:10b6:a03:167::44) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: dd885e7a-63a7-4154-3d70-08de7f996d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ci8h+vGfkn1CrRWW8Ll5MPZ/C410hbq3DJXY15xM0mIj5d2uENLknq2eyRXah9Olh47Fi4smzVgm8UJl393vFL4cB4WW0jpaLaXD+t1U6gj1LG4lCtyi+mm4pbxZCo07K2t+PuvV5PogK09kwWUognn7Cg9JzzTsFRtNDv0KKqLbY3amoBNlJBZx9oG+YBC9fakbkRYEe7oJ5ItZDADyjvuxmvo5JSLCpKqMzJ6gH6tkfRIx9X1YDjSaBARY0wjvrOeC0YrFFxwIkJJ/BhwrpOfIfn48yb7whb0LFpzek2Xc1xWhGsmo00Yg2Tk6Wnv7F8okXzGi/yGOCNrVsco5jOorEc1tBLlqiRY9vYc1uo0xCl4FMDNpzV52iUwSg4IdTPL2Q/mxWsJuKlz7KCTzCWxleXhmyLkDgxro9i8y0KmZF6z1UleEsqhwoVozCzQPwzowgspSjdE80QjB3gEYrO0eB7YY+wCUHwKo4/p1Ugj/uAi8e0IpX/2SNRIh8DWWzl/RcNVBOAOzoasgc3P/qYy/Uj3/6wQ6F6GSs61lyJTLdwwMy0iI/ZikmUQ1VFIJ/J+ot+E4Wiw9WnGx/fJfFnuT60nN+r6Nv2Krc/nvlR7havi6D+v+wcRTV4nL1a7uKB+H3OKEdOfstM4blFXvhC9rlXlA0aBx9QsE53NUb8sbZqqlnTC0BrE7+Q9g4QRMLWRxcF3HbsTPtKbUY4zbpnXvo97fcnOCeT+dFd5oOZU+CtWcbeITLvruMufUGSCQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+k60HUKHr5ueN2Uhu5UuLqr63carDUqiMgTLmk7/LMEK3O7MTwfsSBDBRN?=
 =?iso-8859-1?Q?AKcsPkGk00EjFSnU/cuDJLH/2/JfYc06bnfYmHYFRDf9++cZHN0SFsWQit?=
 =?iso-8859-1?Q?g74E5zHXMP5h3eWfZ67dED/RKecvbx3YqiL5nWls9V9WVZfHeyqDwBC25B?=
 =?iso-8859-1?Q?NCJaga//qlxuy78kFVq3Bs2cw395fSAjxcaxEtF/Gc24sExXQaL5spgomT?=
 =?iso-8859-1?Q?lL4mCnyYuwfKS81hVpyKIWoR+inZOHAbKkHYADegZBKbuAAdf89VT+BcyK?=
 =?iso-8859-1?Q?Pf9kqZ1x0FX17AjjR7jF7abpJWCHmK9QPQQFi2FoLHIYdYRqhBJRGdH8hD?=
 =?iso-8859-1?Q?/1GlP5gCBGnAQWOEcMSr4SsHESDru7C/fHq4GBEdHl5P4c6KNW5s8Unfl/?=
 =?iso-8859-1?Q?R8dnWPuK0zWz47l9jnYsKZXMGuoNu75Cpxkn316vhYVJZprLM1mlKfIHy8?=
 =?iso-8859-1?Q?wdW9bejuhAryZHcoVnMPuB+Pn3Et6QhuibjGxw7njk3k7a3RXNORVoTn7a?=
 =?iso-8859-1?Q?lEZQILcZky/zvF8jcxGpqiBbvSJhY/duScROfIebjsPcIHBoEgZpVUT6e/?=
 =?iso-8859-1?Q?FlbYi9rhxDMAjIX+0xcs+3IjMlBUOU1I/fSfvYRUmpjeLghs/JTxlfZKw/?=
 =?iso-8859-1?Q?SjycrYlW/j/RPYR9AzQ32ceUQ0Y+7f98lQ4M7UUIzCc3UKkp/iEn4PMa2k?=
 =?iso-8859-1?Q?7P5s+Elhs7bpSDPndiyNrswc5NwaiQ/Kn1fXRESF5QG5AtFl2aVWFAJpaU?=
 =?iso-8859-1?Q?JLmN+dXZvGmQlCCoq/V4KmNMo9yFuMn9oxxS1Z88dmCHnlP/NpOWDR4Tb5?=
 =?iso-8859-1?Q?a0iTQA9/ebSinK9XRhunKA/f4kteV6hvwqPCSkF+CGcAnz27mhqs1deFYW?=
 =?iso-8859-1?Q?Uw/6ZFNQwj2eFqVawwsSxsvL/R51zwNtHBZEOYB6wqBSH2SumojSQrGVvs?=
 =?iso-8859-1?Q?jmZ9TiI4ZYSkR0g5sVynW+gDfAEZaririvdhQq3/Zwl3gAxZfGlih7cJRN?=
 =?iso-8859-1?Q?sVMTGa9Pd97QaxnXiuom/qU7sojUIHtNP6CY2qfr/6AOMsJvCmupmHQ9NK?=
 =?iso-8859-1?Q?N8IScgkVpLBZnsLSrgqHfc8esJ1Ozzpva/JHwLnkws7Fet9nuHqp6VWT0d?=
 =?iso-8859-1?Q?0oOAGWkby1eWDxbl+1GvUT3Qc7lWO/70Zueyw415KtYP0IASnXeDHMHz31?=
 =?iso-8859-1?Q?Or1gULiiYyDzkPUr5top2fq5FGBqdcwRYc1KwzEpaFigHHztO3BAiLrMZs?=
 =?iso-8859-1?Q?RNVRX61edqio2Lyhna/0cwcIoDYwp0YvIQTnyCUPF9vMV3gWK9uvBtBO8F?=
 =?iso-8859-1?Q?obSgWRAGvjUncTl6kVZgCsy0qRbLWjZwIrrzqmCrUcKFzXcwtXb3HcHbmF?=
 =?iso-8859-1?Q?zRQz+7UAq58CHmCK8Tsx68lpmo8x2lV77l/v3+PiXg4wTVudiOoxDKea6U?=
 =?iso-8859-1?Q?F5vZSae6YkMiFH7jhji/HTclynNyQ4AoTk56XI+6l35KfJE2wPpqM3no9Q?=
 =?iso-8859-1?Q?SZLiL2vPg+9BodUI/ucZrU0UImTVY1eZ6cUGtt4JiJzBtNJPXuqsKbd3rq?=
 =?iso-8859-1?Q?NpGmttWc7N818NvgwZ6Rg170xHixuadL6Kw7Dbz2nL8VzpO5ybyYZEnWR7?=
 =?iso-8859-1?Q?6Yi7ypyaL37GxFoqZVQRx+Dg6UIXwGnDkH307D9LZVq00+r3xfHXqZlrHB?=
 =?iso-8859-1?Q?ZTCHNKNFcysAWsAwiOfcywQ3bHkQGU/d5cp+BUuKbNWlCUzB+RWcllpFpS?=
 =?iso-8859-1?Q?DD/yaU5rtW+1Xw3WtbToTaPKrb05KyZdhNY5aTUiLzIAIAjf2voh7LTxcp?=
 =?iso-8859-1?Q?8Uw6t7PU+Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: reW19dIgVUiMeO4830qeM+Ymtz0Kw6mL0FiFFD2a4YU2R8CpUTNPTw9E5mcRgH/Try2N3WZm6ZRELPGd9isCqs9xiSCmUvfD7dwI/3oeyJer5EQ/ILL+cmD8tQuaVmsIiwNbwMGWYXRy5Si+F5PkqzceUZ5Qymh1quZUvJrkKbL2bLM/ckP2tuG6R8Q0+UE3bvdnCDVhZBsji86DXiOaGa1MAQHJcBy5UxQ3Z0mHXmmb/L8QxvPuAGtj+VsREeF5C+RrZlb8eGPw+vxBl/yXdMU7wdDHhuIWBdFQOLv4EhTSqUwzjhDyEKiZHu7dT8m1UlveAexmn+dAAtOsF8+/wA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd885e7a-63a7-4154-3d70-08de7f996d06
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:10:07.1897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4BHq0mGulFuu5pIKNFFtvq7HsdtIB76+js2EJSltPXLEDR7HGvTWWDZbSL4yUUqFtDsH5m+1zhACYjsWaosug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6873
X-OriginatorOrg: intel.com

On Wed, Mar 11, 2026 at 01:16:22PM -0400, Souza, Jose wrote:
> Hi Rodrigo, can you help me here?
> 
> I think this issue was because
> https://lore.kernel.org/all/49dc20448a12f3e03f5f8347540d167a281b8987.1772042022.git.jani.nikula@intel.com/
> was merged in drm-intel-next.
> 
> If it was splitted into a i915 and a Xe KMD patches and merged each to
> its own tree I think we would have avoided the issue.
> But I have not looked at that whole series to understand why that
> decision was made.
> 
> I don't know how to fix it, maybe rebase drm-xe-next on top of drm-
> intel-next and then a new commit fixing 0e07b16371b6e.
> Not sure what is the best option, can you help us here?

This explains why the patch was not applying cleanly.
This is the reason why we should never ever edit the patch directly when merging.

If this is breaking the drm-tip build as well we should immediately revert the
patch. But I'm considering this anyway.

The alternative to that is:

Jani needs to do a drm-intel-next Pull request towards drm-next.
Then Sima and Dave picks that up.
Then Brost do a backmerge fixing the build issue in the merge commit.
Once we fix it we let Mark know so the branch gets re-enabled in linux-next.

Let's revert and re-attempt after drm-intel-next and drm-xe-next are back in sync?


> 
> Thank you
> 
> 
> On Wed, 2026-03-11 at 13:08 +0000, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the drm-xe tree, today's linux-next build
> > (KCONFIG_NAME)
> > failed like this:
> > 
> > /tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c: In function
> > 'xe_lrc_ctx_init':
> > /tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c:1554:43: error: implicit
> > declaration of function '_MASKED_BIT_ENABLE'; did you mean
> > 'REG_MASKED_FIELD_ENABLE'? [-Wimplicit-function-declaration]
> >  1554 |                 state_cache_perf_fix[2] =
> > _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
> >       |                                           ^~~~~~~~~~~~~~~~~~
> >       |                                          
> > REG_MASKED_FIELD_ENABLE
> > 
> > Caused by commit
> > 
> >   0e07b16371b6e (drm/xe: Allow per queue programming of
> > COMMON_SLICE_CHICKEN3 bit13)
> > 
> > I have used the tree from next-20260310 instead.
