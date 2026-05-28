Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A132F7EF5;
	Thu, 28 May 2026 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982508; cv=fail; b=gS8sc66qvYCraKYJvVPGuhNxBcvxp1uBI8dGUL4gOF7EpQNk8hCAMLylKEL0UifRygvNiMYcv8z4ZxZjkJM/5zwXDcfP3enL7421PQnM9S08N1Py5iCTrgdlt52IIHpRqqp+/MxqXfVgkIYmdNA+8NVYt5dKn6GVitUR2Djld80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982508; c=relaxed/simple;
	bh=cIoV4gRgbTGKGkj0d1ajkUXHy9pOuS52/nfCw+vdHA8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ePAh/HijOalytW917QomsnEPP8xZRHbeTxbZ5tPv+vnHE+Yg+4KNnxOqtFwJZ3CPmIAln2RY0K0JCD5cG9dusBLrbbt7J8G4QaF8w98rNK7hPsaL+tWenKdMwFnscZimKuv09QRz4+JM5jR4WG3QI1hNJaeovmR/BvgIQlth5pQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sPNLnR/G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=az7q7ox8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sPNLnR/G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="az7q7ox8"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SDvWWj1769087;
	Thu, 28 May 2026 15:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=jeKluscAYYOPM85mDz/fkw00RsPJ3WxdqUTaJOEPszw=; b=
	sPNLnR/GSKa/qhwG4HIFiVDcOX5ca8ewaMhxSxrCgALRTJiFaNsBI9UEjP0TAnRX
	6Zd2Y5BxlfIO2OO3Ny/LWixBKci93Y1Rp3p4y/tC3wWpbRDpZlgJovsUpFKGwhEZ
	F6vC1HH/gb87gpP6mIZQQGGN0cLUjtyeBef39JtOf0eqUfMjwlHqjx/yviQvth+D
	4Ot6XjtvUCb0BUbLff67FKzqFsoZM9dpjtZpyA91fRJT29CY3pJyVT50nBF2diFN
	/m4+IDVX9zcIRC+f0Taddb6mflKxh4ibsL3u/Lctnw7vY/eSmU9ODn6rk4hr7+bD
	jMrWBHV52k9nbB35hOk6vw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ee7wp96fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 May 2026 15:35:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64SFYvn6024139;
	Thu, 28 May 2026 15:35:04 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4edjs33vhc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 May 2026 15:35:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ow0nv3GqA2BQk/am3qNq4F2MUui9ISiOVtb49K/XhisOXmwBeCNFBuBqIUyLkxA2klmhWWGm6WRRaD7iEIMvb1Qe0HPhHkWQtolQaz5xASENziwHqhFP7f3NrBREPzo2OgOvuyaIVTIJ18Otysu6+6FDXjUGOavG7ia/UoluCwXD6iblnDuXlHZ1sP2NCi0hH87B4m1VUaNpxWYwj2XHRSBIASjXXW76pZs0F4QLR6fQEE2mXBYJiwwc+d1GXNoguy4DhWJaw+1rwhar5Ri5sEThF66IzOJPM221jyN08ti2QG5T0heBFF1xY8MFHA2fIhVy+7t1bxxo7OS9BJV4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeKluscAYYOPM85mDz/fkw00RsPJ3WxdqUTaJOEPszw=;
 b=dvXmAr77ZZL20gOhqE8jbIizscHhBnFJsCZ4Vagrq9nK+Ywj4UyaJETzvSIgdIPRlQLP92qEzjhXayydvxjn6b8lwWqjMhlj0lv0QIfOGPLwDk0FsaSsAbSsPwbrJjeuUQzsUwKUowhsCD4eobdAtIrwy5LzZ3qTINHsguLgKrQ3sfhrz09ybe3lXyMTUgNSIT+vf0y6E4iacHVNfbxbE4aHWH2k60T8wgIcJtJgDmXgKpc+qGAuLWTMD7S1LKiTsX4lft4YGFQDrKiHA4f0rU1RYf6Qh4DqQHddppJcxEQsj6oaTyWBF4XbNhYdPd7SSUTR7EBXPgRtQDaBOSZfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeKluscAYYOPM85mDz/fkw00RsPJ3WxdqUTaJOEPszw=;
 b=az7q7ox8jttzNBog8wkq1RnqaT77/I5w6g17sR/TT+BLYHUVDCnlRmSJQ97Jg9VQqbXvhZSgImnzjAddvUirxLOvHokgr/EH18xSxebHg/QYi01BcZIkUhZNObJcPRnfaHgkCo8Py5F/g94WqfCR/SZvwQaQ2ESYjKNDxT1D1Hs=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by LVTPR10MB997864.namprd10.prod.outlook.com (2603:10b6:408:3c6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 15:34:26 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%3]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 15:34:26 +0000
