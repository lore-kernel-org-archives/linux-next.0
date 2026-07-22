Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AEA35E1D4
	for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729987; cv=pass; b=iVn1PIqXoBTGc5EXC+rOm/c8RUMcV6XXokEAfqlzwsxwVKWu5bBWcod69SLNfOG2hWcyLqwzTTZ9o8Lkvj0PhVGXS3kIncr1O/2MZWCOt1JzFASg4SlqwA8tDYfAoTtVwANz6zN9NfqY/Dso+zUJM3RjTyfis+UgtSAJ2dHoeWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729987; c=relaxed/simple;
	bh=wmDaJE7TdORIm0TIK1Ty5C+1XP1frR7ZH1BORcakATE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tk7oRaK/osfZtB4viG+36a2xd3OKfyWEBAsBF9sR427io7eVZbeFzFW3gQglvNIBztYjUG59ZOZiVUkIQI0TAxj0s71iPb36SUn1iuqbwVXrSDHNFDwscRo9CxiTt9A0PcEScAhYtJEBh2nOiTWWzndz3gnYm2cGsgn32wAcjGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fq+qu8wA; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fq+qu8wA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso13986623a12.0
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 07:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784729984; cv=none;
        d=google.com; s=arc-20260327;
        b=Kw5AC2YBe2u+0ckEVElDKF4xkyvK4hwxGs21x1Xi61/q5iKBYoRqx2MVZw+6qIpOms
         ZUraDGFHthT0TcyKXVDxiRq7xsiewfo8Q7M9CnrFDiG/I71htmo0vm3QVUwap5ya7SVf
         pvoOne61a2/5u0TE+wcY/eAUT/0akT/7unHPLyaa9Tjry8AYF0WFExDKORa5exQsb8qh
         h+Jf87VwKfJgVMfvjNjpek0XOPjdlWhoKClRchYiwzFM9ZjFkU//zv9+rMwvWdci9zZu
         J2qGYek5b1TV3513K+NuA2FFP8pTsZ8oK+QgELlLv5Pj2qtMvzzrtzw4sHFy5E3OhNLB
         y9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b3E8d7WAhoP8pb30OsxVPGLHFLRePkbLmobiJvp+11Y=;
        fh=+9OCQaLUpaP9BykdDcEPeNmoyGZQPXkcj8auYu/CzgI=;
        b=MjP5YHhMJnkc4WUENRTDRD1rMqBohW3VOtnk9+8k4vSji/p9w9PYprguzBgNQh0eTy
         zyo4dZ9Wjxu7vh0+2+xdvoxWny3SJ4L//BaxIE55bat/UVEUlDowNr11YdekNcLcAc3v
         Cs2aSEtTpQ3aJ59sYyn5MieXiBUvIshpH7xOm2vPW1hXwSiimuEwGTyIyyeC6tEAhE97
         zNv3kQxj3HrleyPGTqi2AMkSEFuL4IzgCdToIeaCAriQs6i7kwLokDiGP77pog7+aOv5
         pJe62yZWI0W0/ybUlbTcJgOMKF2hxHCap9ualKNhlwNZuqymUBeKWFxCli6y9fVGOp/C
         mZ6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784729984; x=1785334784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b3E8d7WAhoP8pb30OsxVPGLHFLRePkbLmobiJvp+11Y=;
        b=fq+qu8wADAa2XMjyS1y3qXjttPlTOjnd++3yybRezSwK0kSbaHFLj2xN/u8PNWEk19
         rlozhmXvjXaT6OTjyuLuiT+aRc+HkwfB6jGefQqIOm0ZTlPgABrwho4kiErpwja9Cm+4
         Lr2JN8WZSJeXSc9CFyX5X6X9fqi1j5SOv1ZLkHHucRjCSShqMHybsAH6ec+2jUD7awPe
         hoVy3dza1BPghzybSoRJ3B+uc6Q0T3kZdFNkApryF2OqHq8wKZMFB7Pb2mrpCvU8WOG3
         lWLsIg3UgI9m3cyeaeT1Zwl+2x6rop5pOAegOk+yaLkoo+u+3Kpqo6hKHtWRDid7oA2b
         /8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729984; x=1785334784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3E8d7WAhoP8pb30OsxVPGLHFLRePkbLmobiJvp+11Y=;
        b=mzmxJfeSshyImh57cygQMeAQWJybbkIrCSNLq4n5MYeAEQVZPKU2GPT/4TYXwUm6ft
         hQ6hCU1DMunJonc8bLlLXajY7mmQ8hW7ECXliykltlJc+FGEeacTVnYdAHrMHKUyH+zZ
         +4DhezqpnRzQM+diy6FvloiUR3kQVli4vdHUrmuLrswHWltGVe3apN0T3YWHPSiLAxwG
         EsLy98ZgR/I933wcTIIpjHWgHXxTTrMPhnFhUkNwwDE4Tpj2r07W4/Cb05Fx+J1+SAQh
         8MTRZs3qOpiITWZRuNvjXajukLtvL1hQl2yH2zZIzgbdcizBYqJ8F8kICF7ekSVkNCU0
         t6yA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9OedmJZYHYYY/nOkGjVkKsWrc5rN89EsGG4I4uTepzK00BYLK2a0PcQiDX2cnwadsokO9qIs41aug@vger.kernel.org
