Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FF6353EC2;
	Mon,  9 Feb 2026 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630415; cv=fail; b=cZ235fqtNBH0K1uFWgu20nN/CBxdKzbCHBQDyBY3x/XqaZ28htYRQA9Fsr77pVkVj7+pCSPi9rsoNduP4qQrLesYd9OaGbg7SV9QWsO59dqeb80WRFFv0oFar0dSobI3e1yI/RnYiAIYGRxdO+/j916GI69gEhi0KVDme7m1PKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630415; c=relaxed/simple;
	bh=ayacBUHopqM+6k7RbCy9eTJ4UKoyG5upFi0eoP0+c70=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N2xIU0GlzTxwFFX4O/BSAJ7/zhA3hfn9qaEPaYL+E9SZgXolfM0hBevxzBRAWQLyI+iEHbQr3ir7lpuNpXeYfPX4PvzWtbZ+qr0t1ehx/zz6HpYxs1IIMrSoswNn1U2hXv+/dSy1siAYvR10r8ukAWQsapt17PGJlvQuJznV9cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EmJDp+74; arc=fail smtp.client-ip=52.101.46.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EmJDp+74"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSd5UIoW+FWhY5jC7jNFTPqaV0Yvx7GkaHFyQK2SqY7TChzePMb+OEd38e4lov3/E8rMPgl+JTbYab225RJVNYCym0tuFuEhTzwZ98S94Vu/Qh0Gikfs/nZyRs0mlstVdej8px9G5QhlAbrYMUilXckNXMGDUsQn0waeghRJZ78l2ZLSzAubwjO7nAZlHGsjURRp1P/41uzGlB6MbYgFYJwe0iEaCneUEZuoF9CNeJibMrGIWwCBTORNx4ERwEZsJDQdjJ/2LmoyzDg0j5fv5j4w1wz0Jiu9hcEobDBunUQ1wJTrsnB2bbBNdchDBLbJOJDKAVlKJ6U9U0fIuuLf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3PTdHj0ePPzapUsVOoh8LPTuPbAxCLaKNCIPo078sc=;
 b=UvHyPJt5/NS3ed8Xz8/iH+Grw0EybSBAVjTYQ6l6M2rt0iEbLkjwAOT+7YvvYclvVTw7E4XBvJCSqwqJM15rQQP0i4eMSN07GFMcRM/YkfBAomaBovBb3SKrJsE45CXsg82SgQB2iNuunlTbBQWYFepmXmnPlSecos//3IYGSVgPxiBVaC7sQE4r/iRF06nriwavB+300RS9cWFggWLagU2oQcjQCaZMt0fv04MhSQ+YJpTd4C/0zPZdIlg1xHkpZwyqxIYjlPYtG4S53IYzSrJDR7FaB6b0JigFITeYNzxMULS+7MCI2w5RW95AUmXjCm3QXMec8ypTyrtZaFtcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3PTdHj0ePPzapUsVOoh8LPTuPbAxCLaKNCIPo078sc=;
 b=EmJDp+74r6cnCAJO1uhnUIWV3K0vw/nynF/0LB9o/EOq8gZVQxzLXGHZQ2vVom9mUXtia2CVmmMxsq8OQagJSromdZx3mubNPwLL1J0uBynPyh+C/mrI5lVlrqrBoBmH6mKp8Um2+zEdgwSJXBzPwABSTVxWmQtiCgFVImFC0ykU5N2RKRqedjwcmUDQwmO0HQ3r7ELga/klpfrLHx8tokg/DqTK8d5BN9wwN1rD8q2iymhKeE3jHfCAZYFSkOsm/aVYDC9dFunakgYMcmAOCZF3hl80n1J5g1E0QVv0JtvMmDay6cLKNlf8HQqQ3n+gg3Lm5eFp5wAyVEwG1lIjtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 by DM4PR12MB6279.namprd12.prod.outlook.com (2603:10b6:8:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 09:46:50 +0000
Received: from BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::778:72e1:e792:df81]) by BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::778:72e1:e792:df81%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 09:46:50 +0000
Message-ID: <1225afb0-2326-42c7-a9f0-fe6ce5209008@nvidia.com>
Date: Mon, 9 Feb 2026 11:46:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the vfio tree
To: Mark Brown <broonie@kernel.org>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leonro@nvidia.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>
References: <aYlBU4l2YoT8iaBK@sirena.co.uk> <aYlJe1XKAd2MhEZE@sirena.co.uk>
Content-Language: en-US
From: Edward Srouji <edwards@nvidia.com>
In-Reply-To: <aYlJe1XKAd2MhEZE@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0298.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::7) To BL3PR12MB6473.namprd12.prod.outlook.com
 (2603:10b6:208:3b9::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6473:EE_|DM4PR12MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 957f9faf-6c36-433c-e080-08de67c02625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWdYUStSS3R6NHlWOGZrNTF3Q3MzbnI2cjQzM3BYc08xOHgwQjVnK2RUdGtC?=
 =?utf-8?B?VjUvbUE4dVRRMTNsRkRQMFE1T0tYcU1Wdm9PaXZsSGdNQU5sMnMwQVdNancx?=
 =?utf-8?B?anRxT3JqNWpBNDBEYUxEQlZISlFRUzNsdlhMZzdnN1UrTXc4cG1mRkJXT2do?=
 =?utf-8?B?WjQ1NnpSSTZmUlVUc05ham8wendybUp0ZmVQK2VkY1hMdld1UGRQRDlhZXlp?=
 =?utf-8?B?ZXhEaE42NUNoa0ZwZU5zUmpnV0tmVjFiMjVDWUZQa0RlcU5GVGtycmlZL1Vy?=
 =?utf-8?B?bGhkamFzMTU1VE9WYWFqZCt0bkVGM2R0N1V2MGppREVIVkRKeUxNK2NLdjRV?=
 =?utf-8?B?RW5xTjRmY2tLSlduZ1lBeGhkM042eVJMaEZXWE9zMVdYZnNNZjB6OG16RVJs?=
 =?utf-8?B?M3hmNlFYb0JGcVNWZVFPbG0vOHZjT0JhdWJ5UkJDaUg2ckpVeVpnSE53UUdn?=
 =?utf-8?B?RGwxREp3ZjI3NEZBc0IzcnJuWTFvcStnNERUOXA3UThwMUxJT0RMbzgxVjRn?=
 =?utf-8?B?bys5NGxPM2FFVXdXTi9aWGdkYjZub05FUHExRzc0MGdiU3hXVjVjVUJOcmQr?=
 =?utf-8?B?cmFKZVdLV0tYcVJkYmJsRm4rRGNaMW5aeVVEZ25wOC9pcEJFNXhpMEUzNC9x?=
 =?utf-8?B?T1pCRE1pdmVEeVdPcGJsWW5VVndDOTQyLzRFVnVjdHRKazJISUp4WExTaElV?=
 =?utf-8?B?WTE0Y3V3Mnlmdm0rZm80YVhpdVhCSVFqZDQxR0diaTMyYnp0L0wwdjhCUDhh?=
 =?utf-8?B?M0hWL3NWYk5abzJxRGRuUXNqTUlyYXdDUzAyVjZMaE0vZ3d6L3hmRU5nMllF?=
 =?utf-8?B?U05kREMySXFtRVlWVjdkVHBZQWhhWHNERnJSTlYyc2FVZU5WRC9iQUM2cFlr?=
 =?utf-8?B?ZVZTSnJyYkluUlVCcWJjYi9tbml3SjlmMnIzZDQ1QXlaVjRobUJiTUpYU013?=
 =?utf-8?B?dGFiYnU3U2tRYnRDeDBDaGpDb1ZnYUxSVHZMR0l2ZmN4RFA1S0FiWllVd25M?=
 =?utf-8?B?RlBXU0lKQzhucWtwTWQ4K2JhS1RRTnYzd3kyRDM3WnpINmUzOUswK0ZaZTZZ?=
 =?utf-8?B?SUhpOWQyVnFtQW8zKzN5Nk1mVU5BWjlZQzFpalYzTTVobmQ4T2UwdmpaVFpB?=
 =?utf-8?B?S1hJN3FFQkZKZ3ZaNVhUUmJva0NIdkJMbFNweHBYaDRyZ0dodThKWEFkWkJI?=
 =?utf-8?B?RDNKWXJ6bExXTEE3ckFEbVlxYXZkM2pyY3Y1RXVnam9rdmxyc1o3Q0cxcC9z?=
 =?utf-8?B?R3NHZDFRRjA0Nks5S0dUeXcvYzJXZnZWaStjRkJyNUoxZ1BLZ0hMU0RPNHpQ?=
 =?utf-8?B?SzVIMlp4aHFtNGdYNVVJNzlpSS81L3Bwd1h1RFUvUWFDaERueEZGUVlIbytp?=
 =?utf-8?B?K3ZGRFU4VlBEczVOVTN0alRHM2VRRlNQWGxpcnVOOHJmK3RLWFEzalY4UkRV?=
 =?utf-8?B?NXl2MVNPWW9VWHllemZrbW9teThLTkVQWFpwdkVCMVNNMUFrSnBBcWRUa0FW?=
 =?utf-8?B?SWtscFd6SXZhazQyaDhtMUtHMzdLYXVrMVBKY0tNTkdlSnVLY1dBc1h4dWx0?=
 =?utf-8?B?VlVSaHVWdkE1dnQ4T25BQTZpcmFsSGdQWG9hRUh6TVU1SWxjZytPT3BCTmVS?=
 =?utf-8?B?US9HTExMT2o5ZFpHelhlSjZSUk0ya0xzTlpsZ1orU2x6bURqTUNDeS9CWUk1?=
 =?utf-8?B?c0FrK0NJeklEWlEzU1ZWeTkxbUdSVlcrTmlJeXBwbHNRVWN3NVNOTmpaR3Ns?=
 =?utf-8?B?M1JGNk1JM09DdnhyenN0eEdJNWdhVGp6ODF4eXdyY3VTeU9sd1FkYmIvTGxW?=
 =?utf-8?B?aWMzRnI5UkxNQTZoVmhSR2M4bTRnWmthdnNETGRrSmZaRVVKRnk5YzJCKzB0?=
 =?utf-8?B?aE9xV0k2ditUVmtJQkZVN1ZHNlRJMlllaFAzcVhySExiQ2hGMCtnTGNRWWxH?=
 =?utf-8?B?ZkVrd2MrQ0F1azNJUzJUa0t3SE5ZZmIvZ2VpV3V1RmhVVDNOUHRXOGgrS2tG?=
 =?utf-8?B?a1BrVkVTVDJSOVFDZ1IvaGVqcXBHb3I2Qy9WWGFDR3ZGTVFSRWU0TXFEcnI3?=
 =?utf-8?B?VHJyUU1vZGhUcEVGaG1sT2o3NTU2YnV0K0pKNUJ5VlpRdEc4WEgwNit0NWJu?=
 =?utf-8?Q?dQj0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHNXQldMdkRvcTVzNW1BYnByQWNpZnk2eGM0NzN0QkZNVFluNFlCdVhSU2hv?=
 =?utf-8?B?ZWhPZGdPMW9TV0UxckgrcWt6cng0ZDcrdDNLRG15bFJQK0t2UWZsRFUzZmM5?=
 =?utf-8?B?eG0xeWZpZTRtRlRiRVljSEFrRjFrcjkxYWtzMlI3MWpETEUzVVU3RXVKam8y?=
 =?utf-8?B?WHNGOThlUXNEN1gvbWhieE4vNnVTUHhxU2V0cWlDd1ZUWTg5Rk9CaDQxbWJ2?=
 =?utf-8?B?R0Jlc3BwS0xZdTh0cWcvTitZVHJMVmpQYk9DbmJGOGJVMC80K3l4TE9BWUVr?=
 =?utf-8?B?VWdob2k5aXJLcWM3Y1g4cFFKUUFSTXZGNWMyVEREbi85VTRMNm1URlEvT1Bu?=
 =?utf-8?B?UDRuWUFKdHhSMTI5c3pkclZRZkFBU0ZwVTVVS0g5MXEwWkVURXBvYVYveGNo?=
 =?utf-8?B?T3RzMkc2L0tVNFZlaHU3ck0xZjM0YzZXcUdvWHZhOXIwb1RtVDlNaVY5UGc2?=
 =?utf-8?B?dkg5UVplQkdRU3E4dEN2eWxBbURDY0ZlNHhhNmVJeTh6OUxRa0s5dlVLcUVE?=
 =?utf-8?B?eXNBbnZtN3dGdytDV3ZJWDJVSlNyY1JWZW1ObG5QZ1g4bkxPV0l4L1NnaGdy?=
 =?utf-8?B?YWlCTmNxR25VWGl0K2pOUC96K2RUZEZyMUxwVnVhZWkrTWtScXBBUW13NVow?=
 =?utf-8?B?SzRvcTQwalk4aE1vemVKcjRJQkg3eXRBWFY3OGZKSWs4Y3BWOWRGUDhab0xV?=
 =?utf-8?B?UTFrQzl3UE1XQ3FCR01oTmFwcFkybnd3bDZpNGVQWUtVZ3gzKyt2S2xUQkN5?=
 =?utf-8?B?UlpFR3JkaTJKYTYrdkZDUVlFa2ZDMEVUVE1iVzFVV2lheXNQbVc2aXZSTVB1?=
 =?utf-8?B?anFMRWxSWG56QzhzQ21iTG5PeUdEam53VG9ncDF2bmZzMy9pVGd5UFV5eHha?=
 =?utf-8?B?OTVzdUFzSEpoaFI3T2VBVy9xN3cyeWNSbjBOOHhFTExBcjBTNHlaWlI1M0ZN?=
 =?utf-8?B?aGpwZXRQb24zZlkwb2xIR3JRN3AyekdYY2VsSmlWYWlrbzlTNVBaejZHVGV0?=
 =?utf-8?B?RVVaS3Z1allRRW5iSkFJSVoyWWtFN0huaXJvODlmMHBqVEZra1JMbllITnor?=
 =?utf-8?B?d0pCbkR6WXBBVVhsYlc5UlE1K0VkWGNxSjF3UjBJYjlXdmU3d29Jc20vYllY?=
 =?utf-8?B?Z21TWVV0a2E2OU1oNUNDOUFVVmZCUmx1OERPSmQxYjh1Y1F5RVRGdWJMVytt?=
 =?utf-8?B?YnNoYnhIRXF2N0Y0OFBteXJMRFVuVXNtRVorUEtSQmQrUWI5d0hXYXB6R2J3?=
 =?utf-8?B?QXFCKzhmQjZqT1dtQXNrdkU3LzJtQ2FpSTloa3NOVGlDcHFzbFBXUHljcm9E?=
 =?utf-8?B?OWkzTjVLWlNaU0lGSkN5UkVRbDZTSVJ5SkMwNGNBRmZBUWZpQy85L1RXb1Vu?=
 =?utf-8?B?cDlOSjVnOHJNMWNBTWJwVmZnRHQxVG8wMVExVE5YQ0NrVTZDNGsyeW1QTjVt?=
 =?utf-8?B?VmhFcTVsS1FuMTJDUXZIUGtscFFRdmMzVlE0R20vaDVsSVgzQXJlNkpGY2M2?=
 =?utf-8?B?N1VQNkV4T2Q2bnZXa3VjK2sxNEFtdGsvWEszZHVpSCtGSWgralp0WFJYNzhX?=
 =?utf-8?B?UXVwUUlkeFVsVkUyWEU4dGtkWTNhR2lYOHk4TUUzWVJ1WjJldW4yQVBBRGFO?=
 =?utf-8?B?bCsrWjd5S0V3UTBuSk1qRGtVQ01hRlY0RDJvV1ArMDZVMEVLTktRM05RN1N5?=
 =?utf-8?B?VG1zSG00NTZmUmlPdmFBWTYzNmcxcUVqYk1vQ29YUzlubWJtaVRKeU9FZlEx?=
 =?utf-8?B?aVpLQ1VLNFhUb0dpN0tBVHZFQXBRZjUrNVhpYjI2WUx2andyVXhoeDVHZUd3?=
 =?utf-8?B?dzNiZ3V3a0RIZlRJMCtwSkJDMGZSZXAzODQ4SW4wdGhJY1JZKzdIbG5QYmtF?=
 =?utf-8?B?UnRtRldTTFBnTEEzQWh1M3RlNEM3TGVaTjFMR1Y4b1p2UVVzUE05WmFSSVFz?=
 =?utf-8?B?WlpmZ2lpbDM5VTBoMm5iWktaK3BDb0owT0ZrSXBHZEdnYndmQXJXTDZGMlRU?=
 =?utf-8?B?ZEhnamlPRnRWbnVUVFVFR1V6YXY0R3RPQTk0eWsrRmFHejdWWkdSV3lrdmJP?=
 =?utf-8?B?cXJBbEJRQmhKVkdVbUY0OFBySGNyWk1ZcWk2ajgyU0tSbXF6VVo2Q3hBdDdY?=
 =?utf-8?B?WU1xdmEzajZOUXYzc3F4bkw5bXdzZGFWdWVseGxGTE5MdVMwT2tFanJFM3kv?=
 =?utf-8?B?bldDaHZha244OFFrS3FBbG1MMDFUa09mTXk0MDRiNkw2L2FHZ3lLeGZ6dlVt?=
 =?utf-8?B?bUJzQUVtME9CVVBqNG9lSnpvbWMrYTVBTmQyS2xwRjVaOW1KOG9pWDhwZ2pG?=
 =?utf-8?Q?nbCtaKIj7j+b7YXD2v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957f9faf-6c36-433c-e080-08de67c02625
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:46:50.6909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7I1TFxOsch3ZJmxuomjqRIw2tCA/hSn8SNnqFVPIvqRxI+YZf2U+RZnc5+Tr1EEPd+zj9tNQy67WpR2Kzq6lpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6279


On 2/9/2026 4:42 AM, Mark Brown wrote:
> On Mon, Feb 09, 2026 at 02:07:15AM +0000, Mark Brown wrote:
>> Hi all,
>>
>> After merging the vfio tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>>
>> In file included from /tmp/next/build/include/rdma/ib_addr.h:21,
>>                   from /tmp/next/build/include/rdma/rdma_cm.h:12,
>>                   from /tmp/next/build/drivers/block/rnbd/rnbd-clt-sysfs.c:22:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/block/rnbd/rnbd-clt-sysfs.o] Error 1
>> make[6]: *** Waiting for unfinished jobs....
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/smack/smack.h:22,
>>                   from /tmp/next/build/security/smack/smack_netfilter.c:19:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/smack_netfilter.o] Error 1
>> make[5]: *** Waiting for unfinished jobs....
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/smack/smack.h:22,
>>                   from /tmp/next/build/security/smack/smack_access.c:13:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/smack_access.o] Error 1
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/selinux/include/avc.h:18,
>>                   from /tmp/next/build/security/selinux/avc.c:30:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/selinux/avc.o] Error 1
>> make[5]: *** Waiting for unfinished jobs....
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:546: drivers/block/rnbd] Error 2
>> make[5]: *** Waiting for unfinished jobs....
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/smack/smack.h:22,
>>                   from /tmp/next/build/security/smack/smackfs.c:28:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/smackfs.o] Error 1
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/selinux/include/avc.h:18,
>>                   from /tmp/next/build/security/selinux/selinuxfs.c:41:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/selinux/selinuxfs.o] Error 1
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/smack/smack.h:22,
>>                   from /tmp/next/build/security/smack/smack_lsm.c:47:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/smack_lsm.o] Error 1
>> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: security/smack] Error 2
>> make[4]: *** Waiting for unfinished jobs....
>> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: drivers/block] Error 2
>> make[4]: *** Waiting for unfinished jobs....
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/lsm_audit.c:28:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[4]: *** [/tmp/next/build/scripts/Makefile.build:289: security/lsm_audit.o] Error 1
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/apparmor/include/audit.h:16,
>>                   from /tmp/next/build/security/apparmor/audit.c:15:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparmor/audit.o] Error 1
>> make[5]: *** Waiting for unfinished jobs....
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/apparmor/include/audit.h:16,
>>                   from /tmp/next/build/security/apparmor/include/policy.h:23,
>>                   from /tmp/next/build/security/apparmor/include/policy_ns.h:19,
>>                   from /tmp/next/build/security/apparmor/include/cred.h:19,
>>                   from /tmp/next/build/security/apparmor/capability.c:19:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparmor/capability.o] Error 1
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/apparmor/include/audit.h:16,
>>                   from /tmp/next/build/security/apparmor/task.c:19:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparmor/task.o] Error 1
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/selinux/include/avc.h:18,
>>                   from /tmp/next/build/security/selinux/hooks.c:99:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/selinux/hooks.o] Error 1
>> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: security/selinux] Error 2
>> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>>                   from /tmp/next/build/security/apparmor/include/audit.h:16,
>>                   from /tmp/next/build/security/apparmor/apparmorfs.c:30:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparmor/apparmorfs.o] Error 1
>> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: security/apparmor] Error 2
>> In file included from /tmp/next/build/net/devlink/devl_internal.h:17,
>>                   from /tmp/next/build/net/devlink/core.c:11:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: net/devlink/core.o] Error 1
>> make[5]: *** Waiting for unfinished jobs....
>> In file included from /tmp/next/build/net/devlink/devl_internal.h:17,
>>                   from /tmp/next/build/net/devlink/netlink.c:10:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: net/devlink/netlink.o] Error 1
>> In file included from /tmp/next/build/net/devlink/devl_internal.h:17,
>>                   from /tmp/next/build/net/devlink/dev.c:10:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: net/devlink/dev.o] Error 1
>> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: net/devlink] Error 2
>> make[4]: *** Waiting for unfinished jobs....
>> make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: security] Error 2
>> make[3]: *** Waiting for unfinished jobs....
>> In file included from /tmp/next/build/lib/dynamic_debug.c:40:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[4]: *** [/tmp/next/build/scripts/Makefile.build:289: lib/dynamic_debug.o] Error 1
>> make[4]: *** Waiting for unfinished jobs....
>> In file included from /tmp/next/build/fs/smb/client/smbdirect.h:14,
>>                   from /tmp/next/build/fs/smb/client/cifs_debug.c:25:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/client/cifs_debug.o] Error 1
>> make[6]: *** Waiting for unfinished jobs....
>> In file included from /tmp/next/build/fs/smb/client/smbdirect.h:14,
>>                   from /tmp/next/build/fs/smb/client/connect.c:45:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/client/connect.o] Error 1
>> In file included from /tmp/next/build/fs/smb/client/smbdirect.h:14,
>>                   from /tmp/next/build/fs/smb/client/file.c:35:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/client/file.o] Error 1
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:546: fs/smb/client] Error 2
>> make[5]: *** Waiting for unfinished jobs....
>> In file included from /tmp/next/build/fs/smb/server/transport_rdma.c:18:
>> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phys_vec' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   2509 |                              struct dma_buf_phys_vec *phys_vec,
>>        |                                     ^~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/server/transport_rdma.o] Error 1
>> make[6]: *** Waiting for unfinished jobs....
>> make[5]: *** [/tmp/next/build/scripts/Makefile.build:546: fs/smb/server] Error 2
>> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: fs/smb] Error 2
>> make[4]: *** Waiting for unfinished jobs....
>> make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: lib] Error 2
>> make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: net] Error 2
>> make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: fs] Error 2
>> make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: drivers] Error 2
>> make[2]: *** [/tmp/next/build/Makefile:2086: .] Error 2
>> make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
>> make: *** [Makefile:248: __sub-make] Error 2
>> Command exited with non-zero status 2
>> 9192.96user 710.88system 1:31.98elapsed 10766%CPU (0avgtext+0avgdata 1476624maxresident)k
>> 0inputs+0outputs (2743major+125416372minor)pagefaults 0swaps
>>
>> Caused by commit
>>
>>    b703b31ea8cd22 (types: reuse common phys_vec type instead of DMABUF open‑coded variant)
>>
>> interacting with commit:
>>
>>    e6738fe6cad448 (RDMA/uverbs: Add DMABUF object type and operations)
>>
>> from the rdma tree.  I have reverted the latter commit (it being the new
>> one), really a semantic fixup should be applied - I will try to revisit
>> tomorrow.
> Actually, no - just no -next today since stuff seems to go wrong with
> that revert.  I will try again tomorrow.

The latter commit needs to be adjusted - not reverted.
As the first commit that came from VFIO suggests, "struct phys_vec" is 
used instead of "struct dma_buf_phys_vec".
Similarly, need to replace the usage of this struct in the latter patch 
(this should be the only adjustment).

