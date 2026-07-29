Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0116F3C0602
	for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 07:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309142; cv=pass; b=BPKh58r2vs/jpausjCpE4RJ/2b5R212uA6jGhpiuE/ByieING44Kro9xfjAEilbTqOn1u3LjX2HgGBuufc/NxpybZbyIgyZ6jbaDsmgXwETop2mDgL4p5kXRd/2/z4Ypl0c1vc3RccI40dV1R+rH7dmbQl8Lm5OisidnjSMj1+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309142; c=relaxed/simple;
	bh=D41yv/61LfAQCPFRxpye+PX2WnPP8JxAwAcgbJ0TTmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtzeEWLfyTWYakAFws5c7A3mMCNTxvRxenNS0lxfct+y3R9xvcvQzrmc7NH27tAKoa4w++7fKRE6EnGSMxhB8o79QXWsx1jxLT4M84aRfnATXbSC+wNEfEVluDwkX+EXi6wR7HZBDKJ7yRad3dBUnPfhuCvAEFjv8XxrbWNYgfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLyBN5gN; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLyBN5gN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cad85b7b5aso633745ad.1
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 00:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785309140; cv=none;
        d=google.com; s=arc-20260327;
        b=ZkIXA+qf1L0zCnFzU9fSdpqm40orYVUBGgC5+O2itZoo196JodbNBwvrPIyKLP8dEX
         rrN8xkX5a0suSaGNFsSNz3PLWkAjoBgRoYVOGwCD5I8sAvAN6fpebUDoaZtwvcdXYz/3
         59ApZNiTeNfKQPtgHBHGgBj6DhyF7OatbW3ILRIuKvk4l04FzmLC0wU03YHnknXM4oi0
         6wXpjCNaYAZRHpI1W4rz8AHYKb3w3UJsqAuqxaUM0PXwdJzBk7etdkEckKRqFJUi6zJm
         8g/Bi/b9aBcwdxWbk5/98a/ZUf0zdBHKI6JINVONA9mN6SEgB7dJKu7IV1Snc41aqIZo
         7eLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D41yv/61LfAQCPFRxpye+PX2WnPP8JxAwAcgbJ0TTmQ=;
        fh=S8nD/FUYSA3dkhT9FlY8qfl2lgUbaQaLa2LmrgopKqg=;
        b=r1TsU53wywq1o4mJur3ChdrNojcU9Aeu3n7Lw49g6Puw8F6lun5PmRNhmX0cRX6nXu
         g+WGr3160niAa4Wwy8HTI8z+rbpBNkjODN2Bg2Spe3HsDFbgOWKh2sNnNn9N4PXBgJqV
         eLCPc+77J2Y9r5ageIfYPYtarYZVSO5zSOqi8MZVmJsGzfMso5cpYglngdV2Ve1Gm2ec
         KwhWjk1kO/RgL6FusdcbL0uSYNB19i7AawPGMbMpBAxL0jPc4c9Kdear0km9ohR14kmF
         d61QEEmcLpFjaoxDifY8+/bV7pu4Ld5+U0J/ZZLMKXj+dWreRQdQpSD+tV5JSS2lNwYi
         hiPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785309140; x=1785913940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D41yv/61LfAQCPFRxpye+PX2WnPP8JxAwAcgbJ0TTmQ=;
        b=OLyBN5gNZJLmM/Sp2qlOE+ay7/JirOuHeIC7Za9ZRzT7yQYKUCOCvDchhWf0CjnGL9
         LJuJCSK8orVHAsTw1ncbYmH4j8jGul2Nu8yrB7GhxpzQ+Da1IAd1uFedxZaKqXX2Rx0Q
         2FzqzK3QptWWKxQsspnKtBWv6XH1jal3oBPQlfUvoMT2FCbug7HX/CHofy2cGz2qppCc
         k7aMiuUPpeWSxw2D4ee8gwjGk8x+RoYcyULyjCDaa/XxAu+lREegobeqMcG90UtwjK2D
         ZoZQNP+8183k1DXsdjMVW7K3Efb44p/FsIcyPv36EF1oq1uHW1BRnVmdMnFu4aRINGJx
         vxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309140; x=1785913940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D41yv/61LfAQCPFRxpye+PX2WnPP8JxAwAcgbJ0TTmQ=;
        b=YdKoApXUBPixQq1ehdCeettI1CBi1BtU8mCOLpycukkobIgcKcduK1CYwy/PR4g4I7
         uT4GBTkQLB9BKPcnoIhc4Yp6izOXFZ8O7MBXdVsZ9rBAj3p3UVy7SEgS+By0QvpWiKQz
         NtB6BFbPdWSs06JZFLFxqm/UfUjfNiUM3Y3XuYZj8syqRfyMAKOesWd4iPwdhl5sAzOq
         gsMfyouZbU20R3oLfgoZMXsz9hkgL8sRkhAVkVz7Xha5eAnOxjj96TsqafwQt9SBKzFE
         EIN6vXIZTsZKdArp/8+R7hRc+roJ0vxKYY7HI3NZQhkG5lCM2DaL8KrOy4v8U5n9e44P
         gZnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPqxnkb42sOPei/na1gjyXvcsy/9ELNAgZUWAi2GT1ud/NbAemRuFwEZNdau+lRnUv/fCJPILLjOt9@vger.kernel.org
