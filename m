Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDA8363C6F;
	Tue, 21 Apr 2026 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787479; cv=fail; b=aYi9tPSWjCeDNBk9/qE51lPoTleWvJ6yv1+WdCq1gz1+oOiVhSDMmy6fwsr1jNL6O1Cb60BkjUJu8uGqo6/4BoXzlmuS57h4ZVl2tnhAwO71dRFGlp32r0RFinBgm27vMwMA+B2VImUOCkvXInsU+Ok46aNuMox6xsBxbAn7Ds8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787479; c=relaxed/simple;
	bh=58hXDWcedO+RsvdoKPfy0PxWhpTDK2aqBVcoV3ahS2I=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rhtMFcgiYmcFDFNg3C3K1gsm16Wgektg509DxOL4YXMPE/rvXFoDmM0RPqGIiKyUBOaGd55wpC8imVG/dnUg1RxB/P1W+W5dBDhf9QmPAynf5lcPh9zFGoisdQohrrWhNlY5C45ksiuaUjURl2DDDlEVjTdSRlZt7oX7shP9zQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEgT0k2l; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEgT0k2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776787479; x=1808323479;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=58hXDWcedO+RsvdoKPfy0PxWhpTDK2aqBVcoV3ahS2I=;
  b=gEgT0k2lr45SXIIQMhuWLJ8TdJSmiT8zEcse3plH0JST/c9kLd8wXA1e
   B6zyFUVtlt16YW9hbPJ8aTQpFcyjyrFeLryHkGF6xQEu6bCX4wJOJLI9H
   jPad8Og1gsHQAxdrTqIKQ64gu99wWYVyIg7/2rDNtcuRKX00tW6f1cHzw
   7vHoHunIZIJG2CmfWyjp5UlH+B3K/nPzoYwVfKyXVj7i9NOsGnOP41UrV
   SBJerP6IC0TqsZC24AwCn2onmL+rbMN7RHeZbD2ony+FLYorEBZjwRiIc
   XHtM/aHUMNMyXa07U0+zrjJhBDbiNFgbsijqc4ybKz2cDsSEtocw8qF4s
   Q==;
