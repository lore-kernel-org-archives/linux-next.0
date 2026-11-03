Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793671556;
	b=L2Tjx+fcroa/biJtlnr/gCeDNmwdVIhjitPWY8CkWnShZRADQAfCFHuN0e6pBv7IeVm7
	 OsDcdewa/Ki3h8W7holX3vMkAP5k4r5kPDh42nTi16egh65xY7lQahs0+Onp3UqFyFCn9
	 sUcOgFme/9yWGlSmTysmK9cwhHVms1Gn38uLSxixjIr/X1L4yBi57BoGkX0h5JQyxfj7u
	 wg0LsvQVl3ulqduZ5884C8zu/clh/pCxisJMl2Cey5qUn0qZ2qBRq+kyQVccL1w0vZYsK
	 ceTDuvBZQrDYbIm3v1jEll3asWwvO4BEyK34yEa3+ysleqDHJaDSS8JeWPMMm2QtBAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xKtYIIN3BdzhbeJocKMQ0P/NsPFcFnFc8kTjqddwAE8=;
	b=HiZAyYjCJ/2jFj/yBL9eFEAczBdIVSO7Zn/rsJoK1+55LHnViv1+HuJpOeAdwqY4YOrh
	 JMJKu0hdZDGHecxZe3Ag2qEHH3fxbB7rVbOEWSCYjpz9gcBrGlniL/Ddh1wltVy4OxYRu
	 L6vuD5aZVc5kANUSfwtbQifH8m1251bCqa365IcLC07Q54c7qVMaZryOOP80gnPEs51A0
	 NtDCXaB+nBot74ILuucz98yPPLZyWCm7w+lAx8OMgV2CIjONROwh+83+1yKxTEafRYKLp
	 gvInI0UpQalDmiNGWFiaroMb+L8FhNdFmzHVwvEA1HMaei8fIfFt0xeyLPWHKaVaFyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNtegG3c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50868606A32F
	for <linux-next@vger.kernel.org>; Tue,  3 Nov 2026 02:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50868606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNtegG3c
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b55859245so56195536d6.0
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2026 18:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793671555; cv=none;
        d=google.com; s=arc-20260327;
        b=GqrBTSRUi3+bNy8mosqQ4GB7vvpC80fXCAcFk/l3BaBsxpHTVa0jcnhKUZ9o6SWr/4
         F4Q6AvwXG8Z8doCfT166KBqg2cKZh/ThEWb61B3orsstoMjsoYwq+/jdSpLsKcYx9deA
         AXqBJ4r34K2UYDYR243auzE3zFHMbPrDL+xkVyjpzKp0CsRJwOX/Tj1n5aFUy/HCeWUE
         pIESftvCZLPFoh/YTNoiTl2EjkfI/uDRMBDhvm9lrdQtw5UN3J87kbAOxcS4xkGkQGFY
         fHCR7OhRtHh3kKEAE03AsFuTZRO4qHGYaBw+pt1nXOlbVMZ/BLFLPjBsInc8B4gQEpO7
         E3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xKtYIIN3BdzhbeJocKMQ0P/NsPFcFnFc8kTjqddwAE8=;
        fh=UVUW0LJWMcN3BUmsoQoNr/YFqp7KaQ+ILBWTlpYJ8S8=;
        b=bmDBD44zjRgWcLM4aR43BwQ9A7h8ByHPei4uPOXhC/g2Wj6eqwspEV7B1tYbQY/cpe
         wrTlUuFr1BUo9taglGBmS+X6+nl84wdSmqtIHheuqJl5ccp7EUaVIBa5JVffBnFF1F69
         6QpPabfX5jUF/v4Zc0+cAwHJw5/dRXSEwGyxKHrDQ4bdQXvr5GkWgOuT1yo91ExgJO+k
         qBDuRvy6B5Uqv97z6ktg3uBuTBz+2kQrwzxHmX0aZZuAJRnc+aJi3TDgj3jK4A5JV68L
         a7XgjMEqLFgR8jHx2eX8SbpCLH1Kr2gXaMjt3yRsA1+MLJUH5ac76FfYcFazQFXds3TN
         H68Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793671555; x=1794276355; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKtYIIN3BdzhbeJocKMQ0P/NsPFcFnFc8kTjqddwAE8=;
        b=fNtegG3c+WHo5ZkG9eN/QIH9GVxWoLdF9U/F+sb8coWU5o2gG6iIKfklCoA316N9+a
         VK4SMvSTKurmdE7annLJv23ePAXQiuWLJvq4DYLumQtS2R4dNs+odSwiXcCWBooopTaS
         UZPUGVjEexqircqXW5wJi22DaVEMu7p8g//i36BNDg2swNnnGlwuW5p9H5BOW+Z8ugyj
         w84Oa6jzudPZUdqmMWy/HvZu7ani6R6cF4O0YnVTFRuoaZcNWxbR/ZGQXTx1caSGTp6h
         vAdpOnkqE/03zN24G5YDoKjX5gLTWdZrxxmg+YtDVUIijLlcYXlZdw0MRXKfuWh5Z0ed
         tH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671555; x=1794276355;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKtYIIN3BdzhbeJocKMQ0P/NsPFcFnFc8kTjqddwAE8=;
        b=JCAdGFKznUXJJqaeUIVz5Q1+ntTFq5PHYJ3+O0YQ6kuWvKT7booCecJcTzCT5zbIKU
         kbFQ/sbF1LCPFKdHkc8yBfYKVz/4qKd14jlw3kKj9RNU+56v7mrDFi/TNX7a+8sS39TA
         7RTmU3rOzNawvPM/NEQC6y9DghaGLnY5j1Q2ryzbiWnXsZiqj11qbadPyb7FsAwxmhHB
         TJCTcEwtxHPUnGbLUAjIgTK7EWvPKntxgtx+B2x/1PtMwAoqShf6bROMtknaI2PIcT26
         HK4nWSH6gVPpomITr1TZB00B7bAT569xowbSQMSA9mxIDgr2giJfasTlRO8ivtLRnPcB
         UXlg==
