Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4709E2DA759;
	Wed, 11 Mar 2026 17:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249392; cv=fail; b=Hhp0W4R/CWxclNstC8FDaM+MA/N+ExR13Bf9uqdUhZVewHKXPlvVRzroQFh/veosAT1VKcc9jvqbYjYGl1ZCctVN2KHkfkBdNV/W3Enrd5U0otNT3QsGBLo8JmkoeKUgqAaXeB4Vzga/c+l9SzG0jXiWvSemhjTzbeaqPNj0yc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249392; c=relaxed/simple;
	bh=GxzQJFJVUq/CJ/vGAK4elXF/pGIXGRoFMTNsisK3cYc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j3fkMw7dsq6Lct+pdNrMXhN/QYtTwiF9hvZy1JTETl/aAspMfiPj7UwuBDPK/YxvdGHAndLr/Q1dfvD24ON0vXahJRN8LrKA3cVSnFA5iyFHAjgdxSChIr+kXSDAiaIcwwztD8VxBcHCjDxsx6UrDgqMhUl3LLZqPNMUAOzxqVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kf5ktSkl; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kf5ktSkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773249388; x=1804785388;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GxzQJFJVUq/CJ/vGAK4elXF/pGIXGRoFMTNsisK3cYc=;
  b=Kf5ktSkl/P+2JRSA0avIvYv5S4VHIMGl9qi7i596f52t5u7/iz/1R790
   9SGhePyq3LT3WxqltYeRDG77fsKWnlofn95wWEXHysCsPzhbWAbvb6Zdx
   vb2+I5gORv2UkbOnBm6zdSRxK+L0WNotBz8kDZY2AiWtSWqIGPV0jr3/s
   ti2z8E8WdrT05/qkLIjS4mX3oRywbFSal1Q/iDYbez/YnkTzZFZRznKw3
   Ig6CnFqcQNsLZUhgpLCoEh/8J5a0eXGdmFtbftUMkju3Y9Weojaw34A0h
   LGSr92Sk3RBBpNTLTiqKPH+zys62bLM0ot6OoopYnd0knbkMRL9p81TbK
   w==;
