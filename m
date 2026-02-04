Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBBB28CF49;
	Wed,  4 Feb 2026 14:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770216522; cv=fail; b=YQITbeuSiR0tCq5TttHofSnGzb3tud2xKZVPaAZLQC6ztEoDjAq99dK58cD2XPJSnussfUgRPMjSxXnbplxT9UQ8kyfMoIi6IGA7GyDRCkSU5JGVDt/YDkmmA3hZxJTxMVJ0hJjLzDH0oT4QnjZZC4sdy0mypCmXjdFTw2dlCEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770216522; c=relaxed/simple;
	bh=HB7d35c4g9tM+t9s/v2zw+gN7JIllQhusdL2/3nkh1w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s4UL+lusdoYhI4JtreGbb3d8yHASFnKMFU0wC4jav7qMYL7N7KokHDWlBtM7shVWWYTBvVGab6A+mdIdSWwMaSrVQVTYQZDVVUriXUidmJbMEUhTACcvkFd9qtJEf/AvltjwsCBnskAsA80wzL2bbE5KfGKaVjAKj7UQHHXmKA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QhMbXO72; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QhMbXO72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770216522; x=1801752522;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HB7d35c4g9tM+t9s/v2zw+gN7JIllQhusdL2/3nkh1w=;
  b=QhMbXO72KB9Jq+qC8HG2A6tWIKC+ISZ/TlzrFBowDiSsx0eOw6HxHzV1
   KbFBOW67yuTY/u1KE+wjbI4HCNdNvPgGXl4UDWtjVTXkf7VyaRDE1vbeL
   mUsPJQytIpw54D4bH2ul191NtIG0jRsOrW7ylGPIN3yN84axCQzYv/9Zi
   rb0cuJ3Bo1DPzX7T01uJntDYIIuntQNoLQHd2tPJZCBKEtOj2mckFs1GD
   NCqL45Y1v6goHgdEYkPwhlM9jBbwasaQoeqCGGraOE0iHNWpk/mDYPpl6
   HcBH8RBX01YiCzIL6zRKk6ujnOYEfJNedNbsSaWnh67yw41U3IpgtlSbW
   g==;
X-CSE-ConnectionGUID: R/nZqg/2SySpvbicGTu0/g==
X-CSE-MsgGUID: SAb4UVVOS46hZYdMF5fvBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70599834"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="70599834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:48:41 -0800
X-CSE-ConnectionGUID: LIVQSTNPQLGAV5iiwP7DEA==
X-CSE-MsgGUID: h06ScO+CQdKsh6qW2IpHZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210223398"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:48:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:48:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 06:48:40 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:48:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWQo2T+0ArVjoGVWMLv/w2VRf4djxsDCyot+FWn6kBHBOxg5/pm3ZmS76J6xHKi38tZtFvnBjvh/PqmRFS+uHoxg/aSCrHt/US1Row7WnjkV41/Rb4UM6Z56dCzJ5790hun05+2JTXrg8ZnGJOblgMQsYKJbAwgDSu02xI+ZrIGtLdHvheUtfefFFceH2RXOKKg5Jy9qoYirhCRO0xV9pr1nUkomCVX2jkrrNVD6PgJhzZViuKQAPY/v79IrO7nD4viaUPTDcNNb3Z/AiQnD6SsxP6z8RmFko+ARGE13CLiXvRTF+chTBHsvcdN0R09Teb7/8sVDpWZKtT2W3CCy/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrRPlZW58oOBbg0TU1V0RLTUsO+wwDzopj4lETq4iBM=;
 b=B6PK+LZSBRavkKFa+nzbKljH0sjHD0ejiHOyBiWTev04Z3AdU4AGZsttA4TXJyBKiSMxo0a6YLbfxRIGNJD/vlK3D/FvujocXbiJ4E8nlJiIgn/nI2BcBCbO7ARn3w5T7VJq2w4xpnSEpesN9h6W1MMkHLc+Gp+IKODwRysoYc+4KC/8/+dvblm1kFKEy2merYyhDFK2cZe6Qh9znM8nmKCyIh7tm2tE2BAKAgJlq4p24eiViRC4sEpKx432n/cYW1NDWAlI8fCJxp7bKCLQNMdibMECjycNqOAF92zigKupzKXU+ewTJmuYf2ZCatKk5b34LwzF6+LvWdjLkrwzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27) by SA0PR11MB4605.namprd11.prod.outlook.com
 (2603:10b6:806:95::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 4 Feb
 2026 14:48:38 +0000
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::14c9:399c:8e7c:d8e5]) by DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::14c9:399c:8e7c:d8e5%3]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:48:38 +0000
Message-ID: <e4acdf40-7d6d-48ee-9880-17bacc033961@intel.com>
Date: Wed, 4 Feb 2026 15:48:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
To: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
	<peterz@infradead.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>
