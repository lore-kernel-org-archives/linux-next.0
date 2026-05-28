Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA3F2765D7;
	Thu, 28 May 2026 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979930; cv=fail; b=QOKGZZkqSqSiIs1vlRWGHv+UC9hWxLnbaocuTWU+dEF0vJNDInB2OGdfj4XELqyNFrARYX3lVfZUsARicEfq/1h9UdZ7CwQ0yPNuCddvVMLTm7gizJJy1GZMGrxdhXXStgMNaltD2yx8mnUSQuwq1nLeHH+D115CMBmPTvo83nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979930; c=relaxed/simple;
	bh=/MsAVIDBnhaeJkslwZAK7mZJelrhP+CkREujx7OlfLM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bwIu/ycJKHn/fkzRMmfrFTlYefExywx+pRbCQeMgOJBPEI6CnvffWMmykthmK+GEA/P8+ncjbDK4u+37wucetweTWtRh9Km/zOi4wAvzX0aeJnr4GAY6VC4AeYETadxrW4pitb78WwTLnLvbi0J93Lucu/PXVKamopANHVBGH04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mendmDT0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=P1tL2+y0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mendmDT0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="P1tL2+y0"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SE1Uvq1768461;
	Thu, 28 May 2026 14:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KHw0Dt5E3QRa1W30o5FnTHpULoxFcT4zaSsza9OhSTI=; b=
	mendmDT0aN034tsOtJ/KLXkC7nysg/hw8GAG+MHBG8CXjIjEEcXHNYm1uLHkAqcd
	3xeUKNcOtJ1LgyG+5gli/SosgvN0xc/HvpD7X+OcyusePxVtTg73HG6U1PmyRza6
	oTIhMw2ZWgNihWbEizcrrQOHSEJNvjS7097sW+8F/vI56nF4+CoOv+sTvfh6tHsH
	xIpG+6Rm3JDuWInyh6ro1PiwgfAhb9Q/lvXFJaJJneHZa9wqv/m0Eed/cdjI9y7/
	b6E7M5WEq+aC5Vi9k5AiviQJkiUaebLZTzQK9TAi1vkTy+nZV/XDY6j+xMqKBZNn
	H7LFyGwXbPLyECOjl7nzCw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ee7wp9435-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 May 2026 14:52:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64SEjMnB026706;
	Thu, 28 May 2026 14:52:05 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4edjsg37f7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 May 2026 14:52:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmp7BdRZ6tTJMJDbn7XXWJ0wRQ3CiSK1uusz0NmWJ+WLJpPjxybjvJYSWOSVzRxAmXjKy+mMU9m6EcviQZmn/0cG57MQCDl9WxoqMlMROUvHn/6dgbwnw3UB/6D+ayQtkQlP+9tMTq0o0xnhHGYBgy12RnvRPYZ2Z6r9OoGs+9eKLHrrLgIh9yvp6Buv0LXQu2ny6KPzVtyiGvk7ke8BUdL1njVeP8Md1QjUu/Lsdm0xcT4meRz6JaUt9L0xoqhxY6sPe5Sc+tq54+69JJKTTnSf/IOZZ7kElaVZJXLUfZM47FGhZzIm50OpaphbEDmV+XDTRMH3SW4xP/0qmzuNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHw0Dt5E3QRa1W30o5FnTHpULoxFcT4zaSsza9OhSTI=;
 b=jg26Nq7BcY/2VzMlUV7ZiSWPzEOj1+zRJztzZ9qyekk1mSHJUrXFyVdb2faSYvlsvCEqhoyZKiQgvZTl8sSRK4RrXwkmfPrB9SQTnxMSF2oGrQmMcOPbWfdMsn3ZN8LnYvwxdIJSqUdFIpleIxO4h4CbkW+PTu8e4rM3tnlljya/lXeSoC2ORtq8Fvd8NGzwLGLztqp38VfXGI47faYMYziHj7Xnh4fph1YnpWrb9w5MWrPppgozmgGmnPZnpCPdhpVdrNQl9t0BXaTeTb7CMHZcsbmLB5ZT7zTS/8H/JwMXQENIKPXNGw6N+XWVD0UEyhmh0ga/ZZ03VX3/A+I7Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHw0Dt5E3QRa1W30o5FnTHpULoxFcT4zaSsza9OhSTI=;
 b=P1tL2+y0XdqmAOghtoW/OeOuqOidIGftj7Ix+FOUnLZGd72JzuAxsonskB/bfJYJPPck8ox9DN4o+IPgCApInvqCxJVVFjHgheKBW3qGfwgpKB1Q7QR57mH+Z2iYdljHTzR9Tmuv2+HFcEHqn5CMKgdDHdYsHDiHv781VGvh5ds=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SA6PR10MB8111.namprd10.prod.outlook.com (2603:10b6:806:446::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 14:52:00 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%3]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 14:52:00 +0000