X-Gm-Message-State: AOJu0YzV85cCF9LYobipcJ3xaHjaHPNKNq0zQyajxKDZjhtw5bCZdzBy
	mWSwjxtl80yYEOz4ocy1Kt6WP/+NKchfHjD5JTXu6O2vBMQhbcNagBDpDGBxiCbu07M1V/GVp37
	pCwo0UaKw+qVR4Fle6bw8EXWiRjN6tgBd0CR5Vqqx
X-Gm-Gg: AR+sD11jKXP+0G7UupaXHh5mg26j9ABRfpnVgHIVsEZecYgsz8p60/OgNSJ0kyXuPHU
	4XX/J2wqpYUNUNjHxxp41GdB+FU8q5TYr6EwFL9X2C3V9LE3TJ4TZEQdRv0em2Z4omgVi9DQh3W
	Z57oUoX6xfSAXUVnHFuIMTjrlTSbX0ivJg2o1b74l0mE/5w3DkNkjyVM+x/FhyAj5l1cOpdhx/z
	t+Fd8sZ1ih7QHMk58ARvnbcnj+mvczUWlUQ+KZtvtx64a5xc6w5E4gfPypdKkvTsMgeb0fIDuuX
	HO/JxnLrqP43duyW
X-Received: by 2002:a17:907:6d11:b0:c15:b4f3:6d25 with SMTP id
 a640c23a62f3a-c16b46b8b5emr1078056366b.19.1784729982579; Wed, 22 Jul 2026
 07:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net> <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5> <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
 <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com> <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
In-Reply-To: <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 22 Jul 2026 16:19:05 +0200
X-Gm-Features: AUfX_myRNBdB21ztWm0RPH202Ra89y-QpJClxRnaVhBjoKg8UzzBF-fp0SFJiNU
Message-ID: <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org, will@kernel.org, 
	longman@redhat.com, mingo@kernel.org, gregkh@linuxfoundation.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 1:49=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2026/07/21 18:38, Alexander Potapenko wrote:
> > Hi Tetsuo,
> >
> > You can send patches to syzbot@lists.linux.dev.
> >
> > E.g. I ran
> >
> > $ git send-email  --suppress-cc=3Dall --to=3Dsyzbot@lists.linux.dev
> > patches/kcov-tetsuo-v7/0001-kcov-fix-data-corruption-and-race-condition=
s-on-PREE.patch
> >
> > to test your latest kcov patch and got the results here:
> > https://ci.syzbot.org/series/33930a89-bb2a-4c5a-b6c5-d45829d5c94c
> >
> > The fuzzing ran on 8 VMs for 3 hours, and there were no new reports.
> >
> > Please let us know what you think of this workflow.
>
> Unfortunately, 8 VMs for 3 hours would be too little to stop my linux-nex=
t only patches.
>
> syzbot took more than one month in linux-next until I was able to report
> https://lkml.kernel.org/r/73ed3aa5-f6e1-47b6-9e5d-428ac1f4cbf3@I-love.SAK=
URA.ne.jp .
> I could have reported within 24 hours if all VMs (I don't know how many V=
Ms are assigned)
> for networking trees were tested with my linux-next only patch.

Currently, two syzbot instances point at linux-next:
ci-upstream-linux-next-kasan-gce-root (10 VMs) and
ci-upstream-rust-kasan-gce (4 VMs).
So, we would need 420 VM-days of fuzzing to find that bug. Adding the
20 machines currently fuzzing net and net-next (assuming those are the
ones you refer to) would have reduced the time to 12.5 days, but not
to 24 hours.
During that time, we would stop fuzzing the main net/net-next
repositories. Another problem is that switching instances between
different Git trees is not zero-cost; it requires manual
reconfiguration and introduces maintenance overhead.

Now imagine that requests to extensively fuzz with a certain debug
patch arrive every week.
How do we decide which of those deserve more attention from the fuzzer?
For how long should we keep those patches?
How do we ensure these patches do not conflict with each other?

>
> syzbot was not able to trigger
> "BUG: %s/%u is doing I/O request on loop%d in Lo_rundown state.\n" messag=
e
> using https://lkml.kernel.org/r/30ccdd3c-6353-4a0f-bdc7-230ec3bf4765@I-lo=
ve.SAKURA.ne.jp
> in linux-next tree. syzbot could have triggered this message within 24 ho=
urs if all VMs
> for upstream trees were tested with my linux-next only patch.
>
> What I want is a workflow that can test with patches for many days and ma=
ny VMs.

I am afraid the only way to achieve that is to ensure the patch
reaches upstream.

I could imagine a compromise: a community-maintained repository
containing a bunch of debug patches applied on top of linux-next.
But we won't be able to allocate too many resources to fuzzing that
repository (it would be just one of the many), so reproducing certain
bugs may still take weeks.
