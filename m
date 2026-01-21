Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B2C33D6E1
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 18:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769021758; cv=pass; b=KiEku9ghg+lEhX0yt28dTB7IMrk7NQ4FMl+MmRwdsm57MbsDgLSGejqzbQuVJleXYo4hbSR5ffh0xeZoVl/Vv+HTCw/Jv/mxyx3zVFbPUqpwKMpfEJmXh/AvLVKe6WXM8/7AyJXP7krz4+8dYP0inX8jRsL3gPBVyNIvnlh6xYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769021758; c=relaxed/simple;
	bh=xeIw87+gbAq7el87SXtq/6EM2kQ3xkCeRq3UvJvvZB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JP7sDG4sQBRm5NX9NDTDhPfcVWnvORqAMmqDvVLwEcBu0CZhkYLw7Rj2trPUau51Fw/9VgW9+sRMvwSTXNY4Gdkr5usppVvfQdQ04EtFYjQIckMFequmzYURPVlwwZQ59sn7MUzTrvJWBUzuK4FNRBgk7G17Xf9o7xF4BPnxKMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2EZH91A; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2EZH91A"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1233608c7e9so29415c88.2
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 10:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769021752; cv=none;
        d=google.com; s=arc-20240605;
        b=fOHiIBxaF4qWxqHyL24OpzTzQIi/DQ5ow4TBT9FyR9h6Au1JBEo9CJyAYkmjs5OJvS
         W2Z9DhYovlZ2kYR2PV9q7GnbXIlXtH1AnV33DTSaNN2JiJ7TxheqmguJFkQcMVmzHqzc
         NWaMH4gIZJ50PWVSNJJU/xu8iFVxgl+KHxIGLrrFVA6XTtAwZ6HlBQ+JtX9bkRD4i3P/
         JaNYIJVKoqo0DM163qPFWR4AFaNg4MhaF+/AKAWmG2esoG1UfzEZRPjSID6CDOEesSis
         UaDoQqs54GxHESeGljt5Mw+CGa2MY2A6gbFhDLlfYNf540IF6tiVS58F7YOECJ+ULA0H
         IpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nHG8tTRfzHw94zzrYAHAUzJvAxMVDyhnSEwoj4O9f58=;
        fh=U3ksuDb+FLUMYetzRfAAPSZOB3dsw8En7Ce7renx1XA=;
        b=hH4dw/Em6LKQM0ut0Zp0Ggv23tSVxS5p/kyO/Xk+jTZz1mxL3PU1HUKyMG5Oaz9c1M
         mAm37kfNqpwhWkiPyjYcrEk3NaxDlmlHWFumY/KQFFoawgOSt34tHyamOUI/1i26b+sS
         hyGFK08Ez5kSqvoidHFj9oTVkz7Ce8tkJWn69Ltg2xyjHxDOIc6o/aJcWG6LAnegw7xO
         d714MGzkcxhM5BQ849s1VRquDYQyVBn0VY+bOx8ETSTmGRCtSs/01FZg5cHVZ6tY1RZW
         zG+pq+s3A8W/WPCp6pQ3NMGuqNTtbB4BELnP3KN4UyrdWYLGfXvJrmF9lorhtEBjCREg
         jOKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769021752; x=1769626552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHG8tTRfzHw94zzrYAHAUzJvAxMVDyhnSEwoj4O9f58=;
        b=g2EZH91AnJc8AkHjMVo8tueswdsjo9LUH0XwuVs/tg5d1p67gqKE285yDfkPkmY95e
         w8ZR7RtSMZ04AiWzK2RRnfn36cb8XGFBPiyPzYjpBGszj7OYRPkxSrAPpmFjaZeQMCBm
         gKbtR1JYiq6Y4369qa1QNNX+PLkkUl53A9L7Su/P1tiopmnUgaByexptOk50HgoVsNo4
         FqvfdYAAEKo0/mTU5JAOZS1+8ranDXpAF/lOXeAfGr0FE2gEUVUFxEaGXzhV7i1I148A
         VZrvWr74Y6VxtdlXIJtRmZNnErASRPqRRyRD9MEIkPFOTSaRETIOEMsN/VSrZ9LP9QUc
         Hf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769021752; x=1769626552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nHG8tTRfzHw94zzrYAHAUzJvAxMVDyhnSEwoj4O9f58=;
        b=o9+0Ro+/PTDuqWMhdTS4F94TKswUJkZ5C0S0dy04iooldp9Ulb9MV1zLp432Lu811H
         97pW9kJ5eWFUWKXOGPjj/6gmP38j3L/xicxsVN6dz0VmAVAuy1/EOhR7v1QwUEt4ijc8
         LzvQjj2suXi2B3Du9qXI5Cv2EJPqJu+3CiEanVIW4hkVlybkOB/NlYNGI2ZAazA9jJqt
         zPVxRNB2diy4Ap3tm37jzoVHTu5VQgcqy/chlFUwlqkLmp3TodepPNdwivVRO+yzgPaU
         esZawbOUzL6vNOPAsWoNFVgj+N6kfaVR3UJJEqVR316XowCY0vT51DZ+IQEvT2LPqHNN
         g0SA==