X-Forwarded-Encrypted: i=1; AKwUvBzXYQBivnV+bFJskWPrpYhJ4o40eSd204ulGCzByqbXBAIH5yqP0QTIIMP5+4W4xZEV0oQGBVuLhONf@vger.kernel.org
X-Gm-Message-State: APuU4Z9cABXwHHZ3CxppdoRSfqJRZt8Z/fnCGHhkPE7NUw7ado8h84kw
	5EFZfnIo2rIPeYP47g4iKbh1Oc+orrjVWBgGEdImVXxMod5IkagElOFGU+/9dcNyEXP4KNp7/Wp
	qH+fbpGj8tJy87g3rQqXWDTqaOE8d/Xk=
X-Gm-Gg: AYBFou0l2nJGREOZVj58pY8PZNE3QSivC1hlye4MEOzW2msEaYd/LJuIusqJHHt3lvc
	dTXxNIibg18Ex8Ud+it2b82I6g4gPR4qFLFhwqmqfA6H9feaVE/GP9vLxnn18gWmHBNpL1KAG2z
	TQObv6yrz2nS0A3+AiEjigViYE9uj4BjPTIOUG6olJO5Dc1RUkBRnaUqqAD0UJuMIZ2oSihdZw1
	k+MUUsqKmkZuT71Sn5lP+r/8Blbyx2cY++fdWkgEbVkYDKGsAdk8+dVVOMTPaj/9YtCJdKnGCHE
	wCv/r4bCkR4Ffs6Cc0U307HwzdnCV8XC+/4K+kIB4FrKVdyGSQR9aiv559DwBpz6cNslA/m+gLP
	/S3hRAMKtHLAGr+KIXvDbdoAgSgMLAw366a60B9aVb4B6F0oVPflb9VosTXCTp9lYpfQJ17RM47
	FP5rphcEDUup86Bo3MsCKtOg==
X-Received: by 2002:a05:6214:2585:b0:91c:797f:1210 with SMTP id
 6a1803df08f44-91ca4c0357cmr191765166d6.55.1793671555066; Mon, 02 Nov 2026
 18:05:55 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aujZcJBUyQ7iX_PM@intel.com> <DMKY979I29AF.BS1DF5YAZMOY@kernel.org>
 <aujikV14tF6K1Xqw@intel.com> <DMKZR0YZV1CX.DWVK9V47GR1J@kernel.org>
In-Reply-To: <DMKZR0YZV1CX.DWVK9V47GR1J@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 3 Nov 2026 12:05:43 +1000
X-Gm-Features: AclHuK-th49m9XmX-PUcR9ZjKn7qxL8uGhLaTwwMvc5LLC23wgVb4nKn4SKl7JM
Message-ID: <CAPM=9tww=CJdxzvfUvLwQ6V4uoszg8JrB1XCAcp15upM-xPvSg@mail.gmail.com>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single drm-for-linux-next
To: Danilo Krummrich <dakr@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 06:01, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Mon Nov 2, 2026 at 8:20 PM CET, Rodrigo Vivi wrote:
> > not exactly... The per-tree check goes away and there's one global rule:
> > the driver -next branches are left out from Linus' -rc6 until -rc1.
> > But this is the cutoff the drm-rust docs already describe and used by everyone
> > anyway.
>
> As a general rule that's correct, but in practice we have been leaving -next
> open for a bit longer (with the last PR at -rc7, depending on what's contained),
> as it sometimes helps with cross-tree coordination for interactions with other
> trees while we're still ramping up Rust infrastructure throughout the kernel.

It might be time to pull back to -rc6 though, we could just keep the
rust tree in -next separate,

It shouldn't cause any extra conflicts, but I'd rather not keep all
the -next trees in -next once
we merge this, otherwise we may end up with trees getting ahead of the
next cycle again.

>
> For a late PR that leaves a gap for stuff landing in -next and only ever hitting
> linux-next *after* it has been merged in drm/drm-next. Exposure to linux-next
> should however be a prerequisite for making it into drm/drm-next.
>
> So, I think maintainers would have to commit to strictly close with -rc6 to
> avoid such a situation.
>
> > IOW, when you fast-forward drm-rust-next-fixes at your cutoff, that content stays
> > in linux-next whenever you do it. The only difference is that drm-rust-next
> > itself stops at -rc6, not when you fast-forward.
>
> Sure, but that'd mean -next PR a few days after -rc6 would need to originate
> from -next-fixes in order to get linux-next exposure. Thus, with this approach
> it just boils down to "no flexibility on this".
>
> Can't we just keep the per-tree for-linux-next branches and just merge them into
> tip/for-linux-next?

I'm not sure need to have that complexity for everyone, but if we need
to keep the rust tree as an extra then I'm fine with that for now,
until it stabilises.

But it seems that we already have confusion about what was going into
next after rc6 so this will lock that down and keep it clearer.

Dave.
