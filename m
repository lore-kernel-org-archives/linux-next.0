Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509E7346E55
	for <linux-next@vger.kernel.org>; Sun,  5 Jul 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783252946; cv=pass; b=oPjbEUnMHmg8LJCkGhBmFLQvGa6ALZynIG8b8LYD71tv4C/PvN7Eo9lwJpq2xop6518/ivcdCG8A3T0S4IOVrK25asYDoXQ0iciGMDnpNtuUeTyon+aS14/APkNRys3vdCeCcGgyIk1IaDnggtm+nigW5QF/b+zThFIjSmmR+hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783252946; c=relaxed/simple;
	bh=K5a0McIhIuUNT79JaNpSRGf0YZUHjODLAB+1/m1dAtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVqRyojtBm7LhD3Z1uvoSX13OUWPr6I9KODGoIqe0gJbzW1RcvkqlcGsBpp3oaqcRt7QRGAzdMxWbjpJh3uu2w6d27p919jR3LF9TYqMZKyqE05zXURgQLh91vPvJ6EbGV+6wNlaHTRxRuS9gGo8Fu1wPfgyAjJ2SsFJ5w/pdoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0Reveqw; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0Reveqw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ca7605ce4bso3982765ad.1
        for <linux-next@vger.kernel.org>; Sun, 05 Jul 2026 05:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783252945; cv=none;
        d=google.com; s=arc-20260327;
        b=JiC38rZMwrFBZJMkRDLJzs92NQg37/QfMOyA+Ni/ldnJ7i6BsQVFRd9X8noUVMBRrp
         NmqVS1fOrXtDYyZWc3MctJzSOmk1jjCsFNx4wXHswbflOkG+UnCV4TINW7FyhLjWI+KE
         cAUF8P7RLoyLcGNOcIwLAGIoIy4gysKnE0Q9Ty4cx6gc6w91DYXyJyt6o76LaZiIYekn
         L3jAqM2AN8L0lugfmvfeHZ84RI/EZ2IPAh5zEr4gKI0+I7VA5xESgiBs8/xnPelc2/3Q
         ILynhzEGRByua3qeF+caTbXWn9Bu8mTFlr5+Vmg+eP6yYCIZIXhgSjX7XOL0VC7KbKgJ
         B7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5a0McIhIuUNT79JaNpSRGf0YZUHjODLAB+1/m1dAtE=;
        fh=CW7Qzm1q36oyuqY1OKdb9eTvk3ONesYadvTG9kqELpg=;
        b=qAnyAMeduIlc/Vv2fB9B/m/EC+TOx27OI8nYlGpA5WpGdAgid1B7KA6U/O+t3ownU2
         tvA+qrRwuYhvzv0crRYG63fVqjo0RqQUunPsE2fhQR6mBFlC1aIA/HyACrlDbzJlfA4I
         K4PdhmYWGY+vW0Wyn8ukpv2dXMmbwlGPlaIz2Cr+UUzbt8ChuRsmpE0rhxuDz+Rh8ahz
         IrfMLjsyZSekMupuJhZytY5xGQS3iZTR/D/KrzwAaoNLLqc9jEKFfjkO9csdVMFsfAV5
         wE58h6XdnjwK/UJtUWFVkQ8VFGaSqH9RaIWw4t4oFMNAMCcc6U51mn044y/dJJjgVXSA
         rmXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783252945; x=1783857745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5a0McIhIuUNT79JaNpSRGf0YZUHjODLAB+1/m1dAtE=;
        b=A0Reveqw9cpd4GM2AHSwLegKI7pRvb/tIldUUffURyvsqg3b2Y9j2cIe2mKwH/dOfd
         l/o2ByRgpmXlOCAcpWl1/IFNe10FxFzfhO7VjxP0w9CVa5ZtwyBR5jW5jL/EfxUmajkI
         fTuwzHqw2EwhJFltslutF3h1J7xwFvsPrDjvIDmP+2qFL0Y6CAGKAV/cVBDNbxMi10yJ
         VFbto9+/woVLkNtc5Le7xBWQhrpQhVzUz3tmgDvm0ODCHmhxOb+90YE/XO3XiQKLhU88
         K5NDY2iRLvIfflZHM1mbYqykBkP33LBaGNDlf+PtERHSkjjFxZLQMOm/CkW7WMOH/McU
         h4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783252945; x=1783857745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5a0McIhIuUNT79JaNpSRGf0YZUHjODLAB+1/m1dAtE=;
        b=C+eNZTuIDjojI0jE6Vs1HTuv4u+P/SHInGUSggBM2RZz56eVNeIWh3zXqDtz2KdMHc
         bYofNp5QU9Ncuu6mO6EusiR+PacxU/TM7MvzqiZQ21Joxpt+u6zK3myfJACjQoT8ffkR
         qtuW4TIwrxzhfWIdL35uBZcqb0RNtxyVsFy5R6aE/PlRJzznlZsChMakXrCM3pPeCL1v
         pB3eZt3ljU9/YCWN9/Ebq5RTh/GN2F8247bbsOehaVkE6q1lhMzgUOBcAxn3oIdpKkYW
         eWgZHmogllSlSSabRSQHxjqbUrxNoGrmN0PE893pK0JJP6jB1uQXYW89F+y6rG7wo77G
         WAUg==
