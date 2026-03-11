Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9932E719C;
	Wed, 11 Mar 2026 20:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773259890; cv=fail; b=R1AcXCkkqOC4EjlTHNtOiKxE36CCcJ+Zh+ieB7zrDFIogLe9yWCN0eOKvIq3Ew0sxJ6HoppZhdT46YVRvJq6D9CTOJylPf++qMu4zZvvCwoXSk0rCNOSCotwbHPuUMb7I/tZTHAMoiGepff3S7la4+P+If/bfWfQDUP98s1EP1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773259890; c=relaxed/simple;
	bh=Q57Pqre55pNixrFwgCboPFDNfNRzyzRld+4mPVahtAM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IlfMwtBiZ+ahFU4FaTYbTzveAkhf0/NLet3/gC7uq10oDMpe2nGHSSvW3u7h+ZIVIz/1DU1cEH+TPm+gnB/HI/T5D/OegtGq6pOH7CmPNNc4mQfxp7DvYclgy5NicVifOFpcCaUwByV17A4XTqbQpE/oJB+hy7YJlwAQYL6OuvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OO59iT6j; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OO59iT6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773259888; x=1804795888;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Q57Pqre55pNixrFwgCboPFDNfNRzyzRld+4mPVahtAM=;
  b=OO59iT6jhgAJnw3tMbaULwivDdXrXWn44RXDigv15aBCAdXbUM5HK1c7
   gTkg4LlMx3t8VnXgKTyHdnTVWWiSWKv7M17jcuyCGWiENq4Of0RyjUnKI
   bbrd/SyAZPpmzKSwydBqIp398DCPOldz6QWTC5VKezqR6RNolsrREL2/1
   dT3Wh1PgKteJJ9VlUYR0KBtuJKhfnzq5bno5jRXt/QurE9UWZMlxhXZJd
   45uH97QySP75+tFxx6hLRIChZD4e4pr2MqdnpxQd80V4tm2OCW2QFvajJ
   5zpnR2QqEiC+96a/4PWkDcBr2rarqlbyakREZkVqIgsqc5qzE4vMOMWto
   Q==;
