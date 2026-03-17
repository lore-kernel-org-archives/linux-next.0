Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022137.outbound.protection.outlook.com [40.107.193.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5493EAC99;
	Tue, 17 Mar 2026 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760017; cv=fail; b=bdlnMggQT2ziMVFrMJENee9fWmrn5lSzsti9v9okhy2LzG8vPOS157NXCfVP+zzVSyXNa1zxBmTgEmWm3hTgXKm8j/Wnv9+gSY/K3IS2ugCAbAT6YyUpFRKIZiRmxr7tsRmWN/vc36K5UgcSs9pUzypQui5L5IsLPwCZ0FzSmvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760017; c=relaxed/simple;
	bh=ioFYvSsBfhyPULR84NChfFoAVCnSOZfVBM18Yb9OHlI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e5O5iH+ie3TKjfsddPhoClMxADMmJWgWmzwrF9AQIgRh9j+asXbxAmfYZiWCTfF8RaAHTYJUEAFg9UcDfGQucPUKFKxxlbNNntAafh0nfSVBxNKSr541QR5r1sNanGQ/U3SwYSJFntwey54wY/cj/abP4Y+VSYkQIkLzQV77WM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=oGyg0hYS; arc=fail smtp.client-ip=40.107.193.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="oGyg0hYS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5mbrds6fbCS5PIsDxUQ+080JPj7TizAI+oxQaDfeWDcvEgJZ+KWqY2Uuqj8T/0amSP8WT6PspceBpC76QiEpL7l8LN54KbfoeuoqbXJICe6aw4C+IcV5wOTnwoEa8EfbU/v2SSoeb8Z4WvxQct+hMWzeqyblVwlw73hvrbSPzCi212LGk7L98R1vklVoBnKEL4+DNpDy6adSxVEMMaYN1gPKd/78b2SjXRdeSz2fP0WdyxWNYxOSLYsdrDeZ0NAmzP+kiU5YYgx3IRFSC6bAicduUQKS3auVubKIMV3ec/Bb/5Kc55ZnsMld9iRKm7gk21ovhZf0Ap9rPPQy7TGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwKGE87VBjEQCzCtCpZO1jSo4XeiDfEWa2c/l/b7snk=;
 b=kl/jgNHlCI10a7AnLBrkCtSb1WvhzK1thY/2rYydugAmfh9/0KPzW+CdBUNCa0PUSq3CFW1EdO+FqVcoLJym5pXyTgIWkrfNqIofXnBbNDg22Suqv88Hl/1iIg9MjOMjGxCdqoIxtKQ19wvWlUPlFYQoqfEP71KzXzHWQOTe0+x9ZT1X0vDiPCg0NzOxIRUjwYmQfOXhf3Rn/e5bCb3/MKMSkdQTNASRKVf94BtRJ+OzePgFnAmF60kphdFbauFcjfDtgKE8EThnEvMTFBxwAZ+f/5bepOu0AUWV9zIoDs8Z+Gy9m4z4Oa0zZ/PQIRBQOlHgKEI3+NV2nyvZR8TiKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwKGE87VBjEQCzCtCpZO1jSo4XeiDfEWa2c/l/b7snk=;
 b=oGyg0hYSuaC1eKslIbdYXJyJ7ZN4bZ0EJhMUA+wUNS/h2Zer1uMPR66RYAVqZR/ycC4e+0tMJjFiF0KgGlbQmAq0JOeTBx1d5ya8OFE5BNpkX61/+OL25ef0f9gsOdR4424Q29jDZ8tOQUbBpN38G2phCCUpkpucxBhsUyjxY9M0hHZm3NrAM7mElDUYqwadk/Cz4qJLfTlevNEZldYHxvpKB93KXu0jlmXsMDOt6vNDlAR0MdVLVHDnI3bIZCxXOtWRpfbHmJtFpEafAn0nMoqzwk/PElJPntYZzi+AgxXq/YKDWHhPHWWOYUcoPPLVx9PU/o20fmlWpIDSz8h0SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT2PR01MB11450.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:163::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 15:06:53 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%3]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 15:06:50 +0000
