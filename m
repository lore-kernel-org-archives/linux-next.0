Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A263EBF09
	for <linux-next@vger.kernel.org>; Fri, 23 Jan 2026 18:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191261; cv=none; b=tJ9gOZ+PxP5FTIHofhT2CYnWrgaTiJWfkIEUQUxem9LW/7USQBytxqv9kZNIhLXPaaEY/Sc/sMazMNdUA+4ARSbZRvQ8j0TDNNH2dlehJItEuZJd3zrXlID+aePx9iHF4kfRxPnFcEEdAq3h9ajZ9BmjXFl7IFP88jE34UWSJ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191261; c=relaxed/simple;
	bh=HG8KgjEPaPNnDoUuHfEZrus4aJDzD0BmQZ8Q7j4fWcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iycGBGB7dsP9h8xEHe3HfK5AA9v+kESG2+l9lo4DX0JStprcl1sZJeVMiAN8zgIl887PgXPgtTwOkYM7OwrZi/pe9MsDlKEiP8ShTEO3tRHXJn7U7O0md8Ogir+OEq8RbzhNE5oXmL6fnBEiW8fVNE3eKGnExoLxoY4srDFTWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=CJKeBS7U; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="CJKeBS7U"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45c958d480aso777495b6e.1
        for <linux-next@vger.kernel.org>; Fri, 23 Jan 2026 10:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1769191258; x=1769796058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQaE181ppOlEYSq+SNMh1azWF7TvP0ivnIMtoU6cvx0=;
        b=CJKeBS7UYn3Jy1WpgUiibt/IDf+vLKtMcihjAMV6FpBk747V17PXfWFeOHjuP3/uMr
         LlEI52kysTSJ01BBGb4AvfsCTcU/YHZC31AhgVkeNgcY+DCKgqWrnAT6iGBKAHlzAlND
         mpkeBSy9dDwP6cjTLOkNhTySbBhJXwPXR6HuXxCL+aJK2c4GjAV778ATgEdvbDWy1hlI
         BjiDvf9s9/4AIwzpDQzim4YYF+IeFOWrv37MfdpHBWjF4nmnr4rXQ2eZ1P/m9Bp7EPNi
         OvNc9XC3Ky+F+FfvLwjaat08mMqSUjR2K4g5TuGuXiFL9xZwn8PafbmzSlWWuUG6BxQe
         waJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769191258; x=1769796058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQaE181ppOlEYSq+SNMh1azWF7TvP0ivnIMtoU6cvx0=;
        b=uM2s0znBCByCMxpAug+Cs94XUKv/h5gUgjH4xIJQCWqb1QpKPR8RhmMushiol3cTvB
         4dpH33dLEXY8MICCJ9r1ij/q7yPrac+gbh76PlzDXevfiOrgVKctvJTvFr2uvUXd1htn
         EHEbSN4fpBW5O48Jvxs4xh0U30yMbmMqnFkL5KpmE9gMwjxvWWZG6PBl1LK5KhgFgNn6
         JisKZohiE0QzasQ78TnUMtL5y0imSIsC4+7vEH1DdNhNsJuOl2SteIVRi9Ibuo3IFb8p
         eSG6XqMCqp5I8Nu49sHgwxc7EU0egFEyjDaMKko9c4boI8LPVroSkFvrJCRqyhZXx+VQ
         YPHg==
X-Forwarded-Encrypted: i=1; AJvYcCW4PLTxA/oTfZCn/yRnVjLQfuVTENInBkjMw1slWqs2wh/chjB2WwAqFl+oGbViPCbdub4hgs1dsCZ1@vger.kernel.org
X-Gm-Message-State: AOJu0YyFStLjzfvUNrm7j928r7vTiQpYcPyMg6CHHFJP+WSCQ073mFq1
	xAJh+44bT0GFAJrR9CdJTjRclAdEzUYktJ2LspLS6HnEQ20qbbHcCLDBEdxX77R4KLzKVnMpFRf
	O1IfFSMo=