References: <aYNPFdTRx4WDKlTV@sirena.org.uk>
Content-Language: en-US
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
In-Reply-To: <aYNPFdTRx4WDKlTV@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0086.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::39) To DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF63A6024A9:EE_|SA0PR11MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf45276-fb29-4172-a8aa-08de63fc7b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXJLaHhsS2R1WlNaT1lRRVpLY3ptRXEvRDg4ekhZMm1IRDIwTU1aWUNhVzE1?=
 =?utf-8?B?V0tOdTdMS2xRQ21BTWFyeTJvYk1xYVR4dEI5eHJOOExpOUtyZUhRNGNGQ0tt?=
 =?utf-8?B?bHhBVCtQWmhlSS9ZQWtuam9ndFVrR2ZrOXYwdm1TM0RtdGpoVzNTQS9CL01W?=
 =?utf-8?B?WjRBVEZuK21NWVlKRG1GcEIwNUNYYi9SR3pvUWFIdkd3WDZsY2JkcW5PSFBj?=
 =?utf-8?B?cUU3eVRQY3BKcG1NUlRDRmp1aFdqN2FwcVRSMVFmT08yUWJMNG5rZ0tOcTd6?=
 =?utf-8?B?OFlUQVVlOWR6dWdua05sSVBsYVk2bk1IVHpxOW1VcDVOVkZ3VlRCNFdDQjht?=
 =?utf-8?B?a3ZQcFJJN1hLQWpWVnVLTllOQ012S1lXdVJvT1F2UmZrNXdZN1kyNXRKZEhq?=
 =?utf-8?B?Y3MvOHUwMUs1b0FLNk82dXNzSFdZZlRkWVZ4b1NYRDVUc0lBZ2dzTEQ4L2J5?=
 =?utf-8?B?WENQa2JudnR3bUYzeG5DNmJhRGVGMnYzSzRsLzZGZklabklUeHR1Qnd3YXFO?=
 =?utf-8?B?aDZJOEtSeTM2NkZvYXhSZlMxelFReENUY3l4OC9KckNBRng1a09TZWZXdFNl?=
 =?utf-8?B?ck1uNWtNOGtwdjFKenRjYm05eEFVTTVFREVtQlU0TER5NXYrdG9JUG84VHhL?=
 =?utf-8?B?V200WENFR0NnUVg0dVJXL3lJQnZWNEUzdHg1cGFnb3kxeWNMcDhlWjdGUlNs?=
 =?utf-8?B?UkFTQjQrK2tobWxhekVWMGJSUFdUaC85bUhSUkFjRWhYSVhzamp4c0JSd3gw?=
 =?utf-8?B?cGI4ZDdSK2kyMDVOUXVEWVdUZ1NVNjN3WGxsVlo3M3hRNkRYWGgwVjdsUlh1?=
 =?utf-8?B?VUdpMnJCZnhKanBMdm8yMVpQSzBnbm9veGU4cmJFZ2V6V0o5b0JGaVVsTGVI?=
 =?utf-8?B?SVplb3N1cFg3N0ZneExWODZZTXcyemtrdkI4MTJMOERaK3VzRmI2NCtWNSt2?=
 =?utf-8?B?eERocWQyYm56dEdCMXRCaFFzKy80Ynp2QlBzd0lHVUIyRElJS3RoeUY2MzFC?=
 =?utf-8?B?K1dYVkNBUlU1VExkWGljQ01KTFRvTGhNT1FDWnNVaVNxaTZId1U0UlovM05z?=
 =?utf-8?B?dm1tc0VVWERBTEJJUmZjWWJTc0lZSlZlRlJ3N1NldGJMbnBOdzJMRTF1OURj?=
 =?utf-8?B?KzlMUWdDTWVVZ2M2YkVXTThIT3dab0JCMzR4aWxxS3Y3eXNkYkVjSHBmbVU4?=
 =?utf-8?B?RFk0aUdrY2cvVEd6UjZvLzFPVDg0cVdGYUpKbGx6VkxuMWRtWkJlUHh3TFNP?=
 =?utf-8?B?OHM0cmY2bTFDTUliRTlvRGM1emJ3cjhyT1VzSVhxbGkvS3ZwMFI0NVJMZkk3?=
 =?utf-8?B?R1B6U0tJb3BLMHUxenNSV0E2d2dNOS95MUdMdFFoQUllNWc3dDVGaStpOUJz?=
 =?utf-8?B?U0UrSTVjK3hvYm1FcXhiTlVtVE5nSEdrZXVaTUNMYThLWldvVFJxZ0dQdzhp?=
 =?utf-8?B?Y3JIR25IVEQrMVNBVmxmTVc1YlB6WUZkdURGSGxmUmoyaWRqU29wZnFTYWMv?=
 =?utf-8?B?M2xmY3pJWDJEWHQxUVRWSk9pY0FaYkR6eGhNOWNQY1YvTWZIbzY5OCtmMkdh?=
 =?utf-8?B?MXlsbkkwYWZERkRoVTdoRFF1U1VIZU9lZzNsK2hoNTRlZS9rVDRycmJxWFQv?=
 =?utf-8?B?ZWtKTFFSTVFGa0pWZ1YyT3lBQTdBRVBXeHV0SmJTcWo4WnZRbk5DM0tFRGZD?=
 =?utf-8?B?Ky9SUGs0UW9ycmFkMmIrVmRjUjJ6aWgwdWlPdk5tQk1zOVRUS1hiSjZtRUkx?=
 =?utf-8?B?Q285a1VnRTJ2VU13SUs2Y0RaZFh0b2IvblNPUG9lTlFXcW9uL2NpQk5JWDY1?=
 =?utf-8?B?M3lmK0Y1RUpGWW4wUlZTUHYvdERFbitqYXZwWjlVenduWHh2YzdKQ21JSm9L?=
 =?utf-8?B?Q1RPRXcxNDM3UHVTVERlSk0yZnN2dUVzNzBkdWtBNTM3dWxUQmprL1dCUkFj?=
 =?utf-8?B?NFNYUm9MU3JDVlNtVjRGOUtDVUgwUkM3WFFBdlBGMkhSdk4xN0RnTGkwd2RN?=
 =?utf-8?B?MTBqVHRjZmZJNHJIdS9KeW1RRXFyYmRWM1pVcVVNRHRDbGRjTWhUYXhlZ29i?=
 =?utf-8?B?V0hrKzVQUHJSS3A1NWExN1d4WGlpZ0RvcHJQNzFJTzJzL1gvK1piVFNKcERo?=
 =?utf-8?Q?69xs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF63A6024A9.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTZLYWZaYXE4OFV1a0pGeXYvcURpdFBTSEVTRDVLL1BldUlBdll1Qyt5V0JC?=
 =?utf-8?B?eGM4ZGtnM0s5TTVSeXgwZS82USthMWs3cVJjdVFLcmI5N0VvQmlnY1JiSmVv?=
 =?utf-8?B?V0p0U2hXMHFSTW5XM3k2b3hVVk1SQVIwOGpaRkFXMUY2ZTh4ZFZqRUpBajNT?=
 =?utf-8?B?VFJTbXo3aGorbjRpVTU3YlZKM3NwTGxEVnJxeFJOSks0dXJYY2tPdTZoRjEr?=
 =?utf-8?B?RVZwYVRpMVBvQzdkNVF0akJaSzJGWEhhSi9ZcUZ2UGJMelhwaW4yTDBsQTZP?=
 =?utf-8?B?T1ZYWDdUYXdUdG5aK2g0MDFITUNzc2RjUlVXbVJBczhXWGtrSjB5OVRwSlBT?=
 =?utf-8?B?dVFpUDR6dmpjMjd2Z1ZhRFh3eDBwc28wYlBkOFRKYzdTYjFVU1dFR01nODNY?=
 =?utf-8?B?WUc5T0NuendvbGdTZGVkWnJIUCtMNWNUdDBIcVNOOVJOdGdGRlMwOFVzWEZS?=
 =?utf-8?B?NGRRSkRabSthMVYrR01JOFgrdjZHOXhIb0JyckhTWkdaR1FUYU1MYmpROFd5?=
 =?utf-8?B?Y1ZWQmFGQlNrRVlIaGl3Y2tiVzFaMWkwbDZHVnJyVDk0R0t1ZVB6U3RMdTRH?=
 =?utf-8?B?bjYrS3hOcThFOEFLSFBWaFVOWjBMNSthZHBIRDFPa0Q0SW03TVQ1Q25iTTdt?=
 =?utf-8?B?Nkl2VXdWVk0zdHRXZFVkYUxTUlVWbUpMM2tabFpTc3lYeEtOeXBGaXdMRm9V?=
 =?utf-8?B?MUFFWUVBNXNOTUZhWTJEcTZSTlcvZGRvaVg2RFJuWWk1dkNaQmlmcytyOXZR?=
 =?utf-8?B?aDd4TjNFcC9QbldVU0ZhZ2pzV2FxeGtBeWFUQ1JKamMxTWV0bU9LdUNBdXJk?=
 =?utf-8?B?KzFnY3M3L2MxQ2NQd3JsbHBJTHdMbFI5cWVncHNIYmZSK1FreGJMT1N6NmlS?=
 =?utf-8?B?c1JKNWFWcXpmSEZXTktGam5HZWllTjFKaUx6STdzQVFNdWR0NzZYV0krcDZ5?=
 =?utf-8?B?eXZGR1ZybWhOZDlLcnRRVGJWTmRnKy8zR21MYkRHUzQrNU5SdDdpL05KQ2s4?=
 =?utf-8?B?eDN5bjRHMHFxL0tzNGV1eEpSQVI0MFBEVlZqNVI3QzFKdzlHUmcvWWdOd2hS?=
 =?utf-8?B?cU9PeWFiN2djYms5NnV0d0JpZmxyc05FVWtaZjJBTlVqM0RtYXorNEljVmN1?=
 =?utf-8?B?NDIzODhxckZqNytONHJwSFVxeDlVbnUyMU1YdWRDYUFHeUdDTlJEZUY5SWhX?=
 =?utf-8?B?WmlZckRkWm1xbk1uRWFZTCtqeXpmS3gwM2RFdXlFSHI0aGtVcjloZElkWVJh?=
 =?utf-8?B?VWY2aHNGVHVDT0NZL2lpSE9OVUVHNnYzQ0hWOStjMnUyaU5yM0FEMjI4MHdw?=
 =?utf-8?B?Yk9NSXVKSmptdUJuVkZaM0tQYjAzejIyK3VyaWswb1BySW5UdHVKNHJjbGJN?=
 =?utf-8?B?Y0JJRnFDMXBMTGpTbTJnTmpYRXJhcE1kTG41RHVBQ2NPai9OZjdhKzB1U0Jw?=
 =?utf-8?B?Q1Q4dW1nWEhuNlhNMklOc2x0YVFiOEliUHFHUkxsM2o0aHpOd1JOM21tdHI0?=
 =?utf-8?B?ZHNVNUIwcDgxaGY2b1NkckRJYWZsTVQzdlFyTDgwSFdwcnNtVFF5Wm4wbVor?=
 =?utf-8?B?dFh5UWJ5U2Rvb3dNem11OFFmUVRiYndLVVljc29weVo4SnY5ekZQRGZRdElk?=
 =?utf-8?B?Z29NVG5DR0N0UVhndWtZWmZCQ1hOM1lrMDZLS0FPaWw2VUp1MHhCbHpiSWpr?=
 =?utf-8?B?SXVtamVmK05hRWNyS1FXTHgvNFIrM2FXOVZENjRFUnNwbXhZQndJbWs0TVl4?=
 =?utf-8?B?dGppSHAxZTQzL291TEZjMTNwZmlweXFrWGRUc3hDU1NmMEpLN0JRS0xVQTRr?=
 =?utf-8?B?ZmY4Uk1XTWhEWERGcXQyWHBXL2xia1NwZHBCVk4yNHI3R21LcEM4Q01kbHY5?=
 =?utf-8?B?UXErTzBORlBFNmdIejNPa1ZTdDBHNHJiL3Y4TU1FMEdXYkg5TDJiTXhHVkwz?=
 =?utf-8?B?N05JdHlWcGN4Q2EvNU5WSFZ2VUQ5MDRWckZvQk1GOFlNTGUzc1JOWE5sdkw0?=
 =?utf-8?B?U3UwemMzeVZwRVQzVGNhbWFxTVJiZFFLUllrRXVOV1VSbDhpRCtCL2hEN1ln?=
 =?utf-8?B?b1JOaEExS0VvQ291YXR4Q0FWMFI1dG80M29OQXpQdEJjUktSNFNRQ0d2bnhM?=
 =?utf-8?B?UEFONHNwVC9HOTVua09GZGZ0emJxa0FuY3Y3eG9pNy81WkxScG04SVcyelJ6?=
 =?utf-8?B?K0REMk1VVHlqaHRid1RtRmVTR1R1R3dKUk5VNldCWWFLZUt2SkVxcVRiaS9W?=
 =?utf-8?B?VEZ1SHpvKzgwM2NCZFUwRFBkS0krcTlaYVFtTDRqTWRVSFV1RGdNRkNOa0Vt?=
 =?utf-8?B?OUhDaEpQM3lHa0ZSVndKYUpQL2pTdDYyNWRqTkM2Y0dISWdpb3NiOStObHY2?=
 =?utf-8?Q?tPASFbp3FWQ0Az9A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf45276-fb29-4172-a8aa-08de63fc7b07
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF63A6024A9.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:48:38.2997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swGjNvz61HTDWi+83NHKsfxShh1dukZ/KA2UE2A59n756VLpbL9eVBL7euMmNtVM+CXw2P4MWfG3O0u8/4Jw/oK7juTDF05p+G2I4WNCmKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
X-OriginatorOrg: intel.com

