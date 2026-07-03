Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012050.outbound.protection.outlook.com [52.103.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D17379EE0;
	Fri,  3 Jul 2026 05:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055102; cv=fail; b=KIpHCEB1rxw+ofw3INzO9/AQ3MjF1QbMw76kFC6qjiLt992XielwC/WSHD1AfmutZP/Wibnq7ygm3oRLQJLxtu9+J2eYKcMjxgjvIGT107Ybsi+/9OqfbpYCI5XzB01uki5fruSjDbBwhqfcdYR4aQAXznIwQbkr3q/fIhjxq5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055102; c=relaxed/simple;
	bh=EZjVa46ToKqfrlRbRgjTHClt7CHj6OuNzYToUHCjUso=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sqzY7AvmdnHEnRWY0uODYXPtD2s8SV48TsNCsgsw2wPoVO6O1Ko7gon2F6zXNd0c0SBKA+BB75KGiIy4x4J1KZt+aBaHVyLFSjOhHJ12DUicNOcxqcdy208JJKfuwYUZVWZgxaKzo/7jR6lZ3jgQ6aZi3UGa1N5cQpFegJAziao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=RbnjRJc6; arc=fail smtp.client-ip=52.103.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="RbnjRJc6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqQcpmEms5uIreXxk+pk9cUUJqO4to0nxa3xAFqE08L3jQKjowvjwJZpXkKps7ZJU6ESIj6pp21J3mHDA8ULWud09Oj4jRk3f0AQLc9bnwJZ3F34GtmNE5Bqel/AI6kRKroTd62h6hgX6Nbt6HGxI7tLaXT1W+TB/aSpCBrVU3FraeK0NG73b2NlCRDc/b4IaGi+NnUIxkZ7B6aMzauT199BpVoCd4hGkW9O/Mgee+wn/LeP9ZoURcMF3CDSqff58MoqyE0UpYMNffksq7kNmVJZYGgn3uUxtygNY3nFhx7t+pSdMCdZOKBtu0nCdKlWRP+EmIOe66fKaq6RHxwNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZjVa46ToKqfrlRbRgjTHClt7CHj6OuNzYToUHCjUso=;
 b=bU+5w4kV3Ij4spdtFhtMKHKPVqzPSfQ/r5bs533HZPhKa4xe32ImUxqJdtFFH+zOqcsOTt5zstr5ZGPcC6a2UAwACOOviSIyt+5F/Qqwf1yv+WUlh2k1rWMEyeEqZDbt1AO28dZjXwuT9PMWUqB60IvwyKNlmiAXdQ3+kHMdppr9C0NNpbl3Mv+e+0iORxlACDxhBjdpw8hw6ETWC2M+TRdp+3wCLtQIN/lWOg+iLlGE/ca28hmualyOmGSJ21F9Pu7OfP5e3LrnwJctmdnU9SN0jzK3VTSTOV4ST7p2FNUo7X3GIAkHdcoNOW1ntS7wZHjeaKzr7izmAFVoUK+cHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZjVa46ToKqfrlRbRgjTHClt7CHj6OuNzYToUHCjUso=;
 b=RbnjRJc6Bki9Pgt3+NF/Uv0ti3ob45eOiUon/RUKYKH+YlAjN1pbrpuQrQ6fdp1Iu2ygFqkmFsCVJecB9ALCWpvcOBChtLuKlR5HwNG9olHUARKbzWhxLl254b4igAaFXL0lqYav71tyF9fULgU8kyleKYmR2FJ7UVvLT8xw8vjFDXgwaTHR1se47P/hvqDdK0iaG8Ga1KC6PF4fyo5viAasnnNz4WDM8F0GT4E9zLOCRaBS0SPOn4QC9nCDlBwjwtG8tvFuNfjE09ejdYjesazOT0cCkyWGKtSuFvkfwd0tr3y7JixVITIOv3X5Sgf+m7UELRw4+d1aq+GUY3Mzng==
Received: from TYZPR06MB6916.apcprd06.prod.outlook.com (2603:1096:405:42::10)
 by OSQPR06MB7249.apcprd06.prod.outlook.com (2603:1096:604:291::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 05:04:47 +0000
Received: from TYZPR06MB6916.apcprd06.prod.outlook.com
 ([fe80::e814:9b12:c9a7:5f4f]) by TYZPR06MB6916.apcprd06.prod.outlook.com
 ([fe80::e814:9b12:c9a7:5f4f%3]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 05:04:47 +0000
From: Kir Chou <note351@hotmail.com>
To: Mark Brown <broonie@kernel.org>
CC: David Gow <davidgow@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in final build
Thread-Topic: linux-next: build failure in final build
Thread-Index: AQHdClBWHdhr4oktX0uMOf327IbXE7ZbPk8C
Date: Fri, 3 Jul 2026 05:04:47 +0000
Message-ID:
 <TYZPR06MB6916A3E5B373ABCE5070144CE8F42@TYZPR06MB6916.apcprd06.prod.outlook.com>
References: <akatWxAOMy_S1G2Y@sirena.org.uk>
In-Reply-To: <akatWxAOMy_S1G2Y@sirena.org.uk>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6916:EE_|OSQPR06MB7249:EE_
x-ms-office365-filtering-correlation-id: 7b250278-972b-4997-6cb5-08ded8c09ae7
x-microsoft-antispam:
 BCL:0;ARA:14566002|25031999004|25010399006|15080799012|24021099003|4140399003|6072599003|19110799012|31061999003|8060799015|8062599012|14091999006|16041099003|53005399003|40105399003|102099032|440099028|3412199025|26104999009;
x-microsoft-antispam-message-info:
 =?utf-8?B?clpZT253Vi9kWnhnSVNOckR6cC9VRHhQa2J0YjZmY2wxNDg1YnFnSkZFR0Z5?=
 =?utf-8?B?OGZ0UGZqVFBZUHltL2JoWUpIWm1KK0NJMDZWWmwvS3NiRkpGK1VyWFNoWU5k?=
 =?utf-8?B?RTUrMk1WY2FXdCtDdE56S2x0cWtlTHdhSi8xeW1PY0N3djFYL1JDSEtFdDRq?=
 =?utf-8?B?K1p1cDRMZlp1MmpHUWRHaG53OU4vV0xlait4NEE5UU5LVHBVbGVvZmlrUzM5?=
 =?utf-8?B?KzRweFdhZDVicjhCK2F6Vmw1WlpaUUVrRDFKOHkvcUxpcGtSUTg0RkQwTFJt?=
 =?utf-8?B?b0JISmRKUC8rL3pCVkFkbFFhTXdWK0pKcXRUVjN0VktOWGNjRmEyK3doSWZ2?=
 =?utf-8?B?ZzJ4T2o0b0xOMzlvdUYzY3k3Zll4TUl6ZnV1TkY3bklxalcxSU1iT2NjS1Fk?=
 =?utf-8?B?THE5L3hERVcxVFFYL0NvMTlSZXh4S1cybXptcEdWTHdoYUQ2SmpxYlZ1S1Yy?=
 =?utf-8?B?WkNRTnVsWWVNY21PZ1crYUZUNDBzKzBpR0pYcEhseWFzVjgyNHIvSSt2R0lP?=
 =?utf-8?B?ekNRaTZIUmRLZjhCTHh5SWZUOTZyb09UOEp1QnRWcUFRR0d5WHdEZHhJT1FJ?=
 =?utf-8?B?Z2k3QlJuOFNDZERqRk1mSmlxa01kcDZKS1Yxa3BuU1F1cVh2bjRZTWFRR3dW?=
 =?utf-8?B?S1FmZ0lwSnZxVGVqTWVvdEFBaXRzL2MzMjNlV3VYWTZ1TGJmRVhBWVBPZUlN?=
 =?utf-8?B?bUpWaS9namxhVllnaXJXclVnaFd5NUx4U1FWR0t6N05iRmtDNzdWN2lMY24y?=
 =?utf-8?B?Z3JYdWJPVzMwRlRjaTNnU1NMTGdTRzBJWC84aTJHdW9BMVg0bitPcHllU3R6?=
 =?utf-8?B?cm11c0E1WXR0ckdoT0dtUnp4TGlyenh1T0Z0TG1ScjRFQnpyQjd6QjM3eW91?=
 =?utf-8?B?d3kxYXk1SDBXUlV6WnhFZlVBQ1RHd241OUxYT2VhZnFKNmNYall2MFBxN2xk?=
 =?utf-8?B?MjhOWFVsT3NuY1MrbEczVXEwY1QrOFVjUUVvcEUrMFV1WUYrZklHRlFRZEUy?=
 =?utf-8?B?VUV5SHlSelhlMEQrQkczQXpTOGoreTNhWkVQSkNjbjNZZlVQaVJuVVZpcTB2?=
 =?utf-8?B?eUtHd1lvZ01aRUhVTkRaMExzZFRSVENpc2tZYU0wdGp5dk8ySHcxS2NsdTZa?=
 =?utf-8?B?Vkk1WnJ0bDlPVGpaVDZQV1BOcktMVzJwT1JFbFc4SVBnSndXOGpydmVROWVu?=
 =?utf-8?B?Qk5tQnE4WDVBQXowV2tWeGtJNng4d291QWlLc2tzRkZLeHduMnVZWHErcktO?=
 =?utf-8?B?VnczSVE1bkZxamxDbEowbyt3aEc3WkdQYVhQOFVMYkZlMklqNXVLNTVsOUZu?=
 =?utf-8?B?cnRBQ0k3RUd1aXMwZ28zVHJNOWJxbXBMQmp6NWRQMThqUmNwc0tabkxmdGE1?=
 =?utf-8?B?eDlXTndIQlcxWk1XV2U0Umc1YTFrZ2ZNajZHVXByWEZwcUJxdm03dUMveUU1?=
 =?utf-8?Q?UgEbYCzk?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amd3bFlXeTFRV0cxa0FXMlFVc3EvYmdvQUZYclhUejhEc0I2MC93SVZPa0Ew?=
 =?utf-8?B?MXgzZVc3UXR2enFTbGNPdENqWnZBQ0QvQlVRNVBkODhTem5uRUV6TW42OXk4?=
 =?utf-8?B?MWRSVWJVY1UyMkVNbEZSWjNRSXJyRFhFcnRHaytIdnF0ekJTUXRLa0hQeXhS?=
 =?utf-8?B?Vm94aHdFTFgvaFJwbmkxV0NoWjU4RmlsYjVUU3ZGTVZRdCtwVTh3UW5DZ09C?=
 =?utf-8?B?Y3N5dzlYdDFPVWlkWWZrNDZFMUFYK3E5OWFwQXB3TUZHL3Npenk5R2E0eHJD?=
 =?utf-8?B?UGxUYVFuTGJsS0MwQ1JneFoydzdtUURBUHZNUkdzeDduU3JCYkpwMHpDRHRz?=
 =?utf-8?B?MWRIamxPQ1BnRkd6cFE5UGMxaFpXMW45dktNcGkvY0tjSk5qVDZUcUVGd0Vk?=
 =?utf-8?B?dU1ZcWVMRXJCUHhCVjRDdTV1bWxmYXRZT3lpUlE3SC8wWjRzY2czeGdXMENq?=
 =?utf-8?B?N1MrdmIrd0U5TmNsRHpId0xic1J6OEY0MzVrZnhKTVdObExHK0U0cnZZaEZh?=
 =?utf-8?B?ckFlRlA0RHBSZ3R1MThiRDZFS2cvcU9wL2xzeFJaa01DWTNRc0dKUGFtOEph?=
 =?utf-8?B?c2ZyeXVyY3c2anQ4clFHZHI2NzQvRnltYkFkSmhETTZFV3ZZU3BWR2ZKRWtN?=
 =?utf-8?B?dzhIRGNmbno1eDl4cVErTGcyWitVZThtM3BFaEh5UG5ZbzV4anJJeGQ2RTFh?=
 =?utf-8?B?SHY5ODAwR2J1SVNaQ1kyM2NDMGJpZm5nQ1Nyei9lZ0gwMFZRSjNjYWNRMURE?=
 =?utf-8?B?V3ZDR09oZFgyaW5hTlc5ZStjN0xLVlUxcE16SXVBcFlDV2k2bm5VNTg0NVRF?=
 =?utf-8?B?MUpOS0RyZldKVEN4S0xlc2tINVFubEplOFdNcDJucDlPd1JMRmpHR3greDNt?=
 =?utf-8?B?dUlrdzlMc214anVSbW1sQU0zK3Bxc1RyQmdBTFBIYUl0aDlBbWxscUtraHVC?=
 =?utf-8?B?KzRudmVXa0RLQTVwYzBSZ1RVMitoNnRGTDhtYVI1ckFNT2ZXQTZid0lOWlJX?=
 =?utf-8?B?d04vMStPTXRGdVozQ0lpa1ZXTjRvYm5JTy9NcmZuQllPOEZzWVh5MVZyMVlZ?=
 =?utf-8?B?WUtZQkR2cU9Ic0VDeER2ZDFzN24yMEg5eUVjV0I3c3ZNTDdmdUxnN054b0F2?=
 =?utf-8?B?UVd0dHVOdVdFeVRVMllXVjMrWC91aC96dTFYbjRtR0prMkxMakNNSzNYZ3hE?=
 =?utf-8?B?OUhWUFcyM29qSk1SWkJqMVIvSC9xZWFDKytiODlMU2RNNmt0M0R6VEJCUkt2?=
 =?utf-8?B?MkFidGsrWkh2UDRQQ1I1WFZIbVFVeHJxKzlYMHk4cjhDU1o2OU81TW9pQmY1?=
 =?utf-8?B?K3J5bG5PSjRYWHNBSUZnYW43aDBRMzNNUlBCNUhrQjdkMlhLK2hOT0w5b0lv?=
 =?utf-8?B?b2hlekVzc3BWNXBINXlvWHp3YXpGUHg3dmpIRXltY2lmcmd0YjVyMmVCcFJ2?=
 =?utf-8?B?Q3VwWTNUUFdOS1lDZFRpdnl4OWtBbEc4VkwvbFR6clFvak8wU0lDaWtteC83?=
 =?utf-8?B?N0FwQW41ckVWK2NGQy9FSklTUnN5ck5ZcUlxdytNbWJSSnFiNlpKRDIwU2Vt?=
 =?utf-8?B?L0sxY1E3bG05c2hCdjI2RkR3N29tSzk1bDVvNFNqamJuSmlmVDdaTjJqZ2JN?=
 =?utf-8?B?SkVGaW9WMVVVNlh3VUZOa08yVmliUVgzM01tak9reGV3WXlqWnRrU2hQYVla?=
 =?utf-8?B?RTNINzk2L1c2cTBXckwxTmpXZERLcE5HbzJsZndXeHhNdGpCQmhDNU5YNk9j?=
 =?utf-8?B?amUrZ1dVZm93NHI1T2RObVpNSGdSTzIvREVrekNSS3RUdlk2bmt5UlpyU2FX?=
 =?utf-8?B?WHYvVTd0SkZhazBPMTRnaHpwdDAyQ2JLWnNDSThEVjQrb202RXBaMDRHaTV4?=
 =?utf-8?B?Q0RiRytMVzlCdmVBSHg0bGZ6elFZR3dnNjNsamc5WElaOHE3aXFsV0lqOWVY?=
 =?utf-8?Q?IC67rnHu1krHfSJkevEc364vD3rws8sJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-25b72.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6916.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b250278-972b-4997-6cb5-08ded8c09ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 05:04:47.6929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7249

SGkgZm9sa3MsDQoNClNvcnJ5IGZvciBjYXVzaW5nIHRoaXMsIEkgdGhpbmsgbXkgdjQgcGF0Y2gg
bWlzc2VkIE1PRFVMRV9JTVBPUlRfTlMsIEkganVzdCBhZGRlZCBpdCB0byBhbm90aGVyIHY1IHBh
dGNoIHdpdGggYSBrZXJuZWwgbG9jYWwgYnVpbGQuDQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiBJ
IG1pc3NlZCBhbnl0aGluZywgdGhhbmtzIQ0KDQpSZWdhcmRzLA0KS2lyDQoNCj4gT24gSnVsIDMs
IDIwMjYsIGF0IDM6MjYsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6DQo+
IA0KPiDvu79IaSBhbGwsDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSBrdGhyZWFkIHRyZWUsIHRv
ZGF5J3MgbGludXgtbmV4dCBidWlsZA0KPiAocG93ZXJwYyBwc2VyaWVzX2xlX2RlZmNvbmZpZykg
ZmFpbGVkIGxpa2UgdGhpczoNCj4gDQo+IEVSUk9SOiBtb2Rwb3N0OiBtb2R1bGUgcmFuZG9tMzJf
a3VuaXQgdXNlcyBzeW1ib2wgcHJhbmRvbV93YXJtdXAgZnJvbSBuYW1lc3BhY2UgRVhQT1JURURf
Rk9SX0tVTklUX1RFU1RJTkcsIGJ1dCBkb2VzIG5vdCBpbXBvcnQgaXQuDQo+IG1ha2VbM106ICoq
KiBbL3RtcC9uZXh0L2J1aWxkL3NjcmlwdHMvTWFrZWZpbGUubW9kcG9zdDoxNDc6IE1vZHVsZS5z
eW12ZXJzXSBFcnJvciAxDQo+IG1ha2VbMl06ICoqKiBbL3RtcC9uZXh0L2J1aWxkL01ha2VmaWxl
OjIxMzQ6IG1vZHBvc3RdIEVycm9yIDINCj4gbWFrZVsxXTogKioqIFsvdG1wL25leHQvYnVpbGQv
TWFrZWZpbGU6MjQ4OiBfX3N1Yi1tYWtlXSBFcnJvciAyDQo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6
MjQ4OiBfX3N1Yi1tYWtlXSBFcnJvciAyDQo+IA0KPiBDYXVzZWQgYnkgY29tbWl0DQo+IA0KPiAg
MmVlMTI4MmVkMzZmZiAobGliL3JhbmRvbTMyOiBjb252ZXJ0IHNlbGZ0ZXN0IHRvIEtVbml0KQ0K
PiANCj4gVGhpcyBhcHBlYXJzIHRvIGJlIHNob3dpbmcgdXAgaW4gdGhpcyBzcGVjaWZpYyBQb3dl
clBDIGNvbmZpZ3VyYXRpb24NCj4gYmVjYXVzZSBwcGM2NF9kZWZjb25maWcgdHVybnMgb24NCj4g
DQo+ICBDT05GSUdfS1VOSVQ9bQ0KPiAgQ09ORklHX0tVTklUX0FMTF9URVNUUz1tDQo+IA0KPiB3
aGljaCBpcyBhbiB1bnVzdWFsIGNob2ljZSwgbm9ybWFsbHkgZGVmY29uZmlncyBkb24ndCB0dXJu
IG9uIEtVbml0IGFuZA0KPiB3aGVuIEtVbml0IGlzIGVuYWJsZWQgaXQgaXMgYnVpbHQgaW4uDQo+
IA0KPiBJIGhhdmUgaWdub3JlZCB0aGlzIGZvciB0b2RheS4NCj4gPHNpZ25hdHVyZS5hc2M+DQo=