Message-ID: <03ab0716-6b08-4e4a-8fe6-2d398fe03ac3@oracle.com>
Date: Thu, 28 May 2026 10:51:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the nfsd
 tree
To: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>,
        Jeff Layton <jlayton@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ahhRHXWXMtagI5Zi@sirena.org.uk>
From: Chuck Lever <chuck.lever@oracle.com>
Content-Language: en-US
In-Reply-To: <ahhRHXWXMtagI5Zi@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0363.namprd03.prod.outlook.com
 (2603:10b6:610:119::32) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|SA6PR10MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe5c19a-0026-463b-4af5-08debcc8ac13
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 q+NncxjfSxRK6rxp2tqBRYJLbjvp+q4a/DQ4aBThIx3ijV5xI44hPtkBfRGX6Bb4yUySzD9JT2lvhP/0m6S8WJgfH9nKH3TsoxMrMq8KgZAQmsrIDtaX3TQbAyr4cmkF/FuXgCac/jDOFLSfELIfmKamut8SRdvYUVeb4j17MppZy9EZP+aZCV5We53PaDg9qT3o9fWjs+sevfMMpSzRWOCWif9ncnLPccRK9dMsKK3eR/oqftJP/nnY7h9ATx1sAbgZ0c5pTu4pXA41QKVBjBWrSd1ES/0r6Sp6imnqDugUo08wtujZWqkZRuwORWgEccjNKAbwB1w7CuvlkP69IfMPAYaOWqY4aXOFuucnioMgEGcrZBxPw/PwcP/6Q2jw+/oH8qOM5irxisD8ufS9jSTpcafae3uAW8T+sokbPu45yZsliKccv0BvHO3ZhZ7fXR8E+JVRij+1b/ntGSZG+vhwvxsv/DPrxJLIbmRgCWxKlKw31oi5TIdgo7Yy72XDC+RkdMLxbMVpKCXGTUvuvcUbMKH7ehTVU56BepWHmvAjt4pvDJ++mjvIBLfRDQFsZSExK0d52GFRVmV58k0RpcT6AdfircetZxC4vxgmDQxpooLZwou9UPBCA/PVWjfCQ4e1e5tBCyeZZRqtL8q7a+8KPej4ABzR71sgJgVTwcvFRSZc8aMPd8oykx2IABgJ
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eEkyYjRPZ2w4YkVBVkdaVzNHUEJ1TzFudElSZ1R2ejZKa0hFUlZ1bEIyc0Vl?=
 =?utf-8?B?OTIyMGVxK3pLZkttQzdnN0kwazczMThYcUlsUWdnemdtK2w4bDlvMS8zN0Q3?=
 =?utf-8?B?dnNnR3FhREdKQzYxVVlhQnltSFl6MmJvRFZmQTdOd2xYSFpzUzRDYm1jQnpP?=
 =?utf-8?B?ak4rL0NRZUhUWE43TzR4b1VPd1lpeGQ2K1lYWjMyb2JuVEF6ZENaalFLY3RE?=
 =?utf-8?B?cDcyQnNIKzlNcGRYdXI5TjkzMi9FOHVGUzBRZEVzbXRVbXRKRXFxdVJKVkoz?=
 =?utf-8?B?VE15TFBUOG05Q3FJTXgzVHNRYUVLUDNNUHhHaHAzTkk4SDQ4cXRraVkzcytI?=
 =?utf-8?B?VUhyL1RJU0txeXhtSGJDTUpQWW9BRVNHNzYyRkV5SzhvNW5mM1oyTHViY3g3?=
 =?utf-8?B?QnpqMWh6WEgvSG15MElLRmFqNldia1R0QTNUT1A0aVVWdmxIRGlhclJqdjNT?=
 =?utf-8?B?a3lFSVdXV1VhTC9wL2xYczBTbnNuQVVKVzMzSnJlcXFpSzdzNCtNMy9wdXdW?=
 =?utf-8?B?UEhEcnZWREFwVnJtUmlxZkErSC9ZWWJxVFduNm9ncXBTeis4UWhBRFBCZUMy?=
 =?utf-8?B?SVh2d1owMWN3UGY2QmJNT1RZVk85RDBOb1pyRjdKTURkUzB1THNrVVdJaSt5?=
 =?utf-8?B?YTlYZ2twQytEby9ieEg2V3pvaWxaU3hxUE94WExFTzZDZEtNdEZ6dGlSQXB3?=
 =?utf-8?B?REdoL3FONHJzYnRTVjlodWJPRnpQTjVickZyTDJSTHJkRThoYXo4QkZaZ2py?=
 =?utf-8?B?Qlc2ZHJHYlM4c3I4SW1acTlaL2FmSVkyNVNSRGFYZFFXTWhSUzNiVlVIbjYr?=
 =?utf-8?B?Vm9WK0J0L0NEUTFBRFloTVMxd0xueWdRU0Nvck9jSWZ5aW5TVk5ncVVHZVVC?=
 =?utf-8?B?M3NPSW5TdGRkMFlmVEpsSUVkazVyYktoYlc1U3NldWNET0w1SGs3SDVGSUNK?=
 =?utf-8?B?MGhIcW5GZkszWWV2bFJla0dDZFRBMjljR2x1YU8xdFJ6cVNvMmUrbDFRV2dQ?=
 =?utf-8?B?V08vL3B1WHd0cnRVc0xIT2YvcHp1ZXVuU3g2WHBWeTNBYTlCN1NPTUFuRDNr?=
 =?utf-8?B?R1FzRmRFWWd2THNYclZHUlMzVW1uMG1WaHp2SzQ0cy9mUElDN3VFT2tvNThZ?=
 =?utf-8?B?dTJUS2JLcm1KcjQ1M3FQZThtc2tScEllYTlFbUVVYU14akVJM0xUOWZ1OHNs?=
 =?utf-8?B?RW5OUlB4dDh5aW85bGROV0hZNWdNaXN5VlJETW9CWC9NNE1RL2lQdkp1dy94?=
 =?utf-8?B?Y1UzVnhFOVFvUko5VkllYU81VVFucVpKMmJTdklPc1UxaTd4VmhJb09Bb2xQ?=
 =?utf-8?B?TmZmR2oxZVQ1USt1Y1BmNGd1bkRISU0rc0tvMDNWbzBWL29YVkYvMjh4TkxF?=
 =?utf-8?B?MVl5RkVyZ1JKYlM5VzJmOC91Z0M5MG56MHA3WUliS1FqanptcUJ4NmhmM0pk?=
 =?utf-8?B?cjF5alFJVzdpUnJZdDkwZ0tQb1Z5V2s4Y1hXNzFiMnZQdGV0WVhHczgzdXkr?=
 =?utf-8?B?Ry8vbnpsdk5pdndacnAxRldtREV5aEpRRXAxbDI1QnpxVEhJSUUrdkZSQkkw?=
 =?utf-8?B?bGwxdjhkRVFiZ01wV21uOE9NRGdQZHdSVDIrcWMzSm5SU1o4NndERE1VQysv?=
 =?utf-8?B?OGtzbFZqVjdNcHozdTZTSGRhYVQ4OUFoMkFWY0pEWDV3SjNnS1dyQkt4Mm9X?=
 =?utf-8?B?SWZ1RVVXaWVmQzNCZVZXdmZtdUxHTDEwL0lvWmV2RHFoSmprM0dKclVNT3ZX?=
 =?utf-8?B?Q2tyc1RLTC9JZEMrR2prcDRDNk9UNU9OMlY4Q0JJQklDMjNXTVB5UWtpNmxh?=
 =?utf-8?B?WUxReFdkVWVGYjdQMkI0OVpmUEFWaHhoR0toZ0J0NjNHQzVTMmhwVGQ5LzNM?=
 =?utf-8?B?d1Jwemp4SjFpWlp4dnhCWVdLaE82Snc0cXdwU2VHc2tBYUhKbWxzaVlleFRC?=
 =?utf-8?B?bTFEYlpQZ1V4WHI0RUFUOFFNN0JZZDd1VzNMeFpWOElnOCtiVHIvQmYvckxn?=
 =?utf-8?B?VFU4Si9weXgxRUVBZ1R3TVkwM1lkL2xzUGVVVitraEt6S3FlUVdDa0hWdGJB?=
 =?utf-8?B?blF6eEJ3UnZ4NGI0V3VKOFBpRUpyQWdiTERwWnZLd0ZZOWZqRDhXV0JqelEy?=
 =?utf-8?B?QkhwR2dlKzhsYW5QcWtEc0t6dkFwMU13M2pRNFhaQ0JYM0F1T3hsdXB0a0Uv?=
 =?utf-8?B?WVljSFBNZHdlUTAza2ZZT1VFc084d0pNTDVlcWVmL3FCaVd1SVg1ZkVlWVE1?=
 =?utf-8?B?NWk1cnc1bUphblZ1ejJjVCtwbE53SnZaUWRUYU9CbTI2NUcvcmZlVE0wM1Ny?=
 =?utf-8?B?MG5GeGVlUXhRVG1xczVxb2ZZMWdxOVplVC9OMWw2K3BlZVZ2Ynd3QT09?=
