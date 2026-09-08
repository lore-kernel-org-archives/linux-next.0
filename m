Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10A8568FD9
	for <linux-next@vger.kernel.org>; Tue,  8 Sep 2026 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882410; cv=pass; b=F2ckzwmjbB9A7bJjhnOTF2lkKAs5p2KNh+hkkHVuPC46naB04f0f/KyuNViMcwZCMlRtBE835t8Yf9xlXjaQivqBBdGMW6ELtOEi2Nk9/x0jADsrVb6gs/15VNGp+3DqvMPQnR+8U/8vyCq+vJudpnfkkdE+PhTMZI6tN3bfcs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882410; c=relaxed/simple;
	bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCjtmD0cCt1zrVtDd8WSxVVm9ieOdn9Ipj01gjm6r+sLBXK8HvzbIUstzdxPvlS5J5YcyeZTU8Feadmkyo8+YadknRP7KC17v8E/vRIuwH7IcWTTG2b98A7/xHA+HkJ2La+FfZOaeScnp6OiJMw7+W4YuT2ybPal13rwpJEz2Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V33dWjqg; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V33dWjqg"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc44f8f356bso105383a12.1
        for <linux-next@vger.kernel.org>; Tue, 08 Sep 2026 08:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788882408; cv=none;
        d=google.com; s=arc-20260327;
        b=dhGJen5JAAWTsoabD4+0SVRGvjMchKHqO/3M10a/Isw312At44DU0kz73JA1BJR5RZ
         d3JUfNAt7d6PsfWeNq2kdbPJ2HSdrX4CLckZaY0m95Qib4kTzlIev4efez+ffANrLiEk
         YxTcCqGm52oS+M8pZyuiOCv1jzWweDHcyGdrB57qTDvd3s+kvS7oLrm0eN7Yz8okrWDO
         Mkcki9CKbr212OXIrReZmJLY89uSXWHTHX0Xuq1eYi40hamLdMGPnRlQj5fuaiPzsTLZ
         6acqAnDVvVQGI/d4AZLbgOAj1VCcAhaair2e/2WgD/94FY9JFAB0iElx5XPcBJunEr2k
         Y9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
        fh=Q2KBvvLxwTJNzH3lTXQZnO7/3RDMYZ/ID96Yt7LEIIk=;
        b=AufzRFo3P9wuNunSd/3lZZYQ5BPIlDLnjYJEwPpsEj5+8P8wl/8rAP+0DcpLbvn5H8
         o/FLlMPw53aYaLNollDR8b8gBlemneH5bqloszMLlBjaFVnwOW/SNEqXcc2B0yiukR2e
         iU5OT/IU8Q3lwK9g6yNfTnAVKm0B8qyY3+UavaRKd0O5IjZ4je/feOd4jAn/P+GLt+jX
         mKj3EBDVM52p/MclkYySzL8R1hBLp3LKYvExgYTB2XQ9WRcbl8FpQtSA1taOHRrrNzC6
         ChOgT1ICM40q7MJEDzKAxf3XOBG6RT8jRhFssUqa00As2qtsHaapeDoor9TvEHLur0Wt
         uGkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788882408; x=1789487208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
        b=V33dWjqgqonodEsVOrgcPFV9kxRX6VCt4J3XRIcKlrclVTKZuiKXT8X0PGCOM4PD3J
         q8ejc6U5ijSHZLRkva4CLm/wMHE0qxQXOqC5mzAXSL9gsKndijMhFUBOi2hEyHXGnXrg
         k+3sVjwjPmPe++2yGMtMOCR/zb5j5/tsk4uAN/9JXjWTG4bfZDO4K+QR4CK/PCu8DPNt
         1K0AmbkxeSx4g5TfzbM3yRB7pKDRDLhiES2l+4IiTvFsmFxcS1qY92ucYpSDiHLyiw2B
         zU/c4wXLv9XXaiLe8lI4OeZ8jj/ZfKsi7OPY2LMSL7X51QhCBz73uZgWCQ5buJ37zT1c
         qqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882408; x=1789487208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
        b=eQ4GoG1r7dTVbAqicIIkb74Bu6RI73mMQ2NPN172AhDt3n/NGB9PuQMhkyD6mkGCMy
         3/QSvVqfjOKNLxTgjZu2YVFpwSWWImbYumc2jNapSKQdt2IZ3khgbd8axILQaa0bOYxY
         Lg3P+s80GErv0w4iuhACgSuE0Xz7IFUdbv/gvWBia5dPVTA44HeCOXT2P5qZpXDQ78hl
         dvPqqVuewFsYZGUPeS+EVt4LKh82rjEV099MMlzQ/X6+zyIvXH/UfuAQ+KAew7y5ULYy
         I+4EsebeC6n022GIBUgNLi6Ug/JQ/Hmfb1OdTrhU456pclH6n2FIAoAbapZJMuBUJ13/
         0u0Q==
