Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3039A7E0;
	Fri, 22 May 2026 12:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453907; cv=fail; b=gQnrv+It/B3WRfY0H0KZIwoWh0XkL215PjvoSKzo5QAEvQH9CEwMxFDHQFLTsxSbyijjut0eWyYfKM5VEv//pVul3wUXDhZfe4y3VqkE3CaOlgBTxPE1mjgtqAoh3LKn/GOsGjIHza60usmRDXGJfeagdikOiTajfmMNiiZjeMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453907; c=relaxed/simple;
	bh=QqKJjK3KNQL090CS5NxIPCZv2RK6910LosrDtIo1Hjk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iZdX1v/zfpkcbr6961OFUkVzi/OEH9f2FTonzyHR2tS1cXlVvVFbvE87UYYw9M5aLsnDXVjhjP6CsyMO4D6PBfn6Wz6IXSy4dGK3nwqvYAdv7VlKzos9KteAv/xn/rLRBZ7R+Aq3NzLVnbZ0L6ePW1f7jDip6OgvqFBd044VSis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AZgQResD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Zxj+i/Cl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AZgQResD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Zxj+i/Cl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LJfrj71933606;
	Fri, 22 May 2026 12:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=O9phuvEY41jVET1qaZ19zubz/4ni7WMwfSkZsCts4tg=; b=
	AZgQResDknIEkJHHRwLoA6PkD4bbGGVc6c2fPxcBeK05l8wn3kGHBa++4BmC/+Le
	KFt4J6uJ6RWLI7wpgRI2sFEs/rLZ7BV3imH/DMFWSOibTYet/VrTPfrGttquHO8M
	ZCTs20qjuHFOYgAh1QZpv7ehiCP59DTpU6KDevsJ3Q39ecN7by9mLpVrgUJozqlF
	UrOsolvlgwBtLa/VQ6xZVxAFyHRjon4Rln74upnRBaVZ+uLlzRMBrVVO/kfRQwDw
	kPWYjMta8tjSxXHr6Uz3eYe8TAWi9FdNc4dXv9Ylnajjd1cGydkPy2l8k0tmrivO
	5A+jQphozKZMl1ftpouD3Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e6gyxb13s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 May 2026 12:44:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64MCiog2035017;
	Fri, 22 May 2026 12:44:58 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012040.outbound.protection.outlook.com [52.101.43.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4e6f1m0fq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 May 2026 12:44:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNUuPoYDQHZA9SCjyUh9J+F/UZCoLLxRomue3Zpnjiy2M44UIKB5DjIAF8puwSrlH+gpbqFMnaFdiLUiQNoGjhLATf5xjoW3uL6YfEgKxMs3IACkns/w0MJTz870Z6t3QoLfyFKekkNIEZcFnEYBrQQ6qNBwGsQmfBeAzBlsDsdycDqSr9hU78R4LRcLIhBS0bcVeYm4OUDX8DtKEW5h5W9MsjC1Y2VTfiv53y/vcqj+1rNXXG6UPjcJ0E5p8FlWz6IlG9z5gD+tXOJwSEm2O6WYndtc74d+cErM9MdrsGF0dsYvAOrEFy30B1Iqj3ZkIT7qAbOaVKbDQ6q4Fij0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9phuvEY41jVET1qaZ19zubz/4ni7WMwfSkZsCts4tg=;
 b=H6yszqt+yfT8Wu/7gXvRhwO6/QDazg8XugjHVnaFARcHmJCGFMCjGpER2tgUqrgHNpOx7cQvjAt7JtNnolxOrdSt/fBuP2at0B5ixZv6mk3JXOe79DT8QkEx0SVOwUn8xEHDBbrYAi+DHOD47+20HESi4viw1obyZsIr8gswlty4Ezocl+sf1FqPB6jR42WY9SrXODtC75kB2h7OwqcboByqGA5mH0n+KAd9N8P558etPOZSpaNARAntCgg0MNlTU49kXvJNPxJtrrwt8ExR3zkofYG8uAjUFeY9Gw23qGDfDFeVIQ05ZuIWr9M5TlcWljfvr03DJ7ZF+Qrt/d0oeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9phuvEY41jVET1qaZ19zubz/4ni7WMwfSkZsCts4tg=;
 b=Zxj+i/CldDH20fT7Yq/rwGtVMYAfWjd7QIOKTZaA14E0ShRcJaGOGVkHOoqFns4MdGB/SdasJJImI9mFtDuh/opcmu7OZn0bTXrMBM2iZMtIOxcG6MmWNbm1ucyvIcPVpyAPQuiAFK6yVupAsfG0UhXVKwkMWxNbxfBLvZdK4bk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SA1PR10MB997737.namprd10.prod.outlook.com (2603:10b6:806:4bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:44:37 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 12:44:37 +0000
Message-ID: <02c72a2a-92e1-49f8-9ed5-f8a14951ca01@oracle.com>
Date: Fri, 22 May 2026 08:44:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the nfsd tree
To: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <ahAuv5KUwsmbNNsg@sirena.org.uk>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <ahAuv5KUwsmbNNsg@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0040.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::20) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|SA1PR10MB997737:EE_
X-MS-Office365-Filtering-Correlation-Id: eb894c49-0135-4f9d-cf74-08deb7ffe256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zT+MVjC1SsFz0+23Upzr0Pl+yQtMIUh1XNZO3PJt2oRySCQfbkTNPSRt3UY264pR+0+TBInoVfBtK5oLgXp4Mfv5JkY5inTGWArYFklxBJhTDT0yYbGK4kbPQPyuLblkcqTfVqwNOTYu9ED00nY5yjxq0HVZZBsTDUfV96MsGiInLZJfKqnwPOtzQIwCMB4IvBrkWQ2ilI9PO2TQEsZtjeG05XafNYxCJm4e2agNaVgvIYVSRNyk4wttbNsZ2kaMmveZu7jIu5BAwaCd0nQSguDn/+4V635prWm6fDdpTWqZ2baV+zDUoDbiDTe8F1+Q2P7VUbphuVUt70PsbnrF5/ns+ixqkXUlox6anLHHvIULB5OQnntqSRz0OcCBFdX1BLBCPzjt/sQin0IVbwTRkqOJAt90ly6rAKvT0tUO5eFeZ/aA1v/Jdbpzp0AdffzYsD8ndkb/3kCVEHSFjZSv/mRZt73TCBeZQfib1Kwb91kAU3kSRqc31BtYxXcTqmWuJ8tSXnLdaKUPiryq+Y6ZxgZde+rMw4a3ApJOtlUpqLv90hk0+BRuqA5GiD1Avs5MEwCo92CDy1ns8xKn4XsVVikFX3O2GJ8fsWwaInRfFlN74poVT9zRFYz/Vea636PCDZEM68HMZ8pXpuLMdolMhS8sRtjJtZKWx0e111wIazRGzpAvW7TCjrPK+YzzXMl5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWlLUGRZK05xWTFHTzJ1dzZkT01Tc3h0bW42eXZTdUpaa3NUSUhoVlhCalJE?=
 =?utf-8?B?OFJXN2JsbFdNRTdpY282aWgxaC9mcXhURzNJaFpydk1Ddjk3ZElnN0FIM1JB?=
 =?utf-8?B?TVNSa3Uva2dBSisrZDNOYmFsMnRWdlY0ajhYSVdwUWEwU1cweGMrR201M2ww?=
 =?utf-8?B?UlVRS1k0VmpxQy94b2NoK09HMXQ4a1ErQUo3N0t0d1p3dnNaUTRnKzVZYkpV?=
 =?utf-8?B?M29NbGNGNjRhUXNoWTBnL2xCbVVCaWtlT245dHRVTSt2R1A3bkJuRnZaNjEr?=
 =?utf-8?B?aXp4RGhUQmxlQzRIdTRsUlhIN1N5T2RWUHpqbXQ5cHNmM0JOQlVTN2VUU2xI?=
 =?utf-8?B?REx2N05UaXhRaXJya1gyYWtNUTMraTB2S0lMbXZGMDA3bkxhQ0Vxb0E2bHdk?=
 =?utf-8?B?RXFVQjlnYW9WdGFFU2xUcXFJM2RDRnFpYVZOekFXa3ovQ1pmQkgrTHZxT2Mx?=
 =?utf-8?B?UzVvZlY4Ry9hcERnZUlXWEUzazRjN1dJMHFoSlFZK0pBVDNRaGltaXBWODl3?=
 =?utf-8?B?bTZCM1dHa0gwUFN6L3NpRmhJRnRqa1NJZ2Yrc002dUJXdkkvNDAzczh0QWhw?=
 =?utf-8?B?YytEdU5jYW9EU3pzNFFYR2pYemRLWHJSWkRVWnlRUHV3MGRUVEd2K3I1K1A3?=
 =?utf-8?B?cmdYU3pybWRYeGN1bGRoTFhtSm1Nc1VXZXBiZW9QQitpRXQxQjduK3pLZ0Nh?=
 =?utf-8?B?bzVnN0M0bFpqMTdIVm8wOFc4VU5xZHZoNHdGeUVqa2dJNW5RQ3NySGZhSEl0?=
 =?utf-8?B?WVp3Ylc0bFFGbEZFVXl6Z210Q1IzZzl3WGM3RXdONXpMVVNEUnJuUEd4Yjlo?=
 =?utf-8?B?ZUJ5Zmx4Y1NzckxML1JIR2JUQXdNV2JSb1NKR28xcHd2TzlzZkF2OEZ0dnlv?=
 =?utf-8?B?bElLeE5uYXRWc0Q0Q1JaendES21ualFLSUdGU3BUdVFqeU93M09rc2RPbjlm?=
 =?utf-8?B?WGRDVTJyWmtaMWVMNGZiRmYrOTJsWWREYVcvTHYramc1UnJ1RnJRTnQ3VnND?=
 =?utf-8?B?WlV3N201ZXNlbFVQZTRCcmNHR0tHS2R1cXIrTFc3TG8zcjk0VkNQTGhNU1Uy?=
 =?utf-8?B?elREbTRpaTZZb2JjL0FBQ2d5aUxrT05maDRsK1RMOEtSdTNPejRoOCtab2ow?=
 =?utf-8?B?TVhlcGtLNGV6bjMzY05NbWxUME0zVGttb2N5QVVaYStnMEVMTWVkd3R2RkZx?=
 =?utf-8?B?UWc5citPMC9veHVwSld3WGdVRWErckdOempqcmJqdXh5WUo0M2RyYUpFNTlW?=
 =?utf-8?B?d1VHMURsRTNuTnV3N1pva3VhcjVSSTZGYkxTZllMUjN1aUE5K05oRVF6eHAy?=
 =?utf-8?B?S3J6RW5PRW1jSHM1WC9sYVlQOCtsVEhoa2tlR0JkM0ZtOUlwUHhjd3ZaVUsw?=
 =?utf-8?B?Q0NHb3c2NmVCWkV4TUw3NzZRSFRLWG9OcnVJb2c2YmorTnZ3UkhSc0ZSUXhl?=
 =?utf-8?B?NjhGVHpYVnlnOTZFTWJub2ZucHNEWGRGdm95RzRNZ2JaQWZ2YjljZjhCTzZw?=
 =?utf-8?B?YlIwaC9nMncyYjh3RFUvWTZ5TU9LQzBCMVNkYkJZcmI1T3Jnc3pialZ6c1lo?=
 =?utf-8?B?cXdHMVJnZVZKTFd5NzlhSHBYeU1DMzlCQ0k4UG5CcnBwR1VrdXZkbVE4a2VC?=
 =?utf-8?B?cWlwN1lyR2Q3cTBaNWpxVXdBZm1EK3FxNmJvM1g0ZnlRQUVOQ3FhenkwL0po?=
 =?utf-8?B?UjNRUmxhSFViY2xtOFF2SlZSTGhHS2pkRHFMNTVMVWs4N25rY0tnQzloK2ZC?=
 =?utf-8?B?MStuWWt2dnBmSWpRaG8wR3o0YmF4QlArbkNob3E5YzAxeTQvUGcxSC9FTnBn?=
 =?utf-8?B?b2tVT0hmWWJndEpVZzUwa2hnMnBGbUFlMGZNSXh5RXRvMEMwZXhVb2IwaUdk?=
 =?utf-8?B?Y0tubjJSZ0RVZDlIZFd6aU05UnUvZW8wV3VHUmxJOEs0S055ZWpuOEV0N1hW?=
 =?utf-8?B?cE40K2dzOWZraTlkckN6Qmp3Uk54R256R0wvK3EvUkVmVUZkdmNzd21CWC9L?=
 =?utf-8?B?aEc4WHhaMnpvMUp0YmlBN1FDRmJKMExaUFRmR1ZZMStzQ1pXTi9oaEtTYUlu?=
 =?utf-8?B?V3ozQUVNTXpnLy9ZZjFVVEllVjJMTFRQYTljWk8wWDlZbExKN1g5OUpCNWlM?=
 =?utf-8?B?S254ekhpdFdvU0FIb1dEWFZrUVN0SExabHRXbVRKM0ZVWlNtZGhNZUd3K1Vx?=
 =?utf-8?B?Tmh0NHIxZ1ZnWTZoZi8xU1dRQUVJUmREeGJVR1pFVjhJU0kwMjU1S3IvZHhz?=
 =?utf-8?B?OFBhZ3ZuU21tUG9INmpaVy8vZno4RDAzZThIbVpDOHYvdUhJekoyT1VxcHJR?=
 =?utf-8?B?WHBtamsxdit2L1RWc3pVK05FK2Y5L2FpcW5IUnRwdCtuWm81a0Y3QT09?=
X-Exchange-RoutingPolicyChecked:
	db17hidrYvPJq5e210ctlw6ZuwAQbq5LPXSV0N/P9mjP5dz4HB3jQEnac12Atnz3I08wzAn7vMykXZM/tjHWRzRxs4mJiprEvdC0pW6u6PX/CkA8uBB6yXrKluKVZYRlj5kMs7WtX2zEGd/t3zUSH8UnL0kbjaMYSBMe0KvodAuEEhJcp4VEO0xBpMYyI4ZmE0Ned5baAMqd2JvRgqLXyxrY1HIGoq/1vWRbcT1gq8JtAh89t+hRPj6TH1E9H7pw6dIwK1C0usmSYKg5h65PIShO+oWKKF+j95KJxVTWvMvgwimTBkTTlJJ8pS8AQwsHfvzoPlYAa5DuPLQikluwXg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OWOdUQTF0pTUSm9jl8nr3soGwVLTEu5+yV9QLvHZEzE2PjicgHXE69EjRl5XbFQ0o9rbQY8w0U9J3XrOtGRTJMLbbziMOMOX1xPvvyNeynf+N1Zy7aqIZ2+j1ak21SQshikPdg+PiBkvLWaSNnLwRmTIQr2caxt9jcGBu21+DQwrb4LK1sdhCjAYtQrmp1ODVYraj34cFWY0h1phz/4lpXvaDc6JDDNYtvEA/bs5P+JlHzOSEbEKw8Yhmq8LYyZMVA3yPXuDz56TAht7fVSbPKTFW/L3f9hkLst+HQZGDfXeEOW7HQxZy2zzH6FmrAE1e+oIMybyJTUJx0UtNRMtnMzTMyJiRB/tQDuX+iI12dzo4/x9RpMDprVjikMgGj07wQHXJe3XVLi5s5l94YkAwroAOgaoqqR3iFAI+kyQ2/1JHjtrYZ0Skwqic5vODhEdO7oJuiUQOJN41lWI2We24+1ndnuUGBdurJtm0xdPmMuFwtLft/x8a9s+pN0Ayrf/fPt9Q9OupDEhfNcZTlISbEvLS/bVOWHYt2Zl1xUuTrirpva/GZm1UaZwRobrUirw/7ud/vGN+d91SaBneEeZzcC0pXMCWNDovyGP7JW55s4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb894c49-0135-4f9d-cf74-08deb7ffe256
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:44:37.6273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFdI5ySg/7slHlp74n8mkiqan2Du6Mg1ycpKUqgBTnpwS5i8z3sh5/c8vJpGjySb9+ajJ1cgUh2ObVKtgan2Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997737
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605220127
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyNyBTYWx0ZWRfX7lYLpXBb3IAj
 UeCYT0+hKGIAF+mNf6fJhxAnOFuWy+8CGTfR67m4pv3j0VRHan1aVTWP5Pp57SRSpTP8fqtiMwn
 N4rGm7c13m7KtMOLRtPgWNLuIOe8/CWSC6H72cg38iSYY1PQM4Fsk2LxU/x/Z57MM7a8EdS6UxJ
 paGmPTEiTgvS3l6CUBHKwTcTV7a2ul0Y/hJZwUXG/STlmaBiz8hTXezxJw9tvS16ktvIrujrWkt
 RVA01F3MU+8NZWK/X6coiRlfpGSmVelzJEKcl+qLP2H3P42LXzmDLPy9GqlCeO0FsXU10smJOwc
 nkxaiKRPkwMbJ0FmDhffH7ROgKf3LvzdtsD9TegagTyKsrrhzLC4BRkbzAaloiddr6dRqzVAaIF
 Y+l1qhdlmOdyQSJf/7i2BcoNtAkEkbpknbx/ohzfEFzA6D9eT6WEiR3jVoclPoBqe6PT9Gw/zEh
 RI82dGPa5a9FmQHEX5N7klJUnnYxZqOQuwy0uhu8=
X-Authority-Analysis: v=2.4 cv=Ls2iDHdc c=1 sm=1 tr=0 ts=6a104fcb b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=nAX4ftklvGUgdFdCURsA:9
 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12301
X-Proofpoint-ORIG-GUID: nrmu2u1ycqYi742vBju9PQSDKYKzsLwO
X-Proofpoint-GUID: nrmu2u1ycqYi742vBju9PQSDKYKzsLwO

On 5/22/26 6:23 AM, Mark Brown wrote:
> Commit
> 
>   71556f3d55ee3 ("signal: clear JOBCTL_PENDING_MASK for caller in zap_other_threads()")
> 
> is missing a Signed-off-by from its author

That commit came in from the vfs/vfs.all integration tree. Adding
Christian.


-- 
Chuck Lever