X-Exchange-RoutingPolicyChecked:
	n/faC7ltBvMziHIOXXhkemRdKL6tO0M3B972rpGKNZ8mWTo7a4bUnQpNZvMkWOk/XDhOtldd8MiuEjTeyIZm4NCJInvgiECwVEXWoHI7RVl/v4I+IMNM2oaE6R1qHSDu6Wsx0PqIjtaV4RQw8PIW5pLer0J3OtA83tZYbnxNycVMWB9m3PXMMVuAQWIYXPZMr8AUuQgd8O0K/BJG7fvIeR3ORBFColmnnKReLg8Wn7EcB1OW9IzhIwK117rlbf/naxYNOhsTcv5s25vfgYFNzRKx79QXZiwihaeaerYOPTwJKz1u+AzpDjIEN9anCvzXq32IzlHKhTe6qwqqFMZFGA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HcMOr5Oa+HiwBiRR2A37pP27KMFZtnOM2mAQJG2iSld6js6IpabXwIM6N08zb8XaMhPu67qb19yPiT4NWw2qIO8eJIPBR8YrkGe2qfOPzCJC5cAAC4GBewkFGnGrieE+Gp03n9P9MuCD62pE/uGZmIrSf65dIZoJBuaulet6SRN8j7lTjuBGwL7CNnXvWYc1wKbHOjTLFY19MGIEtjSOgY9j7uUt+Bw3fFq2Qqom/EmrADUxiuplAVPhiMGhqAJ20MAJgUYz3jFupKDFh83/4JF5PLlhnSNP2yNEKsCo7Tsppg/kZdj8DunPRVg+88ZLvPQAPhlLyIgeX7VbJzW0/0Oj+IKvYe9JnXOuGZBJrVF/Lgf+ZUs5TEv6WDLc4+7LIRyadrbbWhkRoEGK7KtSLXEqzrohOd+2IisTv+xXM6PPiCZkllXQXYkwHlJAywd2t1LAwcn0cQFW/t0p/OBGS0UoJuHPY82pZntbD4dPKC3D5ymHk55KgW+NTg6aio4lWzj2O3rZB9S/BQbuQoUtM6KIrT8V7PWLuGCUtbXLYpSLgmz7qFpncwtXXA86biAIjCZc5q58Ol/+uhvEqDJkX+eoTkMnHOan5V3Wd7Eyj+g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe5c19a-0026-463b-4af5-08debcc8ac13
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 14:52:00.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xADtHafaz1qXK9e4HvzGjKcoFwEraG5xyxpz2v9m/+bkppfzR2uc5M0dnIoFUGj250C6gCWWN6/eNMcTyCE34g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 phishscore=0 mlxlogscore=925 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605280149
X-Authority-Analysis: v=2.4 cv=PsijqQM3 c=1 sm=1 tr=0 ts=6a185695 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=jDgg4cVLf-bwnsUELKQA:9
 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12300
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1MCBTYWx0ZWRfXxmDe63IQUwjM
 vhrDxHURjNp07+cSeSQJcUeQFUPQIjchIld/xSlubg9sNfjTe8iRBtBC2JKeHyZd7m8Rgmqtc4C
 nM8QN/jrOC8h/Yv/o34D46/l/kRoxs/yY9epM4+ZODUIeGlY2nFp8eKxV96G6HYPl08iRT+aZNY
 4gYi7IE6ptTHvPtuI466S/YDD6dRbTboRJj6VhkpSm8VJ65yu3OUJaEl6yjosv7ch/e0pMGUEds
 vvnxku2LPoL+QEfI06H/fmBxbSDucA7Ga6SS270zsg1QMGXE4Y7lYR5qht2sB7U9AaeXRPTtNNJ
 yD58Yc9+uwqTy3WoP/I7IWOuK+jZRmbZbAOlXJjEOnzkgSl+7TZNOHPgBDrCASD0tPEK9zfwWz2
 90ZYNH5jllMfqSIxAJmNT1dP15a2Suvv9XB+4R84SpaNv0Y4H16TFZzr+8nQhGPTHKpdjemcu9a
 94cTv2I6XOb2fSWEfPSuNZkwCxUb3cLACUFARNYk=