X-CSE-ConnectionGUID: soLFznxwSJOyidBj3BB3mQ==
X-CSE-MsgGUID: yCK2V0PlToitlayQuQ82ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85803247"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85803247"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 10:16:27 -0700
X-CSE-ConnectionGUID: CzUhhSpmQgGTsP3EbjbCJQ==
X-CSE-MsgGUID: ObebDjVtSreSMDljvVpd1A==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 10:16:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 10:16:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 10:16:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 10:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgLLzSDgJT6/kwBnOQcjkImRmXuxrHqw/ZN67U+unHVTXkJ+y+FhWoqsTke0yButlWz7Knfxlut/eHVve3N1f50dhlSC4zch7hSMyvdIQBWp7TyxEN1OX3pksubPH7WWAT3nnFLGr6xwYEf/PBqV6TyxExKh6ECxKXLEtmfDPHy07sSW57/e6QxS46NkqTksCCQKtc0E6hQhWSpkW7NFePEqtotU8D3L+L4AUxxuVqz1etyS75L5NJtdm+FCDtHN+7EdDusLBFDrFCtBIzGxKPQ1rApH14TFKVou9Y4gSAA8WXhNsdtAiCiIRNh8QJnZ9qa4wSxsKFe1fm0/NVqAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxzQJFJVUq/CJ/vGAK4elXF/pGIXGRoFMTNsisK3cYc=;
 b=KNDHS6Ui10vqgRw6JCAek9/BpCeAGi2zft5yCjE/+Mo8ClAX8tw0gcJyM67TLhoCLJJ0BJucnJWNSau2Uot4BhghF2LCOw7ww4CmeXMUaHt5CegbM5U4pDucNKQFp8AhdDZoMhl7RJndmRlhYPo2ee76QFXgjFghUxWuO2pNNQ2H204GxJjmKZ13POv/J8vis3KDMloPSyvTtE2k64fJP5Z/dWKJ369AmCBW6jcazH46A+/0W39rVdZ+CVGMPyxv7X4MFELLoHVhG7315id0nikYjgYPVtRmlsOJKeVieLAJF9kbWXDlsWRWvEMIlv97/S0xIpQlkSEzDmLL0tLWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN2PR11MB4616.namprd11.prod.outlook.com (2603:10b6:208:26f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Wed, 11 Mar
 2026 17:16:23 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 17:16:23 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Nikula, Jani"
	<jani.nikula@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Landwerlin, Lionel G"
	<lionel.g.landwerlin@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Thread-Topic: linux-next: build failure after merge of the drm-xe tree
Thread-Index: AQHcsVgjSXnCwIeGGkSJUmrw+gl3PrWpksKA
Date: Wed, 11 Mar 2026 17:16:22 +0000
Message-ID: <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
References: <abFpM1FHgzgARB88@sirena.org.uk>
In-Reply-To: <abFpM1FHgzgARB88@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN2PR11MB4616:EE_
x-ms-office365-filtering-correlation-id: 5b45453c-18cc-479c-ad12-08de7f91eb5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: tEDajW1641cWCR2sdPCecrz9/pWCJrlIRX39YiZt9L6RJ2JosCCi76VK3LfcjmqAYG5GMJ4EiamhDXiPvbDXInVKBx8dbgeJLU41lgsedCufzX5tPaPkszXYWQAYKr9zO0Fjp+zo2gXOk1VdLa6ja8DbadqKLyxwOoXMgiixI/mLgRM+wJSa+j2+79TLtAggqR25EwBUSaorKg2I7ANQ/yW1nrMdZEk49ByrTTSTvaVIMuYF6yLLeOvnkqNjET6OoTP41QWCnt8cGqTz6pMJ8LZgaGSe06aCDR3GQQGwhScS7nXOb63UYBO+eEpe/T6/I/HpmF8VPHYTPYRtWX5xLdkoBSq21uWsVBI//wQom0jpO4EtXrN/MTU2/NABuyz6/AGAmkTnCA+FBaulqtQu5ZYQgqRm8td+TIilAoxoTS0UdmEhSx0m1m1AvZ+BUdWoUw4tTu5SdEXnzjPDy1zpxQPnHA3iSiLO3KAy3+1zOVMgzaspVpxPrpqSqcquf/ZbSnwgrxuxqF60sAaKmKjnqxYanOg9Q6JAGgQUDDY+ZXtbzqAl7/WtNdmElGC+TSlkHVHTIYXkneeuU2mQYc6KIvo6SJtK66R6xASW6Ka5dMn0gsaaCVSyWXBJmUlICWKM5ZEJ4YvjY5EATWkLExE67vRAAyYqaEz7AftorAnFyf4V8ttqA9U62hb3AwyujLEWJxanWlXNJbuzymDJG8pv5fma+zSxRl/rJjpNSGlN/nU88Exi4/i5iWT8BtFkCcD2a3vSlfa7b4xtTDdU7oMO3QBnWIv6bMHz4wypNpCJlQo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB8179.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXpoSlNURXVtQi9NKzZ6SnhVVHhsUjBRamJWQUZ3SENvTk9HdzFzNHpWVmx1?=
 =?utf-8?B?YWVJOGZqNXVzZ0w1TTJZa0JIYkZXK3ZHZ092cmduc2M0WVIrUDduN2RqSzl6?=
 =?utf-8?B?aFpIeUVvL09FTWFOdVN3bThjU2FOY1JGTmdKc1h4RDI2dXNzMGp0QytpYzdL?=
 =?utf-8?B?bjUxVStaK1RFQmo5RkI0UWhmVlFPa3lURHF1VGR1a1VrdlVCNnJnYVhSN2dv?=
 =?utf-8?B?bmxEZ1BsRkF0VC9ObEZiTFB1SHBKUE9uVUlLRHVnRzE5ZjUwR21TamozbzdG?=
 =?utf-8?B?bWg2bTFVRStSK2NsblhXekhvWi83MnExSnZOcUpodGdSZTg5Y2k3Z1NVd0Rs?=
 =?utf-8?B?QlZZTFI4UTRjQ2lPQmtYYU5zWmlMK2ZmVkJqK1REV1dlSlViaTlGeStVSWFi?=
 =?utf-8?B?QmFFekRFMlBtSmY2TzA4dENiOVYxekZOZWFkaFpoSWF4dUo2VHZ2VlZrVGFS?=
 =?utf-8?B?VG9DMzlBVzBQM0R1dEZYOU1JdjVERS9XSUJaKy9GYmZHOEM2N2hLYXNGRjVp?=
 =?utf-8?B?RW5CNFN5Z3hOT1Q1cklIMnptRDFDWlB4RmpCdkx4QTNWYWVJODIxRnhvc3Ju?=
 =?utf-8?B?KzdGOVZnTkQ4Tmk2cHRadjZXelI4TE0yVldHTVh5QVlENDRNZ2kyK1p3OG9a?=
 =?utf-8?B?VDIrN0hzYjQrN1NnYkwwY1NUc051anhnK05VenZKV3YrOHo3clM4ZUNxVUhv?=
 =?utf-8?B?djNVVFNmUldmRTU4SjZSdW16NjBiekdiTGZiYVEyMjZWZVFRaW1JWE1lQ0ta?=
 =?utf-8?B?OXRXSWl0eHlzSGM5dFBBTWcxZG5jUjFRTXpJdnBzcVlhdzJjTENQdUJPVjB2?=
 =?utf-8?B?UVpNbXBoOE14cmFPamU1cDZOa0luSEFnenhJcDFtVi9tWVpOSUY2L2VQSVZy?=
 =?utf-8?B?bVFYTFBWb1haQ2lRZE1HU2dCUGtzV1ZZSDR3Z0grNVhmVzdsTlhHaGpzanlL?=
 =?utf-8?B?RTEwODE2dVJFSS92NlI2Y1JvV2F1UnJFMHV1ZTFkeHRXSG1kUC9TYk9QTW1q?=
 =?utf-8?B?L0tpazQ0Uml2RHhzQ1dZZmg5VTJQWCt2QXMxTTN1UkpjY1R2UTBaNUZSRzZQ?=
 =?utf-8?B?aEZzUjd0dFVmV005bklTSXRIcHpWcC9Zblh3VDBlSjFrZG1DaVQvYlRoazZ2?=
 =?utf-8?B?Y01WQXQ5d0FxSTh4UVBrWVhYWGt2NUFjRENTL2hkL2dCSlFDb01rV1duSDF6?=
 =?utf-8?B?ZVJNTWRQM0E0cGZYUklranhVc2FKQktReDh2Z2cxT2ZHTTFvMUY0aHZhN1h2?=
 =?utf-8?B?NG1INmJxaGo2TmRZbDRyZERHOFV3T0JUVlRSM05ucjQyY0FlTVhFcUx5Zyt5?=
 =?utf-8?B?eWdnOVc0d25EWGlGUjlmSUZEbnV2d3ZFN2JVNWdnMTBteDNZdDN3amwyMjNt?=
 =?utf-8?B?MUp6L0FLRGMwVE9BYjN2RzlUS0FhaHc4SjVOK21GTXcvOCtjdVZubFpCZFdW?=
 =?utf-8?B?OUswRCswVUxwZFA0dVBaN0w3TnRkejcwNkNOcklONGRONTRaeXg0NzQxMmZY?=
 =?utf-8?B?NWlJUWh2cU5md2Zkc2hienJXQmxXMTR3blBJU2lDMzNkV2UzeW4vU0xjUlNJ?=
 =?utf-8?B?K2xvRGhOMTVFNE42MjZiSHpYRHpPOUxEODExSTZIMWhxdG9lSzlmOTFJZEdm?=
 =?utf-8?B?VEpqNDFxdlRKVCtTdzVpQlMwUGI4ZUIvU290b1IzQU5UdlF6VnBwUkgwNHd6?=
 =?utf-8?B?YnhZNERwaE9xa01VV0VaZEVjYW1hd3JnOXgwMzZMaGhVeGJURjlyWTZZQlEw?=
 =?utf-8?B?YmJCUEliR1NqcUp6VVBsZ3ZZMUxkTy9zQlRBcXFBWTZQSFBKaCtvaXcwNXEz?=
 =?utf-8?B?eWJhYW0vdDhubkxsTkptcUhERldMZGEzYytyVk01UVV6akdKRVZ2djdYbXRD?=
 =?utf-8?B?TDdaRVV0LzlYdFhYTnM5YW5mRWpia2JZT3dCeEt1WmJGL2tXL0J0dXBEckx2?=
 =?utf-8?B?cjNhc1R4ZjQ3bkdWUlRhVGdmTDdpRnErRHRubVR5alUyZ2dHV0NlVWZWNEVx?=
 =?utf-8?B?cHdoSG03ZEYzQ2pYNlhNT210bHdMR2Q2Zmtvbi9uOWMwWHpQZ05icGFRUTFQ?=
 =?utf-8?B?OXhsZXZ6ZVpsZ3NacnRhN1Zqc2Qwd21XbTdrRlA1cWFtK0F0Q2ZwT1J1Zm1w?=
 =?utf-8?B?YzduOWNFc1RDdU1mNHBFYVhpektxZ0cwVVBXZE5FUkdmOVdMSENsVzJjVmhU?=
 =?utf-8?B?WlBnc0NXY2x1QzNBTEhuTi90cWRlMnJhdlc2SVF5MWpIbFB1MlFPYmFIVU02?=
 =?utf-8?B?UmJTNUhGN3lldzJhMERYeFN1UUY5QnJtM1ZPSGpCd0xYUDFtWFVvc3JGOGJu?=
 =?utf-8?B?Qzd5cHpBcnhCM0pScy9tZzRQT05VMjE3TGxWNmtOdEV1Yi84dVZpdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB5670760B0EB64A95AA7CF66242E1CE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: K7EK4yp/tsAfkg5UZWxyP7lFudRaqV4x8ExAGCQmvJWRY/JYwHS+2FdkVFWOPMLI6Jf+9MmgqAdGjuu6Hy27HT33GHVFPziVqeLyIegicLmpwdMdPlP3AAh+E5axWsKmcTpiEuXuL0BwRFl30fnErsHSTRkF8f48tm5gsrxdMy1maOENhhXDPbZKoO/FPI2Kg3uv58l4VHIUXddiRTrWqxDKgHNbzuVISkKipwxncsEj8galdF4rsZ2PyznGmiFNZ9eklgAI1S32JVv5c8DcVpat9z8Sw6qwvqRfuJyf0PKdkl6PSTe//DVGeO0Qlysm5IaLCM+048DAEfTeGkVXGw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b45453c-18cc-479c-ad12-08de7f91eb5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 17:16:22.8308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rt+USPV3qHQ6f0HOE1g6UYDsXDeReo0Aviu7/yzry7/XNNYxCDxptn+ip7ZDVqgjzeKQoC7u4EU+EuPSxMVRYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4616
X-OriginatorOrg: intel.com

SGkgUm9kcmlnbywgY2FuIHlvdSBoZWxwIG1lIGhlcmU/DQoNCkkgdGhpbmsgdGhpcyBpc3N1ZSB3
YXMgYmVjYXVzZQ0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzQ5ZGMyMDQ0OGExMmYzZTAz
ZjVmODM0NzU0MGQxNjdhMjgxYjg5ODcuMTc3MjA0MjAyMi5naXQuamFuaS5uaWt1bGFAaW50ZWwu
Y29tLw0Kd2FzIG1lcmdlZCBpbiBkcm0taW50ZWwtbmV4dC4NCg0KSWYgaXQgd2FzIHNwbGl0dGVk
IGludG8gYSBpOTE1IGFuZCBhIFhlIEtNRCBwYXRjaGVzIGFuZCBtZXJnZWQgZWFjaCB0bw0KaXRz
IG93biB0cmVlIEkgdGhpbmsgd2Ugd291bGQgaGF2ZSBhdm9pZGVkIHRoZSBpc3N1ZS4NCkJ1dCBJ
IGhhdmUgbm90IGxvb2tlZCBhdCB0aGF0IHdob2xlIHNlcmllcyB0byB1bmRlcnN0YW5kIHdoeSB0
aGF0DQpkZWNpc2lvbiB3YXMgbWFkZS4NCg0KSSBkb24ndCBrbm93IGhvdyB0byBmaXggaXQsIG1h
eWJlIHJlYmFzZSBkcm0teGUtbmV4dCBvbiB0b3Agb2YgZHJtLQ0KaW50ZWwtbmV4dCBhbmQgdGhl
biBhIG5ldyBjb21taXQgZml4aW5nIDBlMDdiMTYzNzFiNmUuDQpOb3Qgc3VyZSB3aGF0IGlzIHRo
ZSBiZXN0IG9wdGlvbiwgY2FuIHlvdSBoZWxwIHVzIGhlcmU/DQoNClRoYW5rIHlvdQ0KDQoNCk9u
IFdlZCwgMjAyNi0wMy0xMSBhdCAxMzowOCArMDAwMCwgTWFyayBCcm93biB3cm90ZToNCj4gSGkg
YWxsLA0KPiANCj4gQWZ0ZXIgbWVyZ2luZyB0aGUgZHJtLXhlIHRyZWUsIHRvZGF5J3MgbGludXgt
bmV4dCBidWlsZA0KPiAoS0NPTkZJR19OQU1FKQ0KPiBmYWlsZWQgbGlrZSB0aGlzOg0KPiANCj4g
L3RtcC9uZXh0L2J1aWxkL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYzogSW4gZnVuY3Rpb24N
Cj4gJ3hlX2xyY19jdHhfaW5pdCc6DQo+IC90bXAvbmV4dC9idWlsZC9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfbHJjLmM6MTU1NDo0MzogZXJyb3I6IGltcGxpY2l0DQo+IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uICdfTUFTS0VEX0JJVF9FTkFCTEUnOyBkaWQgeW91IG1lYW4NCj4gJ1JFR19NQVNLRURf
RklFTERfRU5BQkxFJz8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+IMKgMTU1
NCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdGVfY2FjaGVfcGVyZl9maXhb
Ml0gPQ0KPiBfTUFTS0VEX0JJVF9FTkFCTEUoRElTQUJMRV9TVEFURV9DQUNIRV9QRVJGX0ZJWCk7
DQo+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+
fn5+fn4NCj4gwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+IFJFR19N
QVNLRURfRklFTERfRU5BQkxFDQo+IA0KPiBDYXVzZWQgYnkgY29tbWl0DQo+IA0KPiDCoCAwZTA3
YjE2MzcxYjZlIChkcm0veGU6IEFsbG93IHBlciBxdWV1ZSBwcm9ncmFtbWluZyBvZg0KPiBDT01N
T05fU0xJQ0VfQ0hJQ0tFTjMgYml0MTMpDQo+IA0KPiBJIGhhdmUgdXNlZCB0aGUgdHJlZSBmcm9t
IG5leHQtMjAyNjAzMTAgaW5zdGVhZC4NCg==
