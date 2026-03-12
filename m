Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02FD282F0E;
	Thu, 12 Mar 2026 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773301537; cv=fail; b=J+1IU4LQcoHv1W4X6B06lrgrrSQYQQirBcKenTudar+l5c3QpNCIOCl9kEObaEKI0juKXBYb0vYie+m+DgT6FTw4oLi0Loh6JEG4xpXWD3ohhEPUdADZYIn7KU8rKZyfxsBdbfhohe+ikFMjlMpgK3F9r2o9ONNjM+Gpu0lEKCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773301537; c=relaxed/simple;
	bh=jCssLh/DlkaEmo9eetjlzZ6uOcAfVxkSZDTO5KYmoLg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=awr96ug3ypnN8+UJqamrgtTEWCnUioniP7mAx1ZovOI4lgjTMbwArCA/T1hxDz5Uo6ICNKYBzbwn3NuGyQZtpmzeTDG7rQVHsimWnt/Grvwq/s1/6YFzGi+2Vk/RJW7/7VfcI/hHOO+WkHkJInMibW+DULddy/qxjPzhF083RMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gghtC7jj; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gghtC7jj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773301536; x=1804837536;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jCssLh/DlkaEmo9eetjlzZ6uOcAfVxkSZDTO5KYmoLg=;
  b=gghtC7jjwX2iON0eNw+D/6gfEROPdWdvsh4DrtVgDHS146S+SbCUHVUF
   Oa8DjJiAFWU9B49Gri/6GpaWXdtCARAe6ko1BOYoavomVQnRHvb39YTvw
   brGEgjAf/dsFc1RFEe2KwMxsvy7G7WZ0nf3D2chG2VV/+ePjwbMmajsON
   Stw2cLmSZJ0X1D36+UrR2XLfv83hGu2U0XEqIlbmtpoIWOMOE/wrfF8NN
   SGKvmD4Td/SzXZLkr4M7MzJcIxq4GNed3aok9Qd1nxN5f6+G/8o6PA4k/
   u9cY9Y9YcqLhJ7ptqLeaS0mjLfpp5+9z+97ovpQ80UDpWHOSf8rLtkF5c
   A==;
