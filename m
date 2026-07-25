Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD63806AD
	for <linux-next@vger.kernel.org>; Sat, 25 Jul 2026 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784972337; cv=pass; b=K4bq8UUwVZLf+tNgqs43oz5BGg3Xmm/3h2hrr8jV/xXlIXReeOI5xTyVyUGfJFq3jp/QQF1F8lQibIUqUiI7BOEEIr9Bztx1MXgpohJSvTSGG74mBRy6FSZDs07trwxvXR7JJiigyrq6crcVI5IEcobF8A3asCkOGtmZafFkVCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784972337; c=relaxed/simple;
	bh=L8iZ38Li4PIrl0dsK30qPrGcLt9oxQxRBY6dx+SBomM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b95QNuuhSaWbA4Eye+ue8Qr2nrPxTqS0xBLL7v2nddAdgk+IQ1tsCR+VpsngTjNjikoVcGWq2deJTJBksKzut2eGequeCFkm01hoOVCrKKf2C2KU011Q2BrO5tuhVRiIICUTbsp4AjjkIADQtu5Ch3ndL8hQXjIC0zhjaQiv1Hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kg4paheQ; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kg4paheQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7a269ca1so2586365ad.3
        for <linux-next@vger.kernel.org>; Sat, 25 Jul 2026 02:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784972334; cv=none;
        d=google.com; s=arc-20260327;
        b=VoBVNgYgMnh7Ze5VwWWK6v0/ZHWol77hNuxm1m/dViMUiNekubybBLQQrt+n8h0YBH
         ppUrGMX8el+pfPg+pzOYsnAb1RlWhzKRkB5x2zjXay4iRw1TTv9tYr2/YiijZ5/lgsGR
         G1cl35QRwifxsPTjQh9OoGzIsB0A4Exxxvo+QGBO3CLKu+RUhsMLka9NKZULXkLmfoW4
         M9n7HT2DBzm8iN2VdA67JoEDEnb2FgJjBjj6hc7kn4nlOgNkf1fWRKgfDZ0SZZzJ2LBc
         gTNca8nbYs38Wu3mY2xRFmSaneUknttT3jJNBrbAgo/1ZUtokCFW09R3PCK8FLhZvivx
         TIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qzHUYCyb+2Nl9ORS3n0AtzpAIgRCAzd6AE2/52CumuQ=;
        fh=dRWJRqJzd4y78jo4DYbcQ/5YdDepr+DPGgReg3D0/c0=;
        b=k3OLOj7OruROmZTnZY8p/B/DpcTwj3KOYtuL5IEDDjPWgtUvc6EdElDnYDVIJt/3Vj
         ONYKPuzk0U/s4SCtKJtw0XYLd3gg6wHCPmpzOIaSOqcYWUY7IepCgYEj0myfldRodr3r
         BlbXkXFy/6F7WGKr0mBzYr0hu9ps9vKVLo76BYauG+pyRsf4ZN6AwZCRklChO4ddchfj
         GdcLIlJRppYUDKYcdqyzXHf6Vf55c1FLoukUcKHSs8z4i9Q076Eh3qEP9+06FBR69m1E
         u+6CK+j/Zr5ZXYpk3+spBiUOHntcOLzdnH2EyAkuF09F5+fPx9O5PbgxkLR5vr94ZnLK
         QfCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784972334; x=1785577134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qzHUYCyb+2Nl9ORS3n0AtzpAIgRCAzd6AE2/52CumuQ=;
        b=kg4paheQ0nawSVZ/13yVuRTgrGEL0yTrai8xTjxx8w5Z0sdNrOxe9wxI7pDaPUxeXt
         8zy419cLuhs6ZL5kbrqJ/a6HpmiCI4gmGSNCyIYhPtd+P/wrTdSAVQOzSjt5trkoa/GX
         87p/uy/5ReBbP6R1tvSJwB8rH60o4i8HRtKkNsXYob3sNtel4betJ+YzOMIztmipmqfn
         3U8nIcj+zKmQUHOU0az4MVCvkj94xOOXP+Gv07UMiM5CafD759sfbCbnby6iKCDcolXG
         419Cq2i9vsIuRgMZ5mD9V/2gZrO8epKaqOBoYhWOrkWjat4c85fRVzPU4Lp2UZyNzwAl
         vc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784972334; x=1785577134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzHUYCyb+2Nl9ORS3n0AtzpAIgRCAzd6AE2/52CumuQ=;
        b=aM5yIzuWAH2MBvHCK9sEXjWItzvMJqh+fT3qxf3Dch8y+QoT4rL2JHFe7uqBtbRGMD
         AunmF+EBqUjxgOeq4ZtAj4bDwapXKL6gidb/ntwBMiLIzPjKWNaMay6fQFSGKxuJ7bgL
         tI1p1e78HrMrpjfpuWa7f1zEL8u+rgAQwIw6DzR0V5xEKPSKpS1RiZ4kxOQQa0Dvk3nb
         FL7B0b4KPhirbYz4d9IQQuyQcHmV+cEpkDJi8FZoQBUZgihUZm0nCeXg3vqXXDPIuN7v
         pw8NXH5sUKYu+ipyVf98/HW1fiYMgD5Q4li/wSvmCtA5nhpbrsbFZcV3IeajTjvA5uVe
         xTfA==
