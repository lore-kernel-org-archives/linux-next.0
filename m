Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011068.outbound.protection.outlook.com [52.101.65.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2643827FD43;
	Tue, 18 Aug 2026 00:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787014677; cv=fail; b=OJXghY7fWcRxGs2/x8t/tJV9wqeQNenPWrwI5EBF9ASx8jZUt29ODERzqsw26IsdEeeSb0faz5r1NcaYKBzhiMxdaG2hvzcB7FStbUPjewwHF7WwR/YQcrfxp39N+fe+NqdPYfN4b4byqrdQvWNMju/HyGBNNsjoW7/UTTfANIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787014677; c=relaxed/simple;
	bh=Rc5o+iqC+o0s3zaJRCfyo0dIWIlevxKlhbM2lTQe5dE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pX6yF3EeCt08el884J/w3+jww87iFSOnx4WXwcXgNLeEGgTgNnO+faRJS07tizDveNxEfZoAG+y/YIsjBgkJ7SG7wP6MW4XmtmFE4sr91aJyNQsbOov/a5Hl818FsAmeo+U9XWtgzK90i3126MCl+14xsXFJR0aMm+qLgubQiyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bN8G+aH8; arc=fail smtp.client-ip=52.101.65.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bN8G+aH8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCtCzPWx3o2c0M2Kg/JHJPPKpf9wubwGbWcm8YlujXTja9vncX5eAhJOH7q8HmI6gtVnaQ+FmvRrXFSsh3HM7WXdfOGvNSbV7BJbkF7MRy+YHR7iJO1pS5xpxv2aGLhcVsQJOaU/I258tMXdKifHG1bfd9NSTrSs7OLE5e9lpEXxjbPIXCRc6H3GBRZm8qy+6JFthLkFq4BBSrmigNAmccG58bvQHVf5GRvQAlynbYBZJnkz+qLlZSqS5Hpy2z7XwgVhAlj02oEMXxG8foP7sa3VVdcASbcoRYp/q3JhivvNQJoM7J1ZFUhLV3g4vB3opigZcrnF64VBB/MMD8y56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqts6NTHvdfsBASYdD7gZdAIJymltKVujZRKkAuJezs=;
 b=EyxWolbZlVZ9nFr99Q/So7Jr43yp5fUAJINOCb/s2O2unrLTk5eOFP8I5jHW7miV3jTC5IIztjuuNtDQRAZ/K/FiLa6kPtJYerI+dDieQqHnLni1c45JIDIlos5nJuZllC/B3sBYZwVez2O9Hq3SI67Ryyq55A/8v79cHGySXtM9WbzTqOCRY6Dx20ONRptlS379+Fgc3aD20JC/AYcBI74U2B/K34saqTRP2gnLKD3e303pZfMOSVAJ2oN04+YdL4RF4Mqgd9Ag7MFhbm+UIOjoNaBtP4L0laJK0xdpew7jRgfSLsGhaLsJtrd/Ugtq0kvNG/ZDJ/pZUneS/ww1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqts6NTHvdfsBASYdD7gZdAIJymltKVujZRKkAuJezs=;
 b=bN8G+aH8B5JgV2xgM1vL/55LrqrzNgTYNt9i62K3T81TMApNoqIcJcgFhIxvrVT63nQtqAibwIZYL3yI54iA/y9W0lqz2uHbDWJRCSb6+mCL5JED5CQujIyvUVaUKd4AwEo57GHWeix/IoNKkrGsp8mfJNeKtIsQ4AojtQkmzQe6VWD5THXlz+3VRFnk1y+ElSQXRmI1KAKwQJimN5GsGpEgNrA3G4qWWu1f9DrEagVpMgBBV4YZHJ+tYvGMU502oRZ6Wzg3O+vg+KFfvB7Iy+TyHr1TxEhCZtLeugenVu/Yy8S6oN3DObGah0mHk19x3uWWLQYOxun9SqIiRtn3+Q==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by PA1PR04MB10205.eurprd04.prod.outlook.com (2603:10a6:102:465::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 00:57:46 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 00:57:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the clk tree
Thread-Topic: linux-next: build failure after merge of the clk tree
Thread-Index: AQHdLl10Mlxlf1KYC06QliFuthjDm7ai+/vA
Date: Tue, 18 Aug 2026 00:57:46 +0000
Message-ID:
 <MRWPR04MB12330FB2CC4B859A59E86035A88A62@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <aoMpP0R8qSzhuEId@sirena.org.uk>
In-Reply-To: <aoMpP0R8qSzhuEId@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-18T00:56:09.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|PA1PR04MB10205:EE_
x-ms-office365-filtering-correlation-id: 7f1fae80-bbdc-4ac5-64e9-08defcc3b801
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|38070700021|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 sx+hpKvaufOu2pTczt9HdWaWVAJE9oKJ8nAezjwMIsYUZurydU2C5xyXKqx2Rt27w/fa+f3o9WqHhuHL8oSkeOel52BbCOVk62FTmYbH861rXkhdFQ1TPKehPatkRvN8kJ9pApghoLX0zNPjmifBisL+C/RmApzFReHXwkun69iB+ibAG1yUFvBHHnGJKhG59z+Jn6eMiyPIn8PF7BqLVslx/qHkrYZipLpUlZ/3b5RgTXaOD8bGykQXyYKbWXtmmqkw9ISy5YdYwZymbP7cpGc4ROJ1Uh+HogDo5VsjO02818WwjGlPtdDu5O8IsEsDWYoqw2593Y9jVDSTgO7WfWLgjYeVyjMGXXCv6tpp2RHTQGV8Q5eUCIL4QM1jldm3OIrfjX0i4fGAVXWizfNFfXVIYnW798Nl/ShiCxvdk0xfblkwIc0mKE57AXSVIvrSrW7Cp8gsTyDXl+Zd6tb1EtyKgigqg3DFmxvGArXowyMZjIn3r+V4ge8dO3hxBT0kxMHIaod3rlg7T25+SfQsRGTxPXBWprBWoY2UJf0BlpxN7jUOrjR/YDt6f2k8py7XU5+KZ9Cd/kU8Y1WZ041qD0+xNeI9pib4pSIJ2P0jjIpru3vEoGXvNUS+ziXQiy8xUC+kbdjzrh7jvLc8g2MmZpNCizmhY5rIZdpZHCezj+Oz5UD0rGci5F4zge4Z+2+fOxgy3YpmbsLG6Z6Rj82r+bcP58DORiXXslStT/bsbJ8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?q1FtKkWeIH/PqGF/uitvkkZU9HPqrjVJorIKG0W61uBHZCyeSru+g+UrcOYZ?=
 =?us-ascii?Q?2OwE06u4YtoLMY4Z2buOC3NhZH5IhSpVd+gVUm4q38dA9iOytHUKe6U1mvyK?=
 =?us-ascii?Q?MjglQ5/qXmaq0I7GyRi3fGix9n+MeNuZRISrZZxwjk0Il1NCXWcff+H0PZv/?=
 =?us-ascii?Q?RuzqDDmxiSRMrRDf6b46vyLAwcIcllsmPhYgVgEXX20AGh+9N/hPmCAD2SGz?=
 =?us-ascii?Q?XAUCWjsw5RdjeXaskzLp2oqBPBh48xkWi85r7600qcYliOcJonQNbaPTAuDm?=
 =?us-ascii?Q?nLl0ovLrEHH+LoPjbdIDWNHw61Y7tIzZ3rtzCIkCflYhV9A5FZdbbVEhU0L4?=
 =?us-ascii?Q?xxpj1Ei7XchGjoMV8ppIdFgqjhFqsc//h0IZp0JQIQW3jsytux0rA7sV5QQw?=
 =?us-ascii?Q?FyLhOD89dhFRvkrv93lLopJ4UfAPMG6xC7rU4IrAo+clHXEcccAo+rkRW3i4?=
 =?us-ascii?Q?F2uguUEK0fOe2kkp6PL3ZWNO59GrigIuwLxTeVp/g2URu2KWKtACssCmsKCf?=
 =?us-ascii?Q?phF3ktFydfB3WcMXI6kiMD/S0ReptfgrxXevQfw6yul9ZJEsWgXCyh04gW+U?=
 =?us-ascii?Q?oQbd0FSf5K9dP8PemIQF4SsTmnRJENC1o5qk3kJr4WmIn5ZjxbRvrKPN9fiT?=
 =?us-ascii?Q?ZYpauqGhPqfQGxoqpBqZMdMGIBF8UMiWRg4ZsNifscN2gl+HR3JNSccAkxbN?=
 =?us-ascii?Q?0oBv+qefBoaTf6jlWHR1iglvhqXlzWMxlbGFNRsoHjjfQFQMHKZyc16pv5x7?=
 =?us-ascii?Q?NH1WVey76SAdBV1NMQWV/ZMh/LyaH24+bfKwEtczTmc5ptJe0gZO12gXrlBp?=
 =?us-ascii?Q?zva7YfXx0pa01d1Q7Ee16w7vEz0t7rmHTp1oWSKp9jmSCLuqvHb2UPR3Ba2d?=
 =?us-ascii?Q?ieHTtFwDh5GO7ALsw3ZlE1e3kqdVNQ88wck40gAE12ySIpxx3Ff64y4bqcrJ?=
 =?us-ascii?Q?u0POPHzWQqj+KxK0Sh36wlstxL/0Du3GEz0JVaVEvgKqlyGIzPLfeWR0uI7P?=
 =?us-ascii?Q?PmLWxI0dyySNkOGujXGE4x7sbmj6xYyV8cBm0wJZLyXDBGbsgQsg9tiek7cH?=
 =?us-ascii?Q?tXnVGRuV4yk4m6jBlkGQCmaRG2Ts6jiVAkUROVVbuO8xeALzbn44SqtiiEM9?=
 =?us-ascii?Q?xVN9jrm/2niyCp8LqFL34DwpLszf9F2FKx476WWB0m+MdOb57EaFOUnTVSnH?=
 =?us-ascii?Q?FTLsRdQfc6jn+8h7rB46bBN6T1YNi5Cue16pYKSaIUgXu9c83QLSYuseRZ/a?=
 =?us-ascii?Q?F8esNrgvcqtGf+D1yXzOX0F8Mtjnsl7vcXh84dOl16OBFdh/2uGqYMtn2wP2?=
 =?us-ascii?Q?NF1/MeuwZ5CRt5gZOn4+gYH7ya0tkEJujXOEDil1kEURc3X/SZQovg4Wrzfh?=
 =?us-ascii?Q?a/MGTbShlQw56erkNPJyd6RdnA4Oe2ZZZ3aYySu0ksyqGURFzuB0sP04tBj1?=
 =?us-ascii?Q?+DfoZc8PoPIC7703IdePNujO7ovBYUcU+dV7c0ntwUZsv+QVIynVJn3XMOYc?=
 =?us-ascii?Q?vnsbjvlHfbdM44PjmfGTfE8R/8LBVirT6cLv99y1Uir0cFhNgFlkgYrSKzgf?=
 =?us-ascii?Q?TPqT90f8wrQVBPV/2a8j3hGBSxNnW9mk/hQkGrO7T0SpL28K2d1+G7IHoPJX?=
 =?us-ascii?Q?kT4iVO8qX/DNIWnDmLll66Ojs3JYcKIVrabwf4rgapYRcBlTffzInjd/g8/S?=
 =?us-ascii?Q?14hHDX90kksrPuN5Pxo+zPr1GKvlEOtSil+av8YAwzG6613l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1fae80-bbdc-4ac5-64e9-08defcc3b801
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 00:57:46.8515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FRYacFCtBPo3JnGjcYZssllS/uYrMkAoh7uUIlwsrf/c/kGU00UbY9i9aGCXTo+zNHby6HaxwiF6y9fEmz/U3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10205

Hi Mark,

> Subject: linux-next: build failure after merge of the clk tree
>
> Hi all,
>
> After merging the clk tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Stephen will help squash a fix into clk tree, so the next build
should pass.

https://lore.kernel.org/all/178698381923.5030.9178300925075210422@lazor/

Thanks,
Peng.

>
> ERROR: modpost: drivers/clk/clk-scmi-oem.ko: missing
> MODULE_LICENSE()
> WARNING: modpost: drivers/clk/clk-scmi-oem.ko: missing
> MODULE_DESCRIPTION()
> ERROR: modpost: drivers/clk/clk-scmi.ko: symbol 'scmi_clk_oem_init'
> undefined!
> ERROR: modpost: drivers/clk/clk-scmi-oem.ko: symbol
> 'scmi_proto_clk_ops' undefined!
>
> Caused by commit
>
>    77369b1e6a371 (clk: scmi: Add i.MX95 OEM extension support for
> SCMI clock driver)
>
> I have used the tree from next-20260814 instead.

NXP Confidential
