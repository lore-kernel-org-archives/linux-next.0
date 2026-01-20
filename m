Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA624426EBB;
	Tue, 20 Jan 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.154.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911770; cv=fail; b=XmNLU0He3cZo3VbdeQQnwNQUCPxY5oHNryk3c91kf/51Vv334Cu/xxenGzy6iP8Sn9qpLmYuRKGDmbGBnjDrRJa3UE9q6MBW/e4Jj9uHZRq492TIwjdYyAY+HXPJFsr9YNbpYFl5JZWNpcqZ9a3iQjVDlw/8wL8VIjGUP8eBZsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911770; c=relaxed/simple;
	bh=l8JtlEGLcxL8tw2abIIAFCa620AoAKF24lem65RtglY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TudYe0e/ZfeV4SVLDRMFy+tABNl8//4+grWPAKxysziCpM8HMk/mIL24DkVW23zOsXQ73dYhyQSv2KebOvYku8P8Vd3MXyTiwbkX1Fz5mMiHug0qplTivQyNc2VM5dgp+vrJX62V42FV71tkXgdRCFJATjQ7cL96zaxGdWJ/kAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=KqR0K3wd; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=dyQ3kIxl; arc=fail smtp.client-ip=216.71.154.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="KqR0K3wd";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="dyQ3kIxl"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1768911768; x=1800447768;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=l8JtlEGLcxL8tw2abIIAFCa620AoAKF24lem65RtglY=;
  b=KqR0K3wdkLYTAOF8lyFz4/d8+nrO6ogUepmAHUdxey5558DXEbZJlR4p
   BjpRLbVwKS4ccXUCzL1MWWDmlsPq7jPYzR37CJbZtsVWyH1nI6lScMcmp
   ivz9pYHDzC87RQbQOJuuiUNDzlIwIp7td2+ZWvIx84aiQB427NzrpJTti
   zdtcTyH1bQ5DCJSFt/+e+cvWHUjNJgadQcGeK0zT4gW5o5zVznnnygxaU
   hnDWgny6oUPSUC4FPPxXfpDjmtdd2wTk8ftHzqsEtFPESkUE5t8QZ+Mz6
   yLqkd8Wsk7Cqi8ukk/tuFPOI9X1MniAyvZ69tNQ2ESVrUMW6bo2M8v/sH
   g==;
X-CSE-ConnectionGUID: rOI1vDacSQOVDRj2udqK7g==
X-CSE-MsgGUID: xX1gUkcjQzqQSARgs6kL5w==
X-IronPort-AV: E=Sophos;i="6.21,240,1763395200"; 
   d="scan'208";a="135738975"
Received: from mail-southcentralusazon11012023.outbound.protection.outlook.com (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.195.23])
  by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jan 2026 20:22:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsusjLT6Kw9Ao+S6+/70GFich/J23STIu/2c8+e4TrKmZ0adre2QGZh5XTITjAaNBdUl/EGgYZSNJj+eoaCT4XG1NjSzkUeKrNUWpbjyjbSvKVFPlM1TXd1CAm3TYD178uzh6r0cLryINxS2LDR24EPN+SmmTCvX7vewdXuYOkBQE+w9POgwlyuYXryK3i8AxuF7gynmDL4c6a3ODp1qv/c4iwhpgKBMspHg43vDIgdhe4sWOFMSokRvg3N4Cfe+0cv+SWsh+9dyo/Zxg6G1alnGjCdqBPqMrqc9cMkhxyl/rViiZJgaE21jqjSg5LwMbCjkuVS/RfrztpE0gJTGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8JtlEGLcxL8tw2abIIAFCa620AoAKF24lem65RtglY=;
 b=GVJGpN/8VVQAjOTA0k1yLQkJNWmKJwSzTewYY/pnKGnCSJCVqE6IyasWfuycSetW8GXz0QL2LH14V6vRwBC9GANzN0yJirw1CcN5rWgX0SVO9LNC+vojOAQw+o0W3Rw92mKCdsjWt4Sono2toLIcE4lrCl7xExofqEveijgygxU13Ln524KjW2rzDzb5NsRIHp5PddtQmk+19E8R0YuRCbHstj2p2RwzXE/qCHU6rCpLOcHZvvvi5QC+uF/iBsMVtbArPrkmc27yCCyk4IOwOM7m8tKVGzeKw3K8A/HL9CGDxWeBV9T4XeNH9lcliTWEDxG7f7H2H03Hmp7MYLGQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8JtlEGLcxL8tw2abIIAFCa620AoAKF24lem65RtglY=;
 b=dyQ3kIxlKzMCdL4Gp5Umam41vU53k+tkoRYgqXHUY9dN+BYK8KfEptcyIwzC0g0KZRQhShBXlxyOEno840YR8h/3wyNlWYVU70HAm4zTLVp6cROwAXVabGThodQFmRd6LVJYJftWgsC96SnWrfju8h5T9D3PdqPmxBAfII3y26k=
