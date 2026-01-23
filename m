Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9951E32D6
	for <linux-next@vger.kernel.org>; Fri, 23 Jan 2026 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191606; cv=none; b=Guq50AnE6Q8bBSjMZPO6xZpf/83pwFLAHA/Bca0WSt0vsx70dVZtMjD3j9N6aLvsEnPByr4DOy46dUWETeaCK3Y4jRkp33Ychonh/yKsfwch3GdeD9xi5MbzJz62KqGzOSxVPn2PnjuFgfPpWgfl1teccwTBA2opjRz3FxcqnYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191606; c=relaxed/simple;
	bh=2EGgR3GBmBJ+5qQacb7fj+D3wJ3GLkF9thM5uPiZDJM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fKWDJKNLtdKjIlyX9SBvULtPhg9aJl2J46hc37XLDdbCE6YTiOYAmtC0Fh2UBgSQH+fvc2q4OxhdY9FcCYgACO8h8RtO1xcPnodHVZkx3K5uVcTrJTfbe+UZW8tJU0K8K2gXgbSViYdfaWxo9xeWRxvkFwjiV2JAO2WRWTXWBzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=K366xk/v; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="K366xk/v"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4086661715cso2048474fac.2
        for <linux-next@vger.kernel.org>; Fri, 23 Jan 2026 10:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1769191604; x=1769796404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7syuOmgx3tF+hj3ojVc4WkafcJnKBtlCQ4ZjxuK7PJs=;
        b=K366xk/vMwE2+lMmuOID/XGcP5Uc6vbgRcgGRTGMn8dyk1MjGID+iL4912G1SFK8Fa
         d9Aavdk0gAHbGXcPO2a3rXPqQdDs3fFNF37D17d9BJhUtI8Pt6wasySxo3fHryk/BBzs
         3TamS4RI57hEWRwxzgD5SfgqNwIPHnew/5FAelc2xFcXpUNbMKHSTHoJwFFU5xgFNCRA
         M394oEm0VN9ZlMKW4mzRyt9e1tvOyKIN8/65ZKXl3/y59fLVSnMQnKj/Sydic583QzIE
         576bvoxsTFu/Xplr7gbTG2u8aH9/0Ei2u4QrsIvpFv0qa3AiuiXEBQ5djPhF3lxi5RR3
         qj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769191604; x=1769796404;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7syuOmgx3tF+hj3ojVc4WkafcJnKBtlCQ4ZjxuK7PJs=;
        b=WkNKzUBwmPWD2lIa+kx6a2tAl+41bucV/ZJQbXVRN9NK7sAlzPxwQ5YlAXJSNKvq3J
         WfUbzWei8/6iuJ+F9zUmEj2lSOxab+Pawmegumuf/+U66O7cMLdBZjEeCidJkE7RAr0z
         +4gPZ5bd+0G9LyZKdgc3Sj994iTbAhImf6jzc0lQZf07SNpyJGCEbSOBliEK4oo9ulyW
         9qO73zc/levlzO9i6HdCrNEMu6sgH8hAJmrKXu/GqcGMLIsZ+Au0dKYWvYpNgftxSTbf
         81vhTGrK3lQNWAy8AvArh0vQIixJZ4hKcwXBlhSLD04oNOvRyL58hEv9HvtCg8D/776B
         ynkg==
X-Forwarded-Encrypted: i=1; AJvYcCW5gQVMug3BobG8ZjctBfNBTbWux9223YOCBYUoLXOVHWRYR5PbIOa2OZi8C/rjTnFxV50vjN4VX5vD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5dFaia6pLxI18aKHbHkJJOhDMYiYsu4nT5SCY6tP3kFzSe5uW
	vn6ghkaV7A9ACrrQs+GwPg8Yo6ckDAstxG2lnWsuWm0aGFO4DeWKW1vxScaxoTcyEE4=