Message-ID: <412389f8-7d8f-414c-91f0-e748f370ad04@efficios.com>
Date: Tue, 17 Mar 2026 11:06:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
To: Mark Brown <broonie@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Carlier <devnexen@gmail.com>,
 Josh Law <objecting@objecting.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ablmE1TqDmIYHiBH@sirena.org.uk>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <ablmE1TqDmIYHiBH@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::24) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT2PR01MB11450:EE_
X-MS-Office365-Filtering-Correlation-Id: 8957d916-320e-4811-396d-08de8436d135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hQeay6BbwAKf7MKlvICUk90qM7qWIzFMENv8P2G73WRjNhvP7vCSMlciywTIzawHKivnez5t7DTsBHYhV0OMAkoHQ4hVDcPDswVSGFfouY1zd2f5A1diQv0TZ4A6zJJWeIPAfwUFRECcftfIY9TeJ/TRCRum9ygn4IDMGuRxuzR+TxgPz/rfw24m6rBzOhBlXJiW+Y/O8QFohq6VYr81UkHCrkrku4oQ1bAWIIIA/d5JPuDwMVNYPUUutbBhe8du4KnqNn5jpQqNmq0RFlh0LQDuxsYYBmVcvaPUy1CgnRxZhl1Z51Aeol9zOdXozoUNXMh1texvhkaRG3j6T0tUfAopRtUIpMBvqwvcFmg2tmhi4MrUvCNHCGmsKpXnq2Wrjq5YmZIDQaS80ktfZmWBKyT3vFp4UFyKC7SUa7VMYEW4PM4B3Kftv/LbFBSSacbbFCoh1jozwl8cUUXAvhG9ZdMQo6ieTMcVhN/1tfzzN3BqIsw2i8eHy/J6iuYpVNjUkkwUUsdATzI/NgQ/tZZ6/1puNam6isiBfA8JwgNLvTQGXk/M46KjyqGoQ7Bnv0qeI7Pl2x2UH43IAOhbYhmw299/aNoh6eRCldEQ3/qEZlhVPR+3Ne6o9LZWYEG+nUwh8o5qH1+WEqfeAhBRIJqWTS5osQPItsSlJYK1PPQWQaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RCtrbHJCZGVLWGhMUHAzZ1FtdDJEU0poaFl3bmpZRGVkdkMzaVZKRU0xZ082?=
 =?utf-8?B?Z05wZHZJbndRMmlDSlc2aEdqakw1dTcxWFhZZlpaTWtWTDV6TjV2WWxqVUE1?=
 =?utf-8?B?YlY1ZlFXcVFTbklUR2Npb21obGV5b3dabDBTbjdtekNLRHJITWJkdC9mbXEr?=
 =?utf-8?B?TnQ0M3NseG9DWndVdTVuTm50dnEyM0NMR252Y045UlkxMG5jOVJXZWpvNXNH?=
 =?utf-8?B?aUxIMm1UWjhFYlduZVhseUtUNUMwYngxV1NHcTVJMTFKSDJ4YktzTVJLbXh0?=
 =?utf-8?B?N1Y4TEY1WFNRVEZHOEdmdVhvdWNneUFSbnhnMm5HZEN0Uy9JNFZPcVhWb043?=
 =?utf-8?B?QVVMYWwwN2o3aTJqUnRTWEdDZmQzRk9peHNKdzhnNG9scnh5dy9YWFVBeEhS?=
 =?utf-8?B?VXI4ejdBNjkyMENuZ0JOcW11L284QXg4dFppWGNkR3pVb3F3Q3VpYzFsUGQ5?=
 =?utf-8?B?S2Ewb2pRRm82WFk2T1ptMXRlNFRyelVJRlkrek5Ga3o2R05majd6NU1pczYw?=
 =?utf-8?B?YTR2UHltNW5TOFlvVWhRb01WRDZpVnR1N3BkM0pVK3N2THJtTmZWM0grOHc3?=
 =?utf-8?B?VXBKT000VmFzVFArWDNlOFFNOWZSQkJZVXBNK2lmZkQ4MUowQUUwSTd5QnpK?=
 =?utf-8?B?R21VbVNBYmF5eGdHOUhtMW1PQlovQUlLTEUrOTRnVkgyOUt5cjhWRjJrVS83?=
 =?utf-8?B?Q1VMOFViTTJxWDNaaDJXWDRjcDRqV25JSDhTSTZ4NXRpQWNSTGdwd2JCYjRt?=
 =?utf-8?B?Y28xTzkxQWI5SDFXczJFbENCNjh1dEV4RC8zdUpDS3dhWjJUZWpERFJFREdx?=
 =?utf-8?B?T2pqRmE0S0ZSamEvd3E4Q0dKUUoxK3ZCY1RQU251ZHhOVWZVdktsMWRSL3p0?=
 =?utf-8?B?eUpsdHRhbUNzUjdkTjJTYlQ5YWZaeXUyelh1NnZRUjViZExBV2FMbGs4d3Ay?=
 =?utf-8?B?WTRDTzk2RmVmcC9vVXJOVVFmek8yQktadEJZWEtSR3M5K0hKeEZVQkN1Zjlt?=
 =?utf-8?B?MHQzbmdDV09vNU1IWnNtcG1HRGpCemduVXFKcjl1clN0T0xpTHdHRDRVeHNP?=
 =?utf-8?B?T3FndE8xcmZQWWx1L3dyUXF0b3F3NGQ5UVc1NEFoeFpPazdMY1Z2OVhNQWNN?=
 =?utf-8?B?NHJHa25TRGxIbUtKZEdzVkoybTQrUThxRmM3dHNJcjRpaktaU3JKY3FLd1Ew?=
 =?utf-8?B?QzdQTVdjSEpVOElhMVRpYlFKZVIzcEpxMkxTcXBHekhPTE9RcysxWHJEMjlt?=
 =?utf-8?B?REhSOFNjMG1Xc09UTlZGdGhiWTBiSVVYb3orbFp1WUI4blorOWRlN2lVSVhQ?=
 =?utf-8?B?eTM3WVhMWmNZeVVadlBQdmRJUHA2dDlpeTlmZjJlbWJZek01MitEVjNkdWgr?=
 =?utf-8?B?cDNQMGdkN01uOHFKVDZFNkMzUkpmUXRtSXc4cGcvZysrQ0RJZWh3SHJNbmFS?=
 =?utf-8?B?bHVDd1JGeWRlT3dFUjZROXRSQmx2SlpsMitidmR0WjIrVloyRzV3dXplSGxH?=
 =?utf-8?B?WVJLZXlyKzgyOUMxcFNCZy9ZajhvWloyQ0FHTWM4NksveXpsNU5NOUZhK1ZT?=
 =?utf-8?B?YmgyZWpDbTJySXV6aUlYNUpDeXlFUVFQMHVYNDBCTktjNWpOMGdYVlRUbUdS?=
 =?utf-8?B?b1ZKZTlEQXN1eTRVeEpZQkdOUlZUYUdLUERZdFJwNGRCUERNRkJYQWpkYjNQ?=
 =?utf-8?B?U3lFS21qcGdmNjhWcTNuaytCRkl1dDl0ZUhzMXhQYnhWU3cyakpHejBscGND?=
 =?utf-8?B?Z3pJRjhmaTM2Z3J6eVpnRXlTSU1FUStxWTQ4RlRyNDJJYUF3SmlPSEYyQVha?=
 =?utf-8?B?QUIxVDV5cTBSUVloKzM1UVBNR1IzL1E5Q200TGZaRmMyL05GOVgzOFJuT2Jj?=
 =?utf-8?B?N0oxOHdsMHptOHQ1eGI0YTgwVjJvSGtYN2poWW4vV2JGUE9xK2N2bGcvVjhI?=
 =?utf-8?B?RUs0Zmp2czFDU2haNTF5N3JLRG52ZlJjN21yL243czRIVzIwRG1FcnVBMStn?=
 =?utf-8?B?L25SUm56bTY1MExZdTh1QkFpdVVYYU9iR0JkcUFHc2phTDQrbGlTYlZ3dmlu?=
 =?utf-8?B?TktTeFpvNjlXWTk0ZnprZ2VDTHduL2NWQjh2VjU1cnBzMllvaXBSdFg1RmRN?=
 =?utf-8?B?emNVQ04rcGxhN0xPSmtIK01WSnZkS0JhVjBkOW9kTCt3QkdCdUlkUW9yVjd1?=
 =?utf-8?B?ZE5GT3R6Tmo1cGxrbjdUaVBERUJ1d0NWc0owek9QZ2RsZ2Q4NlZpeUJ0ZGRp?=
 =?utf-8?B?RUJ1U0xEcTNqa3ZhTXJzdFh0cEdjeHZsZ3AxRWlhV3F3bkQrMlovR1BRblYy?=
 =?utf-8?B?Z2dJdkdzbUhPSXhWZmYrdUlvb1M1VVFHQ2w2OWxZeGZkM2NVcTZoOWZtTERN?=
 =?utf-8?Q?4oBqtkjjcWiA5wGoZALcIoRF1Wcx4XXji8KXQ?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8957d916-320e-4811-396d-08de8436d135
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:06:50.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJS/0y5L4SzaDAiGr9bsLERSX1OLznT9uWGvhXn1kfqsihfTtiSbI0Ajnz34LV9SwqWL3QkTirjM4qz2+yGBm7Q5JV8HXBBsm28Xl3VyRLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB11450

