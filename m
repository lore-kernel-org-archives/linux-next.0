Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C423E63AB;
	Wed, 11 Mar 2026 18:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773252991; cv=fail; b=BK+KaEDPWDQAYluJcks4JP9deWANMdGmxIM6vAN7FqYcMRfYdg6gT2nK0sTF/8nJvTHTqODCC+C2+m/UrNX+t+EoWPaC5qMAR2gZWbLzaJ3LrDWoSDQDSCTn7/AW6zfE3pO9u8qOttFnUE6w62vGGM0W7ArGMsZwMbFIInABV5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773252991; c=relaxed/simple;
	bh=n/ChR5mKFwsOqScMRyd0c6QtbNYBJrwRGKBaI7C8C1k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hBo2zu0mxSVJG3PLLFORifJgN4WSIQ1hWlcw3DTp9hfP2/pLzj7bnhwvh7XmJqF1+ynKrPVBKelWDZK7qGcUQvDxGUkiYaPU0EB+8s5RL3zdaZisE7Q3D7RGn763hyl1Q1KAlphiCIrgcCoeOl4c/4d3SzJ7qFz97UGTRsa6chA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNUj+QiO; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNUj+QiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773252989; x=1804788989;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=n/ChR5mKFwsOqScMRyd0c6QtbNYBJrwRGKBaI7C8C1k=;
  b=eNUj+QiO/Ty+5XqABheSlG1GIf/VfJGqUwUiQBdCK871WICzh2Jen/D/
   izSl614af7hgREPK0QH2liUx0h33LXPnpkwm231zSdgbfS8tdIuzeghAL
   XpwaotNqiwMQ6I9q8chK2dJHlGCXF1RwqsAadedoyJSEYIPCRMGobIO34
   qLbywl+j0ZVz3s4Pgn3PQ9BvaQBYSRPNRx0oisMYijih1yxnE2V8E4p4/
   MLYKDQbiN+Axv9770N94+jyHiKfXCdKY7k1Ff1KfE5ikbNtfIRxm61Z+s
   dgdxDnWZkVrTD3LKcRq3ygMp0HpF1NpsWN8KRtBEqdladhlzw+vpli07N
   g==;
X-CSE-ConnectionGUID: IwOOU4ykQjGfsuNEL+I0aQ==
X-CSE-MsgGUID: vCFdVEZxSUmQFupMB/GVtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85035854"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85035854"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:16:27 -0700
X-CSE-ConnectionGUID: 7bsydNQfSYanTTeMhMTVCg==
X-CSE-MsgGUID: DayrzhU/TOi0FmNhLKCLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216772559"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:16:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:16:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 11:16:25 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaTv1E0iMQrDYqUo9tMv81xVp3aR1N82kM4D5cMo578pv2gsM7oyyKUD+SCJ6vycmoSYGPnHSaSwYFguQE2zeyW+eQUgMLkQ1B2/ElOeIY7JBzVDUePMUGnvtJNkvDy+qN7haZaoL+OztXtr9z9KPiWyM2YhD85yfn1OuuSeaoLmgsRelLfFgPalvU/jsKsm1tBKHwdmTcmS4eTouyfFGIFG3iojsKABPjwroeH9d0M0wFalsbie2eRc9AN38ndzlHElHMr9T1ClKOVWhGG52MCbiuu8hMhYq9e5TBzttfiMOJ0teDRzjEFgX08j5LeB/FP88b7PyMWzDrBxfiXG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/ChR5mKFwsOqScMRyd0c6QtbNYBJrwRGKBaI7C8C1k=;
 b=nKfERG1ca2uGlkIMkjT7JkAq4dIhIxr+0/vvMX1v+wmzKVSuO7e3l4A8f4wNvYCGfkh39XrQhAGI4fjfitGRL15rirgJUIFulyFTIvDh5A27JPbvIAlB6STuOnc0bLcyhMrSOhqsTgcXS8M3wVgKL+zfZWZzd0Xn0ZmB/tyJuLdVI/PWr/8J4UFtBSVogOBGX79ZMJz7ktvgoYIwixQcgoDDU6Tul5BEAc2mN+hSYuHFrdJK4efy274tHkRe4Mydy6ANAuU3C5Q6Aur/1UUp3JZfUdS95Xl3nRWsVVzyXK7KUzZJINiPKZZfkHd7lSVdWq8L2StqUGn9ft943YKmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Wed, 11 Mar
 2026 18:16:22 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:16:22 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>,
	"Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Thread-Topic: linux-next: build failure after merge of the drm-xe tree
