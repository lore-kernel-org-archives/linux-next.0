Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D804835BDA8
	for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 17:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784915371; cv=pass; b=A323lmZyzgBdixzQUNij0nZjfSGozQ9RvUFPc0SZ2g1eSf1qsdM+b+L/cVmrQUJXN9u4SgeFuypPpVqU15I5uDfDia+K9u0xYluT94YWSVfRXPYaH3sZwsKgsj4YOZKn66FnqKJAL60a9g3mvAqjjVgx/WwaPJRknqyH1Y7FT1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784915371; c=relaxed/simple;
	bh=lIAZOJnNAxg1DiClO/zrxhEYd2Dpf2yGLOD1OI7zvrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbfIIkHvFutXlZSGjJY6PKCKcwSLaQonSdu0NWWstA3g8rYraO+TAR4Y51l+brRxxizDV4J3zOJMAPv0sz/ziwrLoJLsXniMtBBzbnBpLH3pb3ueugtHk4UNuVw5AJQnXef1ON8F2AFXiyIXtTwy2tNgDbKBGOyTMAnmDrvg/o4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwqwnPqT; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwqwnPqT"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so788135ad.2
        for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 10:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784915369; cv=none;
        d=google.com; s=arc-20260327;
        b=c2AflH2XYhcpZkjmrwY3pd7hYpTTcn1xRRr1sgo/hkto7Qm66X3YGY3JYp+I+m57ik
         IHHGA4XB6E2x/eIhfjlPIqfQXNbYPrvOLzuq9YC6eerkq3oJK9rdYa6iOt1rWBZUJ52N
         HuYeTa0cWktr/yq5Dak9R95HqTsgKbtEuWHLnbkvn04nFVrGJMmy+wpBZN1k99Cro8xg
         ibiRoJuQljdFY/qOKxvyfBbkno7Y99JyXI6XtsPBzmF0wIldKsjiIhuyCYjxVFeH3Hfj
         E6HdBIQkaTIvaUHYPP1oq5jvmIiJorfrD+m6/nj6JNEsT5N46GLviYsNspb9ib4WKnG3
         HKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLkZAbSgoe+Zljjmb6bgBkoIjs/NmUuMSkf94eRsiAs=;
        fh=ckE3LmXyQgEA9xG465L6MLMdnJh+0PUbSi78YkLRq4o=;
        b=GNZYQW4PMgREG6G2MP+zRKuN40Aezsh3LPV/IHi7W5nEydEEURbHprVmHZEAQT3/PL
         xewHzOo7+/E/WV+6rupeJDmp0zmqz/RtNmel4cbzKoct5wHVz9B8nMabxEPGgSjGPC6q
         0G/EG694tVHbA5pIg/6un9PvX9DA6he6fsuvIuV5pacyih+fDOx1yklIbUr51i2Ybiua
         Q4RF/gUxBF6jriku98DRbV1UYuLvaH6SpRA0F15F+1ivyijyFiJlPLYhuL8CkAysWvT0
         Pf3tp2hDH56le7UbTwXdTf+9iaTPjl5v5gBaWlgetCa0SIJ+HsFCZD7z77VR3Fqmygxz
         gU1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784915369; x=1785520169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLkZAbSgoe+Zljjmb6bgBkoIjs/NmUuMSkf94eRsiAs=;
        b=DwqwnPqT1Qexp1oU85Aaq7FqEVYIkkFzpkdrriziAW8gDEYrPSyBnyI5j6aaxDe/Ol
         teBaS4yDhaHcoz2vEIyzuS/Nr4xP5fEiQ00x/mrUXvTkb3TUl8f7lsvndqN/rZoZNAy8
         XVFYb7ksupspY6b5zaEHDROyErrOZZ/ZaPRe847Qrz+KvztIPJ94dDgtFYZcZ6BOpnEE
         xm4bZLyPMHQ93tbhwWQ/8P3Imy9eDMzl6UCo4Y8ZaY4tVItn5wNI9T5syaEuG+qwJqGx
         xOkZfHT9kWz5PX7HUpocywitl7f//dFCEw0fNcPzaMmRei/y3TnozCyG+rPLYmToVwv+
         MXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784915369; x=1785520169;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLkZAbSgoe+Zljjmb6bgBkoIjs/NmUuMSkf94eRsiAs=;
        b=ogr5kFP5ooXJKsSb9VCUwr8KfBTRt+s0ffI9LZ/C7kCCh7beEKMldqiUhoxXGQhirL
         q2DZJjYID+ReIn1WZRyObvIGOOVdLRywNnyJ3WFupMWMHmg8ryZN1nWgVNXBZG/ePIqZ
         pxl1qYPkO2Zj/j/7yZyLn+GdlaV/d6ky3g8elbukupqEgu0VIk9ipftXhyP3h0pg9Jse
         vGdvWcEUyl9YpCUGs9iaJ3YSsXQx3et+4ltPhN83mM/F4fg9CgjuJB7dOWMIE5kJVatc
         fxAyjIOkx1vP/YuTsslmkqqxf8+n9NRqB23OIi5aBv7p7C4ZLaWIN4Uf+oV1iiadNM+G
         mRMQ==
