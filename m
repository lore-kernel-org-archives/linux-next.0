Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2A62F1FEF;
	Tue, 27 Jan 2026 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769493443; cv=fail; b=iviKcKVAQwMfpGc4AeEAbGWOIcU5pns1C7cMXoYKH+ZOiMNXSaZuGN8j/R7e3/mW1aFa94AynpSLhRn0/YWqCmEce8fjUMhZCt9UNrDE9UYQxftajM00LEyFYqs01WemlIsOmInwaLnKEgGnVR0/16t8GyEFf5SgVz9LYD0nvUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769493443; c=relaxed/simple;
	bh=EUQK/ZA9aMLGgCrXwJpDpVn6EKevXjVPeYAPOISPsCY=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=UO3gv9kiH3TEKoOereorzeKwBGS5GFBPGQePsAYxB52TKQ8iu2qfM4nphPoyz+Z7slbTnoo+ZTiKWMCIk4uUXFCRywL6Wf1ZOHWT5G2+fBAKtDc96Kb0RUq9OekrwXd4NkJ6UxmpivMeFRfV9zC/qav/acyy3yJkKinSkGkIWg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=be26oeBi; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="be26oeBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769493442; x=1801029442;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=EUQK/ZA9aMLGgCrXwJpDpVn6EKevXjVPeYAPOISPsCY=;
  b=be26oeBif0vmnN3NTEBLLaq/pqMgLCgAe1rdOPbdWh9jjcY06UQA2Iby
   OuVyZntQ34YTUfvmlhy7QrDKFgw4okjRo5vXO0u03YKycRzG0pUJ8vkRL
   Hpy7JubNMRZ3T4VDFyG7N7zdymHt48ZC/XqNnPIgpWESBKNK1VtoQq4og
   EXRQtJ4mmyD73GBZEKwXWBLwdjEq1HonD5NQLcy3qF7Nu5sPByqL5pJpH
   4bRAxPy3InEZCvutxNPKUKgfoXK51b/3/uFpr0nMxzletahfPXW9y7fYL
   DziWwVVrUQ8sD4sEMRqRZulhqGsrKZ8DMQwPSPzwR+7AHib3A9/wv1tne
   Q==;
X-CSE-ConnectionGUID: rHKeJAJST8ex7PQXfTA2ig==
X-CSE-MsgGUID: cH8MdXpcSfKbJFicgwOPZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81400161"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81400161"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:57:21 -0800
X-CSE-ConnectionGUID: +0mFEyHWRCG4bl1XoRLbcQ==
X-CSE-MsgGUID: C4bA+XkTSdKWtYYKPQIuSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="230833692"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:57:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 21:57:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 21:57:20 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 21:57:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msvmYZlBy3sCaWkC9aJVEXCZi9v8noRffftfGUXOs10vjvh305oUZptdJnVa0068Wu6BbYRx50xqrilkL1wLZi09rOe4iCaKTQxgNcu6QiVcjAC/XsCF9sDVJWwtKdj9tj3JOHRKAAk+Wuw32fXgo0+Ahe72dWz9T/gE6z3tCChr6SKAeRc5RnvvO2R0LceU1nIjZEgNLLiUfLwQC3yLUPyMGlU79PpFfEwX7dxt8MlBiYedSuDgmGvTTGwSDrBHksGxs0QXgDTrQoVWqZ2y5sKEBf8GbtBoaLxRTx8QQR9AETXi3dkrfz5ebR5Qs0fKlxfXbzC/w6++ryPodF8VAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1vMhmOmKrxJ6GaUwlW1JM93sY+7Se7yzi6RmOfDo/w=;
 b=h6jSFYedVyZN73C06GttKhWsxBXgcZIftzXpQ321tWky9NX3aVEdvFY7/5C1W57jfmfWv3Xa4VZwRo2QW3871iR6UIsPtewmrkgCrPCeP6AD8yQcOG/G8h3tTPLRroFFV9a4PE3BSGzDPFDzD7VnohZMVF+uzQaRbOszwGbzvYbSInplKAhci/CGdSVp9sXEtcmST8Y3wYBzV80TEfOy4nCLztQhENrfSfONwV7nzJW89rjNUfYGoZeCfxv01UAis/YXFZEvbHTfafw5akTMhXejmV2/Pk7XWlwJ0fHLKD+xEUX6F6sSAGcoFCXhMY8r6qTOk+PI9eHClzx7GGODsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 05:57:15 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%2]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 05:57:15 +0000