X-CSE-ConnectionGUID: dTvB+9peScax30LEAmmXNA==
X-CSE-MsgGUID: df3BPa5TSZi5Ijxbb9SuHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="73536100"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="73536100"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 13:11:27 -0700
X-CSE-ConnectionGUID: W1poGOTrS1KrJw7gDPOzWA==
X-CSE-MsgGUID: GrseQ3LlSS2zQ90TTXQ2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="258485225"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 13:11:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 13:11:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 13:11:26 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 13:11:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXGVEFAK4FJYM4CU43cd1ie0t9+GHc2CefxjszYZUOAccVdRrDIAmbC/+bqciyoy6MkmmULJ6nTcxlXg3T+SxgoM2hjZGwauIvlg9d5RW/23wpiZGX7P1BoYuvWLy1PH/ssf6AfCgh1iSr08nIaZQAC0IYb/49xsUHmwSEEx6EKDAJ2cT6dsB1o2oycCGtFijtdvWonRrzGREeEJjBMplPYLtT8LKIbV+nF9/c6NoEEJFQSWW9KKQN1HjEAjUeMHsPwNpc/kuWrhF+PUIp5ZgVXcA/lm2QXmZ0av9pm+ugg3GIbPWlnlel8DyIRnkGlR0J1DNuZ1hq3JMDF9ti6ZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NV/TadyhyiJLf7nm3MVHFKAx1E1rS7LWnLvInTvE8U=;
 b=MHzUGKfP92CAo+9vQYWeOX5+O++YyyT4uMZ8XeLdNMPshW8j0sM4Fm2J+/v/FuEwUtNhK0ID3oJUY2dvgwPpleEX8Y5uMnlmA5+uw4DMqYqNMiMhdoyeh1JagY+bmowOy5IHBXrdm173GF+wXmyVxTLIwcxWivrdfryE4Sx4tahc3wvIeNx5RjZ2QF7oYoO9J9sNVdncCx8gutQ+ceBKFJt/PGwIVZ/MJC/moO4ZKgrWwChHAAlNTrIr6wjswKk1y9Ut7OGwnstqZBTNb3xmXC/IDtz36qydt+fbBcWhD6Pa+2UVi0zCSS01hevbX3oayJ5FCWvBY76UKmPp58omQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6549.namprd11.prod.outlook.com (2603:10b6:8:8e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Wed, 11 Mar 2026 20:11:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 20:11:23 +0000
Date: Wed, 11 Mar 2026 16:11:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>,
	"Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <abHMaBe4Wo_PH4uR@intel.com>
References: <abFpM1FHgzgARB88@sirena.org.uk>
 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
 <abGv-5kXSCtOTO8M@intel.com>
 <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:303:8d::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: cb468a2c-a176-4bfe-f879-08de7faa5dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: rU6qMFI6VpE3szw35ce5dXMlqmITSWQ/bvMrl81lr2fGDEKtKHtzr+uQbBoV/Dy/3uANsUWeXlfTEqGNyCqJA9GlAcJUXVrYIol3mF+IaZ6VoZu5Rm3uqpEnNw6nRtbqQgyBBSUeRe2WbRM4uO5M4kxBWtRrR5O20gIcayNLMM2GmAeg9CijKnBeK/+HgD8TDM52Ii8zJ8OaifEloG4YveoNl+OV2qNh9g3LTVyxMM+znDMTzi6v3vcqQRWIrAawwDmAOgBXuLmmktbNwLudwLltgcmgB6KIEdASVeIbhCRTFMpFmGLVgG2hs0Mq8WuGPEL2kadB7X9NwKHD7l/Qs1NoUks28Cc2gqIuUlAz8tNXpSk7b1bnDBDMfRBXjaXWj/11hp8PnpFdZAXK5ZTO59D1uyf6yF84peE7ycem38UaV/WyM6XXUGkM7UDjV36q06GE6ySDS0ohZmQ72jEDQGGI3m/PLibWxuE1Sj2Hei2dIij1BIH+lqmoq1nrXQNP5lQmDNsQ39Ta7wpqIJNZleIYefoPLDLdsh7Phd1UHgHj6xu4yGI3KfEIxNS7yZUzMoiABNX28xYQRMlCwiWE2twV/LK2ZewV/YAYkEraJrS0JoL4vwySaIlw5MFnB3G4D8cnX+oxFuYx5Huu56+6PKFXOfpidcraDJKilsBdqm+AqKXEqfymZfxmJaihUeReLQYmk8Ow0uWKCzMYq1puoz/mKii6jyxfM3KfEok1uAeIrBVEsnJZAZFXIDJBK6PF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ms69W3bXnMxlfIYrEJbnTSYBmAkEBTyc4jINnGNXr8f5ohRrEMGNeCUaDY?=
 =?iso-8859-1?Q?3UYooTojfLNgXmMzEZM7YYOMWRCphBptCqCrRQr/w/oDpi4D8m9w1ZqjaW?=
 =?iso-8859-1?Q?FqbZwW6dAf6VXFdIItmR4b4cZilCm5eV4hOya3gRszmYXoWXDgbYQGBYwp?=
 =?iso-8859-1?Q?dedW/PmjPKQd1ImVDdnOD2CIPqRUuYfGGvKp1C3VE+crkwpqKN4UuY44Eh?=
 =?iso-8859-1?Q?SDUHurQo4SuKFDl4jj5RVJlmxG+cBXFBhbgGOr2epbkQPxT/MxIdUTGn2U?=
 =?iso-8859-1?Q?t8ZTbYzvCtXDhWZ6mFBejaEu5M4tu0P+SIPAAhqr6nm9jXNGzIUjXsMYDg?=
 =?iso-8859-1?Q?VkFsKV0cz5YV8cAMhko3I9xHv+qGpcP7kiv/N3gMACpYbmlGU6Tn+9S/aZ?=
 =?iso-8859-1?Q?X0lE5GP2deSfmhadXH2hnF7+Mw7IEOmwZwpKGRx6ppiG8cCvZDqsHwg9ZZ?=
 =?iso-8859-1?Q?2RtGBSibsxOvPB+6d3f513IMOZ3D2e6sTKq1NkZ5M2zBtRVQ3+QpKIHePO?=
 =?iso-8859-1?Q?uUqhbNtX8S8VQAO9UVHfKBbzV20i61L8NRmJlSwcB4cO1f7n9VLUT9Uo8S?=
 =?iso-8859-1?Q?79Gi6zXyGqxb+ovRpgOrRywWoWQWWkX+VjIXzB+ZE7ZpiS4CDBZxHCh8Fd?=
 =?iso-8859-1?Q?2eRXEv4oOz9Qc7ZW1CP4cUagrpNgtHU7TJs02ULD9M9voaaRyquRqPqTPX?=
 =?iso-8859-1?Q?LSmaBJGYojE29moNm/YnJnMyjjsAgWgOUYiLOxhHHTTDmUF3Ta6x68L02O?=
 =?iso-8859-1?Q?t5rerR++NZ3Vv0O+2+NZfTHKNDWIexKMFlbldllOe7PgsmPz3in4TCcQeP?=
 =?iso-8859-1?Q?3uzGM7AbBuhSpTMUQG715xM4E1/doP7bLOVDMp/doGEmieNEoMjYJj7L1Q?=
 =?iso-8859-1?Q?w8jIT9uKi6uWtpZdi12HxJsP9Y7B9VhlhmkFLVw9+tNOTocGs4i65Q3x0o?=
 =?iso-8859-1?Q?oA8zI/JFUxKzTvJJLWw6SWYoQWNZ0VrlSIpHsq8KnVfebsK/ECly2ZbHbu?=
 =?iso-8859-1?Q?ZKJI3PSoeiEM4bFKVIpiZiynTkLj2kNZEGfdLbUA+NXzotJerMBr3UkSJE?=
 =?iso-8859-1?Q?pktyIAraWUAm2s9v3n6XjO4CNinED9TKRywPvYNEQXKA83YlGGOPmkhr7v?=
 =?iso-8859-1?Q?C3vS4503mxyyQPSVrVv5vw7nDNeg9bbmHJsuN5/oT5i32GZVFpOGC8DHcI?=
 =?iso-8859-1?Q?gW/UW8jx+AYQyCFUKbVKhpyxtot9S5PNqsVEagQvvVB9lIBIc27SgvAVwt?=
 =?iso-8859-1?Q?dTdizErkYHoQLMdhzEBB/fPqhqJzSLRKC0lTt4rNDTHc9UYbFTePXDRahT?=
 =?iso-8859-1?Q?ZSt9+k1ad31BtLnNxkkxciYgHk570kIADGRYXetIcO1OzWK/zItZa7bxoF?=
 =?iso-8859-1?Q?dOz3tyQ5YCanH3tEnyUcwD/BXj6QxucpgGwhxLVdpv3xXbeDlarZYJ+GRg?=
 =?iso-8859-1?Q?Mrsa4BzxVrORn9OvIc7IcmbUnvqhnH2CW9xtE+PGCw4F4JuafH4wOznt5i?=
 =?iso-8859-1?Q?UfEFns4GNlQwnzavoyb4KfJg02VgBr9u0XXE5v9fEAQ0FMqu8jWzdNIn97?=
 =?iso-8859-1?Q?V4z1n5KYXiJHZWIlmriHzSNBli8ThycHJ8uPvOpBIM+n7DAMMy27Dag5iG?=
 =?iso-8859-1?Q?JYsmp0GEknsYL5sos1LGejHcJPL+hCRUrPEThJ4Hl+glbCRjflipKn8C6Z?=
 =?iso-8859-1?Q?bV4Y3s8eZ6X/4Au8rtdvFkAB55BUew/BsioXlw0bbH6ZdYHC+qF0g6vqgx?=
 =?iso-8859-1?Q?sB2Dbfp1W9Hm7QgDUYTpIZARP+F592T1Ztdz+r/Mms2QVinlmP3TBxO/lB?=
 =?iso-8859-1?Q?UFBLv2x85Qfd+xPSkTYcvAVhyncSnfI=3D?=
X-Exchange-RoutingPolicyChecked: eKHOO7WxVTkXJqY2KgKplmQ0RHuA0dtghzEKFY+5sKYSUZ/SBKriNBRZ2WW5k0sdhd2o+V0wFbi+FAHIfZqnF/5kTBGJRMRxl93G6dylvVHxUiz/ggAwvIURCI7WQkMCvbbWQEqrv232Eju4nmBx+ednJ36XoE9hPmYVODRLOBMOi21sNYRt0VtYtTCHeOvEdqYUcnWKOneeh8PjLH/Ya73wF3Lhsl1+d6HLlCxDSfvoYzm+ETM2m4PEuu71ig4XD4tQDDgYuui6A8tgPHiBd4+CnBQRu1ykC+fJRxKk+zELxT/AJYqyGmSazjuHRbPkr/SM3rydfThuZDAYhYZa+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb468a2c-a176-4bfe-f879-08de7faa5dc6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 20:11:22.9641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3+YUJcNcKWoZRj+cQY7eGb9m6vkL2xfBz44ERnZrd/2/wzzezX4uQCAMc49Yj16sdvAzS/NWRlq5oE4oCThxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6549
X-OriginatorOrg: intel.com

On Wed, Mar 11, 2026 at 02:16:22PM -0400, Souza, Jose wrote:
> On Wed, 2026-03-11 at 14:10 -0400, Rodrigo Vivi wrote:
> > On Wed, Mar 11, 2026 at 01:16:22PM -0400, Souza, Jose wrote:
> > > Hi Rodrigo, can you help me here?
> > > 
> > > I think this issue was because
> > > https://lore.kernel.org/all/49dc20448a12f3e03f5f8347540d167a281b8987.1772042022.git.jani.nikula@intel.com/
> > > was merged in drm-intel-next.
> > > 
> > > If it was splitted into a i915 and a Xe KMD patches and merged each
> > > to
> > > its own tree I think we would have avoided the issue.
> > > But I have not looked at that whole series to understand why that
> > > decision was made.
> > > 
> > > I don't know how to fix it, maybe rebase drm-xe-next on top of drm-
> > > intel-next and then a new commit fixing 0e07b16371b6e.
> > > Not sure what is the best option, can you help us here?
> > 
> > This explains why the patch was not applying cleanly.
> > This is the reason why we should never ever edit the patch directly
> > when merging.
> > 
> > If this is breaking the drm-tip build as well we should immediately
> > revert the
> > patch. But I'm considering this anyway.
> > 
> > The alternative to that is:
> > 
> > Jani needs to do a drm-intel-next Pull request towards drm-next.
> > Then Sima and Dave picks that up.
> > Then Brost do a backmerge fixing the build issue in the merge commit.
> > Once we fix it we let Mark know so the branch gets re-enabled in
> > linux-next.
> > 
> > Let's revert and re-attempt after drm-intel-next and drm-xe-next are
> > back in sync?
> 
> drm-tip is not broken, Marteen fixed it in drm-rerere.
> 
> How long would it take to do this sync? If this is less than 30days I
> think we can revert and wait, if that is okay for Lionel that is
> working in the feature that depends on that patch.

We are in -rc3. Jani might be sending a PR in 2 weeks from now.
So, we might be in sync in 3 weeks. Worst case 30 days.
But it can be speed up with the help of the maintainers I mentioned.

Lionel, what do you think?

> 
> > 
> > 
> > > 
> > > Thank you
> > > 
> > > 
> > > On Wed, 2026-03-11 at 13:08 +0000, Mark Brown wrote:
> > > > Hi all,
> > > > 
> > > > After merging the drm-xe tree, today's linux-next build
> > > > (KCONFIG_NAME)
> > > > failed like this:
> > > > 
> > > > /tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c: In function
> > > > 'xe_lrc_ctx_init':
> > > > /tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c:1554:43: error:
> > > > implicit
> > > > declaration of function '_MASKED_BIT_ENABLE'; did you mean
> > > > 'REG_MASKED_FIELD_ENABLE'? [-Wimplicit-function-declaration]
> > > >  1554 |                 state_cache_perf_fix[2] =
> > > > _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
> > > >       |                                          
> > > > ^~~~~~~~~~~~~~~~~~
> > > >       |                                          
> > > > REG_MASKED_FIELD_ENABLE
> > > > 
> > > > Caused by commit
> > > > 
> > > >   0e07b16371b6e (drm/xe: Allow per queue programming of
> > > > COMMON_SLICE_CHICKEN3 bit13)
> > > > 
> > > > I have used the tree from next-20260310 instead.