On 2026-03-17 10:32, Mark Brown wrote:
> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build (arm64
> kunit) failed like this:
> 
> [13:30:42] # hpcc_test_compare_value_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:157
> [13:30:42] Expected 1 == percpu_counter_tree_precise_compare_value(&pct, (long)under), but
> [13:30:42]     percpu_counter_tree_precise_compare_value(&pct, (long)under) == 0 (0x0)
> [13:30:42] # hpcc_test_compare_value_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:160
> [13:30:42] Expected -1 == percpu_counter_tree_precise_compare_value(&pct, -(long)over), but
> [13:30:42]     percpu_counter_tree_precise_compare_value(&pct, -(long)over) == 0 (0x0)
> [13:30:42] [FAILED] hpcc_test_compare_value_boundaries
> [13:30:42] # hpcc_test_compare_counter_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:246
> [13:30:42] Expected 1 == percpu_counter_tree_precise_compare(&pct[0], &pct[1]), but
> [13:30:42]     percpu_counter_tree_precise_compare(&pct[0], &pct[1]) == 0 (0x0)
> [13:30:42] # hpcc_test_compare_counter_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:251
> [13:30:42] Expected -1 == percpu_counter_tree_precise_compare(&pct[0], &pct[1]), but
> [13:30:42]     percpu_counter_tree_precise_compare(&pct[0], &pct[1]) == 0 (0x0)
> [13:30:42] [FAILED] hpcc_test_compare_counter_boundaries
> [13:30:42] [PASSED] hpcc_test_init_one
> [13:30:42] [PASSED] hpcc_test_set
> [13:30:42]     # module: percpu_counter_tree_kunit
> [13:30:42] # percpu_counter_tree: pass:8 fail:2 skip:0 total:10
> 
> ...
> 
> [13:30:47] Testing complete. Ran 9088 tests: passed: 9015, failed: 2, skipped: 71
> [13:30:47] Failures: percpu_counter_tree.hpcc_test_compare_value_boundaries, percpu_counter_tree.hpcc_test_compare_counter_boundaries
> 
> Triggered by commit
> 
>    ebc1ff504f557 (lib: add kunit boundary tests for percpu_counter_tree comparisons)
> 
> though as it's a newly added test it's obviously entirely plausible that
> it's flagging an existing bug.  I used the tree from next-20260316
> instead.