X-Forwarded-Encrypted: i=1; AHgh+RqaS6qF+qtwZXqNPIReWc5vIzrpRFjAHv0yCJngd9KNUwt7maw0SixxVjNdCVN28bSGaD96NVJyiRFt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4aJ6bZj3Q3B3ceEDxv+iGQ1nHBAyB/q1sjCDWGzKdJ99go9Hh
	RHO/WgIbBhsjKy4e+RouKGihWi+M/OdqY2KU4iQHaOvZ+4nfWMZWUSChAr3uN1w9rEHqRu8edTh
	h8YpqjDPabqzF7spAR9pgvqNYa1Nd8rE=
X-Gm-Gg: AR+sD12EsKpcyGgBQwL/MfgvYkfL8uomsiZv0C5x7nGd2XEhzQfLC9qPsCKOUP4FZLF
	yxLXuhK2W6NtFN7vzjZI7dHy61v4h/o+Wu5TV6MsxYcOnNr64c5A7iFpIWjjxYa1M8JEO/3WWZs
	NiQkbtSykb5npxtBnoSoMLITOO7U/DOpfcfHhzX0+hggOT5kfRKQrDnEdU5eK14IELNo4Co/q9P
	J4jo6cG2m1wuzF5cYuCl7MjlSs0ioG7BSIBMWHA/DwbsNRHV2BBH3vNn2VXkFnxAQPnP4dRaPud
	hPqkoLlz7waSSH72xChRe1+TJ/r5nPX6P4WGqPc5LFfoKckwn/RsS+MUHz3hF29+AeP2qrooln7
	cQg==
X-Received: by 2002:a17:903:2f84:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2cfde689443mr14383995ad.1.1784972334529; Sat, 25 Jul 2026
 02:38:54 -0700 (PDT)
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
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com> <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
In-Reply-To: <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Jul 2026 11:38:42 +0200
X-Gm-Features: AUfX_my10vRNgqwL7v7DI0htjKfUDET6zA8FPnfOmyYHpCR6siwhAfoagAf2MCg
Message-ID: <CANiq72=QFc1amaeoX3aceuQQCYbpkj_qb7bQgfGj1CRa=+NcOg@mail.gmail.com>
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

On Sat, Jul 25, 2026 at 5:44=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Excuse me, but what does "successfully unit tested" mean? Broken patches
> that do not build, or trigger oops by just "/bin/cat" _are_ arriving at
> linux-next tree, which in turn preventing continuous testing by syzbot.

Yes, there are mistakes in linux-next all the time, and those mistakes
take time away from maintainers. Which is why adding more unexpected
patches makes it worse.

But, really, that is not the question at hand -- you say:

  "my debug patches won't be able to find a route to linux-next, which
   in turn prevents us from debugging."

No, what prevents you from debugging is that, from what you say,
nobody is giving enough compute resources for your task.

linux-next is just a way to access some resources. Which may be OK or
not to do so, but clearly it was not in agreement by everyone nor in
alignment with what linux-next is supposed to be so far, and that is
what I pointed out, nothing else.

Cheers,
Miguel