X-Gm-Message-State: AOJu0YwcfDzWFmuMd97FrKvBteI1fu+A02zY0HDqW4kRxi2dYStqlmXz
	lDs+KIxir3OH27eH3b0P9hyLV5UOz+aw/F4BOBdkKuJYV6cLwpLsDWyTOGLShkq+78zFWWtm9I3
	ADD2dVloOOjNTuuIaqBbBMfKcuU7pTHc=
X-Gm-Gg: AR+sD11FV0gCnMvFeE2PpiT3X67d1HwJIt3UGQI2DJ8zAYutUCKqPSQDIKIOaOSNAAM
	m1nhq0eBy2MzxRIq/k796hPl7vHIh0mL6/Yzqkp/nu32EGtgJy/fAdT56Q0AMJcu/SrSGcpgChX
	ECdGvYdaavkkIiqxzw4o+5Zv9Uuzr8rOS1LG8kmfuq9nURcP+n/6sFX1Uh62FTa0ZH5g4xSCm+q
	2bbgysoG8n2qn08lqogABHl3x5PVsy1onBPA74lp9h/rrc5g8WQd7RPUvWsz5ScwsIjQRaqDC7S
	9pj5nQHQarglp+V0kp9KhJe5uo3gIPaVofIOAlgHvUlfHcPKH1j+HzLoO3zkkoImLMTRAaQKF4D
	3Yqt2E87VzkeH5mWgJ1qXjY09Z9wnULdoc1wGrgahqY+bzh2Mtgw8gPnrv8g+
X-Received: by 2002:a17:902:8a94:b0:2d0:2741:f31b with SMTP id
 d9443c01a7336-2d02741f564mr10031135ad.4.1785309140164; Wed, 29 Jul 2026
 00:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu> <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu> <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk> <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
 <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk> <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
 <CANiq72kcrJw4Kt=5zTN9vvnDq33_4NV4AZ3jHTFNBJjVxmU+8Q@mail.gmail.com> <bff95de5-7f0b-4f08-8ceb-58a6e354ebe2@I-love.SAKURA.ne.jp>
In-Reply-To: <bff95de5-7f0b-4f08-8ceb-58a6e354ebe2@I-love.SAKURA.ne.jp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Jul 2026 09:12:07 +0200
X-Gm-Features: AUfX_mx13MY_bq8Yy8wwhp6s2OBBI52vv9B4KVE4t2c4oxEyJ5o_32IrGF6Oi0o
Message-ID: <CANiq72=yK2G3Gk3R8QvwdvRcvndn=T0e+-jWMAG2TXW=J1M9Xw@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Mark Brown <broonie@kernel.org>, Leandro Ribeiro <leandro.ribeiro@collabora.com>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Daniel Stone <daniels@collabora.com>, 
	Theodore Tso <tytso@mit.edu>, Alexander Potapenko <glider@google.com>, Christoph Hellwig <hch@infradead.org>, 
	Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org, 
	will@kernel.org, longman@redhat.com, mingo@kernel.org, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 1:46=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> syzbot uses kernel.panic_on_warn=3D1, for most of WARN*() users are repor=
ting
> problems that should not be ignored. Therefore, WARN*() must not be used =
for
> reporting recoverable mistakes like -EINVAL. Abusing WARN*() like
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
kernel/workqueue.c?id=3D6e845bcb78c95af935094040bd4edc3c2b6dd784#n5855
> is a fatal barrier for continuous testing systems like syzbot.

Yeah, a lot of CIs that grep for certain keywords in the kernel log
(or that simply enable the panicking) suffer from those, but the idea
I was mentioning is to defer that until the fuzzing starts -- see
Ted's reply, it sounds potentially doable.

It may not solve the complete problem, but it may allow you, for
certain trees or periods of time, to continue your testing. Thus
removing a bit of the coupling between you and other maintainers, i.e.
making life easier for both sides.

I don't know -- I am just trying to find compromises that could help you.

Cheers,
Miguel
