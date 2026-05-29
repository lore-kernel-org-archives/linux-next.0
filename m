Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7765329E79;
	Fri, 29 May 2026 22:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780092483; cv=fail; b=iMifWjpLn2CtDZs/HL+blmrCVIcIvkxh3Ng+nP807EjSJYoIBvi952xj2oL0npnUsa68xBrOklFPXugptfskltIf0S7+DXOFzuUi0UsGrfsjROk7guqnADmjCwIc4mqAr2aFbiMgV9GwgnmE7sIs0wK1uPG3fL652wYcA6xM0Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780092483; c=relaxed/simple;
	bh=fAex/eYe9ue/HLr/egoWUUaJuPQe5DuPuEPAFT517d8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X7aJO55mflTrpAPZuWmLDnTa5jTSGx0DaiXXMenv/83sFL9/pvy6toZysk4uctY99RPOKGbdt/z9taH4gjUleZa6ainQPujEET/jTDyTNTxhBlQPYPboc15YqS+zKBaS0iK/2kifNOC1lxw1RN2i/perYnaz584ZRPjnDA1lywU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nb3pM0H0; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nb3pM0H0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780092482; x=1811628482;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fAex/eYe9ue/HLr/egoWUUaJuPQe5DuPuEPAFT517d8=;
  b=nb3pM0H05rhVPMaEbORdTrZ0eWZi8xYLVTV9dy3X0cwpv6bZXgBknP+C
   pBJTGVaBSjs3exyUKOZyX+tUyhKNLxiqq5QCR+dvaf0ye+35jIQzNkmls
   V9HWRpRa007wB6FKykiwDA5TkWk16Tgbfx3wpXFwdwnXP20rvj5vIt126
   pXjcTJSsvivQ6LOFE/diIcUu18rbShZFJ4rQwHhIjgwowe4PcR5G8UUxb
   TRkDF7mAySopstjNVCOQy0kaS3feeHhkPY44bbkoAieDcbS0FAzb5eSDM
   MQRIM3dKu5M+gIXQ3Cp3AhXmPpGnM4p4TQXKMUBmaMf7Ki5ejfegaNcIb
   Q==;
X-CSE-ConnectionGUID: T8jqkGiQSfWIweQG4jm3Eg==
X-CSE-MsgGUID: 66PKT/eoTzW58BTjCv+N5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="106400727"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="106400727"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 15:07:48 -0700
X-CSE-ConnectionGUID: 1GIM3UVWRk2Kxcpy5VHQoA==
X-CSE-MsgGUID: y6Gqo9XpQoujhP9yb+p/ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247240482"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 15:07:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 15:07:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 15:07:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 15:07:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ewrxm1PkYfYS5E3IRGiK/b+XcbxEME1hsdXu/uO5romfgJxvFd1hbVPVlmM0UeHITnfXpxkmyMgHIee6tA/vMrNKLFNgJyIFK+WT7vQXK/SZoGVgkp6D9KTFV7s2uNFZim0WsI3dSZ0K5dmDE9UrPkN7hfxSJUspB3IA58Efv9dRtPGKHQW7SCYsqrhmdP1RvLUwbMFfmEGZBfDvok7BgyTkP8oOz1HRCoCUkc81O8Ox9TeRR6sXZT8a9YmBUNwiGpjGpQYpNVq9rGaFUeKdp0OtoEKsS3F2iZeQQ4+k1j8wATLlOst9y1F6Azue3tKz9KUmap5DfVPQfbc9ynLWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRgOCIxkAVK/6oYE/mDrR/kcWFaqwDaEOu+5GM1Q8Qc=;
 b=VnEox78wKVUZJ71OjbkNTDECjf9dq2lqs83EvzO8I87wp+6eIllmYMfg2pqrihirqFqjwV0djKbYsI8R0d0sdGMB2RGkXBxOFAHlqbubBz/BTJZ0LuqVnQ7bB0w7KhFbr6BtqR04LVQZmiVSQUiRGEawrTjAP+AWfEunYtyaZRcaThOVCuUh6xtdVtZ6duBJ8h59nAIrH890gl5G4y7CskR7B6PBDxWOtpZYT/Xh5pW+OhBXlYe/vIHWRhk2KDGj8GOwe4VzaApJBA4kCDT0VGiLgr7t2fsvSLVOid4enqRne1vc1J/pahCMIi3jauc3+Y+RehIx+LiqRtcrvT78Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 22:07:36 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 22:07:36 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>, Borislav Petkov <bp@alien8.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: Missing signoff in the edac tree