X-Gm-Gg: AZuq6aLkfnUitQWcAXgIXaWCE4xdqPIBfPRzozJ1Hzp2781qr5D3X3kvluk8zYUdoQk
	jNmEeyM/KVADS2zNAGf6481NG3s4c6G1fdPNuoPfYFxWUpJ3xoOO/xziPZtI+aaPPUS6bx9DZZt
	WFaeIghIPA6uZl10/aCVAO/foCZeHoeWItvIARlf2g+JoIob004JEFORT5BOeuyeXAeoLkv9fcI
	YnvPR858lV8xv8R0mk5MhfHwtIOKm7JSJykmqtFZ1+PTOXtoaxTBnC+ynjOIDwaV1IB+327O71k
	yUdZfdkWaJGiqeMYaL5HnAyppwnqIOYNzJbH+RG4OoK+ojs/DiP9DYXhyTyySkvY+1I9gD7g1PK
	AUAm31JxsjCfs4W/plRwzvJIQ6KZypVk+cAJvZLZXSftKTWURgxqSpm/i4rK862OEDzogQbtsE0
	0kAMJaZs09G+UVhhk1vqrdNajKTmSCz6tzkNjfbBtiYr8PIqiDvwHP8La83nQM0HpD05RZ
X-Received: by 2002:a05:6808:2384:b0:45c:9a6e:1ea1 with SMTP id 5614622812f47-45eb1d52cd7mr1481429b6e.66.1769191257983;
        Fri, 23 Jan 2026 10:00:57 -0800 (PST)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45eb425513asm1501767b6e.17.2026.01.23.10.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 10:00:57 -0800 (PST)
Message-ID: <cb962e32-7d04-44a1-b99c-4d1889ffdbf5@kernel.dk>
Date: Fri, 23 Jan 2026 11:00:55 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aXOzI6sVTBTdJE5j@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aXOzI6sVTBTdJE5j@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/23/26 10:42 AM, Mark Brown wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86 allmodconfig)
> failed like this:
> 
> In file included from /tmp/next/build/include/linux/string.h:386,
>                  from /tmp/next/build/include/linux/bitmap.h:13,
>                  from /tmp/next/build/include/linux/cpumask.h:11,
>                  from /tmp/next/build/arch/x86/include/asm/paravirt.h:21,
>                  from /tmp/next/build/arch/x86/include/asm/cpuid/api.h:57,
>                  from /tmp/next/build/arch/x86/include/asm/processor.h:19,
>                  from /tmp/next/build/include/linux/sched.h:13,
>                  from /tmp/next/build/include/linux/io_uring.h:5,
>                  from /tmp/next/build/io_uring/bpf_filter.c:7:
> In function 'fortify_memset_chk',
>     inlined from 'io_uring_populate_bpf_ctx' at /tmp/next/build/io_uring/bpf_filter.c:33:2:
> /tmp/next/build/include/linux/fortify-string.h:480:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>   480 |                         __write_overflow_field(p_size_field, size);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   f1e3672e49e2c (io_uring: add support for BPF filtering for opcode restrictions)

Huh, that am I missing here? The struct looks as follows:

struct io_uring_bpf_ctx {
	__u64	user_data;
	__u8	opcode;
	__u8	sqe_flags;
	__u8	pad[6];
	union {
		__u64	resv[6];
		struct {
			__u32	family;
			__u32	type;
			__u32	protocol;
		} socket;
		struct {
			__u64	flags;
			__u64	mode;
			__u64	resolve;
		} open;
	};
};

and the offending line is:

memset(bctx->pad, 0, sizeof(bctx->pad) + sizeof(bctx->resv));

which should clear from offset 10 (start of pad) for a total of 6 + 48
bytes, which is 54 bytes. The size of the struct is 64b.

I guess the part it doesn't like is that it thinks we're clearing the
pad field, which would of course be way overwriting it. Guess we can do
something ala:

memset((void *) bctx + offsetof(struct io_uring_bpf_ctx, pad), 0,
	sizeof(bctx->pad) + sizeof(bctx->resv));

to make it happier.

-- 
Jens Axboe
