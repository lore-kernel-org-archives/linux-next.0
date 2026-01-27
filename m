Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6618A36E464;
	Tue, 27 Jan 2026 19:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542805; cv=fail; b=WwD11xQn+NwHgSEsXpcclEtrGvYe8j5Lu4IT8Y7KD8go6v0tZqbRsloLmSw+gxhgiQFw22xC2WNZZrBO+2lpsqc9IYTWGCTiN7eKOmNYlFaAFtvnrHGWQ7Row/RhzJXaduzfjEbXCetigEx6Np0I5GTamYpF2/Xwxt06laLxWkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542805; c=relaxed/simple;
	bh=3l9eNHu2W27Aa7BNN/zH0dIN61TPRw+p1b9AezFDhug=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RsBp904Z5zLleOBOu9Tt8KEWTYUdDkG86fYxgY/a1AXfk+7DqYmCohCRDudbVMNwQCZ8PTVX6ZWi6k55jiUx/OWuTXjvNl0gD0NZRd0QmHFQGWQ8bo2SNaNI/u0sH0evo49PpPzqAXku0UBQgeVRmvfxAPn0VPyg/W7BFPcr0TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoxaoC9a; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoxaoC9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769542803; x=1801078803;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3l9eNHu2W27Aa7BNN/zH0dIN61TPRw+p1b9AezFDhug=;
  b=hoxaoC9abc+xBsOd9uKQ0cJwdLRhgOnMPr7Mc0Fc2mrhu/mV1Ovncori
   ryEI5IyTY7ycP+O9lfuvYrqy0LuutO/ABjjD7otIcIAg5lddHR82Wd1SH
   1kSTUECIjihf05ful4SIRxVRueC8ux7SBe2U+FTEIXSw4e7SNleWMM5Jd
   6uWCzmnuqL8+qhz153zeuNNx6L17IJePtCQ+mQlfyW+PeWrTrBsYL4ruz
   TO7EJ0xcUpANdVaBaIixkhSVvsBVBOw7+KkpCB7q9v6LndWeulwToTmfK
   v3xB8pszg88M3ndcABnoheM1ozTgu5j5EsqlbfoyawPJaYHadLXkt/haF
   Q==;
X-CSE-ConnectionGUID: fIcd7sCbS5utXd1krm54hw==
X-CSE-MsgGUID: u1iB5WFoSgGagfebKd+0lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82178283"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="82178283"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:40:02 -0800
X-CSE-ConnectionGUID: SIdGCWKZRi2hiJv9D7InHw==
X-CSE-MsgGUID: 2JLOsyEqQl6VYGx/LW/gKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212918395"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:40:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:40:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 11:40:01 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:39:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHEIoLQ2RsiLwj9vQiqkNg4RhnF4V3cKgg5hW+KxHxZfdsDQ1v28gfGgVyyzbmPmeP/7ma7nscjUaACQydWU24i/pYwk1jXIg5lZz5h3Shu6PcDXBNAgmcFzPeYU5C/ZUcVa4TdZkhFTIpkV5F9XRV3S7zriztKn3pAVfqcp6oi9PEImev21OC7hzTSHfYtOy58JSSVzKfXzKC3aNcwTpu47q/yTj0/sl9E3T/Vl82Kxa5CFiGaqs54Jq7EazJVLXeMP2iu4x4SfCN3S8pKANaYTbDkp65vGTgnf+3lpJq/w7z+Q0oySP9q995ne/knjU4lHRCnDr24EEmy+dVDcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Tn7m9eOSPiGJWiqwWmAWZOOS880X8UMIFIxKlKK1gQ=;
 b=H/fA9KAXLdGtfJXTXLyQs9ccbL10wYgTQTFrtk+COWr4XyfTH2cNNOqgvFpE4B7dGJGSUCVhKpFhHlTEi9LP0CgqnvOO7+rUQBCsLDKOjlTuCpvZMIv/G7Zokr/2LFws9PP4xV55rCcvNqs7aSKj457yOrtgemPa3giW2AcSqvKjffTi+jkQIUNlT2oWehu70BSKItO9hDD71EG6ONi/r21soroOJc70164w2yC5steb3okb852L7+BfyrI8pNgwkbWmOCs/6e3gwfQQttZvzKDf4QcZGfYqmSlxfKDsWMZNpuehY7v+bgQQGQyWUTaGJi5B349RAZxaIYdLBwZOKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27) by LV2PR11MB9538.namprd11.prod.outlook.com
 (2603:10b6:408:378::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 19:39:54 +0000
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::14c9:399c:8e7c:d8e5]) by DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::14c9:399c:8e7c:d8e5%3]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 19:39:54 +0000
Message-ID: <79057628-da21-45c9-9391-4f17057b2bd7@intel.com>
Date: Tue, 27 Jan 2026 20:39:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the thermal tree with the pm tree
To: Mark Brown <broonie@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>, Romain Gantois
	<romain.gantois@bootlin.com>
