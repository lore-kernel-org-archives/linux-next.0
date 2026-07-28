Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013000.outbound.protection.outlook.com [52.101.127.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEAD3A9D8D;
	Tue, 28 Jul 2026 08:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225803; cv=fail; b=kZ5OJC5PnxoByQW5Tcmc8Gx82Ab5KrhckBa/mh5fid51BPgXv7g11slipHIuAdv5mWQHDzmwroFenhy8NbeBKh211T02m8+9U5eA+hJM2uKvWus8MyKeH6ZXxAD2KtLRCVBkKFCLydocllct8u95VBXAYAt+xQiE5qEKFdaQ7TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225803; c=relaxed/simple;
	bh=B32WMQRJVa97OE1P4Exg87LHz8uaKuOi2jKzLuGsLJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GioOMtRgugagGezT0JqkYsnMHn5KyziFa7Zagqff/kkdAMppNqWuQz5hMtSVzQ0+XhQw0yshqHWb6sgoaB2mw8eDihP4/NQH7rX+CaNzfzQsNy70J7t838/gVJ5uhZiWi32r1WBni2chE2/wKi2R6vSXMZlzQSl4dtNsWGHsVBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=WPZdyXSp; arc=fail smtp.client-ip=52.101.127.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="WPZdyXSp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsFyD7RS4YbEi4CG9PbILA3UOICBbAO5Jdm4cgUB2MihjAGZkl/pqt32mgCmhmpRScHqkoijiiDb9RW48fYjIL9VnxoRupg4xaDYmHdk9UJkpLuvzKRqttkcr5vJSZZsmLYYe/elg2uECCWqMhiI4lTpSYCRq0vGxRCaxT6ezu2+hrnfUQGTnjbD//lsIFQl2IfKgm+4KBl49PkgWGr2WcxX+1SeJLLdrchhtrYBsKsj4lkcsv9dlhmcHVoGS9LSxippvhPqFZEj/si1eRG5iQvmyTRF6lIGMsNIKFELxp5l3uguasdUDsRvgJpyqqZlg9k+p1S0g6fHcWvC5AXCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGFB2ytLImu3jGW5BnhMFIni/Ay4aJLuDiWKi5vxXFc=;
 b=YAd+R9T+vGin3OpSr6+vyZP4iWrDoWwh3nOhGsTiIziFPcG0Qj/7i/qp0tgK2zVENmlilJefV03WzrkC/MyXXtol6AknASxUS4EnR66slNWIwHReoXQ0pscYcaUFbXTb2dycT2rWcZIMVd6+0Lw0JzxwP6VZUbQ460JzmGXQQ8PRXcyviWWdmnr0sy6E4+xnRXqmxzgZ/fb6kmN6CoAIBeix+zoWp9atD78QyETMqKJB07BrJlAoBXxp/+FqKlvB7YwGhBRVQg5AqPTEJBEnhI894+5d3t54UXghsTsgGYqj6Z/xqfUerjbitkBbxvjKf4LDmnm0UKH8/rDlrDi0Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGFB2ytLImu3jGW5BnhMFIni/Ay4aJLuDiWKi5vxXFc=;
 b=WPZdyXSpeyYCHyJuLGG+H23lKp58uXiruvcGnG3an3UK4bveo4swAtm40yLS21ifsWFHGYV83rYwPmT6hE/FrGEqPQHjqa1dIU8SCX4DH1dCUEP41VQNlwuiuHucwziaPuJW3m5G45VIp2P93GHpYiTtbXYDSYQn/hxJrtqCSqTsakK+G2C497sODWhi8kG3Hao8/HPg20qnNKvEIIxnK+BNAOmkoeIhwYwjShjNcg0Zm9GaZloIvmDQAc//ArCYpDgIwa5uszaUgMwoLMVjThgXqDsJzcUV91vtm2XyyE/zh9QIP3ThRgr3Q5cG98ocUYYDwkGEIK8Amj+m3c/9NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB6661.apcprd06.prod.outlook.com (2603:1096:101:168::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 08:03:16 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 08:03:16 +0000
From: Pan Chuang <panchuang@vivo.com>
To: mika.westerberg@linux.intel.com
Cc: broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	panchuang@vivo.com
Subject: Re: linux-next: build failure after merge of the thunderbolt tree
Date: Tue, 28 Jul 2026 16:03:06 +0800
Message-Id: <20260728080306.385579-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728043537.GO2365036@black.igk.intel.com>
References: <20260728043537.GO2365036@black.igk.intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0028.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::17) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c728184-2709-4a7c-fa59-08deec7eadd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	debYiqjIEQdE72sdMeiFnNpkf+t0lQ6XGWwkjsC9nQJeNQLERAzuT8pqFrb6qoIHoFjFkHMZGr4T0/a0xUUTTTSW4rGIVRjUjY/CbIfcQxt6Iavc7EkDUuEkrtspHkgbgQSVbIz65J6Ode1wbB3yhNc4w1L4/yP4fdhDRR3IFSXioPFsuvWucsjuiqdBVFBWqJZ+52o4iA+jA2OCZD4WZCNBxKrf65IKeLyd8cYZaQjKC5/lG2ym7gxj0LRb6OJTSm7l3xUJ/RzMXVJxtgIW7o1KhFCJldHR4WIGIHeAlZknpBF3RxtK4kBw9FSMZq2K5m4QB0Zr1Oyo61qZHv5XtNymwRKbasU4WEcSahi6WSAFRlach242dhmOJfMO8pVl1SQfLJwQ5NN7vuBIakXVZJ5RbMhSmwmsSEvhkSi2vasRXXPCUfFb+HTBLYtDf+5z0vmL69V/MfUrgpr1oX6xzJWAzn2at/ZA6KlfYF2/r0WsoZYsuxeK3JxOUOzlLp7hXSoKMy2TJTtAxZ5VMnOYxQsATVvFujv0J+VwHx8uPg6vpaPdfinA62dFuRe1bRd7oPn0B5tAefP1Z6yONx4o5I/cbuwRfRy3GTZvqsShUMA9tQoxJyu5nygWqouSqpWYI5s+UB9e+xfNnnntcfeVY0zMVDKXN0dXpjGBlqRaQbsNFZFfKoznXpsvZVXiMRCRzEHXvtuyIZ0pZNE5O8sXsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WG9DxBnnyfiQNyPOz6k/egWC0jd60nCcS/ZpHZUDnrmzOuo0RtruSuA9zY7M?=
 =?us-ascii?Q?zLrNH3mr5wcIcrkLcbFeNqQeo21RG+FLkHu2Qq/OwA2kUtgps636dgdHQ6/6?=
 =?us-ascii?Q?1sSS/A2NSQ9mEtibqTUyCS7cp8X7hiEohucfYWYQgzO57zi/nFphtdeGWLes?=
 =?us-ascii?Q?tZd7fNbRzomhEQI6O442hJC/MCyqzZ/So+2VyrVimpiRCXHqLf22rfK/j+ql?=
 =?us-ascii?Q?yh9FnbGzL2KKfR/unRxZGjvzs3gbnvPz5QXOq8PzvZz00WOPAgyQMQzx4Jdf?=
 =?us-ascii?Q?1DRm9gHmHjo1020rkbKpBaJqUiMudx0FAepDcCUh5f/2X4hJSS/4XrnQ9sfD?=
 =?us-ascii?Q?N3yk9nElP1+QBd6MIzQimzVqsXWfO04h/g47/Mo1TsClLnKM0O/KGjq8AfeO?=
 =?us-ascii?Q?pWSt0qt+wtqX44gUfxcuj/JP8mE2t2uSxJyph7yMBDvIZfNYfEOZuDPyFTgO?=
 =?us-ascii?Q?qxhKf95yV3f28tTP+pcAtX1MCpoFcBoOknf/sU/+8PLjZbQoZn0hhqQjwxFz?=
 =?us-ascii?Q?SzEMXFpjUD855N4ple9jt0qMbMg9z7qkB3Wrv4DWJab4GipdEreI402MjDeJ?=
 =?us-ascii?Q?uFe2FddjjRJdUMfasZAawDOovc7kKwf/24cFy+douvmKe5oNtWsfUuD885ic?=
 =?us-ascii?Q?MA+aCL58uUOVLTkBqqiYNFzD0GhE2xqcKOMyYrQ7PlPK4vkCFGHdjwpU3I9G?=
 =?us-ascii?Q?jYySQxIk5WNe9+Kit0mipmDjd2CSs1nEJ1T++ZxCwhXGEKvNgNfjghHQfPtC?=
 =?us-ascii?Q?ljFj7r/aGc3zLk8gbHZa5C71ZZk/wTiFnM/eov22Keigs8lpSRsqg7MsdK+W?=
 =?us-ascii?Q?CAI8Jp7z1yXagAk8zwFixPW052K92QDH1zcHllmDXb6Nhj+TMKBWZbG8bugP?=
 =?us-ascii?Q?1DwJqgtcuQTrd0au1rVEU/jOT7Cyd5zlGtcIeF14VDk6Wlx7hLFc8rYPlkRU?=
 =?us-ascii?Q?J2sA6F6HeLDKjHYhBPxdEmhNV1V8vNy30pIu0HP9XMI3uUpEHlvmvSYulB+b?=
 =?us-ascii?Q?sGymCxDfFpcB/Nvi2HU63CfjEtl61Q6l7Y06peyyi94uoHFUYn9DYebgGCBu?=
 =?us-ascii?Q?K6zBmWiyOuOq7gh+RmuZ8MIWi1HCfm9lMSRCRra2ZP0K5dbYrPq6wP5K6Fx9?=
 =?us-ascii?Q?O0smn9+cr1CDtgN/ihmEQY+12CAPe2rTaHgjmj0GjTdRkmU9u/quCgXNY/hv?=
 =?us-ascii?Q?nliqCFecouHW5kIc/MRk0N7m2BXpUALaSDaUcb5dJ5wJ8vMlrjgZsARQEEhS?=
 =?us-ascii?Q?3B6p7DTUqBqlYv8J5KCw0vIEgu/AH4NYYDuBCsQmr30c4XtSU1SkmGaDuMkk?=
 =?us-ascii?Q?EUuHxym512xoyjzXx6Qi5DhwUNCnwPDsuI46Z/xNUUuid5tvYU3BtrguxMCP?=
 =?us-ascii?Q?uge5Z7jz7g7R85agNE9RLOX8GENrjm2OuY3t6dfOXHkRALh1FZ5VErHxX1/o?=
 =?us-ascii?Q?Z3HQhdZ4zVUq3wDo+NlMXgvukJuJQ/64txIuDaC1fCuGz6V4149pRs0bmstx?=
 =?us-ascii?Q?79agyJH09xv0z89SWEd1RBVnWBO0UjfoBiwMMvq7MX274ZSwWT2tmkgf38Yp?=
 =?us-ascii?Q?VII2khjxCeh8CSPv7QTom80qsJaJpcsKZhKDmUZrCwI8WOaJgz/FKy9Tc7to?=
 =?us-ascii?Q?ZaxaW6432g+ljLf09hY5QVJaLLnr48HBSYpw6uKnUVsC3gXtLhkS4xIiBpR1?=
 =?us-ascii?Q?ILUEpqfheOqwEA3nBEdDU3m43E8zHYNUDO5Fi9vjqOUGChmQPZZYz4lYib0n?=
 =?us-ascii?Q?5O2Io1fseA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c728184-2709-4a7c-fa59-08deec7eadd9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 08:03:16.3529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvL7AiOJGk2O2kIugPrOTYu1SgVZkPBIOHOzUr8Oin6S3j/+4Vfs2Pa5jknIrgpyxdzrli+w4YW81nvTz1Vxvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6661



On 2026/7/28 12:35, Mika Westerberg wrote:
> On Mon, Jul 27, 2026 at 04:04:17PM +0100, Mark Brown wrote:
>> Hi all,
>>
>> After merging the thunderbolt tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> /tmp/next/build/drivers/thunderbolt/pci.c:115:17: error: unused variable 'dev' [-Werror,-Wunused-variable]
>>   115 |         struct device *dev = &pdev->dev;
>>       |                        ^~~
>> 1 error generated.  make[5]: ***
>>
>> Caused by commit
>>
>>    eef9f6d8c36f7 (thunderbolt: Remove redundant dev_err_probe())
>>
>> I have used the tree from next-20260726 instead.
>
> Thanks for the report Mark. I've dropped that commit from my tree now.
>
> @Pan Chuang, please send an updated version where this variable is removed
> as well.
Sorry for the noise. The fix is ready and I'll send v2 in a moment.

Best Regards,

PanChuang

