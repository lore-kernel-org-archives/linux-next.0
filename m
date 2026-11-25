Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795618965;
	b=MTkibNFILHoq9T8HXVpUCMz9s8G5aw1diJqe64xM7INAn41xAdsjH86Lx4wOrHQfXFr9
	 qJbX72AUimJwuaglfGxHTr6KFIMPCcYW2FVwVXGHz4R/KpSBVbTmlTEZtvBwCwUwJqgrz
	 2yscw7KRI/Pl73L0sYjfLhQNO437CVKdUGIY1kF8avDx/0YBXkyEEKzlyj1/W4sL4eKNn
	 MyIUR6EnXFSLJgBIA7hrlcWEyAbNitt4ErWp5F6raj/314fdjkWWAJvcwP6i2+4KAL6nU
	 nD7LKQ0KyyEsNmkZg+M/C4gwHKigNE3J/M3qBlQITXglQQ69nUSksgTyekt7mvVrDkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618965;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Zn4nDqryDoRV2E597Eo+po0WLg0wcLBtG0fiLVNcHaU=;
	b=SS9qINryoYfNncDtl2OhN4gy0kJgh4UXoTK9azpLqWbu8aNYd1TDp/AocGKeapZq8nCD
	 3YGxXo4QadXrZbbsbG8se7nDAycfLf1La10p4fdvcnw5NvoIXMxuZg+j91OayLzpSAcYZ
	 F5KEhQjAhFPFRbOXPYqHGWCummPLN4j2XhXrfkMc0KojhKgzm+mQMQmNpaYDWhZfIR3YR
	 ymrLRKz0t8kk+R1RQX9NjWD1YY/bD0jlgH6q/LVlKOM3xptk2A0epsi7au0QZbzIunYDQ
	 8mir6nioOX/I+jlh/B6C4YdebpwebkVY0amGjWfI96myPVf1po2qOV3lHaKCbdRV3OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dR5ukWnw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.10
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6F7606A321;
	Wed, 25 Nov 2026 15:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6F7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dR5ukWnw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGzc3xhuMFGeF9qLEKzXHrcdsTFHTLuJJbg6ghdOktHqsaqzjjuS3EmJl4MQybgxqgaPKeiUKdf1a6qzNCD1j9a2Mx7H5d0gAoJXSU06YI/zUbP2sF79iTfR4ltZ9IxvWs4G8oGqu5NKejbSryGSExJcigt8sALyLU9HCcVdI3Aep8l5XezL4dA/Omfs1ckoWZVg8mO8roYGkGVW5lDdPPbEw0L/YVKv/eFKS1GmZL0UoxrAy9m1N5+8felgz3rx4ZTpUPctA+r0brrHEa3vFeMAfuWuPnvxXfEtr6dqV2yxxVUkk5csxIcCt6qWoUmJAdMHNVzYWH/Q8zY8TKv/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zn4nDqryDoRV2E597Eo+po0WLg0wcLBtG0fiLVNcHaU=;
 b=lMBZ5ejEFyznyHbhY1BNxaTLgnOjAJUAdc8X1wztMP5s3ljBhLRiXsasCo0Hd1gsI2YyTwt8uFYWNOa2tAPxV72TkdfY007EHN3FhF8zGeoIEJ9s154zybQWIuUclxfv9R6o8n4qR4LnL+Dtx29SX5Fzijp56pZKVEo5+zXCsWwmELDzDXu7bju0UqIhAyW0RII8/3MbfruCQeQagV1MTFmq0CVISnjzA+V9dfZ5kIMErRHoMaAdQr8D91YPxXpw3MvWYJT38AlAtBDEy+iJORlGbp6XEeYmKI740fPiCmeFRRMljFO394UaFxDqgMgPJh6eQqYZ1yX4Nk+xCSjgtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zn4nDqryDoRV2E597Eo+po0WLg0wcLBtG0fiLVNcHaU=;
 b=dR5ukWnwddjXI7u0I7ogwIEDpRm+iZRJ0w74YG7uu4XAr95i4yokhI8Kybj0RBF9LJziZeJQBr4BohxdupnJ50VpYYEl9fudN1h4uCV9N31IuS8NPdaEJna12bUpUnzB8P6uvg0/Iw84NXSZ2V9enpb7gHkxGG5CGKlTAb9wtu4Om1E0OjdAHfLKgOO65pFYS0bhmJxRiGxJreEFxIseLuCYm1PEJGywjFTnIpqoeyLum/ytQhdk4dfJZUB68/9OIvfipVDEb2QYq/VVIV6fRbP8yFRx2QpaprbLtQh3zvnjBEk9zz6X2Fj9EiofzXplIOssdgISEiqK1oNqxQKmYA==
