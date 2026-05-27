Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0C5175A67
	for <linux-next@vger.kernel.org>; Wed, 27 May 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892761; cv=none; b=RHRjAAMp7VPpgDpEQAX6B+Fypte47qQeyeZUMXy1w4Q5flz23MA5KKp5Ttq0NC/kEmlffN0Lg0b7Chldb0rAkbK8LhDAD9akXos1AquEJIdZxNR+UMXgqpEPywOlaaqoahOrswoHEEwCrcQ9r6EHF3NuivX3YbVSk6qtHohd5qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892761; c=relaxed/simple;
	bh=iNNuF3NFB+bDro+iXGS0Xw2qo7pYutUvcJ3gRzDJeLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4U6dLNIxhXWF7HnOFhr2+hhILmvs6q2ftBqwqQy9vdqhw3sU4IM4zgWOwV7IvbQrekejVr2B3AU6GR+EDI4URB8zstxQe+boPkuaPrvWtYOjw3wkaaovsnMic2IOuchSQR2w8ui5aLDG855ZLKbG+aLuTy0fGpY/Vn3XpHAzxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=TNPRzYvh; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="TNPRzYvh"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-43bfe055ffbso1360979fac.1
        for <linux-next@vger.kernel.org>; Wed, 27 May 2026 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1779892758; x=1780497558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRJ9q98QXLZCyuVnKUhn9nMR1KutQ1mTTMcfu5SCdhE=;
        b=TNPRzYvhPJJCXYG/909pyqFAGCRj9PSu2mRARLI7BNJYoXn39xZ36JxCZutMf24ifi
         +Puvwrs28J6Wjf5qJMfXLpgJwfc1mkDChY7NGoNvQ/rKDHRbLVUqDonr5w4j83eUWyce
         E+J4ikdji/zli1CQ/UmdqPSVmoakj1/B1KrYyGQOV19xvrqc1pRs3T3SSYghm7V2GVAe
         r4pCxBYVsDHeIrsLzzVHbuSt7NVSSNdIWiWwJ34j8khp9xLrwHcFZPfJr+djgCD9nhFd
         PPEfJUjGLynGyITlwHFZIXlqkFuO89VvhX8g6+qSk75aBF7aMZ5/ssB/IKUOwiMaKrT5
         1bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892758; x=1780497558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRJ9q98QXLZCyuVnKUhn9nMR1KutQ1mTTMcfu5SCdhE=;
        b=Uz0NyvTDkcxkoCamSrlEeRv54oCuvEDl5bf8aCXGOWf1fEQ97maltVa1vTFRteZ1zF
         wiU0yQycKDpYfFpDYG2OWZ7Wo9vUg+QSPZtaqs51QGV4E7bXonL47tYEy2flW+4OWoDT
         A8Xm7hwMwIzlG3Lki7IG77y3w0oXgs0k5M1FYi9jZZTyNNzkeCUwzHfQ7M1YS21ii33h
         W+Gz3BJimIgh/qjXsudEXrJB62wqMvrP6gMdA6S812vCIx1ANmzm+EnxhQAsbs4g6ymL
         M8UzSAbXcvqmr7GpEIbzt4UVBefVsgBaXIhrwtAOUNQbGfm4MqRHIENK2aqlOgqBVgHR
         r18Q==
X-Forwarded-Encrypted: i=1; AFNElJ8rsXBBY9vDXc/IAd/5acPHaTGHgLzPEoBE2MIoyB+mm2eSKe85c/XSIo+t88QHdCE0QZFgU2b6lmip@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ZTrdDtkTykgtuglb3UJ+o9qtaC/5Hm6e1kvQGzik3R55m2Bv
	sxlgyU02UXrANdn5w40HIxjetQd6bcK9wa0e5E51goXVTWRPvSf2H/bpnB79Z3Zz+KQ=
