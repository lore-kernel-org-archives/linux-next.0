Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021087.outbound.protection.outlook.com [52.101.70.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2E42D3A86;
	Thu,  5 Feb 2026 20:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.87
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770322278; cv=fail; b=Ra6pU7kr7DUn2qVdZ+C9tDkyHN6+1Wu05lbsRRL8YkuDiLspN+SZesGdE46GYCiKk6kVDT1hRvK+BJRyUz/NPcjbnF9UKpXYPUhWg7m1JQC81+Zth0H+YdmM5/zvz7HQAqDodw3GwJ/ap7OZtb0P9KJoHdkv9yGQwX6o4Aftq+k=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770322278; c=relaxed/simple;
	bh=IencEQ5uvKhM2V1cHovTaqZDCpgeDGaHeOSqYXfqnIY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LRdQnaHE2+UNSnRA73TxIeTj/op+ildBTTaTsjptCptDPzR4GUU/SOp7PniKdbmP5sN5DORGyEnS/oFP4nzmtlam5YVYGcIMQKTTW8gPkN6XwxgFxcLpBGGbjmtGGsznVfgf0eNgFd12NtFcVcAp3/21zYQwA/JOckL5Hm02A8I=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=f7rTAFyr; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=f7rTAFyr; arc=fail smtp.client-ip=52.101.70.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="f7rTAFyr";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="f7rTAFyr"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A+ireCmShJsXQCW1m8kZwB3iz7YLWxNM3XZblBLhkXljHF5buI0K8RnKDO/Ace4paX/+ShqFyuY8hxESflPXq23mvR6dP9pO/TATYtO/4xPSK2UQByrfxWB5KclFu6rQOeJe7+DCM9faWMb7jiegrjMnv9m8BsUUQmY3MZYw/ufwe7xWbrGEYomGxmPsXOQ0plsO3KoU01WXsampsctnDWCDnQC5Jc7P26Xs5DGVhCWxoVEtjiO62TAO/opUdubFS2ofCwyOhisMrOLF7r8123ZpfSLPEgy5ZVPyyqHr0csSZNIAp7rtdebeAGjatzXntL9CSFunVtwVi7jhoEeBhQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IencEQ5uvKhM2V1cHovTaqZDCpgeDGaHeOSqYXfqnIY=;
 b=CWhaLuyJ39SX1rD+EGiYUxpfzFS0xlctsUvxkMEZl4RZTp1XTvprM5PllCOu6CfdPumcHv0lMY0qQhT6cmXIK4zQQnYn3c2iMX3XbL2dxfOuhZ7gtw4W/G9DhdukpejZ1ZI+/1rW+o9gYp4ZzWzSIGLUmseoqy1GlmaYJx9TO6YHxoTCIvJDREGNphaxWotxKmTgWE3oDHG0XA8/5Js0DtqmyRD1BdoaSa2mCUYrkmd6V8pKWym6KgACVUWo7RclHGVm84HUascSk2MJJ0IerK/6U0mkr7ZYAW2WR/gvpXw+3YbGflZiS6XeMU+h9QMY9tilJ0zXvo3YY/d21gQZGA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IencEQ5uvKhM2V1cHovTaqZDCpgeDGaHeOSqYXfqnIY=;
 b=f7rTAFyrb2C5xvjXRrJ2Ci0zXNRHihf98DqfSKx1yoINz+9dKmWyz+l4OdGrOfzk4blhvEp4IQPbfRYx7o4CdcQVqYCY+obeJ+MbrraudjlQhuK3gMtQaM7TwJv8eM+o1ZnhcWLkHWstqxHgZMyvs5Mg/cjOm0RCwQU6+U2Ajts=
Received: from DU2PR04CA0187.eurprd04.prod.outlook.com (2603:10a6:10:28d::12)
 by VI0PR04MB11698.eurprd04.prod.outlook.com (2603:10a6:800:2fa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 20:11:14 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::2b) by DU2PR04CA0187.outlook.office365.com
 (2603:10a6:10:28d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 20:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 20:11:13 +0000
Received: from emails-7797975-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-230.eu-west-1.compute.internal [10.20.5.230])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8E59A7FEF4;
	Thu,  5 Feb 2026 20:11:13 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1770322273; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=IencEQ5uvKhM2V1cHovTaqZDCpgeDGaHeOSqYXfqnIY=;
 b=i1jQskznZHIYmTziqGx+gM2TBz5rFzZUCit/60WVGy4KRHyr6yJHvH3SlQ3n/tse5JgfJ
 yQddwuttb1pyck+fbieR2YbpDCqBMcMAe4SXj30ybrP/E86MiEeT9yeTE7RVycGrGKwlsvj
 dabn6jiWZMSe/P+wjEpKRFHwguiJI2o=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1770322273;
 b=Zumj4R6f4xBchL/w5sY8LQi7VH38FfSw3TKLiwyVWiKHRoOXcTAWs8ifY9pbV4TuF08Pn
 /vKNraJCyJ+0krcy3GlhYQ0HTKGieqN/F1rICaseutDxKQnFgcTt7MmleCCrva/Vwz5v0A2
 0Okgps3ueR/U71YSLUc35NppMMFeo/c=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtjvLSuDtCCHbuvwBOO6DC/aJEkxVybHEfQDkOgqh31bcvMsP4S7nneByjlNzWMp1VYdnmGBMan8YprzEPy1f/vME3icLH0p34kk+zdfiz7oazXLBoaiZe0/TazeMB+De4tZnCsjPx2sFGIWXktezNvMQUBxN7lLn1i3CVdQvWbioPl8mqIb21U9FD6xTtndyfu+oJ7BIRuaaOaqUNpwPZDosMVtp+88pPcxaoo8pOXbiQWHt817YSpA59DtlrA778m0PRrsLPc6OulFO3mK0S/sOzhzrtRzbqs3EaVqc/MdLliG0l65QnxEAt17u1w0yknePCqp/YjmZdzeQdhTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IencEQ5uvKhM2V1cHovTaqZDCpgeDGaHeOSqYXfqnIY=;
 b=Q0WVXc03d4kXShdAa7PY6Ru69Pxfk4HouRimongRyBvn2nqyfPtmUT6Gu25Bae5rdngpPJKaHwp7tbpBUieoaeQvunU65PTA+LdRIcTjTFk8GYpSa4V9gr1xgHcEvsvy9GygSHkHC68a8pVmp//lmfDrTk481UlP85TuobOmtvmWQXMAouElriQWeOMb/8mgZHmNm7FRdrlk4NOWyRF4/0r9JxmgORDm9AXmyYW5DYROdBjJipy86k1E9OyAmvspJmTC8alCPEyaZYp6gWiE0RRsNlN2KAvqVNeGBrPrxTO2NvcvkKm6iBZ4CJhVaYYYRJFgMs817y6BIz8S7tuhGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IencEQ5uvKhM2V1cHovTaqZDCpgeDGaHeOSqYXfqnIY=;
 b=f7rTAFyrb2C5xvjXRrJ2Ci0zXNRHihf98DqfSKx1yoINz+9dKmWyz+l4OdGrOfzk4blhvEp4IQPbfRYx7o4CdcQVqYCY+obeJ+MbrraudjlQhuK3gMtQaM7TwJv8eM+o1ZnhcWLkHWstqxHgZMyvs5Mg/cjOm0RCwQU6+U2Ajts=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU2PR04MB8535.eurprd04.prod.outlook.com (2603:10a6:10:2d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Thu, 5 Feb
 2026 20:11:04 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 20:11:04 +0000
From: Josua Mayer <josua@solid-run.com>
To: Mark Brown <broonie@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Thread-Topic: linux-next: build failure after merge of the mmc tree
Thread-Index: AQHclqQRLjc54X4K10uwr+LAAACJELV0idKA
Date: Thu, 5 Feb 2026 20:11:04 +0000
Message-ID: <b4d5a179-b0b6-403d-bedc-56b3ae69cadb@solid-run.com>
References: <aYScLt9IJ-odFmx_@sirena.org.uk>
In-Reply-To: <aYScLt9IJ-odFmx_@sirena.org.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|DU2PR04MB8535:EE_|DB1PEPF000509ED:EE_|VI0PR04MB11698:EE_
X-MS-Office365-Filtering-Correlation-Id: ceba0032-0b81-4869-f24e-08de64f2b657
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QWJhNVBNNWpoRlpQL2laem5iVllIR3dhUk5pcitBbU9PRE5zbmphU3NnN0p5?=
 =?utf-8?B?Ukl5aTBJa1JxbHk3bFR3MEljNW4yNnAyMjE0UzYxaDBQL0tJaE1JYjZlL2I3?=
 =?utf-8?B?ZTd5V3QrM1JBQ3FaVHcvWmtoVkNOOU16MmVLTkNpbzdZckN1eHVFMU81K0NR?=
 =?utf-8?B?MnBiU0J3MGl2d21yRFRFMDRabHNzQndxbGEvV1U4N0M0ekpzL0xUanVJZm5G?=
 =?utf-8?B?WlZBYm15MWpyLzRyM1BNQTNvaVRsTUI5bjJib1Jqdkw0UGwyNmhCMHBvQmxG?=
 =?utf-8?B?dng3dFAwb0plMU9VVlBuclpsdFNiRERMd0R2RmxQRzQ4b2IrdkpJUU1ydVBx?=
 =?utf-8?B?L1MrdUJkdEY4ejhiYy8xbnkyc0lXTDVSb1d2TlQxaklEUkpBZHVIWjRKa3hJ?=
 =?utf-8?B?eUQzZVhjU2lvb1puSHg5SDkrcW9QZ2lzNi80U25WQWJtcFd0OVl4TjJCK2Q3?=
 =?utf-8?B?c2F2ZHlCVTR4M2JDRnNEbkdhSnBVYndIdHJHR1RoOVFHY2I1Yy8vNWpWQVps?=
 =?utf-8?B?ZEM0WmJxSUpQRmI4WlREQlBmZXNPbmowTFpEdnNpNTFreWFVVUdWdjc4bXd3?=
 =?utf-8?B?WmhPU0UydGN0Yk16NkM3UzlDMUhCc1hIQXNuMFJCWVBxSHVyR3V2TkVUWEJX?=
 =?utf-8?B?U041WkY3OEJKcityR3l2a1dqL3RLUFpPRTBKRStteDIxTWwwa2VtT1NDd0sv?=
 =?utf-8?B?WTlPbFI1aGV2bnFXYTk4clgrOUNxOVV1ZXdvOW40a2xMdUtoZ240WnJqYmx3?=
 =?utf-8?B?SU5HMUU0VStCdjRPUWxKUk9kSlNidW5ML2xGL014ZmZkMHZtWHpkaWMrWkpx?=
 =?utf-8?B?YmFrV0hzZXUrRjZuUmVMRmdnd2U4ZXJHdXM5Q1dCcC9HemFRS1JteXRVVEVB?=
 =?utf-8?B?Qi8xdVVGMVJET2MyYWlmQjNXUERQRHR3WUhESGszamdjU1RCZUFEbHA5Zm9M?=
 =?utf-8?B?NFZoR1hlOGsycFFXU3A1czJDUnlCQkZTR0YzdWJuREx3WmVUaUk5UHNucU94?=
 =?utf-8?B?ZDd4MUhIbjRweWx3Z0JJemhqUXBwNEhQSHd2cXVrSXNhamh1LzFMUllQa2FN?=
 =?utf-8?B?Q0RTRW9melpGR2VxMjlGc1BjbmwzTTltYWVqb3hWeWpCL1hLV0Q4aXJEbEFM?=
 =?utf-8?B?KytqNVVWbHppZDlsaXdRSzlja0NNWmYvNjhtMVlNd2NiZ3krWGFEM3VLRVp0?=
 =?utf-8?B?MFFLU05XcWJvWHVyaGpXY0kwVExoL0c3U01VM0k1Y2RRZEU1eUJ3aDJVZDVM?=
 =?utf-8?B?MkNmcHFzVGdqOFNkZ1poU3M4NkxYSUZoNUdrUjFtcUZPemR1cTFMdmdaOEYy?=
 =?utf-8?B?V0tMZ0dFMXlCeDAyWkdaM01jdGtTTGxKU3dZZVFKQ1ZRSTY4b1k1eWRwRnZr?=
 =?utf-8?B?aUVhTHZxVWFEMzlURThUNVVRTU5pd0VKZlFGWkJ0SDhtemVvR1BpenVaU2lz?=
 =?utf-8?B?a1ZCR3lIRSsvT1p0NlB4UEpNdFRQckxtWmduMmc5aGJDWXlQa2U2RGliZmZK?=
 =?utf-8?B?VkhmMDBvN3ZEa0h3S0RqRXZtNzg1dVQvUlJORHNFTnk1K2pXSmhIOWFqYkpT?=
 =?utf-8?B?M2I5UFZiNzQ2STdKYW5RdkphSXpwMjVZTzhEd2E2YXJXWSt4emxKOWZzL0ho?=
 =?utf-8?B?bi9STEdYeTNIc1E3dE93MWIyV1BLSEVzc1drbC9PazVCaG9CZ0J2N2RhWjBX?=
 =?utf-8?B?S2ZJb1NWLzBXUGhBc2lyRyt0eksxc1RVZGFKVUxleHhkZGtYZGNZaHdUNGZL?=
 =?utf-8?B?WDFlNDg0NWxzeDBBbGdiVENEdWs0d0hOR3B5cWlsZlh0Q2dKOWZETlkyNDN4?=
 =?utf-8?B?YnpNL3hkYUpHRk9uSGNuWHJQUHF3eGhVQW9LdEZ3M1FaeU9JVzh1L1B4K1FG?=
 =?utf-8?B?Y2dSWUVKMnJxbnpORTVBa3VQb1RHY2tyb2dBRTFWWWVyUFQ0YWNRQnV3cVFy?=
 =?utf-8?B?NHdMZ3BMaHFPTW96Q0hHQ1lZRnFZVitIdWx6TlRzK3puemRwOUtZanRSOG05?=
 =?utf-8?B?TEdpZDdxTytNTThpNmVhWGFtUzJCOVlZbHpwaFpkdHNSQzZ3cm9DQzFxRk9F?=
 =?utf-8?B?bmlhRHBNVWZSa245KzdzYWxwTmpqZkIzaHlPRVNBK1BQOVVsM1RZb1crbnN6?=
 =?utf-8?B?QlJTbHN3ZmEzY3p2T0pBck5VNll5SExBRDZLR082NmxPWkg5QzZCTVYweXgw?=
 =?utf-8?Q?os5IYzwCnbi970xROg/y6P0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A5DD6D368574C42BEEC90A580462874@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8535
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 857ed176516f406fa6323f8bd15d9218:solidrun,office365_emails,sent,inline:95de141cdcc9a05caf45321eee1d672d
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14c30b6a-ebc2-457d-b274-08de64f2b0b3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|36860700013|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmI1YWk3UUF6UkU1Wm04V0NjRnRoY1RvenNabzNZTFV1MUNEUW5jRWF3cEF0?=
 =?utf-8?B?bDdIVzk4bzFoK1BnREVPbVJPQzNadkpQSnJtLzRXWGpTeDlaL1BVVnZYUSsz?=
 =?utf-8?B?V1NmbVJ6NVBxTVVHZ3NMMUNMREQ1aGNsN3V0ZnNCY20vRVdieCtHWFROVEQy?=
 =?utf-8?B?dWRpN3NZMCtPbzJ2RTNWTys3NzB4cWt2aWY4WHJibzJINjFuOFpkR0hFMjBF?=
 =?utf-8?B?SlliMGpyZ1FXZkVsOUlyY21UMHB0VnRqakU4T2tXNTJSdHVIUFl5RlBnSk85?=
 =?utf-8?B?djRZYmxHclhFZUtYL01QRXBvdGxhNjJBem1xUkRXSWRkMkpGTVVmV1NSVjdO?=
 =?utf-8?B?SDY0SjRZdE0yRjBsT1VTNktTT25EMExXRFlzUXhKZEZZODNaSldlY2xQdkVT?=
 =?utf-8?B?dmE3NWZxZFN3dTM3QWZhOFZyd3V5eDRLa1RVSGE0QXF5WjFnQzN2Rm5NdWZK?=
 =?utf-8?B?WmR0RFdlbmh0MDZ1SkJ3V2N1RVVZTFl5a0NScnBPY2p1dlJUa3lzSmh5ZHNO?=
 =?utf-8?B?aVJCNVB1aHl0cjdzVGs4SENYMHhVVWpValBpUHRpOEdma1dTNzIzQjFKMlZs?=
 =?utf-8?B?RVN1UjNzRDlhTy95UWFLSzNxTlJyU3k0bjVDbzJLV1ErWklvVnJmbE40bHpk?=
 =?utf-8?B?RUM2K3lrbGk2b3BsT2dOWGdsMG1hM3VqVFhFVzNQWHZsU2J1TnJidzlVL3Ur?=
 =?utf-8?B?UnUxUGsvR1BCVlcrUmVMYW9KRTVxVDFCaGd0Z3ZJTGtQRzFJQkZMOWhsWlFS?=
 =?utf-8?B?ZFJMM1FwZXFUK1VjR014cFFnRGFZMXF3ZURSUnJIOVdwKyt1RGxFeU1JUVRx?=
 =?utf-8?B?NEtzSkNyWWFXNyt3TjRyNGd4YkpsVHNHalNsUDM5anBySng4T1Rnd3R5RjRF?=
 =?utf-8?B?YzNiM0JyMGRZYXlxWUljRDNvZTZkYVdzYXRaU3E2WlZiekZ1S3Urc3g1b1dy?=
 =?utf-8?B?TWlPYjdDSWV2V2trUnVnOTNNenlLajRob01JaUhSUzVFRTdnOUU1SlZGaDNI?=
 =?utf-8?B?aWNLM2tVRUNHa1BGS3BTWHowSjBtTW0zdy9MZzNPVjJkRmhESDFkSkVLRFNE?=
 =?utf-8?B?MTJFaDA2QU5KU3JrOGoyVEh3akdQSis5aVBpS05EUG1yU0hEM1E1SlR1M2Uz?=
 =?utf-8?B?YnhSVndEdUpxNHdEZ1Boa0pmcjRSTklJZ3JuRFQ2ck9Wa2dPUEpORFppd3pP?=
 =?utf-8?B?ZVZUV3B2Q3pzMDJBcFBQbStRSlVNQUp2TWg2bVR0SWxOM05KWUFqTE9DRVk2?=
 =?utf-8?B?bWNMKzB2V011VWVYbDFIbHMzaGRwc0JSU0hCSnNlaU9FVkF5QTBvS1UxejhS?=
 =?utf-8?B?a05HeHM1aVFLMytBcXdUOUU2NFdST0FacFd0R0x5QWFuR3hTd2tJdjJXZDVH?=
 =?utf-8?B?c2o3Zk14dE05ZnVINzYxRXdQODlmRjBwSGxOMS9NVFBGNlFoMFpYd0RJN2Yy?=
 =?utf-8?B?N1hkU0lyb05teWlqenFHVjQySFEvSDRseFI3bzBqeXBjYjNQemtBVGdaR1Mw?=
 =?utf-8?B?ajZCcGVMYmJnVVN5dHkvL0lDVmkxeFkvaTNZVE9uOVVFZG5ubXExeG9kV1ll?=
 =?utf-8?B?WVJleUlNVi9kbTFZZmg1WnFuT0prRFFsWmh5eUxMbTlsc2ZQclNEaGlpdjJS?=
 =?utf-8?B?L2ppbElLbWNSSjd6RzZhZjF6U1VyRG80R2xnblZCYlN6M25vWTJMRDM0dkhW?=
 =?utf-8?B?VUd5eGJjTERMUi9WeWRpK1AwYk5LbzZ1OE04Z3RUNTZpRGZFMmRSaGdOVk0z?=
 =?utf-8?B?VnNWUjdtakJGcC9qckNrR3dWTE5RNkNjYUxVa0VaRFlWNEFBckdCbkhVd3Fq?=
 =?utf-8?B?bWlIekxoS3B5clA1OW1aa003bGRoVjhXZ1dGN0UxdkgrN3hCSU5nOEd4T3lT?=
 =?utf-8?B?RUVLd1R0cEtDNDVKcU9NZE05U3FjT0pkOHRXdjZQa3c2N3FBWFh2OHZFVUhV?=
 =?utf-8?B?dEZqNHl4VytqeGZGVHUrcEtib3U0VnFZZExCTFNRNEZVU25yZStsV0tIYkFD?=
 =?utf-8?B?SzJyeWJSRS9wY045TzRqQks2RHFUMXR2UDVPS0JrZU9Pdm1mQkhmT2h6RWZM?=
 =?utf-8?B?S01aV0JNNk5yTmZ1UEhCK2ZpYWFvcVBSRTRSdnJiQUxoQ0djWmI4My8zTURC?=
 =?utf-8?B?UWZUSGdBN21tMDl0MnFaVEtZM2hBU1F3ampwMzVFaEFLS1hQRy8yVnJ5SENP?=
 =?utf-8?B?RzRrOUNXYkcyTi9zVzVLeXV2d215YTBVYi9wcHBlQnREbFNIWkxQNlRaalRO?=
 =?utf-8?B?M3k5bHlWK080ek9jN3JxMEtycVZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(36860700013)(376014)(35042699022);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bu6kMFUyNwl3eej4OgOsQ3iFJO/QbbMf2KUvFZuWo40PKSary5/MEtiyDRlJwzIqpcUCTkFoIY4NqMSC5C8zJUBA/zsxwCcji6Lr/lYlmU046tzAi7yCvO+PaBN2Zj0XYjrcwERolNVIEHOsbEynoal4tF0k87sS4C0Y2o/1LZIRYdXCtSYLuPhrD1lWZyZOOBzswnfj93qW0sUwYr7eACM8BOIcesblu5QRf/xu234A0/ryZmry8mwFFlU2NVsZP6+o3r7pdJSwE3IOENoRcLVZ2XLWFldHIRvpXP06fHAwq3HKffP6LXzLMUTwPtAZYdRmef9DlJ73cuzinJN41GvXqYIA16HM44Zr4viwIAjPVkd38wGIq7a+eorIdERi1icbQuQ2XbCJQDMECAx8A0ZML1M+8mBzZyw1QEAG2kPziPzBy9EyXHcqFR/WOpm/
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 20:11:13.6837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceba0032-0b81-4869-f24e-08de64f2b657
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11698

SGkgTWFyaywNCg0KT24gMi81LzI2IDE1OjMzLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBIaSBhbGws
DQo+DQo+IEFmdGVyIG1lcmdpbmcgdGhlIG1tYyB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVp
bGQgKHg4Nl82NCBhbGxtb2Rjb25maWcpDQo+IGZhaWxlZCBsaWtlIHRoaXM6DQo+DQo+IC90bXAv
bmV4dC9idWlsZC9kcml2ZXJzL211eC9jb3JlLmM6MzEyOjE0OiBlcnJvcjogcmVkZWZpbml0aW9u
IG9mICdtdXhfY29udHJvbF9zdGF0ZXMnDQo+ICAgIDMxMiB8IHVuc2lnbmVkIGludCBtdXhfY29u
dHJvbF9zdGF0ZXMoc3RydWN0IG11eF9jb250cm9sICptdXgpDQo+ICAgICAgICB8ICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn4NCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC90bXAvbmV4
dC9idWlsZC9kcml2ZXJzL211eC9jb3JlLmM6MTk6DQo+IC90bXAvbmV4dC9idWlsZC9pbmNsdWRl
L2xpbnV4L211eC9jb25zdW1lci5oOjcwOjI4OiBub3RlOiBwcmV2aW91cyBkZWZpbml0aW9uIG9m
ICdtdXhfY29udHJvbF9zdGF0ZXMnIHdpdGggdHlwZSAndW5zaWduZWQgaW50KHN0cnVjdCBtdXhf
Y29udHJvbCAqKScNCj4gICAgIDcwIHwgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgbXV4X2Nv
bnRyb2xfc3RhdGVzKHN0cnVjdCBtdXhfY29udHJvbCAqbXV4KQ0KPiAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4NCj4gL3RtcC9uZXh0L2J1aWxk
L2RyaXZlcnMvbXV4L2NvcmUuYzozNzU6NTogZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiAnbXV4X2Nv
bnRyb2xfc2VsZWN0X2RlbGF5Jw0KPiAgICAzNzUgfCBpbnQgbXV4X2NvbnRyb2xfc2VsZWN0X2Rl
bGF5KHN0cnVjdCBtdXhfY29udHJvbCAqbXV4LCB1bnNpZ25lZCBpbnQgc3RhdGUsDQo+ICAgICAg
ICB8ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gL3RtcC9uZXh0L2J1aWxkL2luY2x1
ZGUvbGludXgvbXV4L2NvbnN1bWVyLmg6NzQ6MzI6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24g
b2YgJ211eF9jb250cm9sX3NlbGVjdF9kZWxheScgd2l0aCB0eXBlICdpbnQoc3RydWN0IG11eF9j
b250cm9sICosIHVuc2lnbmVkIGludCwgIHVuc2lnbmVkIGludCknDQo+ICAgICA3NCB8IHN0YXRp
YyBpbmxpbmUgaW50IF9fbXVzdF9jaGVjayBtdXhfY29udHJvbF9zZWxlY3RfZGVsYXkoc3RydWN0
IG11eF9jb250cm9sICptdXgsDQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gL3RtcC9uZXh0L2J1aWxkL2RyaXZlcnMv
bXV4L2NvcmUuYzo0MTM6NTogZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiAnbXV4X3N0YXRlX3NlbGVj
dF9kZWxheScNCj4gICAgNDEzIHwgaW50IG11eF9zdGF0ZV9zZWxlY3RfZGVsYXkoc3RydWN0IG11
eF9zdGF0ZSAqbXN0YXRlLCB1bnNpZ25lZCBpbnQgZGVsYXlfdXMpDQo+ICAgICAgICB8ICAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IC90bXAvbmV4dC9idWlsZC9pbmNsdWRlL2xpbnV4L211
eC9jb25zdW1lci5oOjc5OjMyOiBub3RlOiBwcmV2aW91cyBkZWZpbml0aW9uIG9mICdtdXhfc3Rh
dGVfc2VsZWN0X2RlbGF5JyB3aXRoIHR5cGUgJ2ludChzdHJ1Y3QgbXV4X3N0YXRlICosIHVuc2ln
bmVkIGludCknDQo+ICAgICA3OSB8IHN0YXRpYyBpbmxpbmUgaW50IF9fbXVzdF9jaGVjayBtdXhf
c3RhdGVfc2VsZWN0X2RlbGF5KHN0cnVjdCBtdXhfc3RhdGUgKm1zdGF0ZSwNCj4gICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4g
L3RtcC9uZXh0L2J1aWxkL2RyaXZlcnMvbXV4L2NvcmUuYzo0MzU6NTogZXJyb3I6IHJlZGVmaW5p
dGlvbiBvZiAnbXV4X2NvbnRyb2xfdHJ5X3NlbGVjdF9kZWxheScNCj4gICAgNDM1IHwgaW50IG11
eF9jb250cm9sX3RyeV9zZWxlY3RfZGVsYXkoc3RydWN0IG11eF9jb250cm9sICptdXgsIHVuc2ln
bmVkIGludCBzdGF0ZSwNCj4gICAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4NCj4gL3RtcC9uZXh0L2J1aWxkL2luY2x1ZGUvbGludXgvbXV4L2NvbnN1bWVyLmg6ODQ6MzI6
IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2YgJ211eF9jb250cm9sX3RyeV9zZWxlY3RfZGVs
YXknIHdpdGggdHlwZSAnaW50KHN0cnVjdCBtdXhfY29udHJvbCAqLCB1bnNpZ25lZCBpbnQsICB1
bnNpZ25lZCBpbnQpJw0KPiAgICAgODQgfCBzdGF0aWMgaW5saW5lIGludCBfX211c3RfY2hlY2sg
bXV4X2NvbnRyb2xfdHJ5X3NlbGVjdF9kZWxheShzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11eCwNCj4g
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4NCj4gL3RtcC9uZXh0L2J1aWxkL2RyaXZlcnMvbXV4L2NvcmUuYzo0Njk6NTog
ZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiAnbXV4X3N0YXRlX3RyeV9zZWxlY3RfZGVsYXknDQo+ICAg
IDQ2OSB8IGludCBtdXhfc3RhdGVfdHJ5X3NlbGVjdF9kZWxheShzdHJ1Y3QgbXV4X3N0YXRlICpt
c3RhdGUsIHVuc2lnbmVkIGludCBkZWxheV91cykNCj4gICAgICAgIHwgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+DQo+IC90bXAvbmV4dC9idWlsZC9pbmNsdWRlL2xpbnV4L211eC9jb25z
dW1lci5oOjkwOjMyOiBub3RlOiBwcmV2aW91cyBkZWZpbml0aW9uIG9mICdtdXhfc3RhdGVfdHJ5
X3NlbGVjdF9kZWxheScgd2l0aCB0eXBlICdpbnQoc3RydWN0IG11eF9zdGF0ZSAqLCB1bnNpZ25l
ZCBpbnQpJw0KPiAgICAgOTAgfCBzdGF0aWMgaW5saW5lIGludCBfX211c3RfY2hlY2sgbXV4X3N0
YXRlX3RyeV9zZWxlY3RfZGVsYXkoc3RydWN0IG11eF9zdGF0ZSAqbXN0YXRlLA0KPiAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4NCj4gL3RtcC9uZXh0L2J1aWxkL2RyaXZlcnMvbXV4L2NvcmUuYzo0ODc6NTogZXJyb3I6IHJl
ZGVmaW5pdGlvbiBvZiAnbXV4X2NvbnRyb2xfZGVzZWxlY3QnDQo+ICAgIDQ4NyB8IGludCBtdXhf
Y29udHJvbF9kZXNlbGVjdChzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11eCkNCj4gICAgICAgIHwgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IC90bXAvbmV4dC9idWlsZC9pbmNsdWRlL2xpbnV4L211
eC9jb25zdW1lci5oOjExODoxOTogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBvZiAnbXV4X2Nv
bnRyb2xfZGVzZWxlY3QnIHdpdGggdHlwZSAnaW50KHN0cnVjdCBtdXhfY29udHJvbCAqKScNCj4g
ICAgMTE4IHwgc3RhdGljIGlubGluZSBpbnQgbXV4X2NvbnRyb2xfZGVzZWxlY3Qoc3RydWN0IG11
eF9jb250cm9sICptdXgpDQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+DQo+IC90bXAvbmV4dC9idWlsZC9kcml2ZXJzL211eC9jb3JlLmM6NTEzOjU6IGVy
cm9yOiByZWRlZmluaXRpb24gb2YgJ211eF9zdGF0ZV9kZXNlbGVjdCcNCj4gICAgNTEzIHwgaW50
IG11eF9zdGF0ZV9kZXNlbGVjdChzdHJ1Y3QgbXV4X3N0YXRlICptc3RhdGUpDQo+ICAgICAgICB8
ICAgICBefn5+fn5+fn5+fn5+fn5+fn4NCj4gL3RtcC9uZXh0L2J1aWxkL2luY2x1ZGUvbGludXgv
bXV4L2NvbnN1bWVyLmg6MTIyOjE5OiBub3RlOiBwcmV2aW91cyBkZWZpbml0aW9uIG9mICdtdXhf
c3RhdGVfZGVzZWxlY3QnIHdpdGggdHlwZSAnaW50KHN0cnVjdCBtdXhfc3RhdGUgKiknDQo+ICAg
IDEyMiB8IHN0YXRpYyBpbmxpbmUgaW50IG11eF9zdGF0ZV9kZXNlbGVjdChzdHJ1Y3QgbXV4X3N0
YXRlICptc3RhdGUpDQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fg0KPiAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9tdXgvY29yZS5jOjYzNjoyMTogZXJyb3I6
IHJlZGVmaW5pdGlvbiBvZiAnbXV4X2NvbnRyb2xfZ2V0Jw0KPiAgICA2MzYgfCBzdHJ1Y3QgbXV4
X2NvbnRyb2wgKm11eF9jb250cm9sX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIg
Km11eF9uYW1lKQ0KPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fg0KPiAvdG1wL25leHQvYnVpbGQvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaDoxMjc6MzU6
IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2YgJ211eF9jb250cm9sX2dldCcgd2l0aCB0eXBl
ICdzdHJ1Y3QgbXV4X2NvbnRyb2wgKihzdHJ1Y3QgZGV2aWNlICosIGNvbnN0IGNoYXIgKiknDQo+
ICAgIDEyNyB8IHN0YXRpYyBpbmxpbmUgc3RydWN0IG11eF9jb250cm9sICptdXhfY29udHJvbF9n
ZXQoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICptdXhfbmFtZSkNCj4gICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fg0KPiAvdG1w
L25leHQvYnVpbGQvZHJpdmVycy9tdXgvY29yZS5jOjY1NToyMTogZXJyb3I6IHJlZGVmaW5pdGlv
biBvZiAnbXV4X2NvbnRyb2xfZ2V0X29wdGlvbmFsJw0KPiAgICA2NTUgfCBzdHJ1Y3QgbXV4X2Nv
bnRyb2wgKm11eF9jb250cm9sX2dldF9vcHRpb25hbChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0
IGNoYXIgKm11eF9uYW1lKQ0KPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fg0KPiAvdG1wL25leHQvYnVpbGQvaW5jbHVkZS9saW51eC9tdXgvY29u
c3VtZXIuaDoxMzE6MzU6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2YgJ211eF9jb250cm9s
X2dldF9vcHRpb25hbCcgd2l0aCB0eXBlICdzdHJ1Y3QgbXV4X2NvbnRyb2wgKihzdHJ1Y3QgZGV2
aWNlICosIGNvbnN0IGNoYXIgKiknDQo+ICAgIDEzMSB8IHN0YXRpYyBpbmxpbmUgc3RydWN0IG11
eF9jb250cm9sICptdXhfY29udHJvbF9nZXRfb3B0aW9uYWwoc3RydWN0IGRldmljZSAqZGV2LA0K
PiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+DQo+IC90bXAvbmV4dC9idWlsZC9kcml2ZXJzL211eC9jb3JlLmM6NjY3OjY6
IGVycm9yOiByZWRlZmluaXRpb24gb2YgJ211eF9jb250cm9sX3B1dCcNCj4gICAgNjY3IHwgdm9p
ZCBtdXhfY29udHJvbF9wdXQoc3RydWN0IG11eF9jb250cm9sICptdXgpDQo+ICAgICAgICB8ICAg
ICAgXn5+fn5+fn5+fn5+fn5+DQo+IC90bXAvbmV4dC9idWlsZC9pbmNsdWRlL2xpbnV4L211eC9j
b25zdW1lci5oOjEzNjoyMDogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBvZiAnbXV4X2NvbnRy
b2xfcHV0JyB3aXRoIHR5cGUgJ3ZvaWQoc3RydWN0IG11eF9jb250cm9sICopJw0KPiAgICAxMzYg
fCBzdGF0aWMgaW5saW5lIHZvaWQgbXV4X2NvbnRyb2xfcHV0KHN0cnVjdCBtdXhfY29udHJvbCAq
bXV4KSB7fQ0KPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+DQo+
IC90bXAvbmV4dC9idWlsZC9kcml2ZXJzL211eC9jb3JlLmM6Njg4OjIxOiBlcnJvcjogcmVkZWZp
bml0aW9uIG9mICdkZXZtX211eF9jb250cm9sX2dldCcNCj4gICAgNjg4IHwgc3RydWN0IG11eF9j
b250cm9sICpkZXZtX211eF9jb250cm9sX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gL3RtcC9uZXh0
L2J1aWxkL2luY2x1ZGUvbGludXgvbXV4L2NvbnN1bWVyLmg6MTM4OjM1OiBub3RlOiBwcmV2aW91
cyBkZWZpbml0aW9uIG9mICdkZXZtX211eF9jb250cm9sX2dldCcgd2l0aCB0eXBlICdzdHJ1Y3Qg
bXV4X2NvbnRyb2wgKihzdHJ1Y3QgZGV2aWNlICosIGNvbnN0IGNoYXIgKiknDQo+ICAgIDEzOCB8
IHN0YXRpYyBpbmxpbmUgc3RydWN0IG11eF9jb250cm9sICpkZXZtX211eF9jb250cm9sX2dldChz
dHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKm11eF9uYW1lKQ0KPiAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gL3Rt
cC9uZXh0L2J1aWxkL2RyaXZlcnMvbXV4L2NvcmUuYzo4MzE6MTk6IGVycm9yOiByZWRlZmluaXRp
b24gb2YgJ2Rldm1fbXV4X3N0YXRlX2dldCcNCj4gICAgODMxIHwgc3RydWN0IG11eF9zdGF0ZSAq
ZGV2bV9tdXhfc3RhdGVfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbXV4X25h
bWUpDQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fg0KPiAv
dG1wL25leHQvYnVpbGQvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaDoxNDI6MzM6IG5vdGU6
IHByZXZpb3VzIGRlZmluaXRpb24gb2YgJ2Rldm1fbXV4X3N0YXRlX2dldCcgd2l0aCB0eXBlICdz
dHJ1Y3QgbXV4X3N0YXRlICooc3RydWN0IGRldmljZSAqLCBjb25zdCBjaGFyICopJw0KPiAgICAx
NDIgfCBzdGF0aWMgaW5saW5lIHN0cnVjdCBtdXhfc3RhdGUgKmRldm1fbXV4X3N0YXRlX2dldChz
dHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKm11eF9uYW1lKQ0KPiAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fg0KPiAvdG1wL25l
eHQvYnVpbGQvZHJpdmVycy9tdXgvY29yZS5jOjg0ODoxOTogZXJyb3I6IHJlZGVmaW5pdGlvbiBv
ZiAnZGV2bV9tdXhfc3RhdGVfZ2V0X29wdGlvbmFsJw0KPiAgICA4NDggfCBzdHJ1Y3QgbXV4X3N0
YXRlICpkZXZtX211eF9zdGF0ZV9nZXRfb3B0aW9uYWwoc3RydWN0IGRldmljZSAqZGV2LCBjb25z
dCBjaGFyICptdXhfbmFtZSkNCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+DQo+IC90bXAvbmV4dC9idWlsZC9pbmNsdWRlL2xpbnV4L211eC9j
b25zdW1lci5oOjE0NjozMzogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBvZiAnZGV2bV9tdXhf
c3RhdGVfZ2V0X29wdGlvbmFsJyB3aXRoIHR5cGUgJ3N0cnVjdCBtdXhfc3RhdGUgKihzdHJ1Y3Qg
ZGV2aWNlICosIGNvbnN0IGNoYXIgKiknDQo+ICAgIDE0NiB8IHN0YXRpYyBpbmxpbmUgc3RydWN0
IG11eF9zdGF0ZSAqZGV2bV9tdXhfc3RhdGVfZ2V0X29wdGlvbmFsKHN0cnVjdCBkZXZpY2UgKmRl
diwNCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4NCj4gL3RtcC9uZXh0L2J1aWxkL2RyaXZlcnMvbXV4L2NvcmUuYzo4
NjY6MTk6IGVycm9yOiByZWRlZmluaXRpb24gb2YgJ2Rldm1fbXV4X3N0YXRlX2dldF9zZWxlY3Rl
ZCcNCj4gICAgODY2IHwgc3RydWN0IG11eF9zdGF0ZSAqZGV2bV9tdXhfc3RhdGVfZ2V0X3NlbGVj
dGVkKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbXV4X25hbWUpDQo+ICAgICAgICB8
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiAvdG1wL25l
eHQvYnVpbGQvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaDoxNTE6MzM6IG5vdGU6IHByZXZp
b3VzIGRlZmluaXRpb24gb2YgJ2Rldm1fbXV4X3N0YXRlX2dldF9zZWxlY3RlZCcgd2l0aCB0eXBl
ICdzdHJ1Y3QgbXV4X3N0YXRlICooc3RydWN0IGRldmljZSAqLCBjb25zdCBjaGFyICopJw0KPiAg
ICAxNTEgfCBzdGF0aWMgaW5saW5lIHN0cnVjdCBtdXhfc3RhdGUgKmRldm1fbXV4X3N0YXRlX2dl
dF9zZWxlY3RlZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IC90bXAvbmV4
dC9idWlsZC9kcml2ZXJzL211eC9jb3JlLmM6ODg1OjE5OiBlcnJvcjogcmVkZWZpbml0aW9uIG9m
ICdkZXZtX211eF9zdGF0ZV9nZXRfb3B0aW9uYWxfc2VsZWN0ZWQnDQo+ICAgIDg4NSB8IHN0cnVj
dCBtdXhfc3RhdGUgKmRldm1fbXV4X3N0YXRlX2dldF9vcHRpb25hbF9zZWxlY3RlZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsDQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiAvdG1wL25leHQvYnVpbGQvaW5jbHVkZS9saW51eC9t
dXgvY29uc3VtZXIuaDoxNTY6MzM6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2YgJ2Rldm1f
bXV4X3N0YXRlX2dldF9vcHRpb25hbF9zZWxlY3RlZCcgd2l0aCB0eXBlICdzdHJ1Y3QgbXV4X3N0
YXRlICooc3RydWN0IGRldmljZSAqLCBjb25zdCBjaGFyICopJw0KPiAgICAxNTYgfCBzdGF0aWMg
aW5saW5lIHN0cnVjdCBtdXhfc3RhdGUgKmRldm1fbXV4X3N0YXRlX2dldF9vcHRpb25hbF9zZWxl
Y3RlZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+DQo+IENh
dXNlZCBieSBjb21taXQNCj4NCj4gICAgYWQzMTQzNDhjZWI0ZiAobXV4OiBBZGQgaGVscGVyIGZ1
bmN0aW9ucyBmb3IgZ2V0dGluZyBvcHRpb25hbCBhbmQgc2VsZWN0ZWQgbXV4LXN0YXRlKQ0KDQpJ
IGFtIHB1enpsZWQgYnkgdGhpcyByZXN1bHQsIGFuZCB0cnlpbmcgdG8gZGVidWcgYnV0IHg4NiBh
bGxtb2Rjb25maWcNCmlzIGEgdmVyeSBzbG93IGJ1aWxkIG9uIG15IGxhcHRvcC4NCg0KVGhlIHN0
YXRpYyBpbmxpbmUgZnVuY3Rpb24gZGVjbGFyYXRpb25zIGZyb20gdGhlIGVycm9ycyBhcmUgaW4g
dGhlIGVsc2UNCmNhc2UgaWYgYW4gaWZkZWYgQ09OSUdfTVVMVElQTEVYRVIuDQoNClRoZSBtdXgu
YyBzaG91bGQgb25seSBiZSBjb21waWxlZCBpZiBDT05GSUdfTVVMVElQTEVYRVIgaXMgZGVmaW5l
ZCwNCmJhc2VkIG9uIGRyaXZlcnMvbXV4L01ha2VmaWxlOg0KDQptdXgtY29yZS1vYmpzwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA6PSBjb3JlLm8NCm9iai0kKENPTkZJR19NVUxUSVBMRVhF
UinCoCDCoCDCoCDCoCs9IG11eC1jb3JlLm8NCg0KSSBkb24ndCB1bmRlcnN0YW5kIGhvdyBpdCBp
cyBwb3NzaWJsZSBmb3IgbXV4LmMgdG8gYmUgY29tcGlsZWQsDQp3aGlsZSBhdCB0aGUgc2FtZSB0
aW1lIENPTkZJR19NVUxUSVBMRVhFUiBpcyBub3QgZGVmaW5lZC4NCg0KQW55IGlkZWFzPw0KDQo+
DQo+IEkgaGF2ZSB1c2VkIHRoZSB2ZXJzaW9uIGZyb20gbmV4dC0yMDI2MDIwNCBpbnN0ZWQu