Thread-Topic: Missing signoff in the edac tree
Thread-Index: AQHc77Y7E/GQjsTF7kaAoNDQoOVqh7YljxpQ
Date: Fri, 29 May 2026 22:07:35 +0000
Message-ID: <SJ1PR11MB6083ECFA7AEBFC7D8EE11D59FC162@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <ahoL3l2gWBBS_e0_@sirena.org.uk>
In-Reply-To: <ahoL3l2gWBBS_e0_@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH0PR11MB5064:EE_
x-ms-office365-filtering-correlation-id: 09a7e8fd-ee73-4050-e440-08debdceb0ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: XD4IiekoGzVH+wxm4RRTYQTYHtrraoBASyPTeWfJ+3Z/ZCcPb/ZkTqZw68y6Cf0cVYKNpfKMOQBEqtysRQPrpJZiwYenlnUV3qnBFmPgwXOzHERBdAg9Mr8XxMJg/evOGZlkEu358nk85xDRZUc8+G6jPID108pWkZpOUR6pDXY5RNzAeAIs69pde15nQMm8FqIb+R0cFEJTwC7f/2jUnDbSNmpK225ICmvZistKeiSrYZc1W+E+1Y77Fl5obH7gweQJzhHr905MswN/kWakbT2QTiydNsxJ1HGkKxa+pPosQxJrCI1Oz+pSPpf7flSkCweoIfsoAs+lmW0uy7JDGz7nZQPrEYtkMLEAVwi6U0o91umAgyDHiC61ooFKxp0TiKY25+FYtpki5cKDcHwF4dPDRX2FNVJwnKRksjvOZGD8NnFm2T7C2WrOnKh0vs324N84QCbufGAAf6VoN81p09LGGWAC6CMO1rk3joifzH2TCX8URUZzwPJmg2AbgNRxt2vPToYbpAbZA+Bl8gMhcJlsZzVbXXxG9MDbEUBah1/BGh6hBWJujEvzLENj8djyC/ErL3Yyk30UfUPPe7pW9oreAbzn0rjUL+EBwCRAYMEXPsTu2G6A0QhnIeirLwSGUQhiuP4UXoDAHhsSfye2NGHr3frVh36Bdr2OGvnb8Fge5PRT9qtV+FSgqicEtou6w2mUVEMep6kaHezfCVxsTtllKgSnjZ83eGF6dyfMCnrRJ5ADexRpKMKdPGYwgIJe
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ENPDykAkOzgZTnpBtnk3KaGIA1CgmjtTDjgX1xKDGyCHCaFdTUzy4g7sPAme?=
 =?us-ascii?Q?HWVCyHN5iGRDEypeTkhCXwW5utcQC3O49TgkipDDGzpw6rUcDRSJXreZ+oj4?=
 =?us-ascii?Q?KiI1359p48P4A/i5j1cPpGtX7srYy+5UYoso8aX4UX97LIHFkrhmMqWk+RBt?=
 =?us-ascii?Q?92r02nCQy0cpf+dmoJ6rld798E6P5wDHxtaq/yFjotfrl9HhYvQ7ZkAhBeQB?=
 =?us-ascii?Q?YgOcAQX69B948jatHsxaBMEi5MWhbyIGemosiQsPAmFOcBSl6LXQ5okpGN7i?=
 =?us-ascii?Q?v7V+ZIXjjcz0Lo3GABIDwsWgcIzn16E0H7ekr5/FKNTzPry+pbBnrIv0NKsz?=
 =?us-ascii?Q?ZqhBD3s0fAvEqD2uousyefKS2lY/B9dfKtB2VYGRV10XzdA+TfQu7mcIcGFw?=
 =?us-ascii?Q?JtqZK365ojqNtBYXa46qxwURXiKnxVCja1fSUnZCMmqyRg+h2lvmYGGdIqyz?=
 =?us-ascii?Q?QiwCeRLAC12IEhkIAigDPSAajT7R6FO3AqSg8txClwaEAfvyxXXwlSmyhuYK?=
 =?us-ascii?Q?j3ujsLebKCNmZGYyFtnoYVSRrG+YMZcZwuZdVtvkoOz9wumG+3hP9DyVz0rd?=
 =?us-ascii?Q?DJTb2G/EkVKFY4ch0Ppl7m1v5StFrpPgjpkPsA3iz42ilsPoDOmQAhFesq9e?=
 =?us-ascii?Q?M3sQpIG24d1PB8Gz1KGhIKgZuEBbJ8efpCrcDlEu7SHuPGTy5x6gOosL7NBX?=
 =?us-ascii?Q?Gpy7Lo5e2kI4L4FYKwkVNE7BCrnnPp51PuhI3rC8IbR3M0n5O/L3V1H35YUB?=
 =?us-ascii?Q?y1ffD8RBMcX7m01t/Qyq/68nSlTEdPkLJ5yj6iZHzQpdfhq0OZMy+gEYXfcC?=
 =?us-ascii?Q?IZlwKolLfrOMaY6XM3yaAey0rn6qamXXGxstkeLIU3CdbNPPo7EyO5phi/Dr?=
 =?us-ascii?Q?ur201kx3qsNkFdvhQ+5DMi6p8uoSfh1V2iRcIaUEYGmXv3ZYDwqai6aeoIRa?=
 =?us-ascii?Q?vRJ93V6flhxkbFaEQgV+yc3ejwulo0ht5m6DZpwUpd8kcHxZG8akCdvCjpk4?=
 =?us-ascii?Q?ZWsByPCbR8WzVhB1XVkRijP7vC0ENkT4Y4RNN0M3vyBZDf1TONFrnMzsi98R?=
 =?us-ascii?Q?dtEyi+dG9gZsrdoli3UxGdBQ4Cxg2WDOcTDioAGxjhO4C0WxVMHHtE92mV/o?=
 =?us-ascii?Q?XYoqFzHsiG9qOzYs2fSTnSAL8bJDbsPf62ZDv1/4/Pba0luJuy52FVyug5fl?=
 =?us-ascii?Q?Ie8WomIw49TTVDMRp6PnGYsjKwIh6mWoHEAWXNwjYd2flTCUWUHMpNvmtqda?=
 =?us-ascii?Q?AN0rKDk6br94MDSHo3eNFE6lLU0ObABT0K9DD+7DW276SlTWSXCXTsGb0T0j?=
 =?us-ascii?Q?xXuXNPDFakDxCxPAsKcu3mt1jA4CsLwxVINVFdw/0OifeXEJIuU5fS4sPOrH?=
 =?us-ascii?Q?MuuK4SNbXYRdEuOkKLa90b5rIt6r5JVLxBZFwNaEY+TW+MHDe+JHy+ioLXvL?=
 =?us-ascii?Q?n7UMA2GDHPVzYD0UKy+srqok8fuAaGGnXTDeF0T336Tf7H8VDSeQqplFZhmA?=
 =?us-ascii?Q?KpE7VkVRLE3TU2f3JkhsdAPVlxbGAvC/CP84R8b9F2RfaVEW+JTigDMZxItb?=
 =?us-ascii?Q?+V2+wmf/FW2T8JukKpHoTj4Vw203zJlZSHPKf6TUiX3yxrAohSh6ia/6A7lj?=
 =?us-ascii?Q?SYgFjZAuqXDJRRlORJ/g+EtdXQyDp/ulDwcdBBcTYfydDiHmdKmHCy98lkyY?=
 =?us-ascii?Q?qKmwftxMh+RjZJK62DXKIC7T10TRD9VXPnIEs3zRnsSNzY+D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PHnrmpzqhLnd45UpLZu9RlMKcomF3aFre8766O0BrJJrrw0fKEhpFUt5ohHQxy6hOJK5GxzNetxvMppRb9ZUomcgkTxwuIrefySK92tbbYkrpbuQ7t3CuoSoRu/lsJWPzLxQ0c95TuDC+TG54YtJfOoQx1rQi0+80dUT+icVYyQm4mxyzuEH/npb+gK29GtJGedx4K30f0lLctGu5dSwkOC7IzvEySSu69nnNRlOTQxjk4LXE5zmzfPsGfHd6HP+RW1Gg3MoZn6wTp/OhBdGLXgtR5pKj24l3YHDEvI9vfoL6V4cdlVdlMYrkEw2CLHa6dxO/Ccf4dORmNVlUCZ96w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a7e8fd-ee73-4050-e440-08debdceb0ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 22:07:36.0104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HyQIVMgbzgoDP6zpjxsDrPgCFGTmY0LH+wtWjg5baSgXTwmi6Hl0Rc+dcGRXoWmHe4j5qbDul53/L08SVSBWaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5064
X-OriginatorOrg: intel.com

> Commit
>
>  3b48fd01d94cd ("EDAC: Consistently define pci_device_ids using named ini=
tializers")
>
> is missing a Signed-off-by from its committer

Boris pointed this out to me earlier today.  Updated that commit (top one i=
n edac-drivers branch)

New SHA1:

78d86a71de6e ("EDAC: Consistently define pci_device_ids using named initial=
izers")

-Tony


