Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FD328DC4;
	Fri, 24 Jul 2026 03:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784863177; cv=fail; b=PIRCDr1d9nfVf4lIVaiZ+lzIUSyhwf3otGef/an+gu9SdLdKbq5NH/QP8dX5TCVGX7CuBJMrTxHn/T0NYJb+8LgQdLwufMZIsDlhTeM61zO9/vZFW82Yza5JTftJzXZ5mDA4Xivg+wfZHUMgmKqYPO2L8+Dm2XHrnsMlvz7t+nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784863177; c=relaxed/simple;
	bh=9zS16iOmKvx12zkAg1VgAkzyc4bIVDm7sJ7wNOkiuF0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LSsvDyLOsieXWbuxced6qH4qgtD7k20tDWkqyHde1RetPAisTaHA1w7p+0zGEuH4rJCSOR74Rx3a26rb8kA0VrxsCD7J8ZXPn4XZr+TCV4L/Z74Xo23GOl6qg8kY6iFSQH8aWAVc/sO9w0V9mWk+8oQfPvMCfIdBZ1prNL4EfGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=fail smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=mDoKY9G+; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="mDoKY9G+"
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O2bkus670414;
	Thu, 23 Jul 2026 20:18:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wivb4EntjbYbZdWQBwYROcfFUUlKZ4wS/C8VX4DtiUg=; b=
	mDoKY9G+jG62maU9fK9hc2plNeGtzLo4PeomqaVz/pb1oaThgeDFNuMP890+FZFh
	p9YGWDUmsBKbLksRdcFBPn8fb5oU9C7582PbfOfwVFTt59LSlQEencOd2x87iFeV
	dfVOHlneix90s+20as2gWNjscZCnptfpCk1RedahctITTHLEAjhTSNT+3iq2rDZ1
	k2A01PaTlsT5CZmYkBJmxSJm9RBy3iPK0sNSgt+qQ7KCLJ7oPwFy8Civf2rQmxH5
	S64RXVjFgXf7kq/u6NfHXhBYISlBkVMyJHDfXonqZphQQNEjHGlHNr0yPuY3fk75
	lO+auEYQXlI4E2rIQQSdsg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fjt3u40yk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 20:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewZXtONoorlM4hi7TZLvV8ih8iaQz4cwSKqHU5QLEP7wJydIe5NGDeiy7N0Oj3U9Wfek8DKAavcE7XC7cCLYYek2U6ntCItc702jEEo30JY89uk5mS5ldcFpIL9aABnY8sooxT4l5jEf8YIey19NpzqzOuSR2d9CcyQvAintud3j8v9JhqanWgsNs+267Kqn/gEcVU7DVr4seMzrQXfM96Vz7Sfjnw7MLRGh6CdlSf5Cri7TJRlh38bexE/Wyo1chWTlwxAF7QgnbYwu/X8jO4jjkaYfAw+OfAMVkNFvhWPPVd4ARg51CQ4K2OqkoKmH5N7+mgQWoWoT8D/6qDe8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wivb4EntjbYbZdWQBwYROcfFUUlKZ4wS/C8VX4DtiUg=;
 b=ymOtWPfJbcKodNSPnO3aNp0CXi161+XbT1CViW+XCHQxZ/UhIYNZfKdIe1i+HGJexRnJKY6yTqp1kzi8pHxSaMK08IQ57xZn/Xw15cydwEvSlOeGCRs0X92LkSIDyWVOyAq/VMdAFRbPBRN/cRjlp4ze6sCPapl8HVhsqlvMf89wmAhv3Aok3FS9O1cpB3XclQmy4++ws1zyP3spzOpTJ1S+zFit7AjWQljPrCg6dNkmAknHObtBUjv0iu9ZG1vC8bPMRdhu71o/ge9hM8zAfcUa76pYiBdJdeCWGV/LWcLXke+wwy+gBRurbqSGZLIF4DrRJO6z40kxOJDFO3yNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by CY8PR11MB7798.namprd11.prod.outlook.com (2603:10b6:930:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 03:18:55 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0245.009; Fri, 24 Jul 2026
 03:18:55 +0000
Message-ID: <22a9e54e-936d-45b8-9083-441c29d43621@windriver.com>
Date: Fri, 24 Jul 2026 11:18:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the nfc tree with the nfc-fixes tree
To: Mark Brown <broonie@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Samuel Page <sam@bynar.io>, horms@kernel.org
References: <akJv3Ajqh0ALyEk4@sirena.org.uk>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <akJv3Ajqh0ALyEk4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|CY8PR11MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: de531322-b937-4d78-c8a5-08dee9324b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|10067099003|13003099007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	fT3+33pk+7bxwI/ydEb4mrSRIt5uY6K9XSf7AHFTtMQjxHJJnVYsnzbdD11l1p9d4uGLjp4skFDCg4tJC0GG2OW4KPjRVVSF46vgY9nJoKqXSZKn4K2+UHmO6rky4ssr9vnGL6dqatLToVW7kvFSyuLpjA90wajn97E3doXhRZ9hgvzhk+EKGVYED/M+xKNCMLeeC2V8NEKOdYcthhodxOlhb1I42Ygn82H+tlTMxhEgxperZaFS/na4Pi9FQSfHPfsBpTYW9iYLtsbymLL4tnL5+9kVKkF3V4fUKxHKHdN/66qGJ7KxnfVceSxE6sebwr3DKMNifR7rFp2MOSegEP2GSm88QXT2jMYXZrjPT4it1VOvtvnLslxdJrruLzjXno34vxMz5+S0HJDMbzNuquk9lpRiCldoU44V2lXmgGeBPetv4Nws7QP05TBUtWZcYrCono2uqi69VE6Sr+rzfXH1dAqVQMHaMaQPw2QAKe9ifOgchZ8vxD5c7AeXumbPtAPabHwwFKxfdDzN+hB/A09ML8uzuiFuPyvV3aABZ7yfOg0KwbfwkWAtqY0Wn5CG9Wv1D/aYEGzJOgiVZ4sLIREDuMzgyCs5Jmw2O6zPYsVy2qXMklNjCmwFvwjUwVZi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(13003099007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWdvM0ordjkwRTJ4M01LL0M0cXpXV3EvWWNJeGsyNVZQQVlhVjQ2VTBwUk44?=
 =?utf-8?B?Z0plbnZLZmkyRVpKeFFRcU1NWkQ1Z1Y2cHNDeEk3OEFZRFlhMXhpMnB2aUNq?=
 =?utf-8?B?K3JZVzJRWnoxWktrZFpDSjA0ZkxMYWNqei9kemljcUw2RDNITEdydjFuNEsx?=
 =?utf-8?B?MlEvVENPUlMrMlhCck1odWZZQlJHWGJKZjIvVkcwQVdtWlRYaTBoRThuM3di?=
 =?utf-8?B?eS93SHJlbkZOK2tXTGROOTNMYkRqeWl6TUNBbVVjbmpDVnIwSStBelBvanRv?=
 =?utf-8?B?SE5POHl3aTdQZG9OQlV3dEYrbzl4cjgzOVRaeVdVYXJMOUMrUCtlRjMzdmYz?=
 =?utf-8?B?SE9xWURCOVFzLzl4ZzdQMGs4L2VEVFk1THBkS2JBSEE1SVJOMjR4T2FQZHZu?=
 =?utf-8?B?OC9ody85LzJCZG9Ub0NMTzZITG8wWDcrV3ZwczVNbUQ1cjN5VXd0STJycEdP?=
 =?utf-8?B?REZHbjlpMkhxbFBXdWxPdnhqWmk2TFV1Vy9teXFQdlhrU0hRMTk2cElHWWM0?=
 =?utf-8?B?d3B5dXpiSngzZkd4SUFhZXQ5UUhWME9lOERVMDBMVmNvRTBvOHF1c3FWdGY4?=
 =?utf-8?B?TnVCQWxva1VyYk5OVVFRZ0VLcVF5ZzM2dmllTW8vUnV4YmNqZ21UT2hNTkpF?=
 =?utf-8?B?d3RLNjFmRnZoY0hXdWRrdnFLWjc0Z1k2Mng2MTk2R1RBb2dRYytyczhkZE5V?=
 =?utf-8?B?RGVuYm5YWkNUYnY0b1NYL0JJOTBScEFwN1JLZnJJS1ptY1dOa3pENS9vaUQz?=
 =?utf-8?B?TVhZYjl6ZGhoMWlFWU1wc2sxNkNlYzcwcWUwM2xEV2RhaXVpWmNrOTRPS0Nw?=
 =?utf-8?B?dzVvWkY2K0wyUlVpNWszRU01MzJWZzVQUHArR25lbVV0UXppVXdPbFZ6V1JG?=
 =?utf-8?B?YWJOcy8vNE91UWswbGQzUzFPcy9GNHIyVWVQWmo4UTAxN2ZhdjdXK2FvMW54?=
 =?utf-8?B?YnRSNXRQamZxWmR6U04xYlA4S2htNVBmZEVSNEVwajZGSkhFeVdXQzQwVVUx?=
 =?utf-8?B?K0NQMUdWVkgweE40ZGpzcks4a0MvWDRTaDdXdzBNUFQwZXZyZ0RscnF2VjhJ?=
 =?utf-8?B?eXY2bDl4NjZuVnllbHYvR2hyRGNUWkN1N2RPSVdPdE5UWGxhMkhzbWpycHc3?=
 =?utf-8?B?VUNIZHl2M095QjFtajNXNlFGeFFQbXo3SU9YSGZZbVRoTjRDdGpoUkNaR1Iw?=
 =?utf-8?B?TEh6Um1BTDgrM0VEci9xZzk4TUR3TmE4aE1QMW14WTlQeUNEYnJZRHlsdFc2?=
 =?utf-8?B?T3JWZUFFMW9xOW43R3pLRXVGM2ZUd0N2aUNRQTVCVEpQUWMrOWlpWnppUGVO?=
 =?utf-8?B?R29nUjBTMkRhOUZTOWMxRzhBV1ZpV3hkMXg0WG5wZmJac1FGN0lhYlVwZTUx?=
 =?utf-8?B?c0dzTnFtUHVFOUdheW56M3FQOHFWNmdkMmxJdXJsWWdaN1V5ZTFtQkdDT3ZL?=
 =?utf-8?B?R0NobGJtNGI0SzFhN2I5ZllvTTNtSXhhQmFBaFpLK284YjhaZEJDbE14dS8x?=
 =?utf-8?B?amtxVDBhOVY4RWNieVVtZ205SEZTdlgxOWY5eUVQNGYrcloxeDRMclUxSUth?=
 =?utf-8?B?aERVbVZkOVQxOEJ0cktMdjR4N1BUUnhSSDZWTUdJV041L2ZvR01BTVFaSG1P?=
 =?utf-8?B?ZHJkZXRLRTNTYmFyMlhDYjlDUFlNUHRsbkpBRlorMVRid2dDMGxQMXNPam81?=
 =?utf-8?B?Vmpsb3UzeWZTMkE1QVgxcDZobWR5TzNtUmpuOER0ZE93YXN2NEc2Q25ZbnYy?=
 =?utf-8?B?SXFWdnFxay9mVlZnT0hud3JIU1NaRm8xaGo4TExjQlNod0k0dzVPd09SSm5a?=
 =?utf-8?B?UkZnNWNJc2RpNncxR3FXSnZmWjA4OS9IVEVHRzRYYnFGN3d3WlFZamRDWk11?=
 =?utf-8?B?ci8wb05QMmcxaTJJZzkxbHdpVzU0L1JUeWFMOXR2UHVXMzFVamUyOEhKWnp5?=
 =?utf-8?B?aUczeVFYbXV6TTZtTGdOM1ZGRTQyZ3pYSCtWT1RBak43dU91bzE1amlZTHk4?=
 =?utf-8?B?cHpQNlBkVk16RzdnWnRRZE9ILytONmV3UURRaXVyVXFZNGVoNmt3WDd5Yjd0?=
 =?utf-8?B?SWRZZTdQM3E2Mk9NTlFBdmNWQTdjamlXbkt4cmhUc3VXNXZMRmJUTWtlZDh1?=
 =?utf-8?B?U3lDRUNKdG9jQ3BjNWI0NVBpYWVNRHJiKzRITDJkMjFPOXh6Q1hrQWxZdStJ?=
 =?utf-8?B?YjNKdVVyRHNpMGlOcUpyclVxVXJXM0puYy9sbFJNc0JJRjZqRStCbnVmU3Y5?=
 =?utf-8?B?TXBTeDQrRGh6Umd2OVBkV3I1OVlXRXd1YVBzN0tPS3dMQ215Q2xkcXRnMWh5?=
 =?utf-8?B?YXZFZ04yeTNHT2dmQTJVY0JxRlhUR0dDWnhPQkY0VXZnWEx0TktUQT09?=
X-Exchange-RoutingPolicyChecked:
	WonivQqIoOTd7PopNBOh1oD2frzM82cGfOQ7r3MHwZx6oTAAuJIwHSMxbCvWPx0ZQYvrvIMXcW27Tqca4nUjoob9819HMXL9fnbS9qhxFkGxRoIDcb/EixAe32Rr7XPEVsZLuE2Pt0n3xVkJSdVBykyoTj1kF1o5uZBuw+3HBDOtX54EnEf5o3CELHOhuqiWKPuMfyytszS+rCzqn1VSIxDLrJaq0NGhLPfiy9EbcZQ/cqG9OHYyaTSidYeJelfjNCIR+e10E/adwfOTccLpj/IhFm6EBaDWMTP3FstQjP0+MYlNLgcRGKu6V1qrJ1o8nOUSMRm21ew20WvVaIP2BQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de531322-b937-4d78-c8a5-08dee9324b30
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 03:18:55.3430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exuQUQR3lXOPDLhMgfgw24ps9kpBkf8KX256DBumHCrfQe5o/yhp4ImQvtGAfaSEa4S7ZLcwWdvz3/Q9lbsVxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7798
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAyOCBTYWx0ZWRfXz6HeFKv9bOK4
 PHfWsp0a+WdJM4yHdUqzWDXiTBkuNCQ9MbFgtKNPcKk5Vod13/1zU13jXCOrPxUl/w6JkW4D5E2
 oKVkfDdxYMxMB3bIgdVRcAg0lM6Dd5WTLPmwD+k2syD/iGH5ZGHHmGIhmpl09d1WClctSgR7CDN
 5cNIBTnzquEGVSiJOn0aVjMu/8Mzx+Slo74IY3sIlqdFGYSPVh+DeQBhZ+QEmRxQXawVMR+1I0L
 iqGA6wG6JVlv1CIAkimPWaDXc/IV1kBwzEG6MUSpplbNJ7j9GHaGrXPIuYbbfgC3WMlbusZKuQp
 XulcclnF23fDVjD5MnVBv9zaEleo8T7cXPWgGYn++U8ktU7tWIZovy76HsK9/25YrZ1vOkPgOn8
 HyuFAGV9w4iUiFO/out8K1mJ1xrNMgPhqrNr8E/W3kWkpel+Js/Syb3R8BoBoOUnjIP0p1apC6i
 fZQi7aEQjLD0YHJvabQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAyOCBTYWx0ZWRfX/tvG5Rny3aZ2
 jt6I3laEmwoxAtg68eNh3BudFIosglxK85Xyy5VrstPbz/28YLNh9gu1v0ODTKNoIhIG8bN/WsK
 c66lQkgPqYeWlECcFB3M4zwPiO6Lj92mBoiDCB5xVlg6JccDj20h
X-Proofpoint-GUID: XC7MEJIAQ1knUrVSz0siU21mTcs3tCnA
X-Authority-Analysis: v=2.4 cv=U9yiy+ru c=1 sm=1 tr=0 ts=6a62d9a3 cx=c_pps
 a=7zLNS0vNT/Ole769MsF7+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=sHcUWxyus_vZBAG6oJIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XC7MEJIAQ1knUrVSz0siU21mTcs3tCnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240028

Hi Mark, David,

My patch (1d5fcb66b07a3) [1] was applied to the nfc tree on Jun 2, 
nearly a month before Samuel's (075f88b7d3b5c, Jun 24) [2] . They fix 
the same bug.

But Samuel's v2 still has issues that I addressed during my v1 [3] --> 
v3 iteration:
1. Error response handling: his patch requires sizeof(*rsp_1) before
reading the status field. A valid NCI error response may only contain
a 1-byte status — his code returns SYNTAX_ERROR instead of propagating
the device's actual error code. I fixed this in v2 [4] by checking 1 
byte first, then requiring the full header only after status == OK.

2. ndev state corruption: Simon flagged that if the length check fails
after ndev fields are partially updated, it leaves ndev in an
inconsistent state. My v3 defers all ndev updates until after
validation passes.

[1] 
https://lore.kernel.org/all/20260527052625.3309581-1-yun.zhou@windriver.com/T/
[2] https://lore.kernel.org/all/20260624224455.999374-1-sam@bynar.io/
[3] 
https://lore.kernel.org/all/20260519013042.3459906-1-yun.zhou@windriver.com/T/
[4] 
https://lore.kernel.org/all/20260522021326.1164807-1-yun.zhou@windriver.com/T/

Was there something wrong with my version, or was it just a mechanical 
conflict resolution?

Thanks,
Yun

On 6/29/2026 9:15 PM, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the nfc tree got a conflict in:
> 
>    net/nfc/nci/rsp.c
> 
> between commit:
> 
>    075f88b7d3b5c ("nfc: nci: fix uninit-value in nci_core_init_rsp_packet()")
> 
> from the nfc-fixes tree and commit:
> 
>    1d5fcb66b07a3 ("nfc: nci: fix use of uninitialized memory in CORE_INIT_RSP parsing")
> 
> from the nfc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc net/nfc/nci/rsp.c
> index 6b2fa6bdbd14b,85c3ff2b78cd9..0000000000000
> --- a/net/nfc/nci/rsp.c
> +++ b/net/nfc/nci/rsp.c
> @@@ -50,7 -50,8 +50,8 @@@ static u8 nci_core_init_rsp_packet_v1(s
>    	const struct nci_core_init_rsp_1 *rsp_1 = (void *)skb->data;
>    	const struct nci_core_init_rsp_2 *rsp_2;
>    
> + 	/* Ensure that the status field can be accessed. */
>   -	if (skb_headlen(skb) < 1)
>   +	if (skb->len < sizeof(*rsp_1))
>    		return NCI_STATUS_SYNTAX_ERROR;
>    
>    	pr_debug("status 0x%x\n", rsp_1->status);