X-CSE-ConnectionGUID: P465z/G3S3+RS6Oik1FBdA==
X-CSE-MsgGUID: KAB7ddPEQaWqdRK8ro0vnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="61961634"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="61961634"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 00:45:35 -0700
X-CSE-ConnectionGUID: tdTz5YOuRVeK7ByCMiukxQ==
X-CSE-MsgGUID: cKfUDTsSRiOI0Pf7+LK/mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="218167362"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 00:45:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 00:45:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 00:45:34 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 00:45:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRvvwyhMtwt9BYEoEGinLE84A/obdw+DRPfnpJSzp2I/rWWVFUN+738CeMzunH11l+H0BtaW1KTS+WIybMyYjfZY8tIFnmGyrkn8uK4XJWsHJkEcc72HaoPD3pYO8bU+rxkBkChphEIhCQzT1AH8180XAppXLTSIlx1SpYH1B3P/ssMGWT3z5ah6dWoyFNQwoPVZNRX6IU/LUPfEy5Pdeknfcu4/6aRQ4QWPavH0AbBCR21033wjVnLl6HTlBxxyQ+17MXqVeBKyz2AWYjB8wplJX51cw9o/BS9k54q+rWUzYSyDMPU80eAZtnJaqCxRSU3G1oaU7Gn4yrBNtq0o1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03WQj4BNJtelgHYFhYMTwMRTSolLt/HRMcd0Ij5vBk4=;
 b=LfOZe6OoEzvjwcxWLYsC6kwRPpSitiXZlnrXSiR0EPWU0DNz582oMOPpzu8cpODfN4xoBiuFxwMGV/sCZa27nTVIFjMoQZyQ9uyLLXRzf9TcNXobRrwLr0KZ+RH0BbfX6AUtxkacBclEY1B4qJ6bpJHIl4cQsGWM53IlyRAs/hgZ5S3AKLHm1vh23neIvvCjad4aQxfcv4vMNoPYHD439uo9sjRHBOxWi91P0ZqI1GA8565oA1fFOrEVBau1TTm6RTjpxbKSH2yVf4LWm+KfnQa8W/418j8h6tTzStUKYjJrJMLDL3wQVaWG3vnuLJ5RiiWwFs06Gtr6Icw83/zlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8136.namprd11.prod.outlook.com (2603:10b6:8:159::5) by
 SA2PR11MB5179.namprd11.prod.outlook.com (2603:10b6:806:112::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 07:45:32 +0000
Received: from DS0PR11MB8136.namprd11.prod.outlook.com
 ([fe80::f5d7:6d58:9035:2a9d]) by DS0PR11MB8136.namprd11.prod.outlook.com
 ([fe80::f5d7:6d58:9035:2a9d%6]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 07:45:32 +0000
Message-ID: <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
Date: Thu, 12 Mar 2026 09:47:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm-xe tree
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Souza, Jose"
	<jose.souza@intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>
References: <abFpM1FHgzgARB88@sirena.org.uk>
 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
 <abGv-5kXSCtOTO8M@intel.com>
 <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
 <abHMaBe4Wo_PH4uR@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <abHMaBe4Wo_PH4uR@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3PEPF0001DC11.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::26f) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8136:EE_|SA2PR11MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fa300d-5d95-402c-847a-08de800b567e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Gcd6FvrqjpyGnQrucA/QKWfak19XWtQD+27JRmhNkFdkH20xFCkea3+rbJ54BmGy8Ds6xaTMI6+BrGxaoOSBb+PRznMR1hVyBJ0ESTv7bVvZiGdvy1WlUld26z0fAP8W6ZL1O5joTjP4mRNgzzz4rCIKFDsPHikdanqIjDr3Uc9P5nRalYenZhvBzvj9Vx0moiDrXS+meMS1bWurJIHDU8rlIotl56S+O4cyGGTJtubZDUOevT0W2rA1OGbKzbsXl1pTQBmdyNFO4C6z8P//zcuisUJdvc/MZKjwJajWR+ZNNorXXQ4EO4rzn+E+cZabFGd9KjTCuuh/lGw/nKnTSBkb/rwf7b5V8cih5/oEyCZDBv33wCOX2gSacyingDI62y3bxPTQ5l1Cfuk0zv1rHQdKHPwL0YttxjV4CgoljRQ3DlnYNzQe3wzvkj0Axzk+DNi+H/zbh8m1zj9oRVgkmZ9RPBdSoDehX3XIy8Zp/cjUbc7X8kbzC3TY+S1BCB6K4SrNUJMsqt/aFucWYy7SFN48r0j7HofF+6S+RZ1CnRl96448DpDoUgIQEclsVmVHRvBPpwxRIWk+3zAONmDzm7tGEamGXb61etQzhPaTxbed9HLcJyvx/Oc+4m8TrSf2EN871/r/UoBf2bI9aNx11wZYPdz7RttUgNBE/15uMj9i1oNXxwvmYWfn+E9+a15ip1Ncybl4fe94ubrJBo1yFoo5Ln+x70c9tqvz7nVKf7BS3W8Wd5NDnn9EM/yF9G2o
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzZaWVRxd2RBTjFiYXd2cVVvUmRzQkpXaGc4ODBTYkR1MElJb2FqejFEVHZR?=
 =?utf-8?B?a3NqOXFHUFJNODVXcVdWcjBnOFQ3aVJnS0Nqbk9YSjRRT0FKN2dSMlNXYlRr?=
 =?utf-8?B?N21LRUdWUThSWjhUdVcra3N2K1I4WmdybGpVb0ZoanZYOEpiako3YWR3b1Vl?=
 =?utf-8?B?bkgrV1pSN1o0KzZjOGJrNENKQ09Ea3pBU05TMExkVG8yYXNmdXBXbm9Tblgw?=
 =?utf-8?B?TWVjRjJMZWJhb0hmd0RZVTNnYk1BSlF3bUdETmd2QWQ5S05FMjZZQXpuL2gv?=
 =?utf-8?B?VXlZR0VxZWt1c05RQit3cHlkMU9sbEY0eHhtNCtwd1lFYVNCSTdsNi9wUjJK?=
 =?utf-8?B?aGhaNzBrK1FKVytyQmFvTjlhcjBnbkFMWlRIczdnYVk5QjArdmEra1pXS2h3?=
 =?utf-8?B?V1R0S3c1L3htUFhDMGFxMjRzQ0NiK2JHcEFGV1c1enNNNnMydTVRaDZpM1Jk?=
 =?utf-8?B?cGJvMmJhbE9mYW1oOEJmTTFPcEc3bmVYemNTYStJWWY1SDcrM3hPWW93MFlq?=
 =?utf-8?B?TUk0WUlRdTJwMkl6SjZYZGVOWkNWalRmcFFwdS84T2c5VUUzUVdhVUhtQTdr?=
 =?utf-8?B?RXBqNkhTNXdHNTdwOS93UkVBOURyWWNRT0FIVzNDM2JZN2h3OHZEcFNzenVE?=
 =?utf-8?B?Ymltai9KTm5yUzYrSGxhQUkyVjZHTmFjeUROalZEbWdOZUFxckgxSnFiZUFx?=
 =?utf-8?B?VUtiTWlSV0l5Zkd0Nk1ZOTg2Q2xkRnRaeFRaMk0vTDZpSlVFVWhRRlZOc1pz?=
 =?utf-8?B?SHNrM29jZ0xsdTBEUTlVeWY0bUpINFl3cWd6TlU0RllhRFlwTGJsem9BbUdk?=
 =?utf-8?B?dnlyNU5qMnJkbnFvSjNtVExyZ2VjeDJSRHZmZ0h3cXpDQlV2aGxSTW5iVGxS?=
 =?utf-8?B?Mk92VzAxUXZrcTlLcXZqdG5Lejlzcm04QVlCdUx1RHBFQVFLMnQraUp6UEhj?=
 =?utf-8?B?bG9Cd1ZZZ3BrTXBkRDIzcUN5Y3M3VCt0SFVHV1dHa0RDYlZNd0pvalBGV2l2?=
 =?utf-8?B?dnc3RkJlNm13T3p4WDNJZmtYenZzeXFIbmxvZVNYbjBhRWVKeDZWdm5zRFR6?=
 =?utf-8?B?dmRNM0FhKzN6S2IzZ01rZTE2TDl1ejgvNkxqUFI2SHd5OHMwcW9odE9Bamdn?=
 =?utf-8?B?WXg2cDBSTTlWWW12NUcwRzl2b2M3VmZoTlJtZGN6T3psdWhjM3JRVmZjNU5p?=
 =?utf-8?B?bWZuQ3ZLdnZEQWVlRTFaUWRJUFAvRXB6KzF1QUdMdVAyTGhQeUJBdmF2ZUFK?=
 =?utf-8?B?WDVkRUdLVlpxdkovRmovK1d1dTR0NVcyMFZpOWFPemp4U3pFUFdqVng3cGxH?=
 =?utf-8?B?NkxQSldScDhkbUNpOCtGaFNEOXJHbFN3UGxLOE56QllQcVlVcEN5QWJiM1Zl?=
 =?utf-8?B?dWVkTUZpYmd6cGkvZE5OL280MUQ0ZDUySGdOeGxVOXhEMGtsd0RwaXgyLzVy?=
 =?utf-8?B?cUIvbEIyUnNqQUFSa1RnQXhObm45cFpDbTlta2o0MWkyWll1dVVzbXMvcmtI?=
 =?utf-8?B?enFtUEJ0RDcwMW02cnk1dEVKWmcwOUg2MWFYZ0YvZFF6TGE5WElCNWhGVnpm?=
 =?utf-8?B?ZGpOSlkxeDFRNEQzL2ZKeDRoaitvNHhzSWg2c0hRUlVDM2JZN1VZcW5NcW4z?=
 =?utf-8?B?bXppMVdMMHBRNlBqazkwclpOSkoxZ055SGpzMnNBR3o2a0VhM1RoN2JSc0pN?=
 =?utf-8?B?RHBKdG1Id3YybXBTbnNoM3E1c3A1eUNNOWlxMWQ3NGV5RWpyOW0wQ3duWCtD?=
 =?utf-8?B?VVl3YUdrRTJpZG93Q0dycjV5a2F6Y1lBaTM2c0dJblRzQmlTS0ttaFF0OHVh?=
 =?utf-8?B?ZmpzUDk5ZHZpUGE3STNtY0xySk1ROXN1U2l6anBuRGdoY2dkSjk4SnhMM3Uw?=
 =?utf-8?B?Q01zalp1ajFYdjZBNzV0RGVmNHdHTG5JdUM0WmNpdmRtc3lkVUZOelpnQ2dD?=
 =?utf-8?B?aElrZWxMRnZKZU12TEVwN2l3WnN3VDRmcWQ3cnNkSEVkVUhQRkNqWUtRS00w?=
 =?utf-8?B?dk9vaUdDUlBwMHNFWUFnS1ZZdDA5QU0xT3UrRGpKc1pVR3FwWitNWlg1b0Jx?=
 =?utf-8?B?SzJreGpzUzVGZGxVNnQ3Z251TWZIZUFpVmlBOXRUZmM3MDN6ZTVEQjFld3F6?=
 =?utf-8?B?dkhpNVlFM2QvU1BOVWFMK1hMTzdHMEw2TXlKVm1CQ3NIYVp5UWwyU0Z0aC9G?=
 =?utf-8?B?VGFUeDZxOTFPRkpLZXdQK0RHcmg0SzVxcmQzSG9XaWl3Q0JGTk5yTS9oaFRG?=
 =?utf-8?B?dXZWMGVvNi9lRjl2UkdKS0w1TmNhZjhQTS9BN0J4QzBkQUozNyt6dTVrN3Bz?=
 =?utf-8?B?cEM0ekJoamR0dXZEOFhUNkFWT3k3V1BodmE0eThzQ0VUaGVvR1lvVGtvY3o4?=
 =?utf-8?Q?27YhN2yZPK+yH398=3D?=
X-Exchange-RoutingPolicyChecked: d5nkj9MoIEn0+g6wFvxDhefqL4+DwC36uzijdl+YYlqBHQ0RmfkcYuObFWxeAneD8eO6d7RryRrentvNHmWbmU/64ClQzPEsIlrjB9MUXbH04O7+G0nq+B8/c0+iTEOpqywF8fy1Y5oBkeRHah1uqAuNA83UOnh4hSB79U3lSoyJJoU/P/Rz5gYUCJMF8urKlFVssFOlRyuyqhueSleTgxCx9OvzFRDE00e693v8JjtEoIugBKnfwt544FMlwpBMQIkqijiS6oJ6F8pD+Q9Qzo+eD7gJ+YeNNWuYwwVcTICwlUd881WYyhq8VZ3Kt5DF6AIbU336G5PGl6BA27ubqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fa300d-5d95-402c-847a-08de800b567e
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 07:45:32.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZV94QcgibbN385TUsDvz9Px6roBj51y3355DLHCDYnRmP0DcLVoPPLrIBHbzqfRKbhDeQokWqT5lZ1YxvAxefeGjbTli+DDVr3a7l2HS2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5179
X-OriginatorOrg: intel.com

On 11/03/2026 22:11, Rodrigo Vivi wrote:
> On Wed, Mar 11, 2026 at 02:16:22PM -0400, Souza, Jose wrote:
>> On Wed, 2026-03-11 at 14:10 -0400, Rodrigo Vivi wrote:
>>> On Wed, Mar 11, 2026 at 01:16:22PM -0400, Souza, Jose wrote:
>>>> Hi Rodrigo, can you help me here?
>>>>
>>>> I think this issue was because
>>>> https://lore.kernel.org/all/49dc20448a12f3e03f5f8347540d167a281b8987.1772042022.git.jani.nikula@intel.com/
>>>> was merged in drm-intel-next.
>>>>
>>>> If it was splitted into a i915 and a Xe KMD patches and merged each
>>>> to
>>>> its own tree I think we would have avoided the issue.
>>>> But I have not looked at that whole series to understand why that
>>>> decision was made.
>>>>
>>>> I don't know how to fix it, maybe rebase drm-xe-next on top of drm-
>>>> intel-next and then a new commit fixing 0e07b16371b6e.
>>>> Not sure what is the best option, can you help us here?
>>> This explains why the patch was not applying cleanly.
>>> This is the reason why we should never ever edit the patch directly
>>> when merging.
>>>
>>> If this is breaking the drm-tip build as well we should immediately
>>> revert the
>>> patch. But I'm considering this anyway.
>>>
>>> The alternative to that is:
>>>
>>> Jani needs to do a drm-intel-next Pull request towards drm-next.
>>> Then Sima and Dave picks that up.
>>> Then Brost do a backmerge fixing the build issue in the merge commit.
>>> Once we fix it we let Mark know so the branch gets re-enabled in
>>> linux-next.
>>>
>>> Let's revert and re-attempt after drm-intel-next and drm-xe-next are
>>> back in sync?
>> drm-tip is not broken, Marteen fixed it in drm-rerere.
>>
>> How long would it take to do this sync? If this is less than 30days I
>> think we can revert and wait, if that is okay for Lionel that is
>> working in the feature that depends on that patch.
> We are in -rc3. Jani might be sending a PR in 2 weeks from now.
> So, we might be in sync in 3 weeks. Worst case 30 days.
> But it can be speed up with the help of the maintainers I mentioned.
>
> Lionel, what do you think?


Is there no process to deal with kind of merge issues quickly?

If someone comes along and changes the bitmask macros again, do we have 
to wait another month after that?


-Lionel


>
>>>
>>>> Thank you
>>>>
>>>>
>>>> On Wed, 2026-03-11 at 13:08 +0000, Mark Brown wrote:
>>>>> Hi all,
>>>>>
>>>>> After merging the drm-xe tree, today's linux-next build
>>>>> (KCONFIG_NAME)
>>>>> failed like this:
>>>>>
>>>>> /tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c: In function
>>>>> 'xe_lrc_ctx_init':
>>>>> /tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c:1554:43: error:
>>>>> implicit
>>>>> declaration of function '_MASKED_BIT_ENABLE'; did you mean
>>>>> 'REG_MASKED_FIELD_ENABLE'? [-Wimplicit-function-declaration]
>>>>>   1554 |                 state_cache_perf_fix[2] =
>>>>> _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
>>>>>        |
>>>>> ^~~~~~~~~~~~~~~~~~
>>>>>        |
>>>>> REG_MASKED_FIELD_ENABLE
>>>>>
>>>>> Caused by commit
>>>>>
>>>>>    0e07b16371b6e (drm/xe: Allow per queue programming of
>>>>> COMMON_SLICE_CHICKEN3 bit13)
>>>>>
>>>>> I have used the tree from next-20260310 instead.