X-Gm-Gg: Acq92OFFQbQcbbIXeagQepRAd/SWxhtKfVkf3z2j1Yq8eeMSEGZsoGGE7ljWbx+MJbM
	RAC9QMbZCSgbG0Q3Tbs/JWK0gFfR07mnFvAnxZzd68mCaK3T1Rpe6z+ccHWV7t7+3iZtZ+mAR6s
	Xen3AziAyeNCtmuB3uon8wxeweHo0TkLsPfd2Q/1w/RrhLcQa/Lm0J5UR5taH+bZO52KDQ+q11K
	wvaln9idx0gnFq4JJxG2ZsunhYCAHd4fdVTBhys59B3JLqUFnM+Fvew8dYGTCPtxkIKcip17Lsc
	WK+hx4p4Hk9FaCCQGFNozlS02PI5Xk4YBBBoy0PwtRHWJqhyaykND1NwNXo5r62SCZDKM3WrDeZ
	Qj7O7PzJRzeUoxcRaL6RLYeHRzztU8P5jfSjYcPVh0BFSfYQ44NejqFNp2x0Lw3hSN5b6sWqN0G
	rquokNOaOhdExfZNZhoD002jY1qIEkmE8+M/CTKEv7DVXDAqZb9JhqvAf1JQYiSEqydnhy2H/xC
	WJEl8fe1W7pjl5D/0Y=
X-Received: by 2002:a05:6870:8186:b0:43b:8eba:7da3 with SMTP id 586e51a60fabf-43b8ebac653mr11314004fac.4.1779892757998;
        Wed, 27 May 2026 07:39:17 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b635d1551sm16738730fac.5.2026.05.27.07.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 07:39:17 -0700 (PDT)
Message-ID: <a9f231c8-f48a-4743-97f7-6ce7f545b400@kernel.dk>
Date: Wed, 27 May 2026 08:39:16 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ahb8y-KE12lOUIVz@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ahb8y-KE12lOUIVz@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/27/26 8:16 AM, Mark Brown wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (arm64 kunit)
> failed like this:
> 
> ERROR:root:error[E0308]: mismatched types
>    --> /tmp/next/build/rust/kernel/block/mq/operations.rs:274:28
>     |
> 274 | init_request: Some(Self::init_request_callback),
>     |                       ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn
>     |                       pointer, found fn item | arguments to this
>     |                       enum variant are incorrect
>     |
>     = note: expected fn pointer `unsafe extern "C" fn(_, _, _, i32) -> _`
>                   found fn item `unsafe extern "C" fn(_, _, _, u32) -> _ {OperationsVTable::<T>::init_request_callback}`
> help: the type constructed contains `unsafe extern "C"
> fn(*mut blk_mq_tag_set, *mut bindings::request, u32, u32) -> i32
> {OperationsVTable::<T>::init_request_callback}` due to the type of the
> argument passed
>    --> /tmp/next/build/rust/kernel/block/mq/operations.rs:274:23
>     |
> 274 | init_request: Some(Self::init_request_callback),
>     |                       ^^^^^---------------------------^
>     |                            | this argument influences the type of
>     |                            `Some`
> note: tuple variant defined here
>    --> /usr/lib/rustlib/src/rust/library/core/src/option.rs:580:5
>     |
> 580 | Some(#[stable(feature = "rust1", since = "1.0.0")] T),
>     |     ^^^^
> 
> error: aborting due to 1 previous error
> 
> For more information about this error, try `rustc --explain E0308`.
> 
> We build with --kconfig_add CONFIG_KASAN=y --kconfig_add CONFIG_RUST=y
> (and would also do an allmodconfig which picks up CONFIG_RUST=y in any
> case since there's a usable rustc installed).
> 
> Caused by commit
> 
>   b040a1a4523d9 (block: switch numa_node to int in blk_mq_hw_ctx and init_request)

Fixed in the current tree.

> possibly interacting with some rust change but I'm not sure.  I have
> used the tree from next-20260526 instead.

Hmm, not sure we should let rust build issues gate whether a tree is
current in -next or not. For, by far, most systems, it's not a
requirement for a functional device.

-- 
Jens Axboe