On 2/4/2026 2:52 PM, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>    drivers/thermal/qcom/lmh.c
>
> between commit:
>
>    80883ce8b1fd2 ("thermal/drivers/qcom/lmh: Remove spurious IRQF_ONESHOT")

I'll drop this one because I think that it's better to use 
IRQF_NO_THREAD in that driver.

Thanks!


> from the pm tree and commit:
>
>    781b391557a74 ("thermal/qcom/lmh: Replace IRQF_ONESHOT with IRQF_NO_THREAD")
>
> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --combined drivers/thermal/qcom/lmh.c
> index b6b7f1193c441,3d072b7a4a6dd..0000000000000
> --- a/drivers/thermal/qcom/lmh.c
> +++ b/drivers/thermal/qcom/lmh.c
> @@@ -220,7 -220,8 +220,7 @@@ static int lmh_probe(struct platform_de
>    	/* Disable the irq and let cpufreq enable it when ready to handle the interrupt */
>    	irq_set_status_flags(lmh_data->irq, IRQ_NOAUTOEN);
>    	ret = devm_request_irq(dev, lmh_data->irq, lmh_handle_irq,
>   -			       IRQF_NO_THREAD | IRQF_NO_SUSPEND,
>   -			       "lmh-irq", lmh_data);
>   +			       IRQF_NO_SUSPEND, "lmh-irq", lmh_data);
>    	if (ret) {
>    		dev_err(dev, "Error %d registering irq %x\n", ret, lmh_data->irq);
>    		irq_domain_remove(lmh_data->domain);
