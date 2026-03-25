Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22A33F167F
	for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455952; cv=none; b=A15ULPPJFrxTZKFED38vB1C9R2JKawlXwz2E4wPIjYm0qwbfbt3p95y7K3KjjHzUEVA/VcUOdVhPMjFZwwMz5Jh9W58rNG/32awhx/TMc2sIPlA8iLOgAZPCru9mXN2Dizh4SP15XY+c0ofEiBrjoG9BaKsay8rxW4RVpQipaxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455952; c=relaxed/simple;
	bh=j+JpOTxoiaC4a3ZwzKzJu6hgT0risfLAx+5XEX+zV0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcvkHAVeqSJps5I6Bh3nZmywKVyhGoX0GxJTCxrFFuQZPJD1B2ZDydLtzbqCYNFhzyQWw4JxEN9u+k5jvPThE0rfiL9PI7IiPLKNp+ZYq0rEDnn3Iuy+sBQCCh9Oree1rlSYYoT/LDa+CdsoihsRkoeYEgce/Rd4+Z0gmSiVQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0s1KqnK; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0s1KqnK"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-128e4d0cc48so6261100c88.1
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 09:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774455949; x=1775060749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4PHuReD7+FVWhNLpyHRhbYrIKNtPz37kFn9VqK6liQg=;
        b=A0s1KqnKsm90w4A0hvnbWrnex0lBPuOdiBYLd67UawbajHcYU+jVlHZD9M53JL5Kdc
         YEPyqk5vlnc1fokSbSS5oOPA1ThioShH9+baS7i3TydK+nZpW8UNkoDR4k6n6znveC/M
         KbZ86fFopYxbciMOrOxMGe48U6/eVuNqSYS9RXoCtzToXTeKbglC5IWRxGl1c9cIwxNE
         7cJESzlbFUJQnPd0Dh3Cav2cilMxicfvYqa3l/2cfhtZwcWr2J9u9muWhn+S9jLvEd8Q
         Ce9jVYVRXZ82OtE6JGbSdlRJd7fDAxmQujbn1dbgMtffwcBqedGky6SFIz0fWV52r+UV
         3hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455949; x=1775060749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PHuReD7+FVWhNLpyHRhbYrIKNtPz37kFn9VqK6liQg=;
        b=RYkPHp2lyftkBKbAxm7eY+7zhHiM5ZvfCiGcCVkkvzd79oTVHvOXNiPwvOGG14OObk
         bKMgcIvgQEsIpcmjzLVakBNVlN/kHnWk42fBtC+ucXmZ8dCuGn//wZENfvhKxO6ZLU4H
         oaBDbNWQVxbJkqWhlO4u1xZr99R0cTyPNTX8alGJQWYtzEflfVrGM9oiGSdYRYcycfZe
         tNdmI6O2VM9VVUXnmnKQoE+BYcR9yANphJKnuTZTqJALBb0135bzKCEwq8CLpP3oQEfE
         o7BCEWx7suReCE5yGQQTRKi7rra7NdeggpxzWKB1JV7SHOOG7PPqLRUu7864nOzu1YvF
         64XQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8xqlqhi9jgDJc3SD+KpUGkltBpIauXjm1LwwyOUPCCBUBC51oTQDJVaMTk6MNKuQ1kq4sv2X7wIN/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu+EhYDexoG4r0f5vGZ94PIi7xmEMSDClG9Hj3LUSDpXgzdNFO
	Hso6ix3OOfdGLj3x51Ad6/5qTmniR/lYZYXM0JqawmUBte5GhtMLcWa3
