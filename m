Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B11B3655DD;
	Mon, 22 Jun 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124685; cv=fail; b=slERtWw4NQQbh5uXstAaejiPDZbTlWcIj8bR7Tug8T5KEtTrUi86DofOsUMtE8gdxs/bF0jSmRppiBLir/uZ+ufrMXaDYOlXXPrh9MAcS7B2eFNIvaapL9hf3CQYgn2nvNndFrIduPu6kleOhrIyig4yNPHV81bKRDU08DuT98s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124685; c=relaxed/simple;
	bh=lm1cXEOi+gmUKR9WdncchvOE6Oj9R8yreXQNVOl5BDg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h4UhtH/fIdPObZgZZmTabT/3PTAMgIX9/MaTMgvMZqKqOBpHsF5y+LZ11AI36caAP1l8rKNf4Mg26PhRcW5BxzV4xQohUzWJ4W+SZiijzXLR7Ql+JezOf1ooBMnP7hz9RVaaGWPVgsVXM6QfhkcJwIi6FOq0rcHmqthis1HltI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RtvUOI73; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NJFBISzx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RtvUOI73";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NJFBISzx"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M9NHGv1432003;
	Mon, 22 Jun 2026 10:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cbcUYOHUvcgXhw9RY9cOFCIG52SVjixlKjTVedoVvw4=; b=
	RtvUOI73BhdL0soz8t/o3N9R/JDKbnCTYl/jTa/ScIBCJvUUsRcP801GacR7+IrJ
	uefDoVBqhhlRunVwjM8MTlbKQjxZ00oeZzg7dxnKNLexkJS5BQz7uWGi9Ko0Hfc8
	mB3li9xP7vayTu6K6ctHihIXJ761daUZRzZBiMnjW3s5FU863PNePkdv5qWKorFJ
	i8k3li+gMQf8LMbE63/txO0PJQqGQUsPzKYXHUG1Kt2mL23MubD243w+XpAB++Dl
	vG6FOtmkF3vgiUuEjcFNp+QLi+x9SqPVLVqDtlw+5xsT7JZYyJtoDWsUXXVS0Wif
	TteScDF3o86uvQkFX5gNrw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ewhs91qhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jun 2026 10:37:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65MAbvXY009868;
	Mon, 22 Jun 2026 10:37:58 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ewhaam70g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jun 2026 10:37:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilCMjVy/H9Uq56EArlyrg+pd5cgGVH3pLwCrL+x1IRcj1zmlFOeTSSTmR25kOsPmXXGul9WdWiTIzfqAEh8KGNNcfLqZY6WLXyyashotoN+C/r+O/1i9+tZEAfFm2XUP31//Imwihy238M3UU99PdR1VfQ+U6lqwkC6K6mDRLlExG9dpwG4O1IpfY+3zant6e54wdAQQty3mesqU2ISsXRc8vuVE4Qg3B10ABmzkc/yRkXPSjPdl1xXOBZoZ4LNSe6ameFD9ixVAn1QgkQ/uyf039AaacwyZtRLhDGrOFS/wUflcK5SNiXxA/PkbmFcne6p1dJ8myswyh7t/svkfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbcUYOHUvcgXhw9RY9cOFCIG52SVjixlKjTVedoVvw4=;
 b=QasqtzJxZ94fKWwnPBb++Fa9SlHgM0LV116K7o3vu5RuNB0OdO/IDpNOIEIYsjiWdLpVkAAn/52Hru3Ch5lQdnDeSYm8OL7U/A3kg+hEq1ZF6PisLCSzY49ounsA/kaDXqAxoIbhfuLEJtjmg0dkPHbmBC5p18JDtOcZcse8bY2e1V2yXeLOvFSBv3Lg98dzFT3dvVjueBig8S/SBDycIMEqyHjXH44+BScIDEBOGhwc3mD6fYPGC9FN92lCiW2shlL02XttWOGLqkVg+GXYf3/8RNdEjRTEd6v6q7+S79oOBP5l9cbO8HFFQOnMCK2XEviT50Vej4XC++II1yjhuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbcUYOHUvcgXhw9RY9cOFCIG52SVjixlKjTVedoVvw4=;
 b=NJFBISzxCdI6tDOaIFmwBHaZJE/DWc72Z2/wGYvvMGqFz1XyYw4eg1sl0f/rxyotpef9/UluN+VEPHxYcCa0pJmyb6uqd095agC1IoFNeJgU6ilo50Cu+4tlleB+c9jJ2WhCT5yMcqqJwYMZUdbBiv6QHSoLG6WI/JCTe3EO3E0=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by CH2PR10MB4215.namprd10.prod.outlook.com (2603:10b6:610:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Mon, 22 Jun
 2026 10:37:15 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%3]) with mapi id 15.21.0113.015; Mon, 22 Jun 2026
 10:37:15 +0000
