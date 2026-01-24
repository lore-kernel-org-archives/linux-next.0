Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651A821C9F9
	for <linux-next@vger.kernel.org>; Sat, 24 Jan 2026 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769266827; cv=none; b=tvdKFdQhqfcOCy/xsf0Zi/KVBBYxQKwNKNQu9mCe8Cuo1B//LDOYXmNFzJowi76vmPN01Zmet9cBwXEw/C6HxVYjEP76Jx2VSeKvw76N74RktqdUuRaA7opgwFEl/2rC1UB1eFfA6dEMcMfMs57bEj/IjMEoduKnC9IVVG0beD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769266827; c=relaxed/simple;
	bh=6HrUoe1kZh/iI+guNdW5pOruzGgoM4/QRAGeumTZ9wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Llzjd6koY1rLCY6HkdNXngiEi9Y9ViJA2oCmnKDYdAVekcHHdiG7iMQs5tTufmzsydVmMTtdEcT5F84ltGS9cxD7VluDXW9P0qyAeXNSvLNYkzWeC4L5qJ93BUI20QpfKziOt36fwIheAWsBWCNp09kknBNyFHIusdryjFNT91U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=dirwl1mJ; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="dirwl1mJ"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4042fe53946so1013464fac.3
        for <linux-next@vger.kernel.org>; Sat, 24 Jan 2026 07:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1769266824; x=1769871624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KPQY7I+g/cUTl6X/qpTV4vJTMxd/5TTcOzc9jOcFEvM=;
        b=dirwl1mJIc3w1Y3WNlbHi4ZkPxnZMHns+OPbZzK/FD2pu1crBFb6GKnICGDWoYhsHV
         qj/ay6fB6w4sGwX1g8O7b3JCRwTTohDJEpkvzrHuaiVblTX0DSlvkCF12FcZo6XTsaux
         l15vSrEYdArtnqE8y30/a4EjtUqKE4JWwti91mHkveU4VdO/xv2BWK/SbxgR/Q573/o6
         Sh4cNZK9otrGYSK6vOZScNvPm/uIt/jlRnBy0fVGDSlTxibghRB1P9ibGtmw/waYAJtE
         VoLlat5keLip/wVZNRPL0hS5U26zEBdTDYOHajAzuUAuQGBCY7rPPw/HKEP0L/gFbSsH
         qDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769266824; x=1769871624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPQY7I+g/cUTl6X/qpTV4vJTMxd/5TTcOzc9jOcFEvM=;
        b=dLC+BWPbEpfSk3HCZHnYXyGw3AsiNZ7IvBAIpsXtAIz0zSYVIE3n6Cx04O8u0Zpaet
         jKMfVSz8CNiAxG+8U+7/sin5zzTstI1mE+qOi6hZeCU0Xrgaut7cZm1MISt+p26XIjtz
         bGghXf9S5tCAlHKEvIEevoipQUMqJ5Bwuqk7W7xKeUXFbzCXzEN1WC+Oa5LHLO2xHmQ5
         81GPHmdri23batipYxxrnXerFhj3LpEl4WCy8/HUdAJvID0W7euC6SWbcjBmzW/UAVIc
         7HUTHU/PwZCvleaaO/ClSJM/8HRyzY+3L8UmoTHjIKx12hMaP+1hO1Cxx9Y8qhVc+GhS
         wT5A==
X-Forwarded-Encrypted: i=1; AJvYcCV0yt3EJnRFhlFSc+J7JhF0UoRavPvvWcSuDltnYTpA4iudObT4+yeLk+lFzqWp5Y4sdq+cfZyG7JXD@vger.kernel.org
X-Gm-Message-State: AOJu0YykqcHblRz/XkDfU8pPmWc4T/ST0DmC1oen/rcEu3K0YEcrUape
	RCKF4Z5XydHv+bzd8F4+XjxZzPqZySKcAHaBnj1bYiaxvQOKv+5YVKz0wsd1jXemqHI=
X-Gm-Gg: AZuq6aLynrw1iqD5SbCN4iBm1W/6q87pIuDe80xCgp3NlBPko77eoiPon7Y5wKJfofW
	crdtIDV3QMTJrRNUpoa/1789wsSaLcZNh2L2Rq0zDicaUZcCMLyv6hoAlYU0qKwiIcGrU5CcjpJ
	ztfLyoz2WdUUjIGcuw9oKdy7rtVBWx/sIsYBcvLTdhOr8sVCM5RCx7YMk2RMuVX6o3umRZESlM0
	RbHexTR005/rKtyotvQkE+jTuvLgiipnvE9LejRMSC0EXlDCEOdZl89vAPPGkUt00R3txx4wLhj
	Rjnahs0Tw1Beudb8uK+uEMas9mV0WaKdCjTGOg1Nv+GCxHUGRMcxTXNzCvYKQLkMWNSyVL5z+/X
	LQ9+dXm8HdsHaqMc3urPT54FkcDF7S3l/IfOPh2nsvKsM/PZQbDGCCEkbYKMxiNzlWvRi37TarJ
	KeMtzoViGuITDRMwItaR2VGK+v0eAHG2V2SXKAWUFrLIJJ+X6l0pNZtC81U4DUTk88uJFVDw==