Thread-Index: AQHcsVgjSXnCwIeGGkSJUmrw+gl3PrWpksKAgAAPHoCAAAGmgA==
Date: Wed, 11 Mar 2026 18:16:22 +0000
Message-ID: <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
References: <abFpM1FHgzgARB88@sirena.org.uk>
	 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
	 <abGv-5kXSCtOTO8M@intel.com>
In-Reply-To: <abGv-5kXSCtOTO8M@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB8370:EE_
x-ms-office365-filtering-correlation-id: 0ff7580d-fd11-4fc2-0fa7-08de7f9a4cf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: tgGWCm39gJnIqfls3POSuGgczOyyjJpAPyLN+yVF0I3byQ0czOGwfRV8BqAECU2ws8Bm9X52/Ajte60r2ht95V7YdaO0/7VnpPxZHH1l79by8Cpv8deO6o92Kob0fNrROS+UIn6+M0fIp05Egm9s2wBkIaV90N1slD6Knt1ObscoeodyCZr0dBHsyQVONAcrnQTxceZmns+BIqVSR/yIbC1yVSHvW1D0uL0lifWJ4qHRyb5N1pqjzg4Gt7l1+qPypIgBLTvfRfOblH/Mx/yPX8T9TXFlxFybhsHfaYf+xsEjfscig7vdThS30hMdBzKtEZcMB5iQGkuOAQdMLe7kOnK08uIEPaevHsT/wZdiZHp0cKYA59+VBN1spMsE0VCYwJ0VEmTxFHPfLkc5ZY2ulspy7sd8818zvHIFP43bY8eKpTeBIEwnB1MsUFjeWBAJt6OjB9c+HZRZGhqQaMOfb/7mvQgcjv8wmCWawkYR/oMZi3c66zVzEojkEvJXpZmBrwF0gjw2Hwtr55yFTYKzFCxuyaCne9xkCz8U6Fk7VIbrcAar8z84TpFfhHXV/wV9THFoTjWsxdlC9uKaOWPQ0AcOLiAua6jZDiZwWHvY3XHNGaZle05stdZ5XEcfLgjfCMrxhuH618KVO2ElOtyE9j3Ghukwxdz/jF0F7fCQwlbO2UW0oWccjRxyfJ238HvcNyckqjsR058rD5m818nUr4upSVSMqLVAGfRBUHivpjr2wMlJ/kf1qKv9uUcShaEWT2UtArwZhApmbzA60dSaRRrvMxH0/AaxWFKfVQqvPtw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB8179.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VS9lNGhTeDRVQUtQaFU5L3pmWTdMVlUwdmI3Q3d2T3IzaTl3YkJ0OXg1VTZY?=
 =?utf-8?B?OWFWcGlXOEJxTm1uakdCNWxKdXFaMSs0MGtqVDNnaXRmczFlN3A5VGxwNExy?=
 =?utf-8?B?U0J4RVZ5ZjhrK01oVHZaeXBNekFSV2dCUTB2bmFVZEJma1lZQytNTmhla0xR?=
 =?utf-8?B?Zk9aaU1TSS91ZUZCMCt1Y2dzdFRBTjBOUnpzclpqYlQ4cWRmcXRiZC9PamRt?=
 =?utf-8?B?eHRBNzJXbEVub1dLNzQwZDc0QXlNUjVnS2xOcFZ4QlZwVzNpVVoxck5Bak4x?=
 =?utf-8?B?MGhidFY3cE5BRVFUa2czbTZwUjJwdWxDMnRWL0hOQXpNa0tzdzNEV3cvNGZl?=
 =?utf-8?B?RzJ3NzVyMEkvaUQycC9PakFyNmcwUEhDU3A2YU1QazZESnJnVUlXb1VWbFlV?=
 =?utf-8?B?ZEg3alJCeWFvanlWVHR2R2RtYlpKSGtHS0RaMVFYYWM5bThjcDRBaXUvNURH?=
 =?utf-8?B?SDdkdWlsdHN5c3E4MTdDNXJtM25oVytkY0xpYVEzYkx6bnViOW1QRGZCdS9P?=
 =?utf-8?B?bWJhdjJwRGhqSG41R25NWXB0YmNsMjU1N3RrUFhiaVFTSnRuelRjRzVwallH?=
 =?utf-8?B?clE5N2p4WEJkcStvRHZseW9TalQrNHpPS3ZyM0RXaVMzWUNreGpTc0JaazQ2?=
 =?utf-8?B?dllTRzZtdGRaTHEvcVlrSmdsZmVoQkZ5MHMxR2YyMGtheVpTdlR5aFZlSUtB?=
 =?utf-8?B?L0VvWU5naXBoeUVoazN6cnY2L3hOYkJMY3VCTjQwekNvaVdXRUszaURjK0Ja?=
 =?utf-8?B?aW9LSTgyeTI1Zyt5MjkzN0tFZkl6UWUxRkVGVzNwQVlVSW9KVEZIdy9oTXlG?=
 =?utf-8?B?R3F4eUdGT1M1bGFzTFNjamphZjl1UDQ3OXJxbTZNVmVnYlhMRmpQVWZnazBJ?=
 =?utf-8?B?OHZLZGRpNlhWKzNQKzBrTnFsbk1BVUkwb3k0aXJDZUNRdXlKbHZVVmU0UjdV?=
 =?utf-8?B?STZ4UzVzd2dEYWdINGJEZC8xakZFcitQdU5GM2p5VFdVb3lyZ3ZOc0VsKzNM?=
 =?utf-8?B?WDltMC9YUkN2ay9XQ2Z2T00vVmc4T3lQSXd0cS8vNU5TVC9xdjBnUDhzWU5Y?=
 =?utf-8?B?ZExBKzRMaFlJaUs2Wmp0UmJVRTZEdFpaVStKYW4wRmhVZWl6d3lmNHBTdzUz?=
 =?utf-8?B?ZUl4Zlo5UlZ4bVNFK2xlaWw3cllRRFpOdm02cDFjNHJXaHRIN1l6SENhbXJK?=
 =?utf-8?B?UkNZYlJsOUF5a2szcjE3QkllN2twTnlid0NwRFQyN1dvY24ybWdRS3VZOEo2?=
 =?utf-8?B?ZFg1MElBbDlxOWJkY2F3T3BLenZsU1hUeTZPKzVuWFhtZ2hncXFDNzhIQW14?=
 =?utf-8?B?SUQ3RUlxbjlhcjRRUkcyWlljV2U5Tis3VTYxOFA1bG1YN3pNTFVYUmtKSTJP?=
 =?utf-8?B?azhwTzZyQm1YZExGY2VKNHRZVjhaaVFpQ2QyMnVXZGJITjFyazdKbVFjT25O?=
 =?utf-8?B?cVVxbEJhTnp1cWpHWk1BTE1uZitiOFJUSWlpWXpnY1ZCOElqNVE4QytnOWtP?=
 =?utf-8?B?ZnN2V1BnZTAvSzAzK0RQa2tnU0Rma2VNRW5LM1lxZXBBSVRkc1NyemNJcWQ3?=
 =?utf-8?B?ZHpaUWRQaWl4UW5uWVFVTzFEU0l0aEY4N1JRVXRwcFlHWm9LKzJkQkJSOTZD?=
 =?utf-8?B?NUFTQmcwQUlNVkRDb2xjYlZvQnF1UHBjUUxnbWJuM3EwbnlaQWpPZkh1dVBE?=
 =?utf-8?B?QStKMlFEdWsrYXRRbkFqZVNYMWlISDNWSnpPSTdPVGljdzY2d1RWVUNteVpr?=
 =?utf-8?B?V3UyS3BIYldCSjgrakFPbzZKTFcrRk56K0JaV1A4WUpVZEdpSWlkUFI2d3JU?=
 =?utf-8?B?SlVsSzIxb0xPNG1jN0pmME1BaHZtL1d6UGgveHZqQU1wdmhZYmtyeUg5Y21n?=
 =?utf-8?B?TnRjSGtJVXZodVYzWjIvb2YzV0p1aVVLVXdhdU01dnlPeWVXS2RhS0oyMTVz?=
 =?utf-8?B?a29vVmg3RG1EUnVUcVNLcS91WERyOGwwMlhLbCttV3J3ZlpVdmY4WUE5TkhB?=
 =?utf-8?B?U0k4V0hPRCtkTUNnWU5tVlpWbDNJUkJReVdoRWJDYyt1b3lXdE9ZVnNaMmJh?=
 =?utf-8?B?czQ2alY1TlRLM09LWWNRNWJmNHBNandwMjBTVVNyeHNxOFhlbUo0cnE4REJS?=
 =?utf-8?B?eUFQVm1DbVRXVVRGWURRWGZlM2pIbk0xd1hqSDF6UXQ4ZUtqY2NPbGFMYWtK?=
 =?utf-8?B?NWpmWExPVnFsSEVmZ3dTc1o5Z3J3UTBtZlphbk9RajM2ZjVDbDg1K011elgy?=
 =?utf-8?B?WVlPZy9MQkNLMWg0cWFpY0xMZ2tseG15TzZJR3cvZGZ4aCtLY2sxQ2FYMm1q?=
 =?utf-8?B?ZlVOeXFBdGxKSzY1RGtFbXMycTBBdzJqTWo4eGhkNmZqOHJwcjVVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD92CF1E8B290B40A83B4F9653D08C5F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HOWsmEkltiYn8LJIOf0cdb/L898MqvZs63lWe+7NXeAVFiZO3FDE6txHA5pFjMl9ws0BxrWiA03i0XaFv5bpvu1/EW/bjfaSavQ9eBO2UVp8xGatPCnQi1tjmdwPBxiK04Snh37yWoPnXfwPXKFo7v0r96T8sPbvYTlPmdqZ+FXjmG9xepbrVwKDx0iWUfhjVGcoQG1NoTN9ffSVLDhs+xMX8C/mnWZyegWlTZWFtVwxBMZyNI1zlkvqUVGbbyVKGZw/rHr2CEfPWSehy63GXi5p3yrClsE+UOJlc8WXTUgodTx83C8vYoy8B8dSqb5xJnwnzIJC81TyXZ5MeWZw/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff7580d-fd11-4fc2-0fa7-08de7f9a4cf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 18:16:22.5191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/8X7Tk9jpwomD0kRBTqD0WvJH/uKg3sIBhxzybq1x3k9AtPTUVVfGWMoNoun5NlrIRsS/UlhQIa1IzxMQAk1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8370
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTAzLTExIGF0IDE0OjEwIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFdlZCwgTWFyIDExLCAyMDI2IGF0IDAxOjE2OjIyUE0gLTA0MDAsIFNvdXphLCBKb3NlIHdy
b3RlOg0KPiA+IEhpIFJvZHJpZ28sIGNhbiB5b3UgaGVscCBtZSBoZXJlPw0KPiA+IA0KPiA+IEkg
dGhpbmsgdGhpcyBpc3N1ZSB3YXMgYmVjYXVzZQ0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC80OWRjMjA0NDhhMTJmM2UwM2Y1ZjgzNDc1NDBkMTY3YTI4MWI4OTg3LjE3NzIwNDIwMjIu
Z2l0LmphbmkubmlrdWxhQGludGVsLmNvbS8NCj4gPiB3YXMgbWVyZ2VkIGluIGRybS1pbnRlbC1u
ZXh0Lg0KPiA+IA0KPiA+IElmIGl0IHdhcyBzcGxpdHRlZCBpbnRvIGEgaTkxNSBhbmQgYSBYZSBL
TUQgcGF0Y2hlcyBhbmQgbWVyZ2VkIGVhY2gNCj4gPiB0bw0KPiA+IGl0cyBvd24gdHJlZSBJIHRo
aW5rIHdlIHdvdWxkIGhhdmUgYXZvaWRlZCB0aGUgaXNzdWUuDQo+ID4gQnV0IEkgaGF2ZSBub3Qg
bG9va2VkIGF0IHRoYXQgd2hvbGUgc2VyaWVzIHRvIHVuZGVyc3RhbmQgd2h5IHRoYXQNCj4gPiBk
ZWNpc2lvbiB3YXMgbWFkZS4NCj4gPiANCj4gPiBJIGRvbid0IGtub3cgaG93IHRvIGZpeCBpdCwg
bWF5YmUgcmViYXNlIGRybS14ZS1uZXh0IG9uIHRvcCBvZiBkcm0tDQo+ID4gaW50ZWwtbmV4dCBh
bmQgdGhlbiBhIG5ldyBjb21taXQgZml4aW5nIDBlMDdiMTYzNzFiNmUuDQo+ID4gTm90IHN1cmUg
d2hhdCBpcyB0aGUgYmVzdCBvcHRpb24sIGNhbiB5b3UgaGVscCB1cyBoZXJlPw0KPiANCj4gVGhp
cyBleHBsYWlucyB3aHkgdGhlIHBhdGNoIHdhcyBub3QgYXBwbHlpbmcgY2xlYW5seS4NCj4gVGhp
cyBpcyB0aGUgcmVhc29uIHdoeSB3ZSBzaG91bGQgbmV2ZXIgZXZlciBlZGl0IHRoZSBwYXRjaCBk
aXJlY3RseQ0KPiB3aGVuIG1lcmdpbmcuDQo+IA0KPiBJZiB0aGlzIGlzIGJyZWFraW5nIHRoZSBk
cm0tdGlwIGJ1aWxkIGFzIHdlbGwgd2Ugc2hvdWxkIGltbWVkaWF0ZWx5DQo+IHJldmVydCB0aGUN
Cj4gcGF0Y2guIEJ1dCBJJ20gY29uc2lkZXJpbmcgdGhpcyBhbnl3YXkuDQo+IA0KPiBUaGUgYWx0
ZXJuYXRpdmUgdG8gdGhhdCBpczoNCj4gDQo+IEphbmkgbmVlZHMgdG8gZG8gYSBkcm0taW50ZWwt
bmV4dCBQdWxsIHJlcXVlc3QgdG93YXJkcyBkcm0tbmV4dC4NCj4gVGhlbiBTaW1hIGFuZCBEYXZl
IHBpY2tzIHRoYXQgdXAuDQo+IFRoZW4gQnJvc3QgZG8gYSBiYWNrbWVyZ2UgZml4aW5nIHRoZSBi
dWlsZCBpc3N1ZSBpbiB0aGUgbWVyZ2UgY29tbWl0Lg0KPiBPbmNlIHdlIGZpeCBpdCB3ZSBsZXQg
TWFyayBrbm93IHNvIHRoZSBicmFuY2ggZ2V0cyByZS1lbmFibGVkIGluDQo+IGxpbnV4LW5leHQu
DQo+IA0KPiBMZXQncyByZXZlcnQgYW5kIHJlLWF0dGVtcHQgYWZ0ZXIgZHJtLWludGVsLW5leHQg
YW5kIGRybS14ZS1uZXh0IGFyZQ0KPiBiYWNrIGluIHN5bmM/DQoNCmRybS10aXAgaXMgbm90IGJy
b2tlbiwgTWFydGVlbiBmaXhlZCBpdCBpbiBkcm0tcmVyZXJlLg0KDQpIb3cgbG9uZyB3b3VsZCBp
dCB0YWtlIHRvIGRvIHRoaXMgc3luYz8gSWYgdGhpcyBpcyBsZXNzIHRoYW4gMzBkYXlzIEkNCnRo
aW5rIHdlIGNhbiByZXZlcnQgYW5kIHdhaXQsIGlmIHRoYXQgaXMgb2theSBmb3IgTGlvbmVsIHRo
YXQgaXMNCndvcmtpbmcgaW4gdGhlIGZlYXR1cmUgdGhhdCBkZXBlbmRzIG9uIHRoYXQgcGF0Y2gu
DQoNCj4gDQo+IA0KPiA+IA0KPiA+IFRoYW5rIHlvdQ0KPiA+IA0KPiA+IA0KPiA+IE9uIFdlZCwg
MjAyNi0wMy0xMSBhdCAxMzowOCArMDAwMCwgTWFyayBCcm93biB3cm90ZToNCj4gPiA+IEhpIGFs
bCwNCj4gPiA+IA0KPiA+ID4gQWZ0ZXIgbWVyZ2luZyB0aGUgZHJtLXhlIHRyZWUsIHRvZGF5J3Mg
bGludXgtbmV4dCBidWlsZA0KPiA+ID4gKEtDT05GSUdfTkFNRSkNCj4gPiA+IGZhaWxlZCBsaWtl
IHRoaXM6DQo+ID4gPiANCj4gPiA+IC90bXAvbmV4dC9idWlsZC9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfbHJjLmM6IEluIGZ1bmN0aW9uDQo+ID4gPiAneGVfbHJjX2N0eF9pbml0JzoNCj4gPiA+IC90
bXAvbmV4dC9idWlsZC9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmM6MTU1NDo0MzogZXJyb3I6
DQo+ID4gPiBpbXBsaWNpdA0KPiA+ID4gZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ19NQVNLRURf
QklUX0VOQUJMRSc7IGRpZCB5b3UgbWVhbg0KPiA+ID4gJ1JFR19NQVNLRURfRklFTERfRU5BQkxF
Jz8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+ID4gPiDCoDE1NTQgfMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRlX2NhY2hlX3BlcmZfZml4WzJdID0NCj4g
PiA+IF9NQVNLRURfQklUX0VOQUJMRShESVNBQkxFX1NUQVRFX0NBQ0hFX1BFUkZfRklYKTsNCj4g
PiA+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiA+ID4gXn5+fn5+
fn5+fn5+fn5+fn5+DQo+ID4gPiDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqANCj4gPiA+IFJFR19NQVNLRURfRklFTERfRU5BQkxFDQo+ID4gPiANCj4gPiA+IENhdXNlZCBi
eSBjb21taXQNCj4gPiA+IA0KPiA+ID4gwqAgMGUwN2IxNjM3MWI2ZSAoZHJtL3hlOiBBbGxvdyBw
ZXIgcXVldWUgcHJvZ3JhbW1pbmcgb2YNCj4gPiA+IENPTU1PTl9TTElDRV9DSElDS0VOMyBiaXQx
MykNCj4gPiA+IA0KPiA+ID4gSSBoYXZlIHVzZWQgdGhlIHRyZWUgZnJvbSBuZXh0LTIwMjYwMzEw
IGluc3RlYWQuDQo=