Message-ID: <14b1b663-56fc-4272-83a1-9fee21a9d098@oracle.com>
Date: Mon, 22 Jun 2026 11:37:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the origin tree
To: Mark Brown <broonie@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ajK3E_9sm1up6soi@sirena.org.uk>
 <61b096e6-39d1-4b61-80ee-31bda9978e86@sirena.org.uk>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <61b096e6-39d1-4b61-80ee-31bda9978e86@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::10) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|CH2PR10MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d4e15d-a62a-4237-c5cd-08ded04a3a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	gGlh4SPJv5UKgXmc49V58D4T71AwqNvLFewGYh5Smfg5wviElZJaO6lRLV+0pRMvfWOjwu6ucDmWbsaNW4EuQwOIcS1pGjrFcpxRGpSUWdU/j3rHjLFLXZTf5Dqb604hUjPR3g8kE+k81uLqgoVhGo0OPdEq2CGUNzrY6BXv0rfAeX2NIqlv3xYcFRwoBpN94oXP1LQNQEFHmJBJF/KpHTnZSkoOptMcwZzoj2lVkDxN3babuRz/HCGDemsoCqo31rEZso4yKyGImtacld1lxSl0spTOWr5q+KeJ0dH5BUxk+vRMSQaC7A8lS05nzhDCL3ip/veVXNq4GLPfEL6G8a610cpmNEH3iIMCN/EEJRxv2NvtQyDBou8aGb4iJlvbHbdSi29duR++Lh40GBo5e5Y+klYhuAHvbCdIqnR244v5o7RsiOxWZUhsD3p6CHPmePVY5zcHLRzoIS8qW43lhHmHpsyPSqb/uMdmOSEqPdBHAI8XCPuLUtAJKf53J58hw8wUyJq0hnQmrFQPrPRVSPTRIqsiO6nFvDceUWeu+FYmfHu/l3lKIHFOUdlxY/pMNocKycTRrqfc5Ijjyo3e6zgv/V7KJp8oams4mawbW6ZWqoxlAQ8eW32hPg6rA44+AmUwAPTbEVNFRCMMhLHpJwQ6pQ+s5Vyu7+iW+JcovNE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWtnTEExMHB3Y04rZVNGYVpBaG9ydkl2aDJOZmtGZUk2OWVmWE1SZktaejAr?=
 =?utf-8?B?Nk1wcldoTUpiU2lieVNIcVNVNTB4ZWc5VVFLQmF6SVFjaHpIbFZCRzk0VEM4?=
 =?utf-8?B?Q3ZUMEV1RzBjOXV1T1VRWi9vMS92V1NaenBPYTM1WXR4bXpPR2ZLcHpJUkZM?=
 =?utf-8?B?S3hZN1krK3JIL3d4TjdlaEZQcDBoZFNXUnJjaGVBcHFPWlZraTR0enh1ZU1D?=
 =?utf-8?B?OGtrWTNOcGFlVFZOZ21ES215MUJGSmJxMFVyc1JZSElpNUwrRnhnTTJUdDFP?=
 =?utf-8?B?c3cwd3pXU2dEbldsZWtJUENCRy8yOHRpbWo1YXUxVUEwQ3hadHRQOUc1Vk5K?=
 =?utf-8?B?Zk5oRUlFa0p3dktrRHhVdlRmVzJrOXJxQk5DVXVMYWZGYXRLMmp6cFkvc1pR?=
 =?utf-8?B?SDl1ZDhrVUd4MXJtOWpPZGROTnVVMWMweG01Zytra2xyK1hlSmNocW5Rdm5I?=
 =?utf-8?B?QXg0K1YzMFNJK1ZRUnFKbmpiZ2ZnQnh5RGVmeGtBTm9MbW9BQ1pZTHNta0J0?=
 =?utf-8?B?d0ZSWHRFT21VMHBUSzFDRE1iTGRqNnRXSkszSjMvNUNsMnlrL1FtS1NZYTEy?=
 =?utf-8?B?YTdBM0VNM1VRaDRRREtSTlRaVytlVGVrU0xiSzVlUEFvQi94WGVycTMreGVk?=
 =?utf-8?B?OXBzTDRpK2V4WWZSQTJqRGVkUWNqRlhJa0pvb2RONlROK0ZTSlAxOGpqdTl0?=
 =?utf-8?B?M1FDblkxS291YkNQR3IrZElVUzliYzU1MmF3dVNNTXo1d3kwbkFlbytQak5K?=
 =?utf-8?B?amhrcXdqaGkzQlF6Qk9QcSsrMXJyUEVxVzJYazRRUnhjenZaczR4cGl0bml6?=
 =?utf-8?B?UVRYVERLNEozbHQxQ0YzdjRzOW5NcmlkbjRWcndOOExzZU9RWDdqdE4xbEdv?=
 =?utf-8?B?SVRyQ1hjQzQ4U2syZllaNUt4dUt2Yklqa2szZ0JNUVNHS1Z6K3QvME1JM0xl?=
 =?utf-8?B?YjNPVDdlckhLeVhLb2VISXRCTCtVZjV3TklaTFBocXIxZ0J0N1VhY01yTi9K?=
 =?utf-8?B?SXZ6a1RZMXF3eTFhdWN5TmJCN0xqTmNnNlhhR3JKaVdyZDlsUDhncWg5dVFS?=
 =?utf-8?B?OVdKaWJqdVZtT0hML3JGbmZXUkVpeHp6bXZ1dnRST3pxT0dQVnpubEZhSjhU?=
 =?utf-8?B?cE5qU2dSNzdQZFNLNDlTdWk3bE5jd0J0aXdxcWFHdzloKytGOXBGTVJEV0Mx?=
 =?utf-8?B?QVJWT1hvM1JVMWRpNElwUTBaeHUrUXVmaUFXYVJhUk90U0xkb3NvaXdaaDBS?=
 =?utf-8?B?b1RjZCsrUkVwZEh2SVYxTG9UdzJxc2YxcWljWEM4NEVFRDYzMG03QTN2YllJ?=
 =?utf-8?B?YjVwT1FXbWZKTGVKSldCY3oxZGxwV2JNQ29UYzVsdTk4Q3NqbGl5T29YbmRu?=
 =?utf-8?B?TlUvYXZvVEY3dURjc0llcmxEL0luWDgrUEhIbHAvSUZGQVExT3dXTzRYdGpK?=
 =?utf-8?B?K2o0T3lqaDBuQVdaVFg2OGxRalhkSHlHOUZsM3llSk1NRGtYdGplYW1Vdzhy?=
 =?utf-8?B?MW5ITkROakNMRmpvMUEreHhlaCtGRC9WbHYyRDZtZnJTclRtYXBKN0tTa2tu?=
 =?utf-8?B?TmtCc3JNQ3ZMK1U0UGp3MXM4Y01CeXJyNGRTNlQrcDdrV2syR1EwdjBHYlRt?=
 =?utf-8?B?LzRMaFV0dzh4RWRkOFgzYndRWm0zb21Ic1NJc0xRWTNwczJ2cEh1b00vV2Fi?=
 =?utf-8?B?akRsRzNFUVlJekk1S0RpaDV6TDRNaUQvdFpMb0drbldVK0xKeDhFQ1lSZDVG?=
 =?utf-8?B?ekF0MjNGcDBFVUJ2YWhabzA0V2lFdWRZZFIyM0JnbWUzeVpMU3N2aFZaZ0c4?=
 =?utf-8?B?YlN1bHRHUWZsS3FWMEhMeXc3TTBHZGxVZXpTQTZ2YUx5TVBHcXJlRHljelk2?=
 =?utf-8?B?ZW81a1dKcDFSSVhEVGVjZnllY0JubndubFA1VEdET2libkRWdXlxeTFHdE8r?=
 =?utf-8?B?WHp2VjgwSVdLUEFaK1ZvZ1Z3ZmVtZXIyaEdjLzdMc1l5OXdMVUFvMzY3QnZJ?=
 =?utf-8?B?bWVvVzRVTEQ1YXNEdURKdGswWk9ZZDd4d3VBQ2NwTmduUTlZSHBTanJOKzk1?=
 =?utf-8?B?SmJ1SzBDRWZPbmhFbkJ1YldJbnhkSFl6bXl6Z2lMR3FUNEl4eVNXT091SEFv?=
 =?utf-8?B?VGU4ZVU1VXJ3dmM3VGxwM2JMM0E5cjNNcTg1K0RueDdGd2VleVhCdDVQQUNM?=
 =?utf-8?B?QWt6ZkljQ2xQaDVNdHJOM2trRjNzcmsxNlhMclNzS09zUDlRYzgvdE9uL0Zw?=
 =?utf-8?B?ZktIMkdIMVZRQUtlZS90MXlCTEswZ0xIR3FydEtXNThiTWRKcDJqempnN2dG?=
 =?utf-8?B?dHM2cnZEaDJYQ0FPUEszcXZib2Nsa2VGVHcrTVZUdlk0WW5ZbkRCdz09?=