X-Proofpoint-GUID: 3rYGjWKptIcZUL39EXgBhhMyThFYutG7
X-Proofpoint-ORIG-GUID: 3rYGjWKptIcZUL39EXgBhhMyThFYutG7

On 5/28/26 10:28 AM, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs-brauner tree got conflicts in:
> 
>   kernel/ptrace.c
>   fs/exec.c
>   include/linux/binfmts.h
>   kernel/exec_state.c
> 
> between commits:
> 
>   6b1c66c9cca99 ("exec_state: relocate dumpable information")
>   38205ecbe6b6d ("exec: free the old mm outside the exec locks")
> 
> from the nfsd tree and commits:
> 
>   6b1c66c9cca99 ("exec_state: relocate dumpable information")
>   38205ecbe6b6d ("exec: free the old mm outside the exec locks")
> 
> from the vfs-brauner tree plus some other context from vfs-brauner
> merges.  Specifically this is due to the nfsd tree having a build break
> from the vfs-brauner tree it's based on and being held at an old version
> with it's old version of vfs-brauner while the vfs-brauner tree has been
> updated.  However since the build issue isn't fixed in the version of
> vfs-brauner I have today (I saw a patch on the list though, I guess this
> will be fixed tomorrow?) the below merge isn't actually going to be in
> -next, I'm merging the old version that's shared with nfsd and there's
> no actual conflict in today's tree.
> 
> Are you sure it's a good idea to base the nfsd tree on something
> that's rebasing?
Usually nfsd-next is based on a torvalds -rc tag. This time around,
Christian wanted to take some patches through the vfs tree that I need
for nfsd-7.2. Therefore I need to base nfsd-next on a branch that is a
merge of several vfs. topic branches plus the latest -rc tag.

vfs/vfs.all is the most convenient source of such a merged branch,
but it has proved unstable (yes, I was warned it might be!).

So I can think of a few alternate options:

1. I might create my own merged branch that grabs only the three vfs.
   branches I need. Cons: I've never done this before, I'm not certain
   my tool chain (StGit) supports git merge, and it tangles the merge
   graph even more than it already is.

2. I might drop the items in nfsd-next/testing that need the vfs.
   branches, and rebase nfsd-next on a torvalds -rc tag. Cons: that
   leaves the pre-requisites in vfs.all but they won't get an in-kernel
   consumer until v7.3

3. Maybe the only branch I need is the vfs.directory-delegation branch?
   I might rebase nfsd-next on that. But I still need -rc latest for
   patches in nfsd-testing to apply cleanly to nfsd-next.

Opinions are welcome! I'll start: I really dislike cross-tree
submission; it's a pain for everyone for not very much benefit. :-)


-- 
Chuck Lever