Message-ID: <755c76a3-fbc3-4e3b-85a2-8d90337a38ca@oracle.com>
Date: Thu, 28 May 2026 11:34:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the nfsd
 tree
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ahhRHXWXMtagI5Zi@sirena.org.uk>
 <03ab0716-6b08-4e4a-8fe6-2d398fe03ac3@oracle.com>
 <30d38675-a07e-4d7e-9365-f4b97a3e31ca@sirena.org.uk>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <30d38675-a07e-4d7e-9365-f4b97a3e31ca@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:610:54::36) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|LVTPR10MB997864:EE_
X-MS-Office365-Filtering-Correlation-Id: 91cd622d-6399-4ec4-6eb1-08debcce998c
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|5023799004|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 luM1oJYHOi9Mayo5JDv1GzV7ObZl3/P7prEFnegs2c/Gi1UmR1LK0sPl3Q2HypS1bKu3WRuc3TsZe4wSijdKEbaVxpuh0KOGtQMuUcOZ2Qiwyl22SMEyv0PfQm51Zi/vCmui7GV0EqvuHSMAt5/9mqc/hDip3BEBRN64bSIxkHBSkeIRZbW4XVDpJQGqC3emJbtqegIvN7/+osaWJJzBHCaSL+McblD/rY9KYzcAo3aquSMYomkdNleXWmme8sBxcGyRjWbMruOw3mXVc+zQi3gomKgISWP0OG2dn8+0xF3tBirowsz9sLY7hvOdzc9OedA0vmAalyRn2ikj35f0O+i0PIijmMXPI2HFn4YGeniF7Fv+12adoDi+mmkwqq/e6XK9uTXgdLm/exAI6fmKLLqeDIzCe15Y+7sL+cGgM5osuZpnojbZTqx2r3RhztbMVV3h78IHKD3hppRQR2TMj1/PpchqYRvLg57af6C7mZU7TeV267lROUkMuGXcd5C4PTj2qlhwDRFSx38a3mhX7BLQ72U/FIjsex/mUHEFYPWiSd6zaaWkuC8gKi6TF/fONiNzGb2mlPGo8G9txq+wWr9m9ptILITfGuEeHpNkeKkAcZn1nbIgqKaiWMCVkc/5gDjTVhh9UnkYjQerr7q3cIiINWXTtvwoGiV3YDRPcICwMqkKs+YgijU5e4bmKbop
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(5023799004)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MTRTM081R3I3RmpxMUpBR0x0ZnE3VGdiQXg5Y3Qzc0w1YmFDMW4xV0lnV1l3?=
 =?utf-8?B?ZDZINGRGaURVaUY5OWE3UThrR3RoMlRhVWNOaFZSOUpDSUV3UjhWZk9LdEE3?=
 =?utf-8?B?UHhmcDRFdUVlVjkxMEdwb2t5UDZEbnRpZG9sTGl3S2dpQU9JWmY1YWw0R1M1?=
 =?utf-8?B?eGxzZWJKOE8ySHlvcTcxS2M0ak1xUlEvNmdnV3F3WEhoSjA4NkN2ZC9NcUh6?=
 =?utf-8?B?YmpjUDhFOTdjREwzYW5jYm0vSlJLOERrTXBXVzRYaHBnY1NWb1ZFdUZEM0RS?=
 =?utf-8?B?N3RxN3NRMGxqNmp5dHZZS21NczFyeENPcmpmaGU2c3EvaGdLcTQ1K0RRY3Yz?=
 =?utf-8?B?MUZlRmhjc0V6aytuN3U5b2Rwbi8zZ01qZXFmd3hKbU1wWnVoaU1vVG53UzFC?=
 =?utf-8?B?V3NzMjM1WHE1dEhtTzZGR1E4cnZnSWV1amtzTGVxZzJ1UG1YaUhUV1EzemVJ?=
 =?utf-8?B?MnR2M1ZZWHJhKzM3RXcwODRLNGdPUUtWb2hkWm91YW5KKytmemtqLzVZbytN?=
 =?utf-8?B?L1V6a29OSG0vOHpCWnFhVlRRU0NLRTQyYWYxaGdjVjRBQTVVbXB4cG04STBS?=
 =?utf-8?B?ZCswYkp2YmNWd2h1aks3L0wrRXBkeVFBWVkvdXZaRVZSS0JxVU5qYjg3UnFv?=
 =?utf-8?B?eVVhRkdzRG9CdnlOSFZOTUNVNXlySTdVNWFtbE1ROWp5OFpLalVRZElCdG44?=
 =?utf-8?B?VEF4UlgyVjFmcnZHMFVuUk5oY282UnZzOUlFVGtoTFVOOU51WjU1QnArY3gz?=
 =?utf-8?B?VUhZQ3EweGRnM2xsNnYrWGVyWHo2cjFyL21rL0ZiMHBzTjNmaGI5SW51Q1o5?=
 =?utf-8?B?QmRqNjQ0N1kvSkRGWEVUWlVRamVQVXc4b3ZBSSsveERiUS8zWWRkZjFpbDRM?=
 =?utf-8?B?RHZHNWhEVjAwZDRuVmNxTnBiQXhCZU9BR3YwVzVaTHlQYnhFbWxxZ3pBMSs4?=
 =?utf-8?B?NjZ2ZmE0SGdJSWdhYjd4UlJvcFg3TEdOSDhpVk5jaXo1UEwzOHgxdjMxUWhW?=
 =?utf-8?B?TTY3ZDBoVGE1bW1yNC8wRkh6SnB6SG9rK09mZkJZK3FadWJYL1lXL2Rha2lT?=
 =?utf-8?B?MU5BUEhqVjNIWjVkOGJVMmpEa0RNZnJabVlBVU1xZ1RyV2JMZkpjU0lxazJl?=
 =?utf-8?B?djRxTFR5b0pZRENtYnowQXpLMGhqcGNoSWc4dFJVVUtad2FQNVVPU2FXTHNN?=
 =?utf-8?B?YnZlYmFqd3owVEV4RXhFN0JYR3NBd0FCKzlYcHlVS1VEUjl2elFXY0VwSTlC?=
 =?utf-8?B?TFlveEQyd0xtbkhaQkZiazBBNnhWRS9DdHZYeVJsVkIwSmFQRzVnWCtFdkRT?=
 =?utf-8?B?aW9LcnlsdFpVc09TM1YyUm9Pd2k3eFhldW1mVzFIVnR5VTNRU1poczF3R3Bv?=
 =?utf-8?B?RGdxMlZUYlRGanFFY0M0bkxjbUY3d3RnQW9MSDRXbnhKM084L1QwcHdKRStD?=
 =?utf-8?B?dks4RWVmTTJHcHExRWtQeXNXQ3NTVGFoVGMwQ3BXbGRMdW9jSTVYTWxacFJy?=
 =?utf-8?B?SnA3cVY4MEdBTFVYMFNmSnN2YmJDajJaTWVHWmg1OGJsWmhadHZuWUNHRHpP?=
 =?utf-8?B?T2gwN1hkKzZ5a0hsV2xPZmlUY3plWUJhOTZyOHJmTE1kVFU3YnEzSzN4a21D?=
 =?utf-8?B?V25Ja20vdFdNMHZ6bGhGSGVZTEI2WmhzK0duSEdJL1JIaUYwK0tuWHRLemJw?=
 =?utf-8?B?S2ROZWFiaGFKcXBqZ0hqQkFXYVpFTDBVQndZRnhNT0IzV2YrMjM4dnFDd29h?=
 =?utf-8?B?MDh6cGVrMVh2OFJCUEZLK1BJOEpDei80UjNMS3F2Rm9tSjJOeDE5ZWdKY1pI?=
 =?utf-8?B?Y0FPcWpyQ3hoazAvd3IrWDlWdVhaRjJLbGY3NWVJeVFUU0F0aUQrNWVXcGMv?=
 =?utf-8?B?alE1RDUwUHhlaVFsVStqVWdqM1BoZ2JZdWZmZ2w0V2ZJc3IyMmJ3S2RmUEN3?=
 =?utf-8?B?bER5N0l1bDlBWFgvcGtEZFljMzRuRDZSTWlObTBCejRGa3RDLytTUkh1Ujh0?=
 =?utf-8?B?OTdjL21ndVhjYitLRTRvMlliMEJRQ0dXZlVUSWU5REhCOEFSNFIrWGI1b25o?=
 =?utf-8?B?TXVSVkNNaGd5c0QrSk9leWROWjNtNlZPU1g2MHptbDZCclFmUTBwRlc4MHUv?=
 =?utf-8?B?QWgzeUhnNlF5d1FTMytKSlNhUTlaVG0rMXBjQzdTdDlWU0tXRHFsZ3BzMm5Z?=
 =?utf-8?B?VnE3WVZwNTNhMGZFRGc1aDcxYzVhQzlYMlBhWDFucHhneEpQWitnUDhPam1G?=
 =?utf-8?B?YzdoVlJYLzg2YkRDRWErK2N5NG5SbWZzWlJ6ZUlITUVoenVEc0xQWWUrNUlU?=
 =?utf-8?B?N2VnL2NxK2FLY3VrT1BIZ0krNVdnUUhIeDJqczFFeXFSY3RPaDJ5Zz09?=