X-Forwarded-Encrypted: i=1; AJvYcCURhxIVU9AKt4bCNLF3mZ+34WTWnkTojVSsELg3s6D0C8XYytbov4bT2URKrITEwOsUcEPv3UA8mnr4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/6PdbC4o/DOXtyfoA4Ouh7W2jhEE/hpf+KmDxQcxfXVV1lxg0
	g6TvnXG8UQoZJBWg/XvdipMdOt/8NR7o8rSZNiWHZV7pp52RHpMPjW7Xi2Nm8Cthm5cngugueS9
	I8n8UAIb8/DH9VLbYZaVVnLWdIoHmrvw=
X-Gm-Gg: AZuq6aLB5uhqeWDFmq514vTSq9txqu/I89YgZPtHm6pCkuxu2WFz5xJ7p1pmMwLMUpi
	5WdGS4BlQ9VhUBUfpdv6xlXzLAOGiWwbsUqKcPAEL/aXsiUuA0YU6+JBuEzOAmpbEsOaNaRrXzY
	YhhRT6eWWn8CF0lLGRMnVZgW3EXWsb+l0xXYHtXjHx/THFfK0no93Xz7ntRZnF7YT2mDByBZxZV
	/yV6UGlPohKyPP6+RsXchxxOIlh3pxl39wJdk4TQxtIaB7I2Ys+4ZmdJyE2iaBcpsJfI/6F6IIT
	LGUugqVB/XXGMDpLS5rCPqGVDSVPgZfh7QFUYXi/orhQp5tTI9/ptoBXsIcuFv6tNP3P3fPLHdB
	YbGudDN5ZRIFr
X-Received: by 2002:a05:7301:1286:b0:2ae:5f73:1968 with SMTP id
 5a478bee46e88-2b6b3ecb13dmr6787656eec.2.1769021751747; Wed, 21 Jan 2026
 10:55:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW5xqLq7gatOy1DV@sirena.org.uk> <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
 <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk> <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
 <aa4bc767-8128-440c-a2a2-81fbb6992a8d@sirena.org.uk> <CANiq72njSUPt2CvjBiNyKw1KHSgnMdcBnXNL_pHV4iURYL1n6g@mail.gmail.com>
 <b17da8b5-6640-46ea-ba73-d2f4a08e246c@sirena.org.uk>
In-Reply-To: <b17da8b5-6640-46ea-ba73-d2f4a08e246c@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 19:55:39 +0100
X-Gm-Features: AZwV_QjUvg_avF4Efiz0niieqAhIejZgNq3bpQMKYiUHa8aZ5nunCXSR-yxpcXs
Message-ID: <CANiq72kT9ThJcr5W0OhBmbwKZCpULjUehNjijTt8W09yB0CxSg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>, David Gow <davidgow@google.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 3:56=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I'll update my notes to rustfmtcheck, I presume that exits with an error
> if it fails?  I'm not actually doing any of this Rust stuff yet, the
> builds that are done are just what happens when all*config sees a Rust
> toolchain installed.  I've got a small pile of things I'm going through
> one at a time.