X-Gm-Gg: AZuq6aLZkI1GmYQga7CkhaX/sux17tG2dO84oU3TbeOHpnUkiLLEWNYtXjDY9YSGFMF
	+HSR5Ce7gZdb8pHJtfp0VXMA6y8nOxZxrDbm2xBbFhgoNsZWZEakpSZUnORhZNrvgGquP87/qWV
	XEkbKia2t6623dm+memSVtWvKD1D9ToLu8ZRGX7I7mplma65jaRTPDP9JDfkxZ3MqX+tWLLAHAD
	34IINwvyT70H8ocC+3JO3kinlsbz17PplBtxkXC5HkShjSulujExTNjgQqtzb6vs5SBKo9KpD3g
	E1+I2BJl+ud6uTSFiqyHdO3z1v3nWGvnJlX36xs+5c6WDmPXLhenxFtNmUzTCQgh4f3ERFFSaSg
	6EOIZn/gyvtxnxY9sgOjauNBZfS8QZD/eDD42XVkOM8PYFtl0q6AafTU7XalfbkPfPAyIypEh/z
	R7QNULD88c9Md4IcqELurX6PGZKAia6aRfVftKWbN3Iz3i0LgWaV1MTWY3Ber6v/NaXb5b
X-Received: by 2002:a05:687c:409e:b0:3ec:4089:f963 with SMTP id 586e51a60fabf-408bdbb08b1mr918837fac.44.1769191604214;
        Fri, 23 Jan 2026 10:06:44 -0800 (PST)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-408af890291sm1885938fac.9.2026.01.23.10.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 10:06:43 -0800 (PST)
Message-ID: <ed061c97-9d4f-41c1-a340-1b1e57985e50@kernel.dk>
Date: Fri, 23 Jan 2026 11:06:43 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
From: Jens Axboe <axboe@kernel.dk>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aXOzI6sVTBTdJE5j@sirena.org.uk>
 <cb962e32-7d04-44a1-b99c-4d1889ffdbf5@kernel.dk>
Content-Language: en-US
In-Reply-To: <cb962e32-7d04-44a1-b99c-4d1889ffdbf5@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/23/26 11:00 AM, Jens Axboe wrote:
> On 1/23/26 10:42 AM, Mark Brown wrote:
>> Hi all,
>>
>> After merging the block tree, today's linux-next build (x86 allmodconfig)
>> failed like this:
>>
>> In file included from /tmp/next/build/include/linux/string.h:386,
>>                  from /tmp/next/build/include/linux/bitmap.h:13,
>>                  from /tmp/next/build/include/linux/cpumask.h:11,
>>                  from /tmp/next/build/arch/x86/include/asm/paravirt.h:21,
>>                  from /tmp/next/build/arch/x86/include/asm/cpuid/api.h:57,
>>                  from /tmp/next/build/arch/x86/include/asm/processor.h:19,
>>                  from /tmp/next/build/include/linux/sched.h:13,
>>                  from /tmp/next/build/include/linux/io_uring.h:5,
>>                  from /tmp/next/build/io_uring/bpf_filter.c:7:
>> In function 'fortify_memset_chk',
>>     inlined from 'io_uring_populate_bpf_ctx' at /tmp/next/build/io_uring/bpf_filter.c:33:2:
>> /tmp/next/build/include/linux/fortify-string.h:480:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>>   480 |                         __write_overflow_field(p_size_field, size);
>>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
>> Caused by commit
>>
>>   f1e3672e49e2c (io_uring: add support for BPF filtering for opcode restrictions)
> 
> Huh, that am I missing here? The struct looks as follows:
> 
> struct io_uring_bpf_ctx {
> 	__u64	user_data;
> 	__u8	opcode;
> 	__u8	sqe_flags;
> 	__u8	pad[6];
> 	union {
> 		__u64	resv[6];
> 		struct {
> 			__u32	family;
> 			__u32	type;
> 			__u32	protocol;
> 		} socket;
> 		struct {
> 			__u64	flags;
> 			__u64	mode;
> 			__u64	resolve;
> 		} open;
> 	};
> };
> 
> and the offending line is:
> 
> memset(bctx->pad, 0, sizeof(bctx->pad) + sizeof(bctx->resv));
> 
> which should clear from offset 10 (start of pad) for a total of 6 + 48
> bytes, which is 54 bytes. The size of the struct is 64b.
> 
> I guess the part it doesn't like is that it thinks we're clearing the
> pad field, which would of course be way overwriting it. Guess we can do
> something ala:
> 
> memset((void *) bctx + offsetof(struct io_uring_bpf_ctx, pad), 0,
> 	sizeof(bctx->pad) + sizeof(bctx->resv));
> 
> to make it happier.

Folded that in and pushed it out, should be happy for you now. I wonder
if we have a helper for that...

-- 
Jens Axboe

