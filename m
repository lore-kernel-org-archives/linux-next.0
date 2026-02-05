Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023097.outbound.protection.outlook.com [40.107.159.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2536F2264AB;
	Thu,  5 Feb 2026 20:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.97
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770323353; cv=fail; b=G1Ai634QPoJlnk4A3poMP/qfJrKF/tMQNwSDocetbbfsQZR3O7dR4OzySKoxDndtBjeSFTiV/VjiSxcItdyaDh472jhKC6d47AEf+i3fPPDwbL+cRadihnvwKQGSdKJ3x9jDFCVpnbWHtX3zdTFji0DzBBvIrFulDuWhD9G44FQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770323353; c=relaxed/simple;
	bh=nVG/kD0ZJcK/SW/TFtIqAFOZrQJnjz07q+nJgWYxImI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WGCtUc+zpoAZ/LWuUOUez3WW0PzKmADy9awcCH0B55He44cjr1wr4oVh2gAAnHflh1rrqEBuv5QdbNUN36mOO1ohIIg5hi5J3+3XgnSMf9SGzMdsZ65x1rJchZx9esLEOB9uKz6oXGqQVPqNpp+phne0tYn3LBwAApu3D2b1DT4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=dCvrrk77; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=dCvrrk77; arc=fail smtp.client-ip=40.107.159.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="dCvrrk77";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="dCvrrk77"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RWjcfBEeQMvvaSpnNYqOSSii9vHVyLEx9Cqt3u0MCuLuKVdiCSX37OW92XdSiCKK/IRq/ihNTn5CFky2o2YkV27yS2szX/TT/BeYnF9MoyDvFP2UVcQNcl3lupQY0iTww5wTrqHdh0J1M3rWB/Ja4jL3ZDA7tVLkpoNIzYudZQzysO5CARhetc7nQT9joCo6k1++TS6hEHAR61f74fLp/RVcQOvjDnu+TzKTwFU4b80NyMH12dpf1C39lCgpT1DjAIGK4y2z4IJzxPiwsmnnaBFaufAQpDZ6nKQ0pnXvA+55ehM/+sx6urLXtAsOLPhcwRQD2ULkAtTZDLE38rBg6A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVG/kD0ZJcK/SW/TFtIqAFOZrQJnjz07q+nJgWYxImI=;
 b=taJN7k9Bpnpm/yROvCEuoZL6HjhGbFC4kLTM07IYB0+GsVQsHC7Sd9Lr79aH2xrAKs4oljofocxbADfslkoS8+/9Pxn2h8Pd6nR0HkqD6PgPg5LsU59Ga6oJPzd5c055ZjXf2GHWZFa4dQKdgocd+BZSsfPiy2G9E1jmeCoTfmyyev+mzZYkFLupYcNCpL0AtZCdmky49AuGoHF2uRUjr/Us4gzH2nrYN7U9F5lyrNXHio8HTXONYB78WIQC33V1gd+vExziVgxF8ZgbSZ/T3VPd5g35wCbEWALzTycZB2PCjxwNUC7Dr+9Q4ubmVoJuk7b61akk37j+zQwaTvFNlA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVG/kD0ZJcK/SW/TFtIqAFOZrQJnjz07q+nJgWYxImI=;
 b=dCvrrk77RgBYtCUbu/3QFbkpnZC/5BaceAnaqUMNjM2JQNqDZgcw+DUyBpWqVH3GMxhU/JhkPNPdDFf3OlqYTggGxgwGAJfPlnBqUDGEe26wNiQuEn+1vhfp38q9cAJVvWZqgRzpQu6FORQV9kMYhaQ/UzWqQBCNyWenwB35qSY=
Received: from DUZPR01CA0135.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::6) by GV2PR04MB12065.eurprd04.prod.outlook.com
 (2603:10a6:150:2ff::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 20:29:09 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::85) by DUZPR01CA0135.outlook.office365.com
 (2603:10a6:10:4bc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 20:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10 via
 Frontend Transport; Thu, 5 Feb 2026 20:29:08 +0000
Received: from emails-5762643-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-224.eu-west-1.compute.internal [10.20.6.224])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 946FD7FEE2;
	Thu,  5 Feb 2026 20:29:08 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1770323348; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=nVG/kD0ZJcK/SW/TFtIqAFOZrQJnjz07q+nJgWYxImI=;
 b=IiWePhR+366NATn+0/UCdBFKWgT6htuJIJbKJJUmGvxPD1sVuTwIVGHxSkCL67ctoIDEQ
 UWaFRFEMuoPZ+C66hJ5gdyFfkf5jdbWd/7dgHtFNxKFEZRrprjRI2dXp1Jqjc6zSY0LwxFY
 PzoIM2ycIuvS40Hv8a33wyDSGkxo3N4=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1770323348;
 b=e2agp0gpp7pMUDFCMjtSWEJlxS1qiAD5tKWQAk/xcLJrCE+RfjpCRQvOhlBbDAeO9oqHn
 X+I+afa3yAEiM3a4Y1QgtffDEVJqRzVkSuFbT7YJW0eP0ZxulcjE1ZBKL3z/WAWu7aQw7Md
 PgmMba6rd3TFTz3XgpljEdw1aWRlTvE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NX+hwJ9qoGdqP74eluK1UcwKemAEfudEpsCNytewx+57nDnWQ1qKnpF4JCa95E8UigoQDf1X/4GcXr5uwug//6OLxfNINti8tYv6hvKdtnsqo3IRsbkeVSnP2198ygS9B8yBMq+xkUG3wuQ5ZzudMNnbMYsvs9feZfPH4rYeVsrjXNQcetCkQfq6TXc18I1KGVX0V4mvtYlZxjA8+5pNg4xeTkTgn91F+awE61/3t57aNwNNYCXPlAafmdFqUo5aiRez4QyUmiN5vmuoFfny3WW5jbosPDrT6SQ1iI2Wr4g3o3wEo4rX4Xv/vRQy90T3vlBbx1Gvt4BWalVfrS5/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVG/kD0ZJcK/SW/TFtIqAFOZrQJnjz07q+nJgWYxImI=;
 b=Gy35F089mcB5bfr3Vxwvkei1rvZDscm1LlFybIvbJoumhzNTsO4LX4C0AwXKc6s1EKMy8PbsiDf6w65TZC3NV5KSuUx9uR1N9V1lMG9g9Sj2xsZCqpv43ug9W7s7ct6vbUrxDGXUvNLH3ozZmf1cw1/ukc9CTwsxHalKF42RAH1Lc5l8rTqhGoS87D2+q7Y+uYRWk3RrBZdc9nlC0f4q9s4Yi/dfQ3IPJJcR1uNekOMsSwzOP4f+T6XRUdYxHt4so+0Ot/moAWDnqt1WAZzwdVRYXV0yQyCvbiFNbreQCp72BbYKVlOz0bJOimuAkQxAHpqjzJRG3f3MOXGEmtOdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVG/kD0ZJcK/SW/TFtIqAFOZrQJnjz07q+nJgWYxImI=;
 b=dCvrrk77RgBYtCUbu/3QFbkpnZC/5BaceAnaqUMNjM2JQNqDZgcw+DUyBpWqVH3GMxhU/JhkPNPdDFf3OlqYTggGxgwGAJfPlnBqUDGEe26wNiQuEn+1vhfp38q9cAJVvWZqgRzpQu6FORQV9kMYhaQ/UzWqQBCNyWenwB35qSY=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA1PR04MB10721.eurprd04.prod.outlook.com (2603:10a6:102:489::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 20:28:58 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 20:28:58 +0000
From: Josua Mayer <josua@solid-run.com>
To: Mark Brown <broonie@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Thread-Topic: linux-next: build failure after merge of the mmc tree
Thread-Index: AQHclqQRLjc54X4K10uwr+LAAACJELV0idKAgAAFAgA=
Date: Thu, 5 Feb 2026 20:28:58 +0000
Message-ID: <db9b6ada-896d-42f9-9072-d67803122190@solid-run.com>
References: <aYScLt9IJ-odFmx_@sirena.org.uk>
 <b4d5a179-b0b6-403d-bedc-56b3ae69cadb@solid-run.com>
In-Reply-To: <b4d5a179-b0b6-403d-bedc-56b3ae69cadb@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|PA1PR04MB10721:EE_|DU2PEPF0001E9C2:EE_|GV2PR04MB12065:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e4bf26-0679-4e06-e473-08de64f53716
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MVNVQmhoUEEzNkk0YmtkMTN2aGRnUjk3TWt2UFRXczRyTzFMM0FsSkZtUzJ3?=
 =?utf-8?B?cXVuRURZVGwxcWphRnlwditlVGEyYVNZSks3c0N5cUtCcXlSQmUrT2VjOUlS?=
 =?utf-8?B?aDRpeUFKSVBqak5RTUl6b3dieXRNc0RSQzgxdkozZW4zWnBYNWRUR0YyZzdq?=
 =?utf-8?B?dksxRndMMUNTQ0lHZ1JUSnFyeFNYS3FWaENvM1FTZGRvZEoxbjh6UVBCYWZ3?=
 =?utf-8?B?ZUwxTmRBdHlPQ1RkRjlaQVlDa3dxK01Xc005eUpjRW1PVXBkakN4aml5b0V0?=
 =?utf-8?B?ankzMDRiZ3R6MEdQck9sbTExREI4cFRMY3NuZHBya29MTUsrWUR3M3VJNE1M?=
 =?utf-8?B?aWhiRG1xV0FCcUJYdkVidGdlVVlTMVplVlYyYVBIVytjQVVJUS8vY05LbHMv?=
 =?utf-8?B?YkcwRnBQRDQrWndmTUtLMUZCelpQV1NNcmVGcTg2NmN3Yk5EelVQditwNlBS?=
 =?utf-8?B?ejZRN2Nab1lvdDB2MHZPU2hiaGNtRDBEMVVqdVFQY0k3Ulk4OWNWL3RnQXVN?=
 =?utf-8?B?b1B6dG5lNmFseHdaNXNPYW5kbmI2Z3lRbjFPMWF2dHdyc1hwbVdqZ0w3c1I1?=
 =?utf-8?B?bThoSmdBOE8yeVJBcTFGYmtRSU40ZVBPU01xUXVmZlpBTURNQklSazNGL0Ju?=
 =?utf-8?B?TnUwb0VXWVNUSTNvdUxlSkNnajE2ZXU4dDluK0UxekUxRVN2ZzdCbS9oQXJM?=
 =?utf-8?B?MWtHamkrMjBKY29RL2hDNjBFUER2RWh6Z1hWTFdwd3Vkdm1nMEZHd0gxMnIr?=
 =?utf-8?B?NXZQK2U1SjJtTE9RTDdLNkpVOU1Nb09vZnRSQWkzbDhCdGQzK280M1IvWkRq?=
 =?utf-8?B?czZSeHFDUDEwYm1RZWtnaHo4ODFGeFFLTDU1VzlGNEtvUGxoMGNVVVFQS2dX?=
 =?utf-8?B?QnhvdEUvR1dycnk5RDFNN1NqenhSNXRvaVkwRkxFUHRkV2RHSXFua2FRNU5m?=
 =?utf-8?B?cVl2YmduNjhJcE1aRUtmWjNsenVnSy9wc0MwM1BFb1NuNWlKcnFma2hveVI2?=
 =?utf-8?B?NXArVFAzWTZuanJGM25qelZSdnlTT0c0K2RzeGw3dWpIZ29XTE9nWWNZYytM?=
 =?utf-8?B?djFjYThnMFpGb0dDc3MrdlJ1WkJnVjFmYlc3MVRSUUI5d0ZZZzN5QmxjLzBB?=
 =?utf-8?B?UkNvcldHaDJtVFRUVklxbUY1V0xrRjhqZ2NBbmg3N0NYbEtxdkNLbFRESWo0?=
 =?utf-8?B?SkRiVXkzb2x1MHZJRWNDaHFaUWtKSXZNVnVKTmhwUU1DMWxTR1JqZ05laHVl?=
 =?utf-8?B?b2tTZkdNQ0cyNTh3RnVHaVh2Wk9GWmc3cTVGZGlndXdsTUVkMERneFBmVGVa?=
 =?utf-8?B?QTd4UCt1eVFkamNRM01rVDVOYi8rbUhEL0d3c3FwV09DeVBNSDBtSSs3QUJG?=
 =?utf-8?B?TFBYNVZJUUtvWkVMTWVoY211U2s5L1BvSzN6QnJZeEpEQUpxdDRoUi9zMzhW?=
 =?utf-8?B?TnF6OEZ0SUsxa0R2K3pYeHNpaFJoRU9aZzVMN1hFaUREaHloVFNqbllHRmRU?=
 =?utf-8?B?S3JCREFEVnRmZi9ndG1rTWV5aGI3TnRZYThnMHpOQWZzOXR3Ym9iKzllRHdR?=
 =?utf-8?B?YVpIc3p4WmMwdHgvWkpMQWNNUUZvcE9VZ1VLNmc3b3EwaGwwM2NVSXBmYW9S?=
 =?utf-8?B?Y3ViNFhjekwxZVZ4MmV4RVlwNTdiQlNVZ3NrelFYNFY3QkFydm9zUE5La1g5?=
 =?utf-8?B?OHpya1pQZXdBU1Naa054RTY1TGk3OXpRNERjeFNwczBHcncxTW9zZGUyOWN0?=
 =?utf-8?B?N2lXZGlZdHhramlBbC9mUW82S0hmdEpTQy9QcEtBcUVpOXl5WDZyVGlnUDJX?=
 =?utf-8?B?WS9mTG8reXJ5TGphRTdkWjZPSVI2WUJzTEo1NHhjWDdKcFQyL1RvMW11djJM?=
 =?utf-8?B?YXhSdHpsWUt4akRkM1RDTW1EdUEzSS9hZzg1WDZpV0psb29PYXBYTWNBN1o4?=
 =?utf-8?B?eHozSEVVL25RWWQxUmN6MytQYVNzbkV2KzVaQnJIc0lKNG9pZmpMenp2dTJp?=
 =?utf-8?B?SXRwRmErcWt2eXdQdy9pTW5iMlo0bC9hL05Qa1F0Y29CV3NYcW9ZNW5HRDhj?=
 =?utf-8?B?d0lJeVdjYVE2MDM3NnU0c1VseGNraTk5c1NTWUFaQmx5K1Z0U3B2NGF5N2hE?=
 =?utf-8?B?U213NzkvcitNTlVadWs2ZXJ1NTZDWEdVWXREM256TGQxaXhldk1SMU1pMEdM?=
 =?utf-8?Q?d2CuT+eFjc/cYlMYZ/d1AGA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2709803AA536354FA4B1813A4F594366@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10721
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 6d68e013c2a74157b76d5e8c6612e0ea:solidrun,office365_emails,sent,inline:95de141cdcc9a05caf45321eee1d672d
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e35945fd-921e-4352-a69d-08de64f5313b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aG0yeEpTS2VkSkxBRmx3eXhXclZNRjY5M0FKWjN0KzZKVHJiRmplc2lhY2N0?=
 =?utf-8?B?SWI2b2dsNmhYdjV3QUtUVHFnMjFSTVJEUEllajcxM1l4Y2xKSE1lb1oydnNi?=
 =?utf-8?B?djVTTXBKWm5sbFZtNnNaKzF3ZWNmVTZkQjNZaTlqWDhNUGtMTFlwNk80VW5i?=
 =?utf-8?B?TnZCemVncnNSVHpmRU04UFQ1Y0pKb240T3B2VDhMWTRpeEVRY0Rkcm9sK25O?=
 =?utf-8?B?bFNBc2UvbUhQNFdHYVU1bW9SYW1sZTlvc3F1R1Vmb0ZwdjhTOVFReUl5R1RF?=
 =?utf-8?B?STBZY3NHZytSaUxzU1pxRHEvRnMyNmVTUTVWZUlvTkpZTk55a2UwdUk3UlU1?=
 =?utf-8?B?bktNZXlpVEVoNjFYbDllN2Q0R3dLUjR4M3hzZFBZNHJQZnNrMHBVdENLbFB3?=
 =?utf-8?B?bmM4N29JZ3plSlJTMzdRTVdiYzdkQmJTT0tBNkczaWQwaXAxcHIrRHI4SzMw?=
 =?utf-8?B?b0tydXhReDE5V29leDExTmFVbFBHZUE4WTBLaklpM2lTbW8rZGtPYnYrcmdW?=
 =?utf-8?B?UjF4MHlPTWJLOG8zSlRHbXlnNlI2MEo0dVlpOFdVS2FjWUc2MVVQYXN2ZTJC?=
 =?utf-8?B?NzFwTzljMG1kNkpYdDdFQmVsRzFEcGgyWlVzR2VWNDhNUnhhUnExdGFaMGZM?=
 =?utf-8?B?d1UyRGVmRHZvTmIwL04zMXFGN1AyU1UzOUpiRmRlK3Z5T3RVNFl0Y0VKemR4?=
 =?utf-8?B?ZXdMQXM0c0RmTnRSbzd2ampYQUMwZEFhTFNEWkhEVkw0NTRnMUhNSmVNMGlt?=
 =?utf-8?B?bmdoWXFDUUpHem9jU3A4Vmxmckd0aHRFMTdYOVhITHdTdVNTaXhaZlZaY05p?=
 =?utf-8?B?QWtCVmpsWmxRUE4vbndYTzFKd2paMmE3RzVlUVgrYktMTmtSVzM2Sm13Zm4r?=
 =?utf-8?B?QnR5TW9yZ2FHSXEwN0ZSUGVVWXVVd3EyRTVRWG1YYm0rV3l4cm9EZFVSL1dy?=
 =?utf-8?B?Tld5THZ1MWhCR1gxNjFpbTgzNGpXRkZ5UGZHMEt6NVllVUxucnRzK3Zsd0Yz?=
 =?utf-8?B?TVN5bi9YMjN3WGJ5T2hBQnNCeFVHNHJ0TnQwcExzWWIrK3VlTTdiUmV4MUFC?=
 =?utf-8?B?L3hTa0tJQVVnUWlUeUkxYlYrUnlYenhpMjRuSEF2WUxDcUFBQ0dRWjc5RDJK?=
 =?utf-8?B?M3M0Q0V6dDh3YzlvZU5uM2hxb1krM1A5TEVOTGtka3VmVWFjUE1HOFdvOUg5?=
 =?utf-8?B?T3c1TFRJZ3JleUFObjZrUUVLZTVmVERMMC84bXVWS2dzWVMvczQ5UUtNOVJC?=
 =?utf-8?B?d1JoWTBmNFFPK0ozQk1wZUx5ejBxMnBBNkYzbTY4UVhOV0pFTmJ0ZkpQcGtu?=
 =?utf-8?B?YmRod0Z3M1lkRUFmQkExNkU0WEh5MmNRclJhSjZvYVVKVG5jay8zNW41OVpk?=
 =?utf-8?B?TFNhZU5xWDB1RENPNkdvSCt6M2ZpQWR1UmlJSG9DMWs3RUpkUzBmWmJJLzdT?=
 =?utf-8?B?dzhoaU5HSS96VThyTkcrSm4rSGJvYm13MncvQ0dHeENLL2o2U3dOTCtrMjRQ?=
 =?utf-8?B?TDBmTjdlNGpUaDE0aEtRenVSMFRXS0UzdGUvbEc5RnUzd3p5OVdoWjdQZ1JO?=
 =?utf-8?B?Q042NjBORWRwQW9sZ1J2NnB5ZFIvM2toVnJIQVJsbVZKTk5SVGdEaDBROVUx?=
 =?utf-8?B?WmM0Yy9ZbWphbm1TWmxiR0Z2c25mMjlINEVQMUN2bnF1TTVSRHN6WjNIQzVa?=
 =?utf-8?B?TGM4OVJuQit0MHJEV0JRY2M2V3RpczgxcERWeGdTeVZreW5aRWp2NnpDVVgy?=
 =?utf-8?B?eTBUVmRRTUVFZ1cvbDVJbnl0ZkpJRFcwU2dwZjk3OWJPcFltVVNaMGM0a2tP?=
 =?utf-8?B?SUV5d09TeDFRV3ZsWVVBeFBXRWplRHo1V0VBMitTcFRRZmZ4dGE5di83MHdq?=
 =?utf-8?B?ZUtiNGh0aU1hbXh1L0ZqUkxqS0R3MWpmUmlmajhkSE5QS29aV0Uvc0p6emx0?=
 =?utf-8?B?MW8vaEdGK3Q1SmN4dWoydmVtcHUwY1VITzJXWnVsUHhnbE8wS0o4dzE4ajVU?=
 =?utf-8?B?b293QnRCNmV4RUdZMSszKzh4bnhyanVENjFyQ3Z0SEMyZEJjTWl3eW9PbXJk?=
 =?utf-8?B?Zys2aEJUUCsxMXp2VVhMaTA5UjEvcGpiblhnTklacFU1Qm9PS1Jtd0Y4ZXBr?=
 =?utf-8?B?bkZtWUg5OEpPODZoRkJyQitJK1dWRzUyL0pPSXpNQU0wOWpFZmJuTlNnbHlY?=
 =?utf-8?B?VkV3c3VxcUhJVnNPUzRxVS9uNVBUZGJ2YlM1dlRmK1MraUdrVm5qU3YyajRx?=
 =?utf-8?B?bjVtWkxLMGRlaEF1bjV3WW1GVHNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mC3v7BR7NjFZ90EqblfFj3HtemSo99AwWMK0D4c5Twsq1UtZr+0BmNgQDq3cpoMuTplKrSCFg8ahUlYDJugz8QL8TX1V3F8A2CT9XrgkFeWbaECdPp1kdNr5YfeXGfrs0euozdzDfM47e7wk+lYzERH6s0vwoTATAU/7g80ZEkfxfAnn3f6xWNxJoFyeRE2bt3KcY2QHUQYE4QAp8YXQTeGSWjrD0YcRNmrM0p4bA0+2rLriHV54F1p4Fdy1rIXVSGDNSjVCPw+sxvY8Y9GI4WgAY1g1pKgBJu3YnKIe+s3BEodF6cDfOjz688QoZgpE5qntzG0IJGgXLhKT9vtbFyiAcjP6uZAy8yyqIbb7sDPOEKyl7ClMIJQq43s3Y4f3ZJ5e96OjpaqmGlGQgqBqWEShMHLnrPheTz70+2isVAUw/rIR/gMAlXq3ZdWvxUQW
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 20:29:08.6774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e4bf26-0679-4e06-e473-08de64f53716
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12065

T24gMi81LzI2IDIyOjExLCBKb3N1YSBNYXllciB3cm90ZToNCj4gSGkgTWFyaywNCj4NCj4gT24g
Mi81LzI2IDE1OjMzLCBNYXJrIEJyb3duIHdyb3RlOg0KPj4gSGkgYWxsLA0KPj4NCj4+IEFmdGVy
IG1lcmdpbmcgdGhlIG1tYyB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKHg4Nl82NCAN
Cj4+IGFsbG1vZGNvbmZpZykNCj4+IGZhaWxlZCBsaWtlIHRoaXM6DQo+Pg0KPj4gL3RtcC9uZXh0
L2J1aWxkL2RyaXZlcnMvbXV4L2NvcmUuYzozMTI6MTQ6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg
DQo+PiAnbXV4X2NvbnRyb2xfc3RhdGVzJw0KPj4gwqDCoCAzMTIgfCB1bnNpZ25lZCBpbnQgbXV4
X2NvbnRyb2xfc3RhdGVzKHN0cnVjdCBtdXhfY29udHJvbCAqbXV4KQ0KPj4gwqDCoMKgwqDCoMKg
IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn4NCj4+IEluIGZp
bGUgaW5jbHVkZWQgZnJvbSAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9tdXgvY29yZS5jOjE5Og0K
Pj4gL3RtcC9uZXh0L2J1aWxkL2luY2x1ZGUvbGludXgvbXV4L2NvbnN1bWVyLmg6NzA6Mjg6IG5v
dGU6IHByZXZpb3VzIA0KPj4gZGVmaW5pdGlvbiBvZiAnbXV4X2NvbnRyb2xfc3RhdGVzJyB3aXRo
IHR5cGUgJ3Vuc2lnbmVkIGludChzdHJ1Y3QgDQo+PiBtdXhfY29udHJvbCAqKScNCj4+IMKgwqDC
oCA3MCB8IHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IG11eF9jb250cm9sX3N0YXRlcyhzdHJ1
Y3QgDQo+PiBtdXhfY29udHJvbCAqbXV4KQ0KPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+
fn5+DQo+PiAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9tdXgvY29yZS5jOjM3NTo1OiBlcnJvcjog
cmVkZWZpbml0aW9uIG9mIA0KPj4gJ211eF9jb250cm9sX3NlbGVjdF9kZWxheScNCj4+IMKgwqAg
Mzc1IHwgaW50IG11eF9jb250cm9sX3NlbGVjdF9kZWxheShzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11
eCwgDQo+PiB1bnNpZ25lZCBpbnQgc3RhdGUsDQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPj4gL3RtcC9uZXh0L2J1aWxkL2luY2x1ZGUvbGludXgv
bXV4L2NvbnN1bWVyLmg6NzQ6MzI6IG5vdGU6IHByZXZpb3VzIA0KPj4gZGVmaW5pdGlvbiBvZiAn
bXV4X2NvbnRyb2xfc2VsZWN0X2RlbGF5JyB3aXRoIHR5cGUgJ2ludChzdHJ1Y3QgDQo+PiBtdXhf
Y29udHJvbCAqLCB1bnNpZ25lZCBpbnQswqAgdW5zaWduZWQgaW50KScNCj4+IMKgwqDCoCA3NCB8
IHN0YXRpYyBpbmxpbmUgaW50IF9fbXVzdF9jaGVjayANCj4+IG11eF9jb250cm9sX3NlbGVjdF9k
ZWxheShzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11eCwNCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+PiAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9tdXgvY29y
ZS5jOjQxMzo1OiBlcnJvcjogcmVkZWZpbml0aW9uIG9mIA0KPj4gJ211eF9zdGF0ZV9zZWxlY3Rf
ZGVsYXknDQo+PiDCoMKgIDQxMyB8IGludCBtdXhfc3RhdGVfc2VsZWN0X2RlbGF5KHN0cnVjdCBt
dXhfc3RhdGUgKm1zdGF0ZSwgDQo+PiB1bnNpZ25lZCBpbnQgZGVsYXlfdXMpDQo+PiDCoMKgwqDC
oMKgwqAgfMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+IC90bXAvbmV4dC9idWls
ZC9pbmNsdWRlL2xpbnV4L211eC9jb25zdW1lci5oOjc5OjMyOiBub3RlOiBwcmV2aW91cyANCj4+
IGRlZmluaXRpb24gb2YgJ211eF9zdGF0ZV9zZWxlY3RfZGVsYXknIHdpdGggdHlwZSAnaW50KHN0
cnVjdCANCj4+IG11eF9zdGF0ZSAqLCB1bnNpZ25lZCBpbnQpJw0KPj4gwqDCoMKgIDc5IHwgc3Rh
dGljIGlubGluZSBpbnQgX19tdXN0X2NoZWNrIG11eF9zdGF0ZV9zZWxlY3RfZGVsYXkoc3RydWN0
IA0KPj4gbXV4X3N0YXRlICptc3RhdGUsDQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4NCj4+IC90bXAvbmV4dC9idWlsZC9kcml2ZXJzL211eC9jb3JlLmM6NDM1
OjU6IGVycm9yOiByZWRlZmluaXRpb24gb2YgDQo+PiAnbXV4X2NvbnRyb2xfdHJ5X3NlbGVjdF9k
ZWxheScNCj4+IMKgwqAgNDM1IHwgaW50IG11eF9jb250cm9sX3RyeV9zZWxlY3RfZGVsYXkoc3Ry
dWN0IG11eF9jb250cm9sICptdXgsIA0KPj4gdW5zaWduZWQgaW50IHN0YXRlLA0KPj4gwqDCoMKg
wqDCoMKgIHzCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+PiAvdG1wL25l
eHQvYnVpbGQvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaDo4NDozMjogbm90ZTogcHJldmlv
dXMgDQo+PiBkZWZpbml0aW9uIG9mICdtdXhfY29udHJvbF90cnlfc2VsZWN0X2RlbGF5JyB3aXRo
IHR5cGUgJ2ludChzdHJ1Y3QgDQo+PiBtdXhfY29udHJvbCAqLCB1bnNpZ25lZCBpbnQswqAgdW5z
aWduZWQgaW50KScNCj4+IMKgwqDCoCA4NCB8IHN0YXRpYyBpbmxpbmUgaW50IF9fbXVzdF9jaGVj
ayANCj4+IG11eF9jb250cm9sX3RyeV9zZWxlY3RfZGVsYXkoc3RydWN0IG11eF9jb250cm9sICpt
dXgsDQo+PiDCoMKgwqDCoMKgwqAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+PiAv
dG1wL25leHQvYnVpbGQvZHJpdmVycy9tdXgvY29yZS5jOjQ2OTo1OiBlcnJvcjogcmVkZWZpbml0
aW9uIG9mIA0KPj4gJ211eF9zdGF0ZV90cnlfc2VsZWN0X2RlbGF5Jw0KPj4gwqDCoCA0NjkgfCBp
bnQgbXV4X3N0YXRlX3RyeV9zZWxlY3RfZGVsYXkoc3RydWN0IG11eF9zdGF0ZSAqbXN0YXRlLCAN
Cj4+IHVuc2lnbmVkIGludCBkZWxheV91cykNCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+IC90bXAvbmV4dC9idWlsZC9pbmNsdWRlL2xpbnV4
L211eC9jb25zdW1lci5oOjkwOjMyOiBub3RlOiBwcmV2aW91cyANCj4+IGRlZmluaXRpb24gb2Yg
J211eF9zdGF0ZV90cnlfc2VsZWN0X2RlbGF5JyB3aXRoIHR5cGUgJ2ludChzdHJ1Y3QgDQo+PiBt
dXhfc3RhdGUgKiwgdW5zaWduZWQgaW50KScNCj4+IMKgwqDCoCA5MCB8IHN0YXRpYyBpbmxpbmUg
aW50IF9fbXVzdF9jaGVjayANCj4+IG11eF9zdGF0ZV90cnlfc2VsZWN0X2RlbGF5KHN0cnVjdCBt
dXhfc3RhdGUgKm1zdGF0ZSwNCj4+IMKgwqDCoMKgwqDCoCB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+DQo+PiAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9tdXgvY29yZS5jOjQ4Nzo1OiBlcnJv
cjogcmVkZWZpbml0aW9uIG9mIA0KPj4gJ211eF9jb250cm9sX2Rlc2VsZWN0Jw0KPj4gwqDCoCA0
ODcgfCBpbnQgbXV4X2NvbnRyb2xfZGVzZWxlY3Qoc3RydWN0IG11eF9jb250cm9sICptdXgpDQo+
PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+PiAvdG1wL25l
eHQvYnVpbGQvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaDoxMTg6MTk6IG5vdGU6IHByZXZp
b3VzIA0KPj4gZGVmaW5pdGlvbiBvZiAnbXV4X2NvbnRyb2xfZGVzZWxlY3QnIHdpdGggdHlwZSAn
aW50KHN0cnVjdCANCj4+IG11eF9jb250cm9sICopJw0KPj4gwqDCoCAxMTggfCBzdGF0aWMgaW5s
aW5lIGludCBtdXhfY29udHJvbF9kZXNlbGVjdChzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11eCkNCj4+
IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+DQo+PiAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9tdXgvY29yZS5jOjUx
Mzo1OiBlcnJvcjogcmVkZWZpbml0aW9uIG9mIA0KPj4gJ211eF9zdGF0ZV9kZXNlbGVjdCcNCj4+
IMKgwqAgNTEzIHwgaW50IG11eF9zdGF0ZV9kZXNlbGVjdChzdHJ1Y3QgbXV4X3N0YXRlICptc3Rh
dGUpDQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fg0KPj4gL3Rt
cC9uZXh0L2J1aWxkL2luY2x1ZGUvbGludXgvbXV4L2NvbnN1bWVyLmg6MTIyOjE5OiBub3RlOiBw
cmV2aW91cyANCj4+IGRlZmluaXRpb24gb2YgJ211eF9zdGF0ZV9kZXNlbGVjdCcgd2l0aCB0eXBl
ICdpbnQoc3RydWN0IG11eF9zdGF0ZSAqKScNCj4+IMKgwqAgMTIyIHwgc3RhdGljIGlubGluZSBp
bnQgbXV4X3N0YXRlX2Rlc2VsZWN0KHN0cnVjdCBtdXhfc3RhdGUgKm1zdGF0ZSkNCj4+IMKgwqDC
oMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+
fn5+fn5+fg0KPj4gL3RtcC9uZXh0L2J1aWxkL2RyaXZlcnMvbXV4L2NvcmUuYzo2MzY6MjE6IGVy
cm9yOiByZWRlZmluaXRpb24gb2YgDQo+PiAnbXV4X2NvbnRyb2xfZ2V0Jw0KPj4gwqDCoCA2MzYg
fCBzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11eF9jb250cm9sX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYs
IA0KPj4gY29uc3QgY2hhciAqbXV4X25hbWUpDQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+DQo+PiAvdG1wL25l
eHQvYnVpbGQvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaDoxMjc6MzU6IG5vdGU6IHByZXZp
b3VzIA0KPj4gZGVmaW5pdGlvbiBvZiAnbXV4X2NvbnRyb2xfZ2V0JyB3aXRoIHR5cGUgJ3N0cnVj
dCBtdXhfY29udHJvbCANCj4+ICooc3RydWN0IGRldmljZSAqLCBjb25zdCBjaGFyICopJw0KPj4g
wqDCoCAxMjcgfCBzdGF0aWMgaW5saW5lIHN0cnVjdCBtdXhfY29udHJvbCAqbXV4X2NvbnRyb2xf
Z2V0KHN0cnVjdCANCj4+IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICptdXhfbmFtZSkNCj4+IMKg
wqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+DQo+PiAvdG1wL25leHQvYnVp
bGQvZHJpdmVycy9tdXgvY29yZS5jOjY1NToyMTogZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiANCj4+
ICdtdXhfY29udHJvbF9nZXRfb3B0aW9uYWwnDQo+PiDCoMKgIDY1NSB8IHN0cnVjdCBtdXhfY29u
dHJvbCAqbXV4X2NvbnRyb2xfZ2V0X29wdGlvbmFsKHN0cnVjdCBkZXZpY2UgDQo+PiAqZGV2LCBj
b25zdCBjaGFyICptdXhfbmFtZSkNCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+IC90bXAv
bmV4dC9idWlsZC9pbmNsdWRlL2xpbnV4L211eC9jb25zdW1lci5oOjEzMTozNTogbm90ZTogcHJl
dmlvdXMgDQo+PiBkZWZpbml0aW9uIG9mICdtdXhfY29udHJvbF9nZXRfb3B0aW9uYWwnIHdpdGgg
dHlwZSAnc3RydWN0IA0KPj4gbXV4X2NvbnRyb2wgKihzdHJ1Y3QgZGV2aWNlICosIGNvbnN0IGNo
YXIgKiknDQo+PiDCoMKgIDEzMSB8IHN0YXRpYyBpbmxpbmUgc3RydWN0IG11eF9jb250cm9sIA0K
Pj4gKm11eF9jb250cm9sX2dldF9vcHRpb25hbChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiDCoMKg
wqDCoMKgwqAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+IC90bXAvbmV4dC9idWlsZC9k
cml2ZXJzL211eC9jb3JlLmM6NjY3OjY6IGVycm9yOiByZWRlZmluaXRpb24gb2YgDQo+PiAnbXV4
X2NvbnRyb2xfcHV0Jw0KPj4gwqDCoCA2NjcgfCB2b2lkIG11eF9jb250cm9sX3B1dChzdHJ1Y3Qg
bXV4X2NvbnRyb2wgKm11eCkNCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoCBefn5+fn5+fn5+
fn5+fn4NCj4+IC90bXAvbmV4dC9idWlsZC9pbmNsdWRlL2xpbnV4L211eC9jb25zdW1lci5oOjEz
NjoyMDogbm90ZTogcHJldmlvdXMgDQo+PiBkZWZpbml0aW9uIG9mICdtdXhfY29udHJvbF9wdXQn
IHdpdGggdHlwZSAndm9pZChzdHJ1Y3QgbXV4X2NvbnRyb2wgKiknDQo+PiDCoMKgIDEzNiB8IHN0
YXRpYyBpbmxpbmUgdm9pZCBtdXhfY29udHJvbF9wdXQoc3RydWN0IG11eF9jb250cm9sICptdXgp
IHt9DQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF5+fn5+fn5+fn5+fn5+fg0KPj4gL3RtcC9uZXh0L2J1aWxkL2RyaXZlcnMvbXV4L2NvcmUu
Yzo2ODg6MjE6IGVycm9yOiByZWRlZmluaXRpb24gb2YgDQo+PiAnZGV2bV9tdXhfY29udHJvbF9n
ZXQnDQo+PiDCoMKgIDY4OCB8IHN0cnVjdCBtdXhfY29udHJvbCAqZGV2bV9tdXhfY29udHJvbF9n
ZXQoc3RydWN0IGRldmljZSAqZGV2LA0KPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+PiAvdG1wL25l
eHQvYnVpbGQvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaDoxMzg6MzU6IG5vdGU6IHByZXZp
b3VzIA0KPj4gZGVmaW5pdGlvbiBvZiAnZGV2bV9tdXhfY29udHJvbF9nZXQnIHdpdGggdHlwZSAn
c3RydWN0IG11eF9jb250cm9sIA0KPj4gKihzdHJ1Y3QgZGV2aWNlICosIGNvbnN0IGNoYXIgKikn
DQo+PiDCoMKgIDEzOCB8IHN0YXRpYyBpbmxpbmUgc3RydWN0IG11eF9jb250cm9sIA0KPj4gKmRl
dm1fbXV4X2NvbnRyb2xfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbXV4X25h
bWUpDQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+
PiAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9tdXgvY29yZS5jOjgzMToxOTogZXJyb3I6IHJlZGVm
aW5pdGlvbiBvZiANCj4+ICdkZXZtX211eF9zdGF0ZV9nZXQnDQo+PiDCoMKgIDgzMSB8IHN0cnVj
dCBtdXhfc3RhdGUgKmRldm1fbXV4X3N0YXRlX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIA0KPj4g
Y29uc3QgY2hhciAqbXV4X25hbWUpDQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn4NCj4+IC90bXAvbmV4dC9idWls
ZC9pbmNsdWRlL2xpbnV4L211eC9jb25zdW1lci5oOjE0MjozMzogbm90ZTogcHJldmlvdXMgDQo+
PiBkZWZpbml0aW9uIG9mICdkZXZtX211eF9zdGF0ZV9nZXQnIHdpdGggdHlwZSAnc3RydWN0IG11
eF9zdGF0ZSANCj4+ICooc3RydWN0IGRldmljZSAqLCBjb25zdCBjaGFyICopJw0KPj4gwqDCoCAx
NDIgfCBzdGF0aWMgaW5saW5lIHN0cnVjdCBtdXhfc3RhdGUgKmRldm1fbXV4X3N0YXRlX2dldChz
dHJ1Y3QgDQo+PiBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbXV4X25hbWUpDQo+PiDCoMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn5+DQo+PiAvdG1wL25leHQvYnVpbGQvZHJp
dmVycy9tdXgvY29yZS5jOjg0ODoxOTogZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiANCj4+ICdkZXZt
X211eF9zdGF0ZV9nZXRfb3B0aW9uYWwnDQo+PiDCoMKgIDg0OCB8IHN0cnVjdCBtdXhfc3RhdGUg
KmRldm1fbXV4X3N0YXRlX2dldF9vcHRpb25hbChzdHJ1Y3QgZGV2aWNlIA0KPj4gKmRldiwgY29u
c3QgY2hhciAqbXV4X25hbWUpDQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+IC90bXAvbmV4
dC9idWlsZC9pbmNsdWRlL2xpbnV4L211eC9jb25zdW1lci5oOjE0NjozMzogbm90ZTogcHJldmlv
dXMgDQo+PiBkZWZpbml0aW9uIG9mICdkZXZtX211eF9zdGF0ZV9nZXRfb3B0aW9uYWwnIHdpdGgg
dHlwZSAnc3RydWN0IA0KPj4gbXV4X3N0YXRlICooc3RydWN0IGRldmljZSAqLCBjb25zdCBjaGFy
ICopJw0KPj4gwqDCoCAxNDYgfCBzdGF0aWMgaW5saW5lIHN0cnVjdCBtdXhfc3RhdGUgDQo+PiAq
ZGV2bV9tdXhfc3RhdGVfZ2V0X29wdGlvbmFsKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+IMKgwqDC
oMKgwqDCoCB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPj4gL3RtcC9uZXh0L2J1aWxk
L2RyaXZlcnMvbXV4L2NvcmUuYzo4NjY6MTk6IGVycm9yOiByZWRlZmluaXRpb24gb2YgDQo+PiAn
ZGV2bV9tdXhfc3RhdGVfZ2V0X3NlbGVjdGVkJw0KPj4gwqDCoCA4NjYgfCBzdHJ1Y3QgbXV4X3N0
YXRlICpkZXZtX211eF9zdGF0ZV9nZXRfc2VsZWN0ZWQoc3RydWN0IGRldmljZSANCj4+ICpkZXYs
IGNvbnN0IGNoYXIgKm11eF9uYW1lKQ0KPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+PiAvdG1w
L25leHQvYnVpbGQvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaDoxNTE6MzM6IG5vdGU6IHBy
ZXZpb3VzIA0KPj4gZGVmaW5pdGlvbiBvZiAnZGV2bV9tdXhfc3RhdGVfZ2V0X3NlbGVjdGVkJyB3
aXRoIHR5cGUgJ3N0cnVjdCANCj4+IG11eF9zdGF0ZSAqKHN0cnVjdCBkZXZpY2UgKiwgY29uc3Qg
Y2hhciAqKScNCj4+IMKgwqAgMTUxIHwgc3RhdGljIGlubGluZSBzdHJ1Y3QgbXV4X3N0YXRlIA0K
Pj4gKmRldm1fbXV4X3N0YXRlX2dldF9zZWxlY3RlZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiDC
oMKgwqDCoMKgwqAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+IC90bXAvbmV4dC9i
dWlsZC9kcml2ZXJzL211eC9jb3JlLmM6ODg1OjE5OiBlcnJvcjogcmVkZWZpbml0aW9uIG9mIA0K
Pj4gJ2Rldm1fbXV4X3N0YXRlX2dldF9vcHRpb25hbF9zZWxlY3RlZCcNCj4+IMKgwqAgODg1IHwg
c3RydWN0IG11eF9zdGF0ZSANCj4+ICpkZXZtX211eF9zdGF0ZV9nZXRfb3B0aW9uYWxfc2VsZWN0
ZWQoc3RydWN0IGRldmljZSAqZGV2LA0KPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
DQo+PiAvdG1wL25leHQvYnVpbGQvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaDoxNTY6MzM6
IG5vdGU6IHByZXZpb3VzIA0KPj4gZGVmaW5pdGlvbiBvZiAnZGV2bV9tdXhfc3RhdGVfZ2V0X29w
dGlvbmFsX3NlbGVjdGVkJyB3aXRoIHR5cGUgDQo+PiAnc3RydWN0IG11eF9zdGF0ZSAqKHN0cnVj
dCBkZXZpY2UgKiwgY29uc3QgY2hhciAqKScNCj4+IMKgwqAgMTU2IHwgc3RhdGljIGlubGluZSBz
dHJ1Y3QgbXV4X3N0YXRlIA0KPj4gKmRldm1fbXV4X3N0YXRlX2dldF9vcHRpb25hbF9zZWxlY3Rl
ZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiDCoMKgwqDCoMKgwqAgfCBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+DQo+PiBDYXVzZWQgYnkgY29tbWl0DQo+Pg0KPj4gwqDC
oCBhZDMxNDM0OGNlYjRmIChtdXg6IEFkZCBoZWxwZXIgZnVuY3Rpb25zIGZvciBnZXR0aW5nIG9w
dGlvbmFsIGFuZCANCj4+IHNlbGVjdGVkIG11eC1zdGF0ZSkNCj4NCj4gSSBhbSBwdXp6bGVkIGJ5
IHRoaXMgcmVzdWx0LCBhbmQgdHJ5aW5nIHRvIGRlYnVnIGJ1dCB4ODYgYWxsbW9kY29uZmlnDQo+
IGlzIGEgdmVyeSBzbG93IGJ1aWxkIG9uIG15IGxhcHRvcC4NCj4NCj4gVGhlIHN0YXRpYyBpbmxp
bmUgZnVuY3Rpb24gZGVjbGFyYXRpb25zIGZyb20gdGhlIGVycm9ycyBhcmUgaW4gdGhlIGVsc2UN
Cj4gY2FzZSBpZiBhbiBpZmRlZiBDT05JR19NVUxUSVBMRVhFUi4NCj4NCj4gVGhlIG11eC5jIHNo
b3VsZCBvbmx5IGJlIGNvbXBpbGVkIGlmIENPTkZJR19NVUxUSVBMRVhFUiBpcyBkZWZpbmVkLA0K
PiBiYXNlZCBvbiBkcml2ZXJzL211eC9NYWtlZmlsZToNCj4NCj4gbXV4LWNvcmUtb2Jqc8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgOj0gY29yZS5vDQo+IG9iai0kKENPTkZJR19NVUxUSVBM
RVhFUinCoCDCoCDCoCDCoCs9IG11eC1jb3JlLm8NCj4NCj4gSSBkb24ndCB1bmRlcnN0YW5kIGhv
dyBpdCBpcyBwb3NzaWJsZSBmb3IgbXV4LmMgdG8gYmUgY29tcGlsZWQsDQo+IHdoaWxlIGF0IHRo
ZSBzYW1lIHRpbWUgQ09ORklHX01VTFRJUExFWEVSIGlzIG5vdCBkZWZpbmVkLg0KPg0KPiBBbnkg
aWRlYXM/DQpMb29rcyBsaWtlIG15IG1pc3Rha2UsIEkgd3JvbmdseSBhc3N1bWVkIHRoYXQgQ09O
RklHX01VTFRJUExFWEVSDQp3b3VsZCBiZSBkZWZpbmVkIGluIGJvdGggY2FzZXMgTVVMVElQTEVY
RVI9eSBvciA9bS4NClNvcnJ5IGFib3V0IHRoZSBub2lzZSA6KA0KDQpJbnN0ZWFkIEkgc2hvdWxk
IGhhdmUgdXNlZCBJU19FTkFCTEVEIG1hY3JvOg0KDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tdXgvY29uc3VtZXIuaCBiL2luY2x1ZGUvbGludXgvbXV4L2NvbnN1bWVyLmgNCmluZGV4IDNl
ZGU1NWI5MDdlYi4uZGQxYzYyMDdmYzA5IDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9saW51eC9tdXgv
Y29uc3VtZXIuaA0KKysrIGIvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaA0KQEAgLTE2LDcg
KzE2LDcgQEAgc3RydWN0IGRldmljZTsNCiDCoHN0cnVjdCBtdXhfY29udHJvbDsNCiDCoHN0cnVj
dCBtdXhfc3RhdGU7DQoNCi0jaWZkZWYgQ09ORklHX01VTFRJUExFWEVSDQorI2lmIElTX0VOQUJM
RUQoQ09ORklHX01VTFRJUExFWEVSKQ0KDQogwqB1bnNpZ25lZCBpbnQgbXV4X2NvbnRyb2xfc3Rh
dGVzKHN0cnVjdCBtdXhfY29udHJvbCAqbXV4KTsNCiDCoGludCBfX211c3RfY2hlY2sgbXV4X2Nv
bnRyb2xfc2VsZWN0X2RlbGF5KHN0cnVjdCBtdXhfY29udHJvbCAqbXV4LA0KDQo+DQo+Pg0KPj4g
SSBoYXZlIHVzZWQgdGhlIHZlcnNpb24gZnJvbSBuZXh0LTIwMjYwMjA0IGluc3RlZC4=