I've been able to reproduce with 1 cpu:

branch: mm-unstable
commit dffde584d805 ("zram: propagate read_from_bdev_async() errors")

cat .kunit/.kunitconfig
CONFIG_KUNIT=y
CONFIG_SMP=y
CONFIG_PREEMPT=y
CONFIG_NR_CPUS=32
CONFIG_HOTPLUG_CPU=y
CONFIG_PERCPU_COUNTER_TREE_TEST=y

/tools/testing/kunit/kunit.py run --arch=x86_64 --qemu_args="-smp 1"

[10:48:04] Configuring KUnit Kernel ...
[10:48:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=x86_64 O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=x86_64 O=.kunit --jobs=384
[10:48:07] Starting KUnit Kernel (1/1)...
[10:48:07] ============================================================
Running tests with:
$ qemu-system-x86_64 -nodefaults -m 1024 -kernel .kunit/arch/x86/boot/bzImage -append 'kunit.enable=1 console=ttyS0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -bios qboot.rom -smp 1
[10:48:08] ============ percpu_counter_tree (10 subtests) =============
[10:48:08] [PASSED] hpcc_print_info
[10:48:15] [PASSED] hpcc_test_single_thread_first
[10:48:19] [PASSED] hpcc_test_single_thread_first_random
[10:48:19] [PASSED] hpcc_test_single_thread_random
[10:48:34] [PASSED] hpcc_test_multi_thread_batch_increment
[10:48:34] [PASSED] hpcc_test_multi_thread_random_walk
[10:48:34] # hpcc_test_compare_value_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:157
[10:48:34] Expected 1 == percpu_counter_tree_precise_compare_value(&pct, (long)under), but
[10:48:34]     percpu_counter_tree_precise_compare_value(&pct, (long)under) == 0 (0x0)
[10:48:34] # hpcc_test_compare_value_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:160
[10:48:34] Expected -1 == percpu_counter_tree_precise_compare_value(&pct, -(long)over), but
[10:48:34]     percpu_counter_tree_precise_compare_value(&pct, -(long)over) == 0 (0x0)
[10:48:34] [FAILED] hpcc_test_compare_value_boundaries
[10:48:34] # hpcc_test_compare_counter_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:246
[10:48:34] Expected 1 == percpu_counter_tree_precise_compare(&pct[0], &pct[1]), but
[10:48:34]     percpu_counter_tree_precise_compare(&pct[0], &pct[1]) == 0 (0x0)
[10:48:34] # hpcc_test_compare_counter_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:251
[10:48:34] Expected -1 == percpu_counter_tree_precise_compare(&pct[0], &pct[1]), but
[10:48:34]     percpu_counter_tree_precise_compare(&pct[0], &pct[1]) == 0 (0x0)
[10:48:34] [FAILED] hpcc_test_compare_counter_boundaries
[10:48:34] [PASSED] hpcc_test_init_one
[10:48:34] [PASSED] hpcc_test_set
[10:48:34]     # module: percpu_counter_tree_kunit
[10:48:34] # percpu_counter_tree: pass:8 fail:2 skip:0 total:10
[10:48:34] # Totals: pass:8 fail:2 skip:0 total:10
[10:48:34] =============== [FAILED] percpu_counter_tree ===============
[10:48:34] ============================================================
[10:48:34] Testing complete. Ran 10 tests: passed: 8, failed: 2
[10:48:34] Elapsed time: 30.726s total, 0.001s configuring, 3.074s building, 27.600s running

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