X-Forwarded-Encrypted: i=1; AKwUvByZDxDpVKc3r0t1V2W54r6iXWxiZXFyV00CmSIDP404RJlh882e0ydEvIe7B/7e7ksSISpfUDcgPYFv@vger.kernel.org
X-Gm-Message-State: AFuF++mAMRgPCDBlWaB9IqCCzrXGPrnfxDUPlSJoOwyJuP7CrxS+ANgK
	2uAdRk7NPNUluvmO4eBoTgv0LsIagt37WTKXhMLHptPsZ8QGtTK6sj8UKnvM2x2kGJStzXxj51V
	rDwiapuSGE+Je3KV0tl+IBl6ku6idkxc=
X-Gm-Gg: AYBFou2Ss+iMoO1i1bobs5ea4zTgfYlGwQLznSMwNJSeSvr0v6oKeeOoh/i+dToBYIF
	mgmaqCu18yf2WvstIRgSUgl4pypXGXtkVadiv8YMrlbSLDROWatPEXsRZvHJ2zxIAWewBc1t1F1
	4zqrLtfdhm85HtRUjHQgbpzjzwNqqC3GA8IXDhuzWgm5v24WRouYBrrKEfqBAQc18EIc76qfd3v
	vrzgr4+4RjDVEHfXnuUsVMCql7Er2KCmlaIfAPM4M/0rx/aAfyJ80Ohuj2Mv2QgREKXhsUilt3e
	YDzdBxBndyVV9Gpz4dGQxx+/7I+pwVkAA1Si1NtccsTl7YduuKoqmLoDKqhAnlRjkmr5iBal95c
	nF89OxQ5YmMxBjSJycbG9Fy8yC9MHRJwIan+m9cdQE95suFYaMGpdGLZCjqE7
X-Received: by 2002:a17:90b:498c:b0:398:a2e4:c784 with SMTP id
 98e67ed59e1d1-39b3d5c4449mr20100311a91.1.1788882408145; Tue, 08 Sep 2026
 08:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4da62a4b-c4ef-492a-9a27-b56bd4784acf@suse.de> <1b3d0eb2-9e9a-4d4e-b8c0-ff966033ef03@leemhuis.info>
In-Reply-To: <1b3d0eb2-9e9a-4d4e-b8c0-ff966033ef03@leemhuis.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 17:46:30 +0200
X-Gm-Features: AcwNN1UZy9klDHYXIQdjFGVCMKJTy69JyKumGJIN9nRq9tK-al_paSfA5ZANsw8
Message-ID: <CANiq72mUW5d1dOQDgpYjuKoUaZAi-im7j3v30Wd4KTDznmM9zw@mail.gmail.com>
Subject: Re: rust: Build error in DRM bindings
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>, Mukul Joshi <mukul.joshi@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:35=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
>
> And I already wondered if I'm the only one that is running into this, as
> I reported this a few days ago already. Pseudo-patch to work around this
> can be found here:

You are definitely not the only one! I have been seen it in my CI too
-- I didn't reply here or there because I had already seen the other
replies in the other thread and I expected it to be folded or dropped
the next day or so.

But, yeah, it is painful to have it in linux-next.

Cheers,
Miguel