Received: from LV8PR04MB8984.namprd04.prod.outlook.com (2603:10b6:408:18b::13)
 by CH0PR04MB7972.namprd04.prod.outlook.com (2603:10b6:610:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 12:22:38 +0000
Received: from LV8PR04MB8984.namprd04.prod.outlook.com
 ([fe80::9ba6:7273:90bc:53a8]) by LV8PR04MB8984.namprd04.prod.outlook.com
 ([fe80::9ba6:7273:90bc:53a8%5]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 12:22:38 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Mark Brown <broonie@kernel.org>, David Sterba <dsterba@suse.cz>, Boris
 Burkov <boris@bur.io>, WenRuo Qu <wqu@suse.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs-fixes tree
Thread-Topic: linux-next: build failure after merge of the btrfs-fixes tree
Thread-Index: AQHcigVwSdNPABNVM0uMdSFOMhlPcLVa+uGA
Date: Tue, 20 Jan 2026 12:22:37 +0000
Message-ID: <3a4b638a-f527-4d02-87ec-054ecb84ea0f@wdc.com>
References: <aW9wHq0fs8KpLCyj@sirena.org.uk>
In-Reply-To: <aW9wHq0fs8KpLCyj@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR04MB8984:EE_|CH0PR04MB7972:EE_
x-ms-office365-filtering-correlation-id: 3ad69004-20c2-4d9a-709f-08de581e9970
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YnQwSXpPYjBEdUh1NVhMS0Q2YlRJYW42Yytub1BwbEhzNmVFZ1NjeGRSUk9L?=
 =?utf-8?B?akk0djIvVFA4L2NxNTFTTUpLandGR3JHaENMQkFsdzZxd01SUit1ZUdLYVVR?=
 =?utf-8?B?aERnektNcU5BSEV4bzNmQiszZ3AzQXRvUnM5SklpMnV4eUE0cFU1Q05HSk9s?=
 =?utf-8?B?ZUFBVHo2d2VKRWRJTEZmOUZBc3NQZGFIc2hKZVNiUksyZ0tYRFk2MUovYnJ1?=
 =?utf-8?B?US91SXJGbnBwL2hZWEdIV0xvcG1zaUpVT2pvUkUwejVidkRUOHE1dDRrVXo1?=
 =?utf-8?B?UjBzMmNKQk5ESHJ4UG42N0gyUGE4Nnc0MHE4Q1R3Y25Za1F2NSthS2xuVjJt?=
 =?utf-8?B?cFVLUUpPTzV0d1BDVTlEZ0hxaUUzV2MwVTBzVkRNZFNGNU92WEhOYTNNUUkr?=
 =?utf-8?B?U0dpNTA1Sys1RXUvMUVYN0pKZkljRWNqUVpuTzlOZ2Z2dE51UjB3WklYZm14?=
 =?utf-8?B?MGl3Uks2eXNUUnFxVXBoZktOZ2ppajJOdVhnbWZPeFRqOFdkdTlxSTdLZjJ4?=
 =?utf-8?B?UTZvT0NNVFJVM1VQb0NNdGRSY3ZicGVPUDhGOVRNcVRIQ3FMNWgxL0Q4Z1Fr?=
 =?utf-8?B?cWg2bmw2L1BGMno1SWZsWFhtQ1M0Z0VUQ0M3VHJOb2o1a1J0d0orTnlzR3A2?=
 =?utf-8?B?WlRwNGFxclZOV0VFRnpCOHBRQ3ZIOTRVSmdtY0lCQ3RrQzBCSlJMVW9YUXA0?=
 =?utf-8?B?amUyUUxjRkZkaWl5emxWaXFLQ3lPd3dhWFlPSkI4eGd0RlBPSFh6WmJiUGFr?=
 =?utf-8?B?bGZ1d1k2N2dBaldNK2ZBQ1M3aTljZWhnckhrMXZISnZuTWJVaW1JZUVmVVlQ?=
 =?utf-8?B?ckxxaEdtOGl6Wnh4ekUwWkgzeS9lbjFJNXcyM0VPMnhJNUZFQzhCMUR4Tjcr?=
 =?utf-8?B?MThNdDQwZVZiRjlyd3NFZ1VTRHQ3NTk1WlozaFU2c2xSL1c5YmMzYXZkRWZJ?=
 =?utf-8?B?K2t0SEpOQ2tvZGZIb0t6ZWJnelplM0JwOGhCV1dGOWp5SFJoNy9zN0llRjJC?=
 =?utf-8?B?OGpQOTJLRDZvakdVU1pHWHJkaEdmMDBTREhGMlIrTmIvcmRhZGJNY2VMTFRI?=
 =?utf-8?B?UXh3a2d2dmtkajVKbUFLUExOMTVKNk5vRXJnYTJzUTg3MzE4WXQvRTdLMUJY?=
 =?utf-8?B?THVvdzM5Ly84eWIrdFdmTDZFWXpRQ0RVcXFjOW9aaElRZXM0N29HcmFSQzg1?=
 =?utf-8?B?c0F6azlYUHg1U3ZNOWxZKys0WGhhSE1BVmxkM21BcU1QclRsVnJhWEZnMjF4?=
 =?utf-8?B?VmhPQm85RGJrNVQ3SEk1eVFQN2JMaXA2d2dxRm9iYzUyRUpiWk95dGt3WG1i?=
 =?utf-8?B?cmtZKzl1a3RmT1M1a1RvUWk0ODVZNGdKd1hvU3paS0VpWExPZVJYemRlY01X?=
 =?utf-8?B?RDQ5MEVTbnFoRndYcUJ0TlYvQTdvSDB6bjljZjFKR1ZYSUdYeTNhUkMvd2FX?=
 =?utf-8?B?RjZrL1k0TzZDa3I3WjE2Zk4xK3hmUCtsbXgzY2lDKzY5V0xiNlFsTTJMclU1?=
 =?utf-8?B?ZkRGc3Y3L1RxWjJnL0JjdnVkRFJZVjJYQnIrVVNSM3pobEZpU0hXRENuQ25z?=
 =?utf-8?B?eXZMemMrMUJSemh0emZnNEtyc01mTjBGQ0MwVWdaTkZuRnlHeVpwRldFRWo3?=
 =?utf-8?B?bFdyc2k3UVMyUHFIc3JhTWNtcDhHaXFIQVd1ek4yMjZ5MlVwWVpKM3JUTm5C?=
 =?utf-8?B?bmFiTjF1RndPNzYxVkIxZXNzRUs2YjBENVBROXVlUHdGM1JZdHV1dEVKWGls?=
 =?utf-8?B?Syt6NXRldEk0R2VhZGNBNmNOZ1ZWdVNWQ1lvMzVNNXJ3aUxlL25BbDRmOUVH?=
 =?utf-8?B?d3pXSVZVU2NQQjkxcm41MWlRVUFHQTNwVHZwNklldTMzaVA2cDNMWGZXaWJX?=
 =?utf-8?B?bkpIbXdDSmZuOENMME1BTkpDaTVXNHdxTDJaZEFzK3RnODFRT1lPS2o2SWhW?=
 =?utf-8?B?RkhjcldHcCtNaHVlUUtkNkhLQ1RCSzdNTHh6QUQvQ2NPUWtXS2dNYURBelpR?=
 =?utf-8?B?Yk9KY3VhWkZxNUtyTW9jaDVoSndUY3dUOU9BK0djZlBzNkRSbWFsMm9wQkVB?=
 =?utf-8?B?Y25sdUNzYzl5Rkgzejd1SlVrR2hEUG5KV0w0VUJCVE5WY3BGejBtblhvYWxT?=
 =?utf-8?B?SDZNdGJKdnBRVnJ5c0twSUVSdGx6eDlrVTNMUGNYZTdEQ2JXVkY5NXFHdTVq?=
 =?utf-8?Q?Ugj0RJtglTgDKqQAKexaC2E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR04MB8984.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WW5ZY2lMaEhKbjlFWmdEZGQwRjQ1a2pqNGZ0eHBTUkIwVGtPOWVNaHc4WC9h?=
 =?utf-8?B?cEozK1BNUmkxakFHTGovaGVRZEFPd3hoZjVwd3MvT2xpWFdENUJNc3NSaXo3?=
 =?utf-8?B?aFVMa3o5dXBPS1NJSGFIYUttNmJEcy9YMFh6eFhKT0RlYmhHZzZUdDdiaWhH?=
 =?utf-8?B?ZmJOQldMRllYdnhncXd0aHRqUXgzN2wvek1hVzUrSHlOQzRCdW1JSmQrVTRL?=
 =?utf-8?B?VjRUK01pbGd1UGRHNUNMa3hydW5qVDl0WFU5cUFnZXVwcXFnU2tPd1J5MGFo?=
 =?utf-8?B?bmdueTkyWHZLRk5JQmpIZDUyT1VPVkwza29vOEl4WlJkcjN4UGo4Q1lHRzRQ?=
 =?utf-8?B?S0x6YmF6ZllNaEc3KzZzenpadlIvcTRMVkozWGFLWmlVVG1hNm1iSWxFeEVm?=
 =?utf-8?B?ckxsZ0diQUZ5NGxzWkIxWTNNUEdsSk4wNVNQYmlCbjQ1bllEZGNTQTZVYWlT?=
 =?utf-8?B?ekRrbjRVWVFjQXF5czlGeWxkK3F6cjVaME1OV0ZJQjExaUljTlFuclpZbm5u?=
 =?utf-8?B?bTFKVDlKZlYzVVE4dk5OQnJMQk1wWjNYL21mTVdScWt3YnoyR0xrRXVGa0Vm?=
 =?utf-8?B?LzU4WEFKVmxiRkNQblNRdmIrWHdmb2lEbjN0QnhkRzBTLzVaYWZtK0lXaWNT?=
 =?utf-8?B?TXMxandZZ041ekNXSUUwcWdJM2FyVU1nRTJURyt2VEhsVUNJVVFaYURhMncy?=
 =?utf-8?B?bjB0eUk4NUo1K1grbmNqaHNjeEx6SDdEamR5MWJUdzRUai9GOGkwV2lHZHpL?=
 =?utf-8?B?Z0llVDNPRUJPWEFGUFRrdE45T0ZUdHVkOThYR01aWThWZ1l0NlNBZGlDa013?=
 =?utf-8?B?eXU2Wm0xNTRaS0ZucDc5cUFGZkgrY2IwYVJUWXFvb21ZcVpxMERjd3U5c0xC?=
 =?utf-8?B?cFZ1ZEEwUWM0M0J1QVpkS1VrZGhiVzFOd3c4UHV4MlhMaXZaeEhxcVR5YTNY?=
 =?utf-8?B?UG5McDBMbDN6M0VOTU1FUW4rVU1VS3ZEZGVGU1daQmdhWVc0c3dxdXFxanhx?=
 =?utf-8?B?ckR5QzF5YmJFM25iZkZQYlFEVjd4VHNxYldybk9naENmVjlpQ0U3UUpObjRB?=
 =?utf-8?B?aDdzbzI4U1ZzeTJzc0ppUWl0RG56NFB1aTRLMjRKeXphaWhLUERER3IzSG12?=
 =?utf-8?B?U2ZmR3c2WXErUHFNSjROdGpXMnRRWVF2aDdsdEs3R01rYkNQOVZhUHo2YkUw?=
 =?utf-8?B?U2pYbmY4eHpucjNldmdpRStTMERzOVRXYlk2TTRWdTcxelBoNXZSeW5GNkR1?=
 =?utf-8?B?WnlWcmlSd1NvSXc5M3ROd2tPdzVNMnJQRGNLMGxZcUlJYTI4N0ljN0ZidnhD?=
 =?utf-8?B?bU4vRUk2TUljd215cENZR0x6WEMvMjZ3b2ZnMy9tSVh3bkwySW1KaURUOXd1?=
 =?utf-8?B?QWhscFRZZUhRUHNaZit1QVhYbGF5TDBQUEtaVCtHa0ZxVFFWSGhSd21XMG5L?=
 =?utf-8?B?dGlHRmZnbHFFdERpU2plc2lJaHRiN1ppbnYvOFZiS014bnUyNFRTRk5WbjZT?=
 =?utf-8?B?WnF1ayticERmanJ0a1paOGxsOFhFcXdpUTlQUWd5czljOFNRbGY5UUZGVHNk?=
 =?utf-8?B?NCsxdXhLT3hMem45TllMbVc4RDJMbWJxOU1kbFVoV0szcmsrdmVSL3VkTUR5?=
 =?utf-8?B?VEF3TDhFcG1zWk1teW1XYU94NmNPdk83Y2twaVBrSjRqUWFEUnlHck1Oelhx?=
 =?utf-8?B?dk50TFpSWWd2Tzc1WWlpQzh3a1NmdFdkWDlnMFNCakFBL2psS1B2dGl2MzNC?=
 =?utf-8?B?ckdmTVJSOTVzbERvZEhIOVI1c05nVVVEWTRFclJUdyt4OUlnY0FHNVZWMzFI?=
 =?utf-8?B?dGZzdlZjQXpKNGIwRTdLR01mam5qZzV3ZG1OMnRMSEw2R2dnaXo4Wk9kZFFr?=
 =?utf-8?B?VkhxcnpXNTlKTXJhczNKRmF4WURYaWtJSHh5cEFDYisxYTlmMUxIbm1LQ0Mw?=
 =?utf-8?B?b2pOejIvajhlNWkvWnAzU3Exb1hGSnF4VU1HSWpRb1ZrTHcwRXZzaDNZbFRN?=
 =?utf-8?B?N3l2QVEyR01UMlZCcWNob0NjTlJidmFjc1dmWEx4Y1VKM0J1RDdrVGg3cllJ?=
 =?utf-8?B?dGVJSGhXK3JReS9Nem4wbXRyRFBYM1RsZGQ5REJlT3d6MHdZcE0wQ1RTQi9J?=
 =?utf-8?B?Smwyem9GTUg5cEQvSlliUzNwa2hnUFpVWVJJMTloM3AwVWVZcWc3LzR5Vnpy?=
 =?utf-8?B?OUZCeFFHQkhiTU9vbmoyNHEvMk9naEtWWWpZenRNM2hhbFBjK3R5UUd0cElO?=
 =?utf-8?B?NDB6V3B4d1RQZFppMjVvc3BRUSsvTFlYZDREUngyWTNxdXFWa1pCMWlrRDRZ?=
 =?utf-8?B?aTFTK05ZaTJZMVdwS3ViNnpqSElFam9BU2txMmVpRmVQUEpXUWIxRWVINXVJ?=
 =?utf-8?Q?uO3FtRYZlXWA2N44=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <530E5A3DB4F0B940955533902C915255@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+gdDR8jrHt+b0V8xlxhIWY1bjjvA60yjFzEsuwAsf6NWn7e/Dus+X89YndhR9B/XGe3AB3iE+2RaybKXoPtlhGox/BoDbzclQfLrNY2TDMr+bAVdIp5GFzhOCdsolYlaxGBC0R5UA9ivjVTGZadl8bWR2i06WXmOajG7H0gL5CGjZsfNvQg6cy2WQOM3YN7NR2jhi6U6h2/tN9uGLMpke1N0nIdEhAcr1p5+kNbAWKB090otNPEajDcfJrmWVzEO4l7GOO3sqJ5htOsd5dkVCbGl3vJwl3XqhRegDuX/namS5DkzcnVb8kN2ZsfCDo37+KUMTQvtRw2qPoiYqMJIbNWHRLgEFXKJMFVG2U1PDcjWME7kn/hkoN4Rq75RHzGbOC+jUEjIEGPQs0UZ2a6st+t2YogQOFh5hGM8axLekkNKXnv56VyKUoDe5IaguGO+HPwDlh4wybgq88jwgzMjaOpO+mcI4jGr/vRwvLuvU+x++APUCAmbyXNy07jLmAfJFc7Ls5kCJpp+Vm+Vf567JjJK+IfCELTNsiGtLOGJ0arROUPsRzn3Yyf2tevcZXYAK/pVa9OGLdZPKVO2AW4gRm+smusT9gSRYcVpN2aZ/qdJJxpyV1OnVn4/1gPFrpDm
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR04MB8984.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad69004-20c2-4d9a-709f-08de581e9970
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 12:22:37.9530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J5YvhQym4X9z/Zfw5k7CYd0kwTHSOIlCyopbDplfCT9tEO+VQHczIhqTTgEHtYgud0nAmrdWKloRupceuo24nKzztKWzHEXgIMLrKusSA9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB7972

T24gMS8yMC8yNiAxOjA4IFBNLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBIaSBhbGwsDQo+DQo+IEFm
dGVyIG1lcmdpbmcgdGhlIGJ0cmZzLWZpeGVzIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWls
ZA0KPiAoYXJtNjQgZGVmY29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOg0KPg0KPiAvdG1wL25leHQv
YnVpbGQvZnMvYnRyZnMvZnJlZS1zcGFjZS10cmVlLmM6IEluIGZ1bmN0aW9uICdidHJmc19kZWxl
dGVfb3JwaGFuX2ZyZWVfc3BhY2VfZW50cmllcyc6DQo+IC90bXAvbmV4dC9idWlsZC9mcy9idHJm
cy9mcmVlLXNwYWNlLXRyZWUuYzoxNzY1Ojk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiAnQlRSRlNfUEFUSF9BVVRPX1JFTEVBU0UnOyBkaWQgeW91IG1lYW4gJ0JUUkZT
X1BBVEhfQVVUT19GUkVFJz8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+ICAg
MTc2NSB8ICAgICAgICAgQlRSRlNfUEFUSF9BVVRPX1JFTEVBU0UocGF0aCk7DQo+ICAgICAgICB8
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gICAgICAgIHwgICAgICAgICBCVFJG
U19QQVRIX0FVVE9fRlJFRQ0KPiAvdG1wL25leHQvYnVpbGQvZnMvYnRyZnMvZnJlZS1zcGFjZS10
cmVlLmM6MTc2NTozMzogZXJyb3I6ICdwYXRoJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikNCj4gICAxNzY1IHwgICAgICAgICBCVFJGU19QQVRIX0FVVE9fUkVMRUFTRShw
YXRoKTsNCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+DQo+
IC90bXAvbmV4dC9idWlsZC9mcy9idHJmcy9mcmVlLXNwYWNlLXRyZWUuYzoxNzY1OjMzOiBub3Rl
OiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVh
Y2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbg0KPiAvdG1wL25leHQvYnVpbGQvZnMvYnRyZnMvZnJl
ZS1zcGFjZS10cmVlLmM6MTgxNzoxOiBlcnJvcjogY29udHJvbCByZWFjaGVzIGVuZCBvZiBub24t
dm9pZCBmdW5jdGlvbiBbLVdlcnJvcj1yZXR1cm4tdHlwZV0NCj4gICAxODE3IHwgfQ0KPiAgICAg
ICAgfCBeDQo+IGNjMTogc29tZSB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KPg0K
PiBDYXVzZWQgYnkgY29tbWl0DQo+DQo+ICAgICA3ZmNmODQ1NWY2MTBiIChidHJmczogcmVqZWN0
IG5ldyB0cmFuc2FjdGlvbnMgaWYgdGhlIGZzIGlzIGZ1bGx5IHJlYWQtb25seSkNCj4NCj4gSSBo
YXZlIHVzZWQgdGhlIHZlcnNpb24gZnJvbSAyMDI2MDExOSBpbnN0ZWFkLg0KPg0KVGhpcyBnb3Qg
aW50cm9kdWNlZCBieQ0KDQphMDhjNTk0MWQzYWUgKCJidHJmczogYWRkIG1vdW50IHRpbWUgYXV0
byBmaXggZm9yIG9ycGhhbiBmc3QgZW50cmllcyIpDQoNCmFuZCAnQlRSRlNfUEFUSF9BVVRPX1JF
TEVBU0UoKScgZ290IGludHJvZHVjZWQgYnk6DQoNCjY3NWFmM2MwZmJkOCAoImJ0cmZzOiBpbnRy
b2R1Y2UgQlRSRlNfUEFUSF9BVVRPX1JFTEVBU0UoKSBoZWxwZXIiKQ0KDQp3aGljaCBtaWdodCBi
ZSBtaXNzaW5nIGluIGZvci1uZXh0IG9yIGJ0cmZzLWZpeGVzPw0KDQo=
