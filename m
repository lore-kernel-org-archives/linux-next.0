Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304813126D7;
	Fri, 13 Mar 2026 01:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773364701; cv=fail; b=iyp+dYXdQ2q1SloHEIs/sH3kfAPvZ/mECqEasl39yiyYdkuSJ7OzHgkZGMaKSiuXKY+kltixRGVqKBtD0DhDYFZta1fHF6ayphXh3dM/4UXARuB65j0HTbhEA3ZxalJtIjPwRp3Llf/wFOaHn5HfqoBDlnljPr36gb7cfxSrbPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773364701; c=relaxed/simple;
	bh=78ljUg1RfY8ZAyZ2B1Xm8YV217lxchixxdotRrovcaw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oJ1glWtNZ2GklNjVO72R/7MbbAskIiwG21xcTjSM5XxE/HH4CV2t0tyhc+vBAwP8wFnv/+v5sIHbTo0i+FgADmqJd8KeEpP24IpNDmbb5o3EVHQPT0carNWbRC2/DFW37xtr+Cny5jflPN3Fslqon3ygqjXsqBXtP0Vwfp/P8LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RebRUy8V; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RebRUy8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773364700; x=1804900700;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=78ljUg1RfY8ZAyZ2B1Xm8YV217lxchixxdotRrovcaw=;
  b=RebRUy8V3ui2KGhWf/u49vDk9uFU3Ie5UGUtvgyoAclbrXMxBQUvCJO6
   pHahg3kx37kMVR+Z1RI9IlIXgbzybtCt/5gUkbEbLFoPFbSEMTOpytFe5
   75ILRQtwxPm/qNhXoR71MhgDA//hKhXPlZP/SQtVcKfj9c58hVLpiDv8k
   8X7j18pq360XEBTkQ+k+988do3hyRdI1mjML0pk1lsEOrRN+8qK0RmV79
   EycIyBXwWYmDQdw/WRIBE4/wjP5Kp/tvXYrr6EeT8231Z+PbyNUYTW5MY
   5xhP0UH/fz6HSO+5WMGqvqvgxOFTWd4PP7m2KPMB9scVhkawKv1VGybyW
   Q==;
X-CSE-ConnectionGUID: vm9O4eEgSgqJuXLUl9zsLA==
X-CSE-MsgGUID: GQDYByGnRm2PdY1p+GpSbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85555651"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="85555651"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:18:19 -0700
X-CSE-ConnectionGUID: GLG+KOK2Rc6EARm+WePCZQ==
X-CSE-MsgGUID: 3PUJasOzS2a/6V2F9IzSxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220955189"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:18:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 18:18:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 18:18:19 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 18:18:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5phk606yN1SeyRTZ8++jx/MR6/Lp5UY6XYZDvoZILZh8tjEMyGvAzuDmXLRnhSp1Ac0XcAB+kvq1174NUnEm4SSWkyRHdlRXj3FOMVfxI4oO5ab6V55qDzS9l8ySAAEeDGunnVHbhhF0/C+auhqozgCYxJIgz89ALRMcUIkXQewszuWMaBn+1+IrL2cQ36qNcVfxm6ZMGana53xkja01MZwMObVPI2ZqG1jIoKZbGBSt7yKnuXOtXd9VQXGHQJcX/S/zBSKIYrl1heS1Ex8OrfMGpBYGAM1qhuRNSvOF7GXw7xEcpAd/7Tvf/xo0Fjv+WYWNZLajdeV1fXXi+JqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78ljUg1RfY8ZAyZ2B1Xm8YV217lxchixxdotRrovcaw=;
 b=GhAR1Xfwrp405apM9S6LGcOoJplgL6NHwdnIjiqHCwhACXhfRc8FqmZYlKk7fa3Npyl+IIscXanqY+qxM8WdowyDaCjIocHk6yADVDHG7O1XCocWggoRBa/JgwFWlgmv1EXtUA2BpXNe3JwDI0+q8KH8djSUF5JJgEvVSZmXrCN23ZdPlvW14bZsWISJzBfyUhE5mqWNMVeHjOMlci3tYQjXR3MWVtrFdoiQW/XTGa56MDmQJbhn5yl3GhG8W8CDDd+XhGe77iIB5eI1ptIytI5QyagviL7kBRIjgJPeSfIcQ9hT3BtMSO4dWmrbec97JXYm98cqOTx5RACs4x1BUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 01:18:14 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 01:18:14 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Nikula, Jani"
	<jani.nikula@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Landwerlin, Lionel G"
	<lionel.g.landwerlin@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Thread-Topic: linux-next: build failure after merge of the drm-xe tree