X-Forwarded-Encrypted: i=1; AHgh+Rry3tY6DlW4TmqzUB6F3h5nqsedXOfAMdN3aYfytSn5Z3mxs6ZBh7yAV3z6iUcggnrURZK7b/Yb4N6M@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNdjfNKAiiWWtRzWiGUPNkEhM7JTGLp+MtiiO2IQ0chjGe881
	+L8MkHRIGdZiu5Z0cyDKNK/n4gJCkNPhtgu51cAyVu/jtlqj2xne4UVF7ArKljldXZhlFcNYNSM
	puOkQE6m2QvmtagPKvSRxwL6mi36GkUo=
X-Gm-Gg: AfdE7clm23r8PPKYRPUzPBGmEyKlE88nfCPli8UwqN/ku9N+bEvvIVIiox/hVbl/KkP
	7x9phqxNbQBkb1pLKsf1YfH8WqQk5RqzzMo6/I7bRoUZEG59fMSVFP+VeU0xz1seul0RJy+tA+v
	dLvgGr8nyjmlDhStWM8bnBG1ToKeraIFT2EhnkX3jG6bPDk3wpEmBBUdorqNQhxY/2C77J4iR4v
	SUzWEotQ/Z/2QctbwVW2/GEIceB3/0fPjED8m+b7omz6z2M5r4oqrekRRBecGnzsHFFbxY1gmyy
	mzYPb5wBZreU+7CjOFx2VV0jaFcxU1qZ7Y1i0gTTonYMQq88ViKRzu/jTkDZemaYI/ILz+t7aZ0
	WnSOBMQSEmMhl
X-Received: by 2002:a17:90a:d406:b0:37f:ea8e:ab79 with SMTP id
 98e67ed59e1d1-382802bea9emr3784565a91.2.1783252944589; Sun, 05 Jul 2026
 05:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net> <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5> <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <akkGwsQg1k5ZfGwa@mit.edu> <dc3c0e2a-a3fb-496a-ac82-fff849b8ba78@I-love.SAKURA.ne.jp>
In-Reply-To: <dc3c0e2a-a3fb-496a-ac82-fff849b8ba78@I-love.SAKURA.ne.jp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 14:02:11 +0200
X-Gm-Features: AVVi8Cdo6tGDxPxw1qffyi6BRv19yR153BRJW14OayP3M-7ntM-PwZMHIsGcHTs
Message-ID: <CANiq72nNz6Xo8yu0nyC3OLAJiAA9A86a7Ku59YX0GD-cVwJnGA@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Theodore Tso <tytso@mit.edu>, Alexander Potapenko <glider@google.com>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org, will@kernel.org, 
	longman@redhat.com, mingo@kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 1:36=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> My response on that proposal is
> https://groups.google.com/g/syzkaller/c/4Y3zvo_t_lI/m/jqRBCN5bBQAJ .

I am aware -- I read the thread before I replied. I was asking what
happened after the thread, i.e. what was the outcome, if some more
discussion took place elsewhere, etc.

> In short, if trees with custom patches were tested with as much resources
> and many patterns/testcases as trees without custom patches, I won't need
> to carry custom patches in linux-next. But I think that we can't afford
> allocating so much resources for trees with custom patches.

Why? Just to avoid confusing myself: are you part of the team that
decides that allocation? Or are you saying that they ended up saying
it isn't possible to do so?

If these patches are so important, then the question is why those
resources cannot be committed, or why cannot linux-next testing be
reduced temporarily when there are such special runs going on.

> I have carried custom patches in linux-next and it resulted in 10 patches
> for https://syzkaller.appspot.com/bug?extid=3D881d65229ca4f9ae8c84 where
> "#syz test:" did not work. Since remaining bugs are no longer easily
> reproducible in linux-next, I want to carry custom patches in the network=
ing
> trees. But in general, git trees are not supposed to make "git reset --ha=
rd"
> changes.

I don't follow. If it were to be agreed that linux-next is the right
place for those tests, then those patches could simply be extra
branches that Mark could merge at the end -- no need to `git reset`
the "normal" subsystem branches.

In other words, just like you are doing with your branch, essentially.
But it is something that needs to be agreed upon first.

> Therefore, I am using my git tree as if "quilt" for making "git reset --h=
ard"
> changes in linux-next tree. If a kernel config option which is used for f=
uzz
> testing were available in upstream, it will make easier to manage custom =
patches
> for temporary debugging and pinpoint-blocking stupid operations (like Sys=
Rq-b).

The kernel config option is orthogonal, in my view. That is, even if
the option were to be added, you would still need agreement to add
random patches for testing (including discussing when in the cycle is
best to do so, e.g. last time you added patches just before -rc7 which
is about the worst time to do so, and which did break rust-next).

Cheers,
Miguel