X-Exchange-RoutingPolicyChecked:
	Yn9GBJ+6R6xgfzSJ46oQbB4CQNLDAFbGx9dKVNHuYh1aDHhqRsf8GPypnfyc5W0H+3sEyzgJmdcVXj1KULBru6BS9nDRGL7bE9bVS/Rzm+FgnbtRk3XHx/E/XgiUzFVeUXZkI6afGGHmjuhUR0/O/lVHIFMxyobOkNkTm1WdCBlGp8Ea3M/SVD4QAmAj6fead7M+qC5jvdXCZaqe2tdFelRckq1I3RT30u1NCjSg8xUih5ngV7IzoSMHwxLhg5y5WRDl37vtKfwQvx4KFehH57qXatZ0nNdl/i/DjrCq08jAcGQ5ThQHLoTIQeP2aOzQ2TX50mVVsgE8Uo9aAYGKUA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	StYomiHvfiCYDmaMYfhSvrKghMuW23jurrr0A8cuxq2QqxDGAwKdboGCMt8KFqxrixZPS5ngzn3fVUzTyhZaaZYn3EQbHtIgnHL6JVytAi9YnR/+2DNXDVTaHWmmbCXaIokI58posanSXyxR593n5Rq767ZhbJw/pbehDbxx8yLm0fgjGr6p+7r/o4RrdBN0nm4XVb9eyaTXjPvHgOQPehJzMse7rQOBbgQo0fkIH5XTpkJvXFChJaesPRIvuqyDbrqLbNXsW52fF1Ivm3LelhP8GfJu27oxZnPyGEijDEZFacSbn0e7v8XJzbKWR0WyT2lvdV+sScfUtOwKIvXzZrb3lEg0Zw63cWWyyalE4j11BDtVT6Qzb+HPiT3w6Tl9AlZPmHtXl0iPMwS3hqWS4b2BiabKzbX6DeLUP/pulOXbja4e+6TGNHG13bofV/Ew/AxKUVx0hjS6a1JxtNItfxc1kcIEzRNmFyPmGCemjG9saErt5PzfGgxqiB60rlw5luEAnxmFIJkPMeMQFAsiVVsU3jfl2m25YP8V2bi5/C6L3OmnLDlE+M1dSyq7M1IefoT9+zIn0AisIeCJpJ6t9Y5bg4lLivZODkGf3GX1Ftc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d4e15d-a62a-4237-c5cd-08ded04a3a0c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 10:37:15.5088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FmeQu4TJFsJyp32oGEmJLysQNPC3u/dLIBmT8AdzE6EqvOEVl0nfkR3BD+TDh0DoeQ2UqJLsdRJqXVHnNoM+LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4215
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2606220105
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwNSBTYWx0ZWRfX87p3Joro8f4e
 WadRbxU25gyRiT8xMgQWZiizDC+nH9Cch7xu3P70BSMYrgP7noEMbnL+T/rctb3pxE4AyGHDVT3
 88WV5hMf5kBHYeDFBe2h55F7UqyFk1wNe8SzTZtdx+eqAuZdWc4OrUe8LAZFKAfiJnZqwhmxdjo
 z6XQMf0sM2/hZkd1Rsp0Wctu40NX4eTns6+Drkht+eoySCGJCEmZ9Hphvy5B5AosGMiHR8HWndh
 KvjxhBPEVws8q82DfU5e/kL6DyiUpSWCiw5eUbADjEfTd0IOlDAb1vZJuYKf/dCmdqrUZ2QZmoc
 eBaAFPr9SwIlYVHKQIfZSE9SCk4aAuQK5XdFXRWdPTiu6ADBVc8QanWktLKd85uludWZEtYmdb0
 rizv/aiC+qmvVaVG5IDgFTtTk8O+40IOQ/gdno//Wm4GD1bfXhULZyuOkq5mI21ODJ8qLHJphlG
 gM4JGModTxokhK9ZBQQ==