X-Forwarded-Encrypted: i=1; AHgh+RplBLZezoBcWT0jk/lbCl6LKt8l+y5QXUjFEsTupUpAyu+NUsgkh3w7vC1fptijkXQMsypKOhW/LA8/@vger.kernel.org
X-Gm-Message-State: AOJu0YxMeQ/vR27bD4nvduCIjJuAiqtB2onmkwuS+qrImMeY7qEf+xom
	IrJw1H3yKr4j0f83EjsbeTrnn8kFWjDAsP2SileYigPgsXNgKMEc11W0cXwhgEySU/X2XYzwAYq
	TyZ0dXh0dWz4TXNjqBIRvLV/gX1y7+io=
X-Gm-Gg: AR+sD12jFJSENGSmijOycOiyO0O++2wb4I+J86rHVEqbBBXGCf5tpQ5314EeZKtetze
	dwo/a2SEgikxRNq9XZHyIXUQKiUPoVa7HxaTde/RYe1p7ttcdy7HWoVLjfuAIuxcH/FGG/Dp2+n
	sPTMXePnYwMfEiIk4wPhj70l2rXbtgwATOpOHCkZ5YQ6XnXojM/J3d+siQcX81TvrMPtYBW4Wi6
	HsEIWZV/B4iVj0mMFzbWqhzbs2HkG1K93sB5kKl5g09NYRg+IUfqUvnsCN2HbPCBj2O7rCpY1Qt
	BlW7FtHG7dAbhZIM0Xt5D52E7MFmyNWR3gFdNElKXUEFW/SkYukNXgM+VcOFmr4eqDclSEVSa+g
	17Q==
X-Received: by 2002:a17:902:da48:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2cfbca01dccmr39020685ad.1.1784915369224; Fri, 24 Jul 2026
 10:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <akZxfzEtam8yPXEh@MacBook-0RXW5> <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
 <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu> <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu> <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
In-Reply-To: <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Jul 2026 19:49:15 +0200
X-Gm-Features: AUfX_mzg4E8_DGzRFUdkw6eauSQ9wkqmjcRjNx2NnG6Oj4wO95XkUjiDM7IAtZ0
Message-ID: <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Theodore Tso <tytso@mit.edu>, Alexander Potapenko <glider@google.com>, Mark Brown <broonie@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org, 
	will@kernel.org, longman@redhat.com, mingo@kernel.org, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 4:35=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Those who hate my attempts (i.e. sending patches to linux-next without
> being reviewed/acked by maintainers) are expecting that any patch is
> reviewed/acked by maintainers. But some maintainers are considering bugs

It is not "hate", it is just the linux-next rules:

    "
      * submitted under GPL v2 (or later) and include the Contributor's
         Signed-off-by,
      * posted to the relevant mailing list,
      * reviewed by you (or another maintainer of your subsystem tree),
      * successfully unit tested, and
      * destined for the current or next Linux merge window.
    "

That is why nobody is expecting random patches to appear there --
because every maintainer receives those rules when they add their tree
to linux-next.

And those rules make sense -- adding patches that are not ready or
unexpected can confuse others, break the build, add conflicts or,
worse of all, silently invalidate testing of normal patches going to
Linus.

Now, again, exceptions are definitely possible (e.g. I asked for one
to add Rust many months before it was finally merged), but one needs
to be quite careful and for something treewide like what you are
asking, it will always be tricky...

E.g. even if you always managed to perfectly place the changes behind
a `CONFIG_`, subsystems should probably still be warned, and Mark
would probably need to drop your side if there are conflicts to be
safe unless you coordinated the resolution beforehand with the
maintainers etc.

Cheers,
Miguel
