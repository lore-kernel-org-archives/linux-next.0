Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AE134679A
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 19:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022883; cv=none; b=s4trMl6i9u0ESjTEqzKVWV4BhbuooaHUvnMWTimvPMSqDfAnJTyrlO2ss+XU/ivlLmFAw9nWbvnwucPiVnHG+BK38JrWM4BLqXLID0iUsNhS52xXH/fk2UDCaoFIWmdn7GShH5MSFuagd8Yz7O50CldiGi7K974iw7K/s7M9A7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022883; c=relaxed/simple;
	bh=0chpB7N3x65nE3NOlOXkFXbbIBTXUw3TFND5HhK2uVU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ntuhAJr1ObGPc3UQIiojD99W9/luhQWJcGVoj2BSYN11wX6L6oX2t2/f2rs5EuikQiXjqsqGB3tIhWB/rC97Q9SfaDMMLtsfxvKTimnRgHP5JeLteg75ScTJRtQAVYaXaCzQVg1bniPMoY0kRDDHHzN0wKPmu4eDl254sHjcWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FKPRvN58; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FKPRvN58"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-64d1982d980so157765a12.2
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 11:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769022879; x=1769627679; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hLFSbu311S3ZYvuYtjZogOWRi98u4rFrPoxMQxHyO0A=;
        b=FKPRvN58JFhtv73pL7O2kCqyPvzLZFevXKtSXtdfw+rMMNWkJ+jh14ViT0dSMzGr0i
         JlVMF+JyfUi0ebonwk/rJhuujxCoBTP8CTjPlB/U59MMJdORRORUJgRO4xKv3uB6d/l2
         5NLeanwyFPy73WmsH+bDtWXIIq1Us7QmwvoU5h/PsRnoEj3XhCmbkSGtEHRlctccF/FB
         Z0PClrgiIlahzuW1aUSP9yStMUZmz/+/z6uAnaIV1RWaW8P260a2ec7SVzYo39KlvKCj
         G+1dYlRLoJj9n/VbA+RDV7LojZgPEudVjQI5D1SnaWnwpJcXohmMpXSemsP35wTtnc0k
         uoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769022879; x=1769627679;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLFSbu311S3ZYvuYtjZogOWRi98u4rFrPoxMQxHyO0A=;
        b=p20OVZ+75N8bb8PYWepEle2p9NbZC3uf8oJf31674kQp8VvsLcdm9lDx9nqcM92Bp7
         NT5aNEGrqtkf2xYU3e2u75tMe6XGbDSqYO8OuCDSVjxHK4S05o49DmkHWLWUIftyegNv
         h/iqwWzoaTRBGJvH8tQqWPhJb3tR0Yrwty4z+OH+/rsJ6mXF5IGl8ZnqRtZP7HDTxYmy
         uLxT+dFyiQQFWFe5JOoKGh8aa/LqrtH6dEMl9+N5A0dlDagRrzvJVXQyW/fScJcITHIw
         WzsLl+eWiqSov71bNXc94ky0h4IA9RV7NQNLSlJKvA4XyvpkQmAj9OHRgKkkfoO5+t77
         g/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWFgHLGvu4PmVPdWRAnZVEm3urnrF5lJHbV9XucwtMHWcd+FxYHFfJSq1SZIl8DW/uovmJWY14k6woV@vger.kernel.org
X-Gm-Message-State: AOJu0YzVbAQeMBmFfRGxhKMSuFmPgmFPAixKSmJxzdsRkvgrpRLQRqM7
	rPSEoKMNQ5K6Z2/ESufDFvPtbVUumharTAGzkCn8tGkcZITNFJYr7HcZ9m8wHb2DszKUKyvHd9u
	1bDdfhDavv1Qi5z1jaw==
X-Received: from ejrg18.prod.google.com ([2002:a17:906:5952:b0:b87:acc:1aa4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f1a:b0:b87:281b:1445 with SMTP id a640c23a62f3a-b87968b75f4mr1533540666b.11.1769022879554;
 Wed, 21 Jan 2026 11:14:39 -0800 (PST)
Date: Wed, 21 Jan 2026 19:14:38 +0000
In-Reply-To: <aXEJZ88g0Ng2dIQ4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aXEJZ88g0Ng2dIQ4@sirena.org.uk>
Message-ID: <aXElns7ZpGuZR6ke@google.com>
Subject: Re: linux-next: build failure in the final build
From: Alice Ryhl <aliceryhl@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Beata Michalska <beata.michalska@arm.com>, 
	Carsten Haitzler <carsten.haitzler@foss.arm.com>, Rob Herring <robh@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 21, 2026 at 05:14:15PM +0000, Mark Brown wrote:
> Hi all,
> 
> After the final merge today's linux-next build (arm64 allyesconfig)
> failed like this, the same issue will be present in mainline:
> 
> error: field `device` is never read
>   --> /tmp/next/build/drivers/gpu/drm/tyr/driver.rs:37:5
>    |
> 36 | pub(crate) struct TyrDriver {
>    |                   --------- field in this struct
> 37 |     device: ARef<TyrDevice>,
>    |     ^^^^^^
>    |
>    = note: `-D dead-code` implied by `-D warnings`
>    = help: to override `-D warnings` add `#[allow(dead_code)]`
> 
> error: fields `mali` and `sram` are never read
>    --> /tmp/next/build/drivers/gpu/drm/tyr/driver.rs:196:5
>     |
> 195 | struct Regulators {
>     |        ---------- fields in this struct
> 196 |     mali: Regulator<regulator::Enabled>,
>     |     ^^^^
> 197 |     sram: Regulator<regulator::Enabled>,
>     |     ^^^^
> 
> error: aborting due to 2 previous errors
> 
> Caused by commit
> 
>    cf4fd52e32360 (rust: drm: Introduce the Tyr driver for Arm Mali GPUs)
> 
> I am continuing to mark the driver as BROKEN.

Hrm I saw you had this last time too. I'm not sure how you're triggering
it - I haven't run into it myself and I do enable warnings. But I'll try
to repro and fix it.

Note that for this kind of thing you can add `#![allow(warnings)]` to
the top of a file to silence warnings.

Alice