References: <aXeaN2nPs3EexjXv@sirena.org.uk>
Content-Language: en-US
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
In-Reply-To: <aXeaN2nPs3EexjXv@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::20) To DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF63A6024A9:EE_|LV2PR11MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab77e9e-25a8-419e-dff1-08de5ddbd80c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2hYSUx3emRkTTQwSGZsTkZwSVd0ZVY0alZqVEI1bkpBcEVBNWgvcjh1SVV2?=
 =?utf-8?B?ZHk4UHJqZ3ZtdjdUWWQrdFM1eUlaTXc4c1hPcVlaY0NUdEdlQUpzVVJQczlt?=
 =?utf-8?B?Szdud25UbFh2NnYwaE1tcUdZa1RoRzdBVVdIUnVTeVY3S0tOMVlSL010NGJn?=
 =?utf-8?B?SnJUWW8veEptRnNjR0pNaTdyRmVhNGFwb0V2NmRMYXdTcE5OTm5zRG9rbGU3?=
 =?utf-8?B?ZWRJVmxWRjJNUlNSb0xNNjFPRytEN2wxeUlDMDZTQi9HQTd5dzA2MVBsbWhV?=
 =?utf-8?B?RFlWSVlib1FNWVoyS210MnRSeTB2ZlBLdkNqR3pFWTIxdEF2MElzdmJnYjJV?=
 =?utf-8?B?bFBPV0dDNUpqR3ZCdTd5WGUva3NWSVJib3kvY0xHUTJtSEtBTC81cldJTWJP?=
 =?utf-8?B?ekc5R1FHTnRZdmJKOExSVXhxUUZkclM1VFJZdXFheEY0SHhqRmNmcHM3MHN4?=
 =?utf-8?B?L3JYQWxLNExRN3JPa3QveG1WSWtIQ0hrTkt1K2dRZ0k2ckdHMGtKbVpqdzhB?=
 =?utf-8?B?UnBZNS80NW5KV0g4Qk5CYTQ3TzRIYXZ2RlhHYVhHbEluTXNhYlJVMzJ0UDFX?=
 =?utf-8?B?VmE3N1JnTDhLcDlpeFRwOUJiTVJCZy8yTTY0bSthL29TN3RVN0xiNE5zMitR?=
 =?utf-8?B?NytqeUwrYktNU1RsRExqTjk5MTNWTGJRdTFyUWhiN25aTWM3a0tld2wyUUpa?=
 =?utf-8?B?Qlp4S204TXVwUXFxd1NDK1JLUEVicVZ1azBSaUtyWFY5ekhtOVpBeEdOL2hp?=
 =?utf-8?B?WFdQRENUK3FodFVaR3VvSlBnbmkzM3FNU011NDlrUGFEY1ZrdHpUWVZXbUtP?=
 =?utf-8?B?ekJsUzg3Sll1bjZYdmRBSzJydmlIdjJVZ0E2ZFNXSGJ0dnhwcnZPZkhmRkZu?=
 =?utf-8?B?ZzlWZzlESkdLdE1uYWdQR0FpTGNUdmJDMzQ2VEgwanNnOGZMS1pZVThyL3ZT?=
 =?utf-8?B?bTNMZmttVVQxdUVMeUNIeSs1U3orQUZGeHVnNkQvWmlndmM0L3ltY1pVMWNP?=
 =?utf-8?B?eDl6cXEvMkJvOGs2cDZyMldmMm5md1Q2ZXE1K2pncDI5YmFDOE5lbUluS1hZ?=
 =?utf-8?B?QVVpWTZPNm44bmNXSjlFOENOZThDZlNJVGs4WXM5cFBnaEpkVWIzcXRPbVNE?=
 =?utf-8?B?SkRtMFZ5S0dJMVVZNkE4dWNsSlFxdmpicUpsNktWTTdJQUlXekVXMS9OWElm?=
 =?utf-8?B?RHN1MjR3Z3o1R2JMSi8ySi8wVGpmN3MvNXRQMyt1SVBtekRCc3FUVU5IYkZj?=
 =?utf-8?B?YTNrY09tckU4d21HSHRnczhUQ0tWMGdxVlppUmp3ZnU2akhrcUJ2ZWZvQk9M?=
 =?utf-8?B?NXJsQzFsRjFVQldhRXdMb0t3bzZGVzZudXI2YXhhUlI0YjBScU5hL21ZNmV2?=
 =?utf-8?B?YWRPUmJJZWRsNHBXQXM2TnBqRGtsRDNteU1za2xoUm9TSEd2M2JFdHRQZ0dF?=
 =?utf-8?B?UEx2cFRJdDl2MGNZZm5PMk9VaFdVY3VGbEw5b2NzK2E5Mmwwc1IrekVVRUVB?=
 =?utf-8?B?NnJCQ1A3WUNPUXV3ZmdhT0pQUy9jc3pWZW1KdzR4SWl1b0I1V2VudHltQ2RJ?=
 =?utf-8?B?alk4ZUM2SUViakY1bi9uU0pXSnFhNmI1eWphQ0RIMUJoRHovcEFqT0EzNHJS?=
 =?utf-8?B?UC85Qk51bTgvZkNxK3dlNTFKTWQydmdKWk9jcmVwQmJORWRLSzE0YXR5L1dZ?=
 =?utf-8?B?UkROOTRrejlxSFZTa2FEOURCMHBJV3QwWDBaS0RWN0lhN0IvR25qOURoaEls?=
 =?utf-8?B?c3VVS0svUUVyb2NEU21tOXZDWE5KYnFWUGlFdy9qRDRKZ1k4UTU3ZE5GQTVF?=
 =?utf-8?B?OXMwU3pJdVh4UWFMQzNnenFWNGlxUktISnpON3JzQ1EvZUFIdlkycHFPRzhv?=
 =?utf-8?B?bWZaZTRuYjBSRlVHZDZINTM4NktTallMK1UrcWMyYTExSW45TTJRcXhaaVB6?=
 =?utf-8?B?dmVxNnF1SHFoWG1UV3ZJdEFaSkpOR3hYc2VGQ3kxQmI4UElGMjliRWtTdlFj?=
 =?utf-8?B?WXlIWVdZMkVJeWwwTWE1ZGtsdkgzRkNrcGNaMTNRQjdKZkhnRnF4dTVJcnZk?=
 =?utf-8?B?ZVNaK0ljN3hNL3o0UGFSRFV1ZFdCaElHMTd5cDhuclU5Z2syWnhrNWFHYmtY?=
 =?utf-8?Q?feHk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF63A6024A9.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3hWQ2JSTW9EL1U3K3RJZlh4QnR4N0djdjBKVlJNM3VHZ1FEdTV1L1FOZEor?=
 =?utf-8?B?Rmx6L3hHcTYwdmRzNVpxYUd1YXd5N0ovcjBEMXBZdDFKOUpNRGhuWjU0SzZU?=
 =?utf-8?B?ek1mWjBzOGMvWFExd3RTaHNacEp0NjhYZGNOK2tDSG9TL1QraW1EMXkydEI1?=
 =?utf-8?B?Sk55MjZVWTRQSEIzR25QdmJlYkVranI4YjA4YkVQUzMxVXJwZlVOcm1Rc0pJ?=
 =?utf-8?B?Q0FHd1U0dWlPak9oS0lhMjFXaktzWTI0ZmVtQVA3ZmZUYVVUbzFpS1l0VGdz?=
 =?utf-8?B?M0k4cWY0R05FVHB2YU1wWnJ6bDZmTmYyTzJGcW1LbXlxNlduNzZ5WjdINmpS?=
 =?utf-8?B?b1FKYlk2MmU4OUNOanA5OUkxVzhpcEQvN2dCSFRiem1kTzFHVWpvVlVPT3pB?=
 =?utf-8?B?bW5yR2duazRySjNjc2VNeWJMbm4zaDZzdkhETnhXTSt1RVZqMHhlbzF0eHl6?=
 =?utf-8?B?UC91cjgzSWVIOVcycGhZOUN6LzhxY0ZZOVNWblFLWUsyOHo5aG9TalgzWFFK?=
 =?utf-8?B?bzdZK2xyeHN0TXFnelhsUXZTaG5iQXl6WUIwYjcwUnY4SURSR2pIWlpiZDVz?=
 =?utf-8?B?VzJpL0g1eVJydjNaNnp3YWQ3NXc5VE1zV0lUNHo1eExTZTlkUmN1THN2QnBJ?=
 =?utf-8?B?TERHU3JtcGVrZEk5d0ZGQnh4S1RxWWYvMllySFZLRDVybHR2SmxzYkZpUzRs?=
 =?utf-8?B?WEJ5MVFlNVNGOFFwS2psdEY0WVNNZVNxNUZCQU5XQVZYYS9SUnVmNDVRV3lH?=
 =?utf-8?B?alZJTEVkdk5LNUY1SytFWmhZWWtSdURPOW84M29Pemt0SXJUVW9VaWRJeUx0?=
 =?utf-8?B?LzlyTmgxWVRJUEZRTm5peWgzUmZ2Z2VVeXdBWm9ZSnRJeWhqNjM0aFVRbkxy?=
 =?utf-8?B?a1U5NkhxKzFCTnBEdmZTWnpHYlpWQjl6V2g0NWtWSG5IcWtObDR5SWVFVE81?=
 =?utf-8?B?aXIrTlEweXdBaVl6bjIxRzNUZzJIOVNBVTRwaW5YdTdWVFF1WGVTaUlLeUZ5?=
 =?utf-8?B?R1JWM3hyRlFIb3FEcmpQQnJCNmNwZ0FoTy9aODlJQXIxbm5ZeVlmMW8yWGZm?=
 =?utf-8?B?VHA3dThwVmFXT3ZuRTd2clIzSVVUc0p5Q2M3Z0lYWWp1MmlkcjF4aHpnQm4w?=
 =?utf-8?B?NW9VejRjb2lxanNpM3hvREgrS0I0dEprVyt2TTdnSmF4T3RLOEgxaEIyS1hs?=
 =?utf-8?B?L3g0SFVVbUtUU2JKV2V4cGhtZGtkZXA3Wk55c1hQRGVpWkVqa3g1cVZkZFA0?=
 =?utf-8?B?NEhSNVFBUXN2T0xXcFh0bVpxUnJWYXJXeHJUZVk4T1pGTE9XR0gvK0g4Mk5Z?=
 =?utf-8?B?Ly9KcW9hQ3ZuRUszQ2J1cy9VQ3M2NzZQdWI4V05ublpUd0d3YTgyZlFQUndT?=
 =?utf-8?B?dE5nSkRJckl5b015Z3V4Wm8xM3lZZStadnRQSlkzUUpCdUZYTDJqVkdMQ3dZ?=
 =?utf-8?B?cVk0cm0rekxQS21kc1pJaXBJM3RjMXJMTUNyYit5ODl4RnNuU2xQUlVlaG1N?=
 =?utf-8?B?eG9vZFlhVWsvdFpKYlpYdGxTRzFSN00rOVBreStVVGlyQ2ZZbTcvWEJOTkUy?=
 =?utf-8?B?TVJPbmVRM043aVFpYzcwMExJRGVZbEt0VUtaQ05aMElDNEIvWjd4UFFxcXlh?=
 =?utf-8?B?TjQwSm1vNFJ1TEhFNXFCVEhCSUd2KzgwVFU5VCt0bHM4c0kyYlBlbE95RmpC?=
 =?utf-8?B?VlNKS3RyT1JYZmJKNkdJaG11Q2M3QXpYS2lqR1FhMjNqeUpEbGt5UDVEL2da?=
 =?utf-8?B?YnRSWDBITzNVSlJKSE5zRE5Lam0zZlovMDRNKzlReXM4Z0cvZFBLQ3dwVzhh?=
 =?utf-8?B?djl5emtXQ2E3dm9xQ2l0UjRDdFd6L3BySnNMSC9LMEtEUm1TWWNKUVF0MjB4?=
 =?utf-8?B?L0MwRXhveVJwRmF5SStZTTk5MkpzZjNJcUdXNldTdEJkQkxNdlJFOFFKM2c2?=
 =?utf-8?B?Sy9LdXpLVG5CdGtjU2VjTXlmQjBMNlF4WmxzVmptR01SL0UyY0hxdkhYRjJP?=
 =?utf-8?B?TUF3TmVLMFJtRzZxK2MzVGFrc3kra2xyUEh6QXdXc0FrL2VSZFJpb3FDSUh5?=
 =?utf-8?B?T3Jlbisrcmo3T25icFFOa05SYXZQV3dhNnJaMHZQQ0dCVzVqazRuOUNlVXor?=
 =?utf-8?B?UFpvKzFGTjJUVkVFQjc5TmlmcFBGLzh5SUJOYTZHR2p2RGkrbk1UNzNPck84?=
 =?utf-8?B?WGJDRk9tQUZaQUg0ZFRhMnc5ZkkwM2Q2bGxGTm9kbWZibWJCaWNhVUFvaW1R?=
 =?utf-8?B?MGkrNnJTVHhRcXFGTHl3OWhiRDRlUWtRRDRqVDJSSlcvWC9oQnR2bktweDBG?=
 =?utf-8?B?eis0aC95R0kwMVU2VzZodzFJVzhEekRrQjVSMDV1L3lpZU1ZV2JjeDRVQzNQ?=
 =?utf-8?Q?3sao/2g+2SxiE//Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab77e9e-25a8-419e-dff1-08de5ddbd80c
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF63A6024A9.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:39:54.0196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcoK0HWJrKSK/GYx+EUbJ+L8KKioEjC/lqqYHfvK7AhhNw/0EgOhRRWAF686MspJw1x/1TEks/gb2gn8vPe5eswt0dD3tYgX/h2ZmhhGEws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9538
X-OriginatorOrg: intel.com

On 1/26/2026 5:45 PM, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the thermal tree got a conflict in:
>
>    tools/lib/thermal/libthermal.pc.template
>
> between commit:
>
>    5addf72e4f7ef ("tools: lib: thermal: Correct CFLAGS and LDFLAGS in pkg-config template")
>
> from the pm tree and commit:
>
>    965ef09a26f3e ("tools: lib: thermal: Correct CFLAGS and LDFLAGS in pkg-config template")
>
> from the thermal tree.

I'll drop this one.

Thanks!