Received: from AM8PR04MB7459.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::11)
 by MIWPR04MB343215.eurprd04.prod.outlook.com (2603:10a6:290:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 15:02:41 +0000
Received: from AM8PR04MB7459.eurprd04.prod.outlook.com
 ([fe80::49c0:9f2a:a423:623b]) by AM8PR04MB7459.eurprd04.prod.outlook.com
 ([fe80::49c0:9f2a:a423:623b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 15:02:40 +0000
From: Frank Li <frank.li@nxp.com>
To: Mark Brown <broonie@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: [EXT] Fixes tags need work in the imx-mxs tree
Thread-Topic: [EXT] Fixes tags need work in the imx-mxs tree
Thread-Index: AQHdfObXHKFLj0BY20GE1W5DxMxAzrc+4hJQ
Date: Wed, 25 Nov 2026 15:02:40 +0000
Message-ID:
 <AM8PR04MB74595EE2B6EFEB2E118D1FC188432@AM8PR04MB7459.eurprd04.prod.outlook.com>
References: <awbsb-f3Z8gHODMQ@sirena.org.uk>
In-Reply-To: <awbsb-f3Z8gHODMQ@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-11-25T15:02:06.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR04MB7459:EE_|MIWPR04MB343215:EE_
x-ms-office365-filtering-correlation-id: e543d877-d11b-4630-9c27-08df4b0526d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|38070700021|10067099003|11063799006|56012099006|261026121527099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 7WRHQkGQbsjPaDbzJOtz9Cm912t/AxZMIXz3LW3XLPiBfzktXNDeY9l3r2W5F0jAeuXfE9USr1pGPYVWL5+4szCduwI/pMXtLKrVa4q1sG/gCJQqtsIYSE8aPCEifglQtepoggLDA7en/69pDVpgOQhY2ceiyh+ffIpZXqxqxRYKSAnpvbHdrgtyzZuTlMFhF+uIGiOhAo2esajRtMzYtyNy/VTSCccH8Ex8koMXLo39x+jckehlOC3ot5xsYoYuRmf6fhLfkJtCOix8VXErKnDqKG3vGUoNvNSWASrTVPJuY6u+bv+4OI0114XZyzwEhpQMYCI8Xe7aNF155UFPkzpo5map+/GaS+iv1eedTRQsIL5V1E8MHAprWwTUdEBUqXBLexZaam6r9hqbSUByO6DAhoE/4m2l5yB6GnHFVQ0bcv6Ze3VUBDoTOpXm79WO9Q2XYF1YbJ1T9p9ATZS7QhX1dtxGezroCwzkXFRM/nGQgJc3yPDWpvksdx5pIGZKLCKmpW60gBHqxHkpNtIQgC61vFf4N62o+p6vH8YFdH7vydQEj/IAZSDTrGwemLXwlDrTu1l/FaqlgLYTrpxZD77/zL3U9hCeXCuXDfbJphPSBQUFswbW3pGNyQM2cEwcPN4TRKU8XNZ1g7ga+TmcOxmqUtrv501GlAcsgU4dnjwOuOKHyXvjiFa5wSY7BffPP6QZ5m69ts1bzNBBhy7o2KYL/wxgzz2Jo55HfPfUNQw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(38070700021)(10067099003)(11063799006)(56012099006)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFp5SVk5UjNXYVN0T1drUjA1RktHNjl1WWI0dzlpMXVQQldwM2JveHpqOHVm?=
 =?utf-8?B?MExYVlBNc2srMnd4WlhkREszaENBWWw0SEhwN3lCVFllZGhaR3NqTVI4T0Ra?=
 =?utf-8?B?cUZQWVhkeE1LQkFpNTBjZHNZcCtXNzJCdnhJMWswRGZ0Y2tBL2Y0VFNFdTJT?=
 =?utf-8?B?ZzBFb1lqSzBLYnlnQU1XOUNKcnZYNkE4dVB1bDhNS3pCSFpvRWcvWG1yRWJT?=
 =?utf-8?B?cWtVUHAwY1dnQ1dQUHhnckdJRzJ3NDFFWXZXbzNWZDFIUVZNRTFaZmNYNFJR?=
 =?utf-8?B?aTdvZzJ4UzJZcVlUN1FFRGdpNTcyc0ZDaHVUeG83cC9mM2x4eHJNV0x3LzFx?=
 =?utf-8?B?RTNLZFZxaUNWKzltY2FDSGdsZVV3alQwNGl5V0JLSzIzSERBd3lRNnZFak1a?=
 =?utf-8?B?NGdtZ3RvMW8yak1sZkovNGFiQ0VScUMyd29kc3h3bTQ5VEwyUDJ5RFlydUtM?=
 =?utf-8?B?SzVlbThzOXF5dVRiV0oza2RTNmhKbHhGMTgzcGpySHJuVWxESk1ISTREekVh?=
 =?utf-8?B?ME1hSlAwdFB6REJJTVZRa2J5WVZzWDVKUXhJNVlER3B5S01mbjRGSURqaG1E?=
 =?utf-8?B?Y1FFdVU2Nk9UQXNNSGd6RkhyVDVLcXNLUWZKekhWa0tJOENlVlBoSDVQNTBq?=
 =?utf-8?B?WXJGYnNCeFQ0dGhyTVNHTkRtbVY2RGFOUzlITDFuNTlMaERBSkVYZFdVL09C?=
 =?utf-8?B?ak1ESlkvMzFENWFiNjNGbHBGMjE1ZDlSM2xtcHBwQkpUVitxY3FCLy9TSnZU?=
 =?utf-8?B?TUlGN2tZb3BBOUhFeC8vY2RPZTdLS0NnUFFHbEh4VlVyRzZxeTliOW9ablE2?=
 =?utf-8?B?M1FQRGROYTVoOUcrUGRiVE5XaU9qZkhMakoyaEdQT1c3U0cvTUxSRHA1ZnU4?=
 =?utf-8?B?U0VSZ2JMTHdwT05vMDduMWhIb2ZPT3ZRVWdwdzcvZVlLSUZiYWMzZ3JZZjdk?=
 =?utf-8?B?SG5TL1RYTnQvODFWSGtTWHZrRXNKSVVJNUMvVThOMnVKYU1FZjlhSVE5Tmpr?=
 =?utf-8?B?ZjdyQXg0NXZvL1lMQkdUUDVFNmhZd1lVTWpvSTZzS1MybjNTVGNDQnMrYlFB?=
 =?utf-8?B?ZVhBdlB1ZWMvYjU5a0Y3dkNrQU94K3ZqdzJxcU4rc01CN0hZSUxNVUwycXNv?=
 =?utf-8?B?VW1XdVNjNVF6dnVuV0ZRL20rdWRFeVVLUnJtRzdoSWpjN0FubUhtVVQ2K2Rx?=
 =?utf-8?B?L0gvM3U5Y2Yxc2hodU5zbjdEbzBlbTc4eExHZ1M1VUZCTTg3dVNSR0llMlQ3?=
 =?utf-8?B?ZlJBL01UeWpXWkJOa2c1RlFUK001d3NGbTRTM0RrejU5c0R6THJrbUFYTFZ2?=
 =?utf-8?B?dXdBZjRDSDNML0ljTG9lNmJWN1VEVFBjd2xoSHRnbHZMelY2SU5DVFNtMXlN?=
 =?utf-8?B?Z0daSVBLaGhMUVBZUmJYdGJLVWpPQjI1b3NabnZnV2tpd3dXd2hSaG5qdkY0?=
 =?utf-8?B?QlloTnIxWG1zblpMa0ZkRWFaakd0NFBpYWQ5R1E4Y2N1YkVRY0ptMndRUURh?=
 =?utf-8?B?VHNDZERyK3BWY1NKN245Sm9RVXlieDBnOTQ4NVhxcnY3N1RlM0crWVhvdHpV?=
 =?utf-8?B?YmZRcHZGNFF4YlVrOURNZkw2ZENvZzFRd3BzY2FzSWJyR3FBLzV1aE1WZWVm?=
 =?utf-8?B?SEE4YmUxWGRRUFJMbDU3bjF6ZzhIN1RZbXl5ZkZjQkRJMEpYOHY4RDE4aWFZ?=
 =?utf-8?B?aStjRTI3YzZOZE1ybksrQUMrNHh1OXlrMnZ4YnFocStIVGtWR0gvTktpQWlr?=
 =?utf-8?B?ek14a1dkUkJjY2tQODNWZGptZ21BbnpDNjZPS0k5ZGxrdldzblFtVFVjQWQy?=
 =?utf-8?B?Um85MlpTWFArWWJaaEQ4RnZ6VFVvaGtyb2grYWxxVW5MbFQvMFB1L3NSUXVM?=
 =?utf-8?B?Z2JFNVB6bWNyY2toamowNTNxRmw5VktyYVFhU3pJM010RlZ5Ky9QNHZzWFVN?=
 =?utf-8?B?TVZhbExPaWtLekV6aUlheXNEazU4bGdPSHRvcHN2c1M1cVBRYThXdTR1UDlZ?=
 =?utf-8?B?K0pFQU5vV1N5OWI0MGFLTEFxTi9QV0hiM0xDU29RT29PRVdFSmQxZG9qM3pU?=
 =?utf-8?B?MVU3T2pFN1FFejVMSUl5RVI0VzhVaXBSNk9zeTNmd1UzamlxVVR4TWEwTEVI?=
 =?utf-8?B?SnVWajJKeGdjU1NieUJ1UHBvNm9xZjZ3c2RUc29CQWsyZ1orRUxRbXpLZ0Nh?=
 =?utf-8?B?U0N3czZYR25PbSsyTTVHQkNuQTRacHJvSDc4MFRqY3FTb2pYRitvRlc1NWhn?=
 =?utf-8?B?L3I0K0s2NjlXTWJqdFg3QVR1WmhJWlZ4UGEyLzIvZkN0WTRRS3U1Zy85NkVx?=
 =?utf-8?Q?iOP7jOw/x9RLppHxVz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e543d877-d11b-4630-9c27-08df4b0526d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 15:02:40.7618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9z4LMbMiISWRIvefc2TymNM4sQVyua1Bsrv0yjIX1XU256RGhnLXuIoUgAYEVjQaVIhTsZOP3Zjhk5zvXofUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB343215

U29ycnksIE15IHNjcmlwdHMgbWFrZSBtaXN0YWtlLg0KDQpGcmFuaw0KDQoNCk5YUCBDb25maWRl
bnRpYWwNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyayBCcm93biA8
YnJvb25pZUBrZXJuZWwub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI1LCAyMDI2
IDg6MTEgQU0NCj4gVG86IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPg0KPiBDYzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtbmV4dEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogW0VYVF0gRml4ZXMgdGFncyBuZWVkIHdvcmsgaW4gdGhlIGlteC1teHMgdHJlZQ0KPg0K
PiBJbiBjb21taXQNCj4NCj4gICA1Y2QyYTA0NWU1YzE4ICgiYXJtNjQ6IGR0czogaW14OTQ6IENv
cnJlY3QgdGhlIGxwdWFydDkgY2xvY2siKQ0KPg0KPiBGaXhlcyB0YWcNCj4NCj4gICBGaXhlczog
YjBkMDExZDQ4NDFiICgiYXJtNjQ6IGR0czogQWRkIGJhc2ljIGR0c2kgZm9yIGlteDk0MyIpDQo+
DQo+IGhhcyB0aGVzZSBwcm9ibGVtKHMpOg0KPg0KPiAgIC0gU3ViamVjdCBkb2VzIG5vdCBtYXRj
aCB0YXJnZXQgY29tbWl0IHN1YmplY3QNCj4gICAgIEp1c3QgdXNlDQo+ICAgICAgIGdpdCBsb2cg
LTEgLS1mb3JtYXQ9J0ZpeGVzOiAlaCAoIiVzIiknDQo=