Yeah, the `rustfmtcheck` target just returns non-zero (and the diff)
if formatting is required.

> We do really want things to respect O=3D, all the -next builds are using
> that, so if anything shows up in the source tree that's a concern.  I am
> bodging that for the kselftest build at the minute but it's not great.

Not sure what you mean about `O=3D`. Using `O=3D` is supported (both for
the subdir and external dir cases which are slightly different in the
build system). Modulo bugs, of course.

If you mean to ask whether `rustfmt` creates files: no, it replaces
in-place, i.e. by `git status` I meant you would see modified files,
not new ones.

> That is not going to be usable if it fails -Werror builds, Rust is only
> enabled by the all*config configurations and they turn on -Werror
> through the same process that they turn on Rust.  We really need -Werror
> to pass.  I can set CLIPPY=3D1 for other configs then if they enable Rust
> they'll need to pass cleanly but then it'll just explode when turned on
> if there's lots of warnings which doesn't seem like it'll help Rust
> adoption.  If we were starting from a point where the build was clean
> then it'd be more viable.

I am not sure I understand. `CLIPPY=3D1` is intended to be clean, and
over time I have sent patches to trees that break that (same for
`rustfmt` and `rustdoc`).

Things should already be generally clean modulo small bits that appear
from time to time. I just ran an `allmodconfig` in next-20260121 with
Rust 1.92.0 and I saw one `rustfmt` issue, one `rustdoc` and one
`CLIPPY=3D1` one -- I just sent patches for all (a couple appeared
today, the last one is in a driver I was not enabling in my regular CI
runs so I missed that one but it is nevertheless new in v6.19).

I have put you in Cc so that you can see the usual things that you may
spot when merging trees if the maintainers didn't do it.

That is why if you could enforce this in linux-next it would help a
lot, instead of fixing trees after the fact like in the emails above.
Things will still slip through, of course, depending on
configs/arch/... etc., but it would definitely help catch most of it.

i.e. what I am saying is that trees ideally should not be merged at
all if they trigger `CLIPPY=3D1` warnings (of course, exceptions can be
made when needed, e.g. on an emergency).

> I should be able to run rust-analyzer to verify that it doesn't error at
> least, it looks like rust-analyzer unconditionally outputs into the
> current source tree, but it is just one specific file so it's less of an
> issue than random cruft.

No, it outputs to `O=3D` -- if that is not working for you, please let me k=
now.

i.e. that should not be a problem even for e.g. read-only srctrees.

> Running rusttest is a bit weird in that it requires a kernel config but
> seems to work fine so I can do that, I was already planning to run KUnit:

We used the `rusttest` target more in the past, before I made the
KUnit integration of the doctests, but it really doesn't do much
nowadays and carries a fair bit of complexity on the build system. My
current thinking is to migrate those tests and then just make it no-op
until we find a better use case if any for the target name. So it
isn't critical if you don't run it.

Now, you mention KUnit, and that is very interesting!

The overwhelming majority of our tests are all in fact KUnit-based,
e.g. these are our doctests (i.e. examples that are built and ran as
tests):

    [  2.714912] # rust_doctests_kernel: pass:283 fail:0 skip:0 total:283

but we also have a few other suites that come from `#[test]`s
("normal" unit tests), e.g.:

     [  2.260774] # rust_atomics: pass:6 fail:0 skip:0 total:6

So, do you mean you plan to run them under QEMU for x86_64 or arm64 or
similar? That would be amazing for us! I didn't know you planned to do
runtime tests.

For x86_64 and arm64 things should work fine and it would be great to
enforce it in linux-next already (I check the KUnit results in several
trees, including stable/LTSs).

Now, if you mean UML to run them, that is still best-effort with Rust,
and it may or may not be completely clean at certain moments (Cc'ing
David, who has been driving that and done a ton of work there).

Cheers,
Miguel