X-Proofpoint-ORIG-GUID: 21PAtgU7P8l3LpCtOvyLkMOoddn4CM3i
X-Authority-Analysis: v=2.4 cv=Wokb99fv c=1 sm=1 tr=0 ts=6a391088 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=nhVcpLtxhj9V0wJdOmYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 21PAtgU7P8l3LpCtOvyLkMOoddn4CM3i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwNSBTYWx0ZWRfX17ZkSF0ELx+d
 OHc/Y2bSOGTGyP97Z5Z3H6B0WQj/IaLmKvsM4MxtAgXQ0Nk2/v63P98GeVotrZC2LpTJ2y5N3xM
 HX09J3ffMkxv2fE+LpJin6LTXxJX9opzYomgtraqreN/uJfh6wbL

On 22/06/2026 10:41, Mark Brown wrote:
> On Wed, Jun 17, 2026 at 04:02:43PM +0100, Mark Brown wrote:
>> Hi all,
>>
>> After merging the origin tree, today's linux-next build (perf.log perf)
>> failed like this:
>>
>> util/btf.c: In function '__btf_type__find_member_by_name':
>> util/btf.c:19:43: error: comparison of integer expressions of different signedness: 'int' and '__u32' {aka 'unsigned int'} [-Werror=sign-compare]
>>    19 |         for (i = 0, m = btf_members(t); i < btf_vlen(t); i++, m++) {
>>       |                                           ^
>> cc1: all warnings being treated as errors
>>
>> Triggered by commit:
>>
>>    f7a6b9eaff3e6 (bpf: Extend BTF UAPI vlen, kinds to use unused bits)
> 
> This issue is still present today.

thanks for catching this; I sent [1] which should resolve the failure.

Alan

[1] https://lore.kernel.org/all/20260622103418.579115-1-alan.maguire@oracle.com/