From: <dan.j.williams@intel.com>
Date: Mon, 26 Jan 2026 21:57:12 -0800
To: Mark Brown <broonie@kernel.org>, Ingo Molnar <mingo@kernel.org>
CC: Dave Jiang <dave.jiang@intel.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Smita Koralahalli
	<Smita.KoralahalliChannabasappa@amd.com>
Message-ID: <697853b8ea075_1d3310066@dwillia2-mobl4.notmuch>
In-Reply-To: <aXfvyADHrlh2BWxJ@sirena.org.uk>
References: <aXfvyADHrlh2BWxJ@sirena.org.uk>
Subject: Re: linux-next: manual merge of the cxl tree with the tip tree
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To SA3PR11MB8118.namprd11.prod.outlook.com
 (2603:10b6:806:2f1::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8118:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: a45b17cd-72da-4624-39db-08de5d68eba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cC9mc0JjbVlyN2lyQWtwT084ZlB0dmw0cHM5RTUvRXBKWjlKVUhrYW14ZFJ2?=
 =?utf-8?B?WFFzL2hjZWpGV0NaQXdaWlMvRWJDZytGbVJKUDRLczFTaGZyaDEzZzVLdGZB?=
 =?utf-8?B?Qzg3RklIQTZEWng0NmtwdlJhSStIeEtWRFJ3eU0yZ2gzaDB2b2lpelZTUVNv?=
 =?utf-8?B?Rkw5VzdxZnZsaURLRm5FOEtZdGcrOHdPMklpRmFwTWtwSFMxVzdvRFpud0pK?=
 =?utf-8?B?Q0cyYTBUbnM4RTRIbHpOZERENThNQmUvRUxDM1pzcXRYU1dJUUZnUnByL3NK?=
 =?utf-8?B?ZWwxMC9aTUg4cWY1VnJQTnJ5MXluM1d3WW5MaEVRSG93MklqS1JqMXNhcTll?=
 =?utf-8?B?OE5ZZjdmb0lac05sRmUwOThNUjRBLzM5Z1BWbGJBbkxVUlU0OFVHQjRCMXdS?=
 =?utf-8?B?OUVsME51VE1rZXBBblF0WmVSYVU1SFJVNXBMaGN2VlYzY2dNVDJ6R0JFaGJa?=
 =?utf-8?B?Z2tHejIrejJoRGUwcDFwdjN0VjZSSVh0VlUvVEhlajI3ZTNNY1AzZWFYbllj?=
 =?utf-8?B?a24zL1pSZjZNcHhEODVnRjh2Q2V3RGM0dWtrZTZkdE9reGxYdnBoaWoreCtx?=
 =?utf-8?B?emV0RnJOSGh3MnJhczJqYW1DZE5pV3FKbkZ6d3MrekdoYmZZczNrZXVIVHlq?=
 =?utf-8?B?dStiSVlsSFdlejljU09nOEZBeFdrNVV4WmVPcWhnc2c3dXYyT1RlMGRLRzYz?=
 =?utf-8?B?S0Z3dXM4VWpZOXZ3YWtETEZKdGVLS3JKa0I3bFNJM2pLWTJsRDdkempGekZP?=
 =?utf-8?B?dFMvcmxLNzBaTGVJa2xIZkpXczVkbUVQSTI4cFJTSWkwZ1FDYnhLS3NSTVZx?=
 =?utf-8?B?THQzdDJiMUxJbi9wR0NNNE1INjdzeEcxRU4rN3hxL2J5VE8wTWM3cVhNcUp2?=
 =?utf-8?B?WjhjQ3czdjh5UU1HOWQ0UUduZTFkZXJKd1dIRXd1ODNxaXpDa1dOeFZKQlNK?=
 =?utf-8?B?dVdSSWljR3dJeXE3TktLZnpac3dtbkVMUVFKZm5zaVd4T3Y3NEc2WVlsd2lu?=
 =?utf-8?B?SVlLTlFBUUNpaGlLUXRUeGdnMURFQThJMTRPK0hhUFVqYmxHY083dzIvdjND?=
 =?utf-8?B?Mm1kb2xCQzRDVlZzekpjU0RUYzBZbjJrVkNpK0Mva3ZtUHVvWi80SnNnZUpF?=
 =?utf-8?B?VWtaNEhwVlN3d2oyVVhvZFN2VGVEdnRLa0hZTlJabmNHV1RobnQ4b1ExWWUr?=
 =?utf-8?B?YWJuMUNMeG1FL3ZEa2lhRUFjSmhSUDZnNkpFZVVacEl5SEN0TkhtUGs3dE1q?=
 =?utf-8?B?UktjTXpEamlSd1JtS1E1eHFLcnBRN0ZZT3owUTVNWmlNK25KS1VsUUgzY1Qv?=
 =?utf-8?B?a1lCQlhlZFk1aFcrekxzbmt1UjdHUGJKeG1WaS9wblg1SlpSb1BmNUp1WDls?=
 =?utf-8?B?SHc4VnVOQjZtU0o5Z0NDeFVQaGJSTU1UdVZiZ0tBZjJxSmdsdDVkWUhPWWds?=
 =?utf-8?B?TnY0YUUxSWVzZ3BMNjdSaE5hZVNOZXQ5amhsQzZoL3MxczR5UnV1ZGcyL0E4?=
 =?utf-8?B?WlRYRVBMY3ZuMEZWWC80ZG5USWZWSmk5TGtSWjRzRzdwVFZwZGFmVkxXb28v?=
 =?utf-8?B?TzYrR1dtTFFxNVlNamkvOHh4d2hFSTU2NHc5YUFWaDI0anBJeUs0dEQ0cVZD?=
 =?utf-8?B?a3AvUEN3eXdPME9wcG9MSHlJT2Q4ak51UUtRdGhMVy9nMk1lOWt5anVkRTVC?=
 =?utf-8?B?REQva1YwOTNkTEJqMlIzSVBCQWdNc0xMWFlCZUdmOFAxRU5vaUsvWkZYZDZP?=
 =?utf-8?B?YSs1Q2hEZWVqWmp4S29ITGtlMTYzWmJYNWErZndaRTQwdTFpNnhzUk1QeHpk?=
 =?utf-8?B?RlgyZ1oyNzBIdDA3QmZ3NkJVQU1adHdheG1vTVZMTnJpZGRJb2VCODlPQjRv?=
 =?utf-8?B?YnRWeWhYWjRvcENZYVdnRUJoazA0dEg5U3EzblFjblF1SHZZakYvbU5ZK1FZ?=
 =?utf-8?B?L3NBKy9XWnNCeWJUYi8yVnhBREp0RVA4NWZ1T1k5S282dExiR28wNGtZSEsx?=
 =?utf-8?B?YVBlN1BtS0FQYno5cndLRUp4KzhCV0U2SzRHN0NITDFyZ2F3OTViUExhV20z?=
 =?utf-8?B?a1V1TDBEU3hVL1BoSHJtMnd6RHZMNCtHWmFrSEU4R0o5WE90cEdHTHVJa0pq?=
 =?utf-8?Q?VGiAuyHgpc5C8OpUsskA/xXuk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8118.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3Bla1BGMHY4bTRkMkdVM3I5ZkZCeTd6eUh5Y014OEY4bDFtZzlpRG1waVh6?=
 =?utf-8?B?bjVuVmhRc0VJWWpiRGVWcVlNa2VEeDJwWGlDZ2w0KzREaUt4Mkg5QndQUnVz?=
 =?utf-8?B?bTE4WlRUSTZHSzJQTVdBckFucTFtd3NIQzZYMzdnS2NFSVJoSk4zbzhuQ0Iy?=
 =?utf-8?B?L1Fpb0NUTWsrbUU4QXJYeGtzRUFqMWNnRnZMMkhGOUJiV2RTRXQ4VEptTHBC?=
 =?utf-8?B?elhOdEhjQkVXOFNVNm5wcmVUYnk4ZEtyL2EzS0pHZklSTVBuTkRTQ0o5WmFT?=
 =?utf-8?B?NlNpUFZYRnRySTNEYllKemRIMmlzR2tGOW9OSjlLMTU0NGlCSjNqMHF3MHdV?=
 =?utf-8?B?WE5TbUFlTDl5b29sbUlXaGtSRzhIYXpKWXhkbzl1NGlDbmZLQS9pekhpcnhU?=
 =?utf-8?B?SlYxcG1jWi9ha3pyMnhLS1NQblpTMkdPcXpUeUYvUWM2anNqWlI0U0ZJaEsw?=
 =?utf-8?B?T0VTRlQxdDZmWCt2M3VQRUdXOExFRWl1NHNoOHZ5d1F2RldTUUZVSjNFV1hv?=
 =?utf-8?B?akovTGl0ZWFEZUx3U2tCUE85cDJ2TFRJSFZDRi9VWVpCYmRGNExEazNCS2NE?=
 =?utf-8?B?VmRrUkxDZ0NjWGZHNElIZTZWMWk5WEdxcW1oVlRITUJ6U3Z6djEyYi8rcSty?=
 =?utf-8?B?MVZyaEkwcU01TERhM3Y3N01RT2FYZ1BRd1NEOEhpcFp5UjBleW1uMlcvcTVM?=
 =?utf-8?B?NW5zMllzSmhZT1lzUndXSjhwMm9wWWxCcjlHSmVwTnpqb0tpMHM4T0xZRU9J?=
 =?utf-8?B?UW52Z2QxNm9sWVM2eUpyYnpzMU9QTmlYWGZVSytXRWNmVFpyakpSZ2E2M1RN?=
 =?utf-8?B?Y3krL2k2NFlPUE1QKzhXNk1QVFl1N1JOcGtrcXFpVXdEaW9Rdngwa2Z5SXcr?=
 =?utf-8?B?dGJxYlhtN0FLQ1dub1g5eXl5eDg4d0ZKTTcraG5lTEo1NFk4VThJaFNXNk1O?=
 =?utf-8?B?SHlKeDNYSTlDTnllTERFazFoTVdQMXVGOWNpMjZxaFprbjFjcm5wNXdCQVNE?=
 =?utf-8?B?MlBKUTdIZStGVXJHd2UvTWNzb05naUZEdldGVEFNYldWcnFxcXRpSWRZVXBw?=
 =?utf-8?B?WnRaM3M3N2VNbFZTdE8xdW8xODZNeHc0QnZCVU80cDdNLzN4ZFN6RXRaR0tY?=
 =?utf-8?B?Q3ZISVl0WXQ3VjVYc3p2OEs3VENJQTczL3JtYitkWmFmNUNKSE9GamRWOE1Z?=
 =?utf-8?B?SnVScDc1MUtoS0RzVTBEN3hYaXdYMU52d2orZVJ3bm5aRitLcHlpOVI0dUVO?=
 =?utf-8?B?dkxuZkFJMytjaVZjbGNDMDFpTEloWVM4OXFuN2VIaDZUcnQxL3lYM0JLRm1w?=
 =?utf-8?B?OGsvL0FIcmFzWlQ5R3pwdkJ0NWViNm1NWFNqbW14UFlKZXhORDRITnFmNHRz?=
 =?utf-8?B?QUxNd3BpbVpBbjJoTHVjUTR5cEFaYlBiaUJ2NGw4QmU1VUxoeThVTHROOEVL?=
 =?utf-8?B?NHh1UXc0VzFydjAzMmFacHhaNUUycTVHcEhlWWhvdEVycUh0LzUybHNPYUJo?=
 =?utf-8?B?UXYvTkZwS2dtK0NHazZVRE83SU9OMGh4S3MydytwWmRIenVLSWNvc3c2Z045?=
 =?utf-8?B?QWVxcC8vUzVlclk4ZVdYYk5aRnJ5RS9aSGpkanhEdEpYYlRKbXppRGMrVGRw?=
 =?utf-8?B?Qmw0T3Q0cjVmSzhzY0pNQjh6RkxNdlhqRnNwelJMNW5SeHAwdVpvdkJaaFAw?=
 =?utf-8?B?SG5zME90N1BIR0xKdnJJR2JIVGdydnBvT09qWDk5TlpYWUhOb2NWQlI4ZXdG?=
 =?utf-8?B?Unh6YVRCT0JYYVpTclV6ZVhYM0FQdkhlUS80eFBjZ1FaaGtYYWJvd1lBWHYz?=
 =?utf-8?B?c1NIanYwR3g4S1Z6LzlGOVg2Tk9QQ3BybHFyM1ovLzJ3SEJkREFsS3Nmemxx?=
 =?utf-8?B?NXQwL0tOT0JGSzQrUkJ5NXVXRHl3Yjh2aE5vK0V4dzUxSGFibUFaVzJ4QkhK?=
 =?utf-8?B?UUR2aXJqQzNuSzBUR0VqRHFza0FXenBaWjRrTG4xUmE0Q1dqOEhsOWwvcnRr?=
 =?utf-8?B?bmYzZHc2Unk0aG90UnBTOVgraXpwbXRCUlZVV2V2WTAySCtCV1BPNDRhSzI4?=
 =?utf-8?B?N2xWak54Qmx3MTVvZmZaU1NQYU50TG9UQzVDUXl2VWMzaXhOOXZGZnhCN2Yy?=
 =?utf-8?B?UHJPSGgzZTZ2bUVQcUpwZExrRHgwY0hYckJadzZCc0NxQVNPUzUxN3ZHemhw?=
 =?utf-8?B?b1ZhZ0E3RklwUVI4NFNWSXhlaTVmUWpGdzJ1eFdhTkhQK3JPZzBxclV1R3N4?=
 =?utf-8?B?c2tQRnpwNmw2WWkweVJtajNoSTZ4TmNTeG13cjdLME5qeFlYeTdpUUJsVEVn?=
 =?utf-8?B?dUR6VGlIOG9OMjR6TUo1SE55SDlIekp2YVoxaWt4eGYvRTIrN1diUHlMSmJh?=
 =?utf-8?Q?Cq+uZVpnMyELGnoc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a45b17cd-72da-4624-39db-08de5d68eba1
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 05:57:14.8981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9peePyrJVZ9WAcfCMaefSVuikBR+AVccy/WokEz+QN2bGaK29991ej+G5YV9VNBd8w2picsBkll45ZHTbrba/0I323CzTxcgM8o3md8bIC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
X-OriginatorOrg: intel.com

Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the cxl tree got a conflict in:
> 
>   arch/x86/kernel/e820.c
> 
> between commits:
> 
>   44f732f3ec827 ("x86/boot/e820: Clean up confusing and self-contradictory verbiage around E820 related resource allocations")
>   dc043d6463bf5 ("x86/boot/e820: Standardize e820 table index variable names under 'idx'")
> 
> from the tip tree and commit:
> 
>   bc62f5b308cbd ("dax/hmem, e820, resource: Defer Soft Reserved insertion until hmem is ready")
> 
> from the cxl tree.

Thanks for the fixup, Mark! Looks good.

Ingo, you were not copied on the thread where this originated:

http://lore.kernel.org/69443f707b025_1cee10022@dwillia2-mobl4.notmuch

Boris had some involvement on an earlier version of this, but so far no
one from the tip tree has acked this follow-up.

Please let Dave and I know if you have any concerns. We have it in -next
for soaking and testing, but happy to reroute if needed.