X-Gm-Gg: ATEYQzxIWUIWCp/y/htHFcRWxsJQ3PYV4itKYq3vEHkUSEml+xshnmm5ByKxjYvJiYB
	jTGdyzfTCsdquHUgMpFoiXh8Hmy8Dja90IXP4/L5vBfQBngAIEjGlXZPdZRTq+OkBsu9HzXOL5Y
	Gi7UBtNJy1Lr0DtpFi4kh7018XwkkTdhalSv4aEaRg9FMlycQq4ldsJbVFXBWno1roXeh0H8A06
	n2CXcDUekpX9Vbcew5dux/wH/Np9xpEu3W/fcVP3sZclzUcem72wRqaLF5ZSlu6OYb7FBdyUVBu
	4Co3SNsyePvky+lyFKm2BTRCO5lJloqllRoaTVz7AEmu3E/Dhe8IaLhXH+kLySJO5E4AA9X5dG/
	zlE5+/m0etf2FiqukWBEDBqKbIr2kjCYksD8OCp/OC5NCNemZKNsy53kppt1XRyb510yCYLl2lt
	6W2k2o+H+FSfB4gVtMzPk8jbx7yTYMPmYrI7L7oQw8TRp31tEkOWhXR7dBKMkxrcKpN7+BKoAmT
	E8=
X-Received: by 2002:a05:7022:69a:b0:128:cf5c:535a with SMTP id a92af1059eb24-12a96e5c913mr2203493c88.11.1774455948769;
        Wed, 25 Mar 2026 09:25:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6e5beb2sm284580c88.1.2026.03.25.09.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:25:48 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:25:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the input tree
Message-ID: <acQMdgYC2IqFgQv5@google.com>
References: <acQLxuMKNAbtQDef@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acQLxuMKNAbtQDef@sirena.org.uk>

On Wed, Mar 25, 2026 at 04:22:30PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the input tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/input/touchscreen/mxs-lradc-ts.c:
> In function 'mxs_lradc_ts_handle_irq':
> /tmp/next/build/drivers/input/touchscreen/mxs-lradc-ts.c:508:8: error:
> macro "class_spinlock_irqsave_constructor" passed 2 arguments, but takes
> just 1
>   508 |                 scoped_guard(spinlock_irqsave, &ts->lock, flags) {
>       | ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from /tmp/next/build/include/linux/sched.h:37,
>                  from /tmp/next/build/include/linux/ratelimit.h:6,
>                  from /tmp/next/build/include/linux/dev_printk.h:16,
>                  from /tmp/next/build/include/linux/device.h:15,
>                  from /tmp/next/build/drivers/input/touchscreen/mxs-lradc-ts.c:13:
> /tmp/next/build/include/linux/spinlock.h:623:9: note: macro
> "class_spinlock_irqsave_constructor" defined here
>   623 | #define class_spinlock_irqsave_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irqsave, _T)
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from /tmp/next/build/include/linux/jump_label.h:78,
>                  from /tmp/next/build/include/linux/dynamic_debug.h:6,
>                  from /tmp/next/build/include/linux/printk.h:620,
>                  from /tmp/next/build/include/asm-generic/bug.h:31,
>                  from /tmp/next/build/arch/x86/include/asm/bug.h:193,
>                  from /tmp/next/build/arch/x86/include/asm/alternative.h:9,
>                  from /tmp/next/build/arch/x86/include/asm/segment.h:6,
>                  from /tmp/next/build/arch/x86/include/asm/ptrace.h:5,
>                  from /tmp/next/build/arch/x86/include/asm/math_emu.h:5,
>                  from /tmp/next/build/arch/x86/include/asm/processor.h:13,
>                  from /tmp/next/build/include/linux/sched.h:13:
> /tmp/next/build/include/linux/cleanup.h:300:17: error: invalid initializer
>   300 |                 class_##_name##_constructor
>       |                 ^~~~~~
> /tmp/next/build/include/linux/cleanup.h:438:14: note: in expansion of
> macro 'CLASS'
>   438 |         for (CLASS(_name, scope)(args);                                 \
>       |              ^~~~~
> /tmp/next/build/include/linux/cleanup.h:447:9: note: in expansion of macro
> '__scoped_guard'
>   447 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>       |         ^~~~~~~~~~~~~~
> /tmp/next/build/drivers/input/touchscreen/mxs-lradc-ts.c:508:17: note:
> in expansion of macro 'scoped_guard'
>   508 |                 scoped_guard(spinlock_irqsave, &ts->lock, flags) {
>       |                 ^~~~~~~~~~~~
> 
> Caused by commit
> 
>   a995f3ca3bd51 (Input: mxs-lradc-ts - use guard notation when acquiring spinlock)
> 
> I have used the tree from next-20260324 instead.

Yeah, this should be fixed now.

Thanks.

-- 
Dmitry