Thread-Index: AQHcsVgjSXnCwIeGGkSJUmrw+gl3PrWpksKAgAAPHoCAAAGmgIAAID0AgADCfQCAAEIAAIAA2/KAgAAHgwA=
Date: Fri, 13 Mar 2026 01:18:13 +0000
Message-ID: <992aac5f4172406f1437236a101d5b83ad2cb1e1.camel@intel.com>
References: <abFpM1FHgzgARB88@sirena.org.uk>
	 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
	 <abGv-5kXSCtOTO8M@intel.com>
	 <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
	 <abHMaBe4Wo_PH4uR@intel.com>
	 <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
	 <b7f67081-7b8f-48e0-8f9e-bcbad47165d6@sirena.org.uk>
	 <abNfbWemfOKGNrVZ@intel.com>
In-Reply-To: <abNfbWemfOKGNrVZ@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA0PR11MB7752:EE_
x-ms-office365-filtering-correlation-id: f1e4bf3f-3104-4ee7-0980-08de809e6633
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: k2QS3gzTG92vniOOtpqhSRB72tp0qt3iBoHTxtLnH+ej7kHJnbvh+p9frYJQvHUkJda6lwjJPUEks5yKVRBpkXr6YBGP+yynCPmoBM1WDlEelibOYJlFIr4De6CRBpACbnb8mBOk9Muc33Qd2S2cwRoI8UyEmGOQ0EzPUViLUw3251+rDh9Bt/BLugXY13urE06sTc84r0YTIchOl2OHd62qrkvV3nbEW9Jhf88DyIk4iX9PwpSBYuDeJhMvCOUyLv6PRwK5gDmzr8J2dFcEsOtob3DuHEnQopYWegMDcWCS9s9roVSNyzsCIEuoByiRh9ZIUwKHnYkufEaJCG8XUA/cs7wCtYzfEjtirXJwbScXqpZWxWTayxS9iKDpR7iMazWs1NsAhphgY0sAtqfvNm9Arv+h7aqnoOvzZSHyUY3ImIid7TQempX2bYCukY8STIaS5MqYcPMTbovwM+62Fett73Gz77XAFRtDhm1QObi7XSy0J3cmRI09EafRjlItU5qHxw2Juzb8oD10tzv9aJ2uYgGelYRsnnMPIK8b4E1AmLkKIauDrUh4zx6kk9oW/g2e1GVQaMOmgnyEI8cPAuGuNVJL0n6FMiEdCYyZd/bMUM3UMNVCPOayPsb4mq+dHfuwKGRfAIEYlwyCqznmpPLDvEZb1QGnVUtrpSoTZX2ZQr3d4wp/oomxjVTdgzHhQCjjsqEXHYsEkoPZ9/Z5/CBWjai0IBMgBazQmQvfzpXynEKerJvQc0c4O/bewtR/UnTWQm81JgGIQq115Faz8obj3hWLQkjsQqvr7+nWuZw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB8179.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWZiT0lYc2ZMamljZiszc3pxMDE2NURSM29IZjlLcEExcUUrRzFaWWNOZVUw?=
 =?utf-8?B?ZEltd3orc094bURVbndZTGdmMWdBMXdkVERvKzJWaURNNXZPTi9mUEdMUmdE?=
 =?utf-8?B?aGEvemxSa0V1QzBHcU0yVjZpU1RsR0lzOTNIR2M2anB3TnVwMVZTbHhldXRP?=
 =?utf-8?B?dm9pWTN1US91NFRjQlhwaVdEWllZbXRFSEVXNXk5dkNIeWg5THZiVUhWTktC?=
 =?utf-8?B?MDRsaE5qLzh1bnhwSVp5NGxDczd0UVJQcjNQRUlYbGdqUW5INnhPbzhLbnpQ?=
 =?utf-8?B?YXdoRTRkSWxNTlp2ZWw0QTFsRDRHNzlTdHdBamtrRTRSSHZDYmhkV0xUblQ4?=
 =?utf-8?B?aE51ZSs2N3hkd3l6T3BQNk5hSEpIYXd3bGh2dVQxdy9iQ2VNVzhIZ25RaUN5?=
 =?utf-8?B?VzgvUUowYTMvMmtmRmx3RDZsZzEyWTh2RWVPaWQxaXFEL0h2a2YwTzBGWTdj?=
 =?utf-8?B?d1VkSEswdGVYUGxuTHliODM3aG1lNUpsM0gwK1I2QzhUVm05ZlVGVGZPaEVZ?=
 =?utf-8?B?SUxNeE9ucklhUXlGMGZ3WTdCWHE1b05JWEE0MVY2MWNYRU5PUXkwMVhibUta?=
 =?utf-8?B?dnVOa2JvTjhRYlBXWFdJY2hzQld6eFFTUndYNmU1akI4aHhKR2RNTThRWGRl?=
 =?utf-8?B?ZHoveUFCZVR4dWUzN1pjMmxkZ05wWHJiR2V2cWV2bVlvWll5UEdIUmVXY1py?=
 =?utf-8?B?NThUcktoYnFVUVRuM1EvOG1mK2VFb2R2L0ZtTHhLRmtQR3lLcExUL1RIVnJy?=
 =?utf-8?B?REtHVUJQalNIRTBMZDFza2FlNHJkZHNiekorTEthbWRLM2RTdDFMVlNSSmlh?=
 =?utf-8?B?ajJFRzNNYlRueEFqbGRJVVNiR0RFS2s0Z1J6emRiWDBaa3lMLzRGenAwU1o4?=
 =?utf-8?B?dngwak9wZ2xuUExRRWpLZWdpdWpYam5KbE8vdHVESUhCS0VVaHRCVU9ncUhO?=
 =?utf-8?B?eW5vMHlhSk45azJtQ0I5RVJwTjIzend3a2RBdy92RFMrN0oxdEtucjBLdGNm?=
 =?utf-8?B?OU1KMWVQMmFEUjB5WGZ5N1NvVFFoa0srOXFVakR1RGFadG9CZGI0QUwvYW1O?=
 =?utf-8?B?bGRLZC9GeFhBc3BVUElpbVNlWlpOc2FmV1Z2NWgzQXUrcFBOS2Z1NUdwaUVN?=
 =?utf-8?B?ZTJlSXN1Y21OUGdkNGdaMkhhWTh1ZTlaQThXeDkvd05hdU0yOXFpNVNmZ1JT?=
 =?utf-8?B?UzFTS1IzTlZJUy9FbEJmTE03c3J6S1diMFY3aTNPamh6ZHk3cGpERUJLcmZl?=
 =?utf-8?B?SkZnNzZQcDhETldoNVh2VDVUemdDUHF5ZFNXY29EZXdCNHpYZVB3WVFKS1Fr?=
 =?utf-8?B?RkZZQ3BPVUdvSk9nNXZCM2xCeW9YdDBQeitoSWRMS1N0b2x0ckJYUmM3aGUz?=
 =?utf-8?B?T1EyZFhZbkJ5cktiZm9VaUxjVFQ1N21YaUx0VkFpVE1HeTlnVTJEakVnZ0J3?=
 =?utf-8?B?RnpuY0w2eUNKQUxNT1RUSmZ0VVNsb3FHcVRxMiswcEVMYzJuQkIrK28xb3lG?=
 =?utf-8?B?Ym5lNFZxc2JCMVBOZTduR0ZRa0NPTis4SGdRdjVXTTVLOUt4bXNCWEZ0b3Fz?=
 =?utf-8?B?dFM0M0d3M2djcGZsS3I0bkpSVEc2aVFIRkFNeE41L1laMW5KajBLOFFTL0Fw?=
 =?utf-8?B?V0lOTUk0WllQanRrakpzVWpmdjQySmhDRlZ4L3Rua0lhb3dEZUZ3czFOM1pC?=
 =?utf-8?B?djYraWhncnYvZFBFZWRQZi80QlpoVy9MVjBNcCtDQlBxM3FjNWlFNE9mS2NB?=
 =?utf-8?B?OFNDZjExQWtNN0xiYjljWVcxYW9UNWpSbGZxNGVDeGRZMXNKWUhHYlJ6NzBv?=
 =?utf-8?B?cndEeDVvbU92UlQ5QkdqYlQvRnRqdzJMRnQ5anBUQTg3RENEakk0eStuL0gv?=
 =?utf-8?B?ZllzVnI2Mk9FeDluY1ZFVGlJYkxNMFloYTVndnc2Y3M3VVE0R0s1alNpMVBw?=
 =?utf-8?B?Z0hYdlYxUlJvTlROUkhzTlVKa1hNMktyc3RKdmpZRkorY0J0Q1RsbC9JUlNw?=
 =?utf-8?B?L25Mc0ZoRmsxK0QvQjUxSDMra1NqeFFKSFR0OHRQUUEvU0RBdTcxSjRsa0FP?=
 =?utf-8?B?aVIraitIS29WemNObTVFYlpyc2xnQlNyOW8yT2NUaXNqcUZvM0NlN0tKT25F?=
 =?utf-8?B?QXlBMTVWaC9nN1NYdjFBTG45Qjg4ZHlvR1dQcTl4bVVDb0pkcjlFQmZqamcv?=
 =?utf-8?B?T0NEYzZCL1AxZ1VXU3hyMzgvMm5wYjVKZ2xpbm5ucWRQWU5xekg1eC8wSTQy?=
 =?utf-8?B?eFBSaFRZUnBhaGZISU9YUkhKV1RFWEZhY285WGtsTUFXKzdjR2VuN1RKZGoy?=
 =?utf-8?B?U2RoWUZBQ05FWk5Ubmpqb3JFV1BiWElPRzF0N3dieXM5RGd4SmJ2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42C95546F7FE32409B85F1040F6CC27E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uSpr84sn3Y/kKE3UTdOGJso3/mIVfMVL+G3a7VuOjRFAykEEVH1mz2As5T8o2L3uTU/W63EZO13CD+rcVNI6NsHbPPxKN6nawaWsANbaMoDhrjQXyq2zvSlkP9Oi3aWTH7lrt5ogARp7VLXggLUmfvk42ZGHhsuVp2HA1+HJ2eZyxPt6SAW26UxdtyB7ItkdDdgKnUd9qaJ1qMd3CylrM409z35jk1klftsHbfpx3NcCCkoJrNl3rnQ7RFdW1yYibIWdGDWeIPtDIoaGEMEItkxil8l4dChDlF/C2Ixe5gC6Br3ruSSYqquJPqJFNI244KaiLzmDur6Wrdxhr5zOZg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e4bf3f-3104-4ee7-0980-08de809e6633
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 01:18:14.0592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5vQj9L4JBHqEL0+wvMJvWXflASBqjThhRz3IIv1/sRsT6ezYDfZ2dR4BpVLqHBtJpe2Pz7uvvLROm7fJHq4B4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTAzLTEyIGF0IDIwOjUwIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFRodSwgTWFyIDEyLCAyMDI2IGF0IDExOjQzOjQwQU0gKzAwMDAsIE1hcmsgQnJvd24gd3Jv
dGU6DQo+ID4gT24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgMDk6NDc6MjZBTSArMDIwMCwgTGlvbmVs
IExhbmR3ZXJsaW4gd3JvdGU6DQo+ID4gPiBPbiAxMS8wMy8yMDI2IDIyOjExLCBSb2RyaWdvIFZp
dmkgd3JvdGU6DQo+ID4gDQo+ID4gPiA+IFdlIGFyZSBpbiAtcmMzLiBKYW5pIG1pZ2h0IGJlIHNl
bmRpbmcgYSBQUiBpbiAyIHdlZWtzIGZyb20gbm93Lg0KPiA+ID4gPiBTbywgd2UgbWlnaHQgYmUg
aW4gc3luYyBpbiAzIHdlZWtzLiBXb3JzdCBjYXNlIDMwIGRheXMuDQo+ID4gPiA+IEJ1dCBpdCBj
YW4gYmUgc3BlZWQgdXAgd2l0aCB0aGUgaGVscCBvZiB0aGUgbWFpbnRhaW5lcnMgSQ0KPiA+ID4g
PiBtZW50aW9uZWQuDQo+ID4gDQo+ID4gPiA+IExpb25lbCwgd2hhdCBkbyB5b3UgdGhpbms/DQo+
ID4gDQo+ID4gPiBJcyB0aGVyZSBubyBwcm9jZXNzIHRvIGRlYWwgd2l0aCBraW5kIG9mIG1lcmdl
IGlzc3VlcyBxdWlja2x5Pw0KPiA+IA0KPiA+ID4gSWYgc29tZW9uZSBjb21lcyBhbG9uZyBhbmQg
Y2hhbmdlcyB0aGUgYml0bWFzayBtYWNyb3MgYWdhaW4sIGRvDQo+ID4gPiB3ZSBoYXZlIHRvDQo+
ID4gPiB3YWl0IGFub3RoZXIgbW9udGggYWZ0ZXIgdGhhdD8NCj4gPiANCj4gPiBUaGUgdXN1YWwg
dGhpbmcgdGhhdCBub3JtYWwgdHJlZXMgd291bGQgZG8gd291bGQgYmUgdG8gbWFrZSBhDQo+ID4g
c2hhcmVkDQo+ID4gYnJhbmNoIHdpdGgganVzdCB0aGUgQVBJIGNoYW5nZSBpbiBpdCB0aGF0IGFs
bCB0aGUgYWZmZWN0ZWQgdHJlZXMNCj4gPiBjb3VsZA0KPiA+IG1lcmdlIGFuZCBiYXNlIHRoZWly
IG9uZ29pbmcgd29yayBvZmYuDQo+IA0KPiBXZSBjYW4gd29yayB3aXRoIHRvcGljIGJyYW5jaCBh
cyB3ZWxsLCBidXQgdGhlIGJhY2ttZXJnZSBpcyBub3QgYQ0KPiBoYXJkIHByb2Nlc3MNCj4gZm9y
IHVzLiBXZSBzaG91bGQganVzdCBub3QgaGF2ZSBydXNoZWQgd2l0aCB0aGlzIHBhdGNoIHRvIHN0
YXJ0IHdpdGgsDQo+IHRoZW4NCj4gd2UgY291bGQgaGFkIHB1dCB0aGUgYnJhbmNoIGluIHN5bmMu
DQo+IA0KPiBNeSBhcG9sb2dpZXMgZm9yIG5vdCBpZGVudGlmeWluZyBlYXJsaWVyIHRoYXQgdGhp
cyB3YXMgdGhlIGNhc2UgaGVyZQ0KPiB3aGVuIEkNCj4gZmlyc3QgdHJpZWQgdG8gYXBwbHkgdGhl
IHBhdGNoLiBJIHdyb25nbHkgYXNzdW1lZCB0aGUgcGF0Y2ggd2FzIG5vdA0KPiBiYXNlZA0KPiBv
biB0aGUgcmlnaHQgYnJhbmNoLi4uDQo+IA0KPiBUaGUgcHVsbC1yZXF1ZXN0cyBhcmUgYWxyZWFk
eSBoYXBwZW5pbmcsIHNvIHdlIHNob3VsZCBiZSBiYWNrIGluIHN5bmMNCj4gc29vbiwNCj4gdGhl
biB5b3UgY2FuIHJlLWVuYWJsZSB0aGUgYnJhbmNoLg0KDQpDb3VsZG4ndCB3ZSBzaW1wbHkgZGVm
aW5lIHRoZSBuZXcgbWFjcm8gbmFtZSBhcyBhbiBhbGlhcyBmb3IgdGhlIG9sZA0Kb25lPyBXZSBj
b3VsZCB0aGVuIHJldmVydCB0aGlzIGNoYW5nZSBhZnRlciB0aGUgcmViYXNlcyBhcmUgY29tcGxl
dGUuDQoNCkFzIExpb25lbCBwb2ludGVkIG91dCwgdGhpcyBtYWNybyBtYXNrIGlzIHdpZGVseSB1
c2VkIHdpdGhpbiB0aGUgWGUgS01EDQpkcml2ZXIuDQpXaXRob3V0IHRoaXMgYnJpZGdlLCBhbnkg
ZGV2ZWxvcGVyIHdvcmtpbmcgb24gYSBwYXRjaCB1c2luZyB0aGF0IG1hc2sNCndvdWxkIGJlIGZv
cmNlZCB0byBkZWxheSB0aGVpciBtZXJnZSBmb3Igc2V2ZXJhbCB3ZWVrcy4NCg0KPiANCj4gU29y
cnksDQo+IFJvZHJpZ28uDQo+IA0KPiANCj4gDQo=