X-Exchange-RoutingPolicyChecked:
	JLC+4Upe5i/LQEJf/XCZGw6ytSYCfoRezEt8WRmbtkh89aY0pM5COZEEmlGYOwYlalhxtx8srQyo7BUGgjTmLn5VHgrQuLPVNdsz2usUU0rVi8AphR15iXai8NTgyNx+hjyK4bvOFkKsZ9F1FJnHo+mdpb0x6QKQmq6OuHWqAssE69jYFs6VCVs1DfZdA/X2qGnuKHCx4EMKYuGCbmmeoYYCaHgcTEoVnJO3owvtWIl8qJKn/QMBsvwY30dDHvDey3YhzJnEVREyAELAHW8GImE1tkpUrgDjM8BZCaOyEmWpaoFEchOIkg1rwgi1hZp0osHOCjgqmhUOFoGofHu4Zw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EHpPq/51R7qLXhDseeY8kYAvhRFSxB7/btRlFzVqHlvC94+xDDruRLg62YlyyT/lBRA8RH1nRg6mAwtSPXgIeIm78PgbqHygeJuyz1Wa3dbvwB+7AxC7AWty36Wjx18jv/RJQSOYtudb5eGQvTBJl4RyeetpM0oF0kjmlSh6SFdnvZhr74aojHG6mjxdRNAnGiuJwUQDZn8+Jt8sCmq0cdoWGmlp+haJGZepxukVDeJGz0MjLyfDmo/bCbBJxx9FJPvMfqYO/GLKys3xBaj3jlm2Ft8e11SGljamAecEqHLaNZzmpSlPuff2fCkxORGpBmyRJ0W+X8ztviiUQwZMg4b4ABmXfPe78YFhC9qG9CTDTTzxKgMOhb8A4Krkq3Dc+xf8+oxj1jN/5flza3lxxjkj7cvr+yPR1E3E29CgHweF7J36re/EAjF/0m4Gdl/eRydMdyklUSLIgAhZelx2FZxqifH08plmxA893W+pCxpFouLmH1nuxbOUm5I2tvo2WXxVR4iJQOa0t3DxYl/mqouGUydesgO+CZcG4AEgZu8rof0OiO/4d8+MSQxaGjVMhMJRS0QcLYn0DbnNGja13cGcZOqDkAQqbViQYIlObfI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cd622d-6399-4ec4-6eb1-08debcce998c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 15:34:25.9609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNpJBfPoK+B7J3nvb2X/H+z3JpggAH2kkCA1clAURsg5xGNtYGDZjFnYA7xvj5UW803tJz2wPt8x/EbQLK5XFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR10MB997864
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=748 phishscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605280157
X-Authority-Analysis: v=2.4 cv=PsijqQM3 c=1 sm=1 tr=0 ts=6a1860a9 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=Gn_bEMGpzBAKvGB7lJwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1NyBTYWx0ZWRfX1uUkMVuk15bw
 hzaekpKfpGwfsuuGtjjr35ErG5V/h6jgX9EffF1rBVpHMnJGmqY0wLV5DxzPBiMcegvG7jOP0lU
 jxsiGa1rGwQxKt8EmSEYVhLOiKxoIp87AeCb0QXiLzd2HESRbJCt3k2kKbHJh3d5eFu+9jKzgBO
 N2qbBluaFeZmmZkvL5M0HQnQdVU9uAxwxXZebHOC6COiGN/yfCb11jnIE8Tmk9zfjqQDZhus1dR
 gWGk7l83vRnw9Ju2gpyKyZV8E1SCNDdrPvaPuhhrdqtSCggEq1gFkVyAj0M/fxchm/d6pWOSUZ3
 L5j0RqK67+sHOaJWTP6FptiY2BcPAoGn6qDiK1rVWTgKQ5jgZaJtnGJTtOnN72hZdnErojN+tti
 2dlN3CJtw0gFMh7ban08iAF82EJRw8+kHHddWgU0WZEqVOopPNd6CZ10hCzO9lnAydZSbY+VHyH
 aYuEV86E8taf4OSSYcQ==
X-Proofpoint-GUID: A_C7jkLtwJHYJWqWcndd_E_5owqoKStB
X-Proofpoint-ORIG-GUID: A_C7jkLtwJHYJWqWcndd_E_5owqoKStB

On 5/28/26 11:01 AM, Mark Brown wrote:
> On Thu, May 28, 2026 at 10:51:58AM -0400, Chuck Lever wrote:
> 
>> 1. I might create my own merged branch that grabs only the three vfs.
>>    branches I need. Cons: I've never done this before, I'm not certain
>>    my tool chain (StGit) supports git merge, and it tangles the merge
>>    graph even more than it already is.
> 
> You could always create this independently of your usual tooling and use
> it as a base like something that someone else had created?  I don't know
> StGit but I have similar stuff with my own tooling sometimes.

I've updated nfsd-next so it is based on a merge of the three
prerequisite vfs/ topic branches plus v7.1-rc5 using the mechanism you
suggested. Please give it a try.

-- 
Chuck Lever