X-Received: by 2002:a05:6871:5225:b0:404:3805:1dde with SMTP id 586e51a60fabf-408ab3b3b5cmr3355162fac.8.1769266823625;
        Sat, 24 Jan 2026 07:00:23 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-408af88d1c2sm3749680fac.8.2026.01.24.07.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 07:00:22 -0800 (PST)
Message-ID: <5e31c5fc-15e5-4ef1-944e-b4ba097829ed@kernel.dk>
Date: Sat, 24 Jan 2026 08:00:21 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aXOzI6sVTBTdJE5j@sirena.org.uk>
 <cb962e32-7d04-44a1-b99c-4d1889ffdbf5@kernel.dk>
 <ed061c97-9d4f-41c1-a340-1b1e57985e50@kernel.dk>
 <20260124114635.10bff99f@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260124114635.10bff99f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/24/26 4:46 AM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Fri, 23 Jan 2026 11:06:43 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 1/23/26 11:00 AM, Jens Axboe wrote:
>>> On 1/23/26 10:42 AM, Mark Brown wrote:  
>>>> Hi all,
>>>>
>>>> After merging the block tree, today's linux-next build (x86 allmodconfig)
>>>> failed like this:
>>>>
>>>> In file included from /tmp/next/build/include/linux/string.h:386,
>>>>                  from /tmp/next/build/include/linux/bitmap.h:13,
>>>>                  from /tmp/next/build/include/linux/cpumask.h:11,
>>>>                  from /tmp/next/build/arch/x86/include/asm/paravirt.h:21,
>>>>                  from /tmp/next/build/arch/x86/include/asm/cpuid/api.h:57,
>>>>                  from /tmp/next/build/arch/x86/include/asm/processor.h:19,
>>>>                  from /tmp/next/build/include/linux/sched.h:13,
>>>>                  from /tmp/next/build/include/linux/io_uring.h:5,
>>>>                  from /tmp/next/build/io_uring/bpf_filter.c:7:
>>>> In function 'fortify_memset_chk',
>>>>     inlined from 'io_uring_populate_bpf_ctx' at /tmp/next/build/io_uring/bpf_filter.c:33:2:
>>>> /tmp/next/build/include/linux/fortify-string.h:480:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>>>>   480 |                         __write_overflow_field(p_size_field, size);
>>>>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> cc1: all warnings being treated as errors
>>>>
>>>> Caused by commit
>>>>
>>>>   f1e3672e49e2c (io_uring: add support for BPF filtering for opcode restrictions)  
>>>
>>> Huh, that am I missing here? The struct looks as follows:
>>>
>>> struct io_uring_bpf_ctx {
>>> 	__u64	user_data;
>>> 	__u8	opcode;
>>> 	__u8	sqe_flags;
>>> 	__u8	pad[6];
>>> 	union {
>>> 		__u64	resv[6];
>>> 		struct {
>>> 			__u32	family;
>>> 			__u32	type;
>>> 			__u32	protocol;
>>> 		} socket;
>>> 		struct {
>>> 			__u64	flags;
>>> 			__u64	mode;
>>> 			__u64	resolve;
>>> 		} open;
>>> 	};
>>> };
>>>
>>> and the offending line is:
>>>
>>> memset(bctx->pad, 0, sizeof(bctx->pad) + sizeof(bctx->resv));
>>>
>>> which should clear from offset 10 (start of pad) for a total of 6 + 48
>>> bytes, which is 54 bytes. The size of the struct is 64b.
>>>
>>> I guess the part it doesn't like is that it thinks we're clearing the
>>> pad field, which would of course be way overwriting it. Guess we can do
>>> something ala:
>>>
>>> memset((void *) bctx + offsetof(struct io_uring_bpf_ctx, pad), 0,
>>> 	sizeof(bctx->pad) + sizeof(bctx->resv));
>>>
>>> to make it happier.  
>>
>> Folded that in and pushed it out, should be happy for you now. I wonder
>> if we have a helper for that...
> 
> The origin warning did suggest using struct_group().

Right, and I do use that in io_uring in other spots already, but it's
pretty ugly for user facing structs. Both because they are harder to
read, and because it's bleeding internal detail into userspace. So don't
really like that for this use case.

-- 
Jens Axboe