X-CSE-ConnectionGUID: HniYwgHhTR+3BIJELQY29Q==
X-CSE-MsgGUID: WYLdHcFjQQKYyhRqjxgf1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77906347"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77906347"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:04:38 -0700
X-CSE-ConnectionGUID: SyvkzkXYRH+cheFGn3Nk6g==
X-CSE-MsgGUID: MsDLRlP+QFOZfro6HmIu5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237083741"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:04:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 09:04:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 09:04:37 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 09:04:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zwd6MCCMGxhybx0/XA8yzDjogeOV1HUNUPMQFT8OY9cftlU3ZJIj9Fstd0r4hq1ZemJEzDdQKQzn/hMrgPGiqEy1stgaW4oyE7APUB+Mwpm+wJKr8ITcx1ASL2P1ol5zYNXMM2R7Z8q17+VF/z8yKHm0TrRn4Hz4PIKf00zPyQxkGX31j+JTIMDI5aD3ap4aU1TJpG+cutFg++3UMU1WYDE3mILeYF3IuRt6BPSmo6ldKaTNebvCE5Iny9TFHTt6X5sRrZMkdBWa6K2KG58eHrao0YIz8F9Ssh+DCbqTLoCY4g7kvIY6uhOWHYewbIB6KN2rI36pPVbHWo7jqCWwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HoZhPPcVN3yQ61HBHIUDwZTt6f7rRawRtqLy7RXEY8=;
 b=H4CsOZsq6lZtYAbSMvAwDVL6QZDLC2xnfi1c2d1ePMcMIWB6P7ixz+TDY16XK/kcqr9CbueNLSHWq7P3MuGONQ8hZmOAfpl1yEmze2QXq/i/cSXzYWxRfqO/fUJWT4466f2sA6hhhK1QRhp5fBW4OmNQ6Z/5nFO1yJmCRbEAx9ZYpVGGbGwQmLSPQ2LlSjsws5U5dkRu8TKedS9LDO45zEswJ/bqa5zigG8ERzsLC6gwIxo134+4rhW9oT0GvDhVetYFGFE92vjo4qhTKkgT3FinQW03hh0MNTXqyUSKPmoBybsjY6ge1/TAxsZAGnLJn16Bf723C5OgE+0vc5UcYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by DS4PPF691668CDD.namprd11.prod.outlook.com (2603:10b6:f:fc02::2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Tue, 21 Apr
 2026 16:04:34 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 16:04:34 +0000
Date: Wed, 22 Apr 2026 00:04:25 +0800
From: Philip Li <philip.li@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, Mark Brown
	<broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Ryan Roberts
	<ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, "Linux Kernel Mailing
 List" <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <aeegCfKoEPkhC8OL@rli9-mobl>
References: <c64e4cf2-ccef-4041-9511-a2dcddbc73c8@kernel.org>
 <955d11fa-a9a1-4956-8d2f-269ccc3f2911@sirena.org.uk>
 <2efaf5cb-abe1-4eaf-b269-bf303b7b8372@sirena.org.uk>
 <a3b85bc7-d9b1-444b-8474-91d0e7f2a41d@kernel.org>
 <20260421071701.641a4cd1f8984c6acb53a790@linux-foundation.org>
 <26b33b43-da9a-4587-b331-801c19b07676@kernel.org>
 <20260421072819.b1ab891aef59c45226f25247@linux-foundation.org>
 <32f90970-51bd-41c6-b80f-71a8c91ec97d@kernel.org>
 <20260421074819.89c55503b44afcba46df5d31@linux-foundation.org>
 <14d0f4e4-45cc-4172-8a43-a0a14bacfedf@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <14d0f4e4-45cc-4172-8a43-a0a14bacfedf@kernel.org>
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|DS4PPF691668CDD:EE_
X-MS-Office365-Filtering-Correlation-Id: 482b7baf-a3c3-4c5d-db69-08de9fbfadec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: nk4pmgKpakiCsi5nS+yB0qS89AfxUibqy7DrDhaV8KXMHBsOiNG299jOKevzwjzBEK+A2VJ2xSzLqO3gRQAyPG6/FHur89bAuPmSlu9dZb1SphrMq/xI6pXQEcUu/08RAQOFiP4/3UJ+R7pvEEDisJxwacvuoVnRYP9O0XOjjTA3HFoY9dx/U+M9LVwiRO1wR5cLSD3kIWDyrOtAXNYm8aiKB/ulQi03aCuNkESD9ECQt7reQNB+HO1w2tTfRTAL9eAZwOHbQW1qzF3SvZF2YVGEBGH+7oOscteMmEtG38gZJl5Sb6bJepVOzziZzff+V2vdvfkuOm+e/AqPNcb1eQZSBaTI26Y7MoI8uKggA+bMsgPDnqRFT04oL6HJSngk3xX1gE00Qr3p5IwhccKXzizMqQTiU39FyXBld+UDRhTqUbdlbD9DV1kY9ONpIdwuPZ/2SMxuBn3s5R3ODc1SHYGaROnMeX2TDV7fWD+3Zfjt+1x8yfipE83vRANmXxaOl7TwcJUOZVJERofwZEft+5tTSf4iQDRre5xvn6h5/WkCEXKbHqirWcveR0UsL8Gpobak0Lks0VGO5xF93uO4xFpJ9pRsvfTHtmywqy7ErfOVuKGhvtae2uwB0WvBsYzaI+heUtqxwgxWIPI2emJRXkGiGQoXISZA7SBVDxOSlEswrAT8d+1mcMpoRxUlxXAeaIxoOh9VZ/aAY0HfZ0Gz4aFzk45smT5xeAw9v8rJCmNsut5V0kyumb5IFwi5P9/J
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/cAcMtEWkcDyE21V934khKpEryvE56pjr2TliSS4ooPmGcTtJvU7Rz5Pajxd?=
 =?us-ascii?Q?4R/9wzxEuNH+aWWWrF5CK0NHAMAomQ0yXrKQB4G7uKVbbrUPgya6xmVNUNF5?=
 =?us-ascii?Q?dn1GZnq18oi+p0V1MPR4Ytdbnbdvw5FxV6jhjkremEkCTnmZp9cAXmoTigtp?=
 =?us-ascii?Q?O3cIF4XeLpKzBmXT0CDdkRdvvtAXCyUQGKM4YwNqffJoGR3v2YdzBtE7ZnXd?=
 =?us-ascii?Q?c08M1wUAxnF7eMbqyy5CuMbquOGZ2uBWXLvY/zv9JcEMDb9umkSysgvp5k3C?=
 =?us-ascii?Q?3ThR6PkVnAVv9g471bYnrp2LwOr6oiZWg4Q9ku/ZFVABloOGL+XQoZ3up4Ud?=
 =?us-ascii?Q?zimk234pBpC44sodNxElfQQWK1X4qSS+BnLDdVwNpCG+PQ+0C9PKhoLRXebw?=
 =?us-ascii?Q?Fo9gaXrWu5IWx8TbRjDRLAkOVA5B5YoazjkSU1oe+kAUut/hTwlFIphUJ/Z7?=
 =?us-ascii?Q?jyZbe4BIwNCTDsY6WLTR9osc8TMrdWWE6ldge6dkrVbNKav0GnqYwovTchad?=
 =?us-ascii?Q?OgtehhGtkAL7g/gSW3Gf3ab9GQWhh2/ZziZmOE9ssJxy5l6tXVYmG2MaVzxM?=
 =?us-ascii?Q?e841LP8PhdYVOpXjq0tkwKR6GLq+BG4I8JbYA6O73zJAzyrXlvg+i09tet+a?=
 =?us-ascii?Q?mHNcVvA373FzPQ/Cb+PugsazwSmrBn65LPChWDge43mp9cGiDSyz7IEcZQ90?=
 =?us-ascii?Q?QJZtn/eoDhJ8Rk7/vWDCNYJRNTisIuwxEzdTY2jSKg0fOXNJfp50bAwmaaR1?=
 =?us-ascii?Q?B3D4JyakllarWwJMbspYSnsgN9xpO6TNqaD1D0fa7uDxgz+ey4p/Np59cYNB?=
 =?us-ascii?Q?nxIGnyoXBxoE43iwP1b9wbPYGQZS+nw1BfmM3Q/w8ZNes2yosNIgH55gdauh?=
 =?us-ascii?Q?zxOwfBATikufJtxODJhIm5tx1XzUNaecYn60hE8ev/si5jEBWsv6+wBiuzZq?=
 =?us-ascii?Q?cGJGPSzVTpMSCHIO43uafIthEhbpFgNMeVE0d481uD/TzMJFd17RRUdkRKhP?=
 =?us-ascii?Q?8FAJZhRZGY937G8V9CpM5SbNJXNrbzlG6G7Jr4ojLf2p3J4D9gITVvqCibww?=
 =?us-ascii?Q?4aMc8N3Y0uuwRL6Ll54AYZGClth8BFdRVGRe0O34DlUnb78x0Vq9WiWYkdeX?=
 =?us-ascii?Q?ev9fEFuh8oa3kt3aR82W7pQCNzX8Y1navgH21g9SdckmPEb20KMZUuVdT32S?=
 =?us-ascii?Q?dwAPBpjh2zcKHKaOxoAo2u+M+vZSe6yEEcWxwKD3iBxMq5cMcEEqF6AJvmAN?=
 =?us-ascii?Q?BZVzcuwqan0C2E5+lHTcByaZz7m/mTLc+pZ0zwv4HbEcmK2bhLh/v8DNbBtu?=
 =?us-ascii?Q?sWpFy9xolxE+oZ2W9CH32bSgTKWMWmMKsTCUoRrmHrC5aGIux3CIhkMJxl7L?=
 =?us-ascii?Q?n8c6E5KV1oyzaerZ6IQRZSA9Qpy0SDPRDHOr1QUzt8zOtAQYdZVXVbO04Pp3?=
 =?us-ascii?Q?rKMBp/8GKrXEVBn7U3dx7Dy25nX0ayNA0EtQ2XQMinCvuXG/hOyd9SOBat+7?=
 =?us-ascii?Q?0l6Tn83IOunA0UK6idSfEXGqBLuw5U4qNduqV7IsAYu8/lUmzch7m3eb/h8u?=
 =?us-ascii?Q?HG5Mmvv2pIG3GGDKd8rTlqfBuhlCX9NfYSHKk1+b6L21uVGn4hWhUWkkvjrb?=
 =?us-ascii?Q?vXBdLTRMnwMOvSCeL8xiUrjWE9cfJTsKHO3NMqboEj+O9kEw8jJkE9kGu7Yq?=
 =?us-ascii?Q?gOR5LPykPkZqqSSLckWafPXdl+XHvTZ8qQ433fhl1ONrILjRfAhM3BA4GIWH?=
 =?us-ascii?Q?veM9L/ns1g=3D=3D?=
X-Exchange-RoutingPolicyChecked: ofBtIYLcOtaDEX/mUY353j/BuEzZD/1NsultV6t1T0AwvxGju8Kwl9fVYcf+v//iTUQiDbqE5A4uR9a3i8GbNzs7BLdcZyIhazXvgAnttEgVOa151zb0z3EfXQiZPLgp2Az7RdezEiblHDvYcDZwK0V6K2HIAmUEG1lbq+i66kB2Tj5ku7CCe14BzsPGLtULXOkJMmIzloA0+ODfJ4Kgxf+9T7DTYCbd77Yy4fXeBMJjHr8bYgHbFw6FpbQ4y7BLEn/W2w/FKhJC4/VDsIm4h6YUu3uTJOj1MNjL3CVBIXnGUJdpljKvnx4wW8uiAGz/IQlchhAzd5d+5WaHgusenw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 482b7baf-a3c3-4c5d-db69-08de9fbfadec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 16:04:34.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91E0Grd8a18PKHgrN7DWYv/FsZpT79KUASbOV06t6QcZmmkxpoXUx4BtMQjMmcYDkxcZNXbIPP19GS5Mv/378Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF691668CDD
X-OriginatorOrg: intel.com

On Tue, Apr 21, 2026 at 05:04:55PM +0200, David Hildenbrand (Arm) wrote:
> > 
> >>> - coverage is mm-new is poor - for example, this error probably
> >>>   wouldn't have been found until Mark grabbed the patch via mm-hotfixes.
> >>
> >> I get daily build reports against mm-new, for example, mail from this night
> > 
> > Aren't you lucky ;).  Is it possible to add a cc:mm-commits to that script?
> > 
> 
> Hehe, if it finds something that is broken, it sends mails to the list
> like [1]
> 
> I only get the build summaries. While we were testing the 0day
> integration of mm-new, we tried to keep the noise for other to a minimum.
> 
> @Phil, could we also Cc mm-commits@vger.kernel.org and Andrew on the
> build summaries for mm-new, like the one from yesterday:

Got it, I will configure the bot to add cc for mm-commits@vger.kernel.org and
Andrew.

> 
> "[akpm-mm:mm-new] BUILD SUCCESS f4279f87cd6c82ebdaccdc56f38e7b80ca7fcc03"
> 
> Thanks!
> 
> [1] https://lore.kernel.org/all/202604171841.MGvqbmu8-lkp@intel.com/
> 
> -- 
> Cheers,
> 
> David
