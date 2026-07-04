Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8E33EC
	for <linux-next@vger.kernel.org>; Sat,  4 Jul 2026 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783166819; cv=pass; b=rxt68puKuXsyEqbHP1Hl1wEBxRP5HB7TaaRC9NrujEaBslBUL+PURxOrgQXvO9uDKts/J/Yp6lfEMteVEy/zR/pGhi53UB1nOvGjaz1ibxAmXk/H3hvxUWOBi1xFl6Mz7PV7oK44oHAeWML17qQTqa+O9UJsqQ/WGFoO/0TYUmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783166819; c=relaxed/simple;
	bh=9iKlwobacLF+971+4gbWLor1Vc1A5uZkYJ88QNgDoB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjUO9a/oMH7qqeBVGNtGUhHFdQhEOu+QJ0+5892xzQ5Gpcb7AKf/BmI53c51xe7ijKVfEacYzokTZ6g2eTXW4COYnbN8se97qxZZvnKtvJwZ2OvqDEQmKp0um3YifR0JUMxvKnNBIRVEZJO6WYcvGCHeLFu9KbmBiH1dY7Uad10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMeD4QH0; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMeD4QH0"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caa0551d8bso3939295ad.2
        for <linux-next@vger.kernel.org>; Sat, 04 Jul 2026 05:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783166816; cv=none;
        d=google.com; s=arc-20260327;
        b=eZu8q3QVOFyz2Zxaw1ZNA8z1yV+UQEMau9b03dEx+kybqK6yL/UfbOqy3m3UX3bBgj
         E4h7f7WcT4tsZ3qsvST3JOImwXoYRsHZ1Bd4nPTAikqa3erPFpA1yZxl7+iLSVI94+p3
         9sTyqQsnG8ssrHkC8m7dNcoAu3D/RxGzyjrWM7uUgj9ncQMnty1lvG7WORLoWxsECpZi
         HRj851qVG4q9rwPUPIbhiKxA63NEhnRzT80y3oqrUVVAq7oGC/8rzTlX6KXArAg7cOZH
         wUzcW66LB8icTBxqo9MQQKrvKKgR1PBt+zgPJIQRHuvDHVgZKLheW4e3FcuG/xh3cPsy
         dhZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LrC/vAlBny/T69F62PkAhmY0enbqgAJUBmm58BDDMA=;
        fh=3bAlhm1LDFzsGY7aO8pQzYVL5AkAHEGMeZANNtD4pzs=;
        b=iAVZFtokSAcc71j0chmVTxSbkmga/Y7TSKWerFtwRmOqD6miwzM1suQ9Wa9FhYaP9b
         zhGRCmGk4EYxo+3Su/WDcd+lcCC2JflA3Vnwz2MFjlBiARyoqMB/ZyVjVoLpVDsN1VNh
         nXxkyO30+QqL2wMJJJhGnN3pQfNBCT1xME47rFyH4RddoinL+tOhJCbdY5Yl36wO8O34
         LAKXHr9cz4gLu/kLiWhDHS81dBlT5gRojNrdBlpOn+uuynpEMdysPzsjHhr0M63UVZ11
         IxI/zpvl1iSrtx4+lnMqPfWAzBkDZLcVQKviTwDxjK2xr4CrCOYBUB1JQK5y6Q1MO8zK
         kfVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783166816; x=1783771616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LrC/vAlBny/T69F62PkAhmY0enbqgAJUBmm58BDDMA=;
        b=YMeD4QH0odrg8i8vgZYqUuG9Ky45c2rGIhmFcmEFYPzv1wI9v9+h+GEtwCRqeZ2UFe
         i+aVN+Jj2aJNor2qQMFGIbCxYL7BrBvOXNxxAiVbE/4S9+eTX7enARLVJSXbEiwodF0N
         e8pEgKQkhQnL6kKepYWli4KbvhKo2pa7aGsXxOQV+2TBos1U7EemUJnO34MUNry2lJOE
         eq835VlyNtKsPrt/kRW7qC+KjW+gpPbR3VWPfb3v6vf537mkOnlMWTphrnXxIoC/GhSz
         MltfF4Aea5Z2VD5E3HW2k5l1KMrfaAzOB4ZjNjFbh2JbZiQGCUanhou9CBv7uR1zvdIo
         5b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783166816; x=1783771616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LrC/vAlBny/T69F62PkAhmY0enbqgAJUBmm58BDDMA=;
        b=DVDeErB3Dpt0Emd9uiUG+SaPA2KvIxOnBtllPtbFD+lL7ZO0dnduJ1pKXFVQHp2e3C
         VPnwUWiTvS/V7nAldimOquy+Zc9SVSEYjMpnZQN7sHnpeEhYGbXD4s46UUJkAq31QX/G
         /lnBM3DH5219/pjtqgeSQl5gpngqJrQeTyyMKHZ66/ful2rDTSJArKGtQdsINmpf7odP
         lgwhPpa16TR7xD+rvsGJNmZGfdQNjVATiM+MzPUajNRR5JQn5Kf35ObgZ9s9SWBIg3ML
         Aj5qDvrvF4u+koXgfHAztabt1K4uV+WOU5bk9X9pXFEXqUmzMAuQWBoi2BRp+5c4rDEM
         woVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXvM49MpVfW/aw53T2FRHNCHGYYkggo8WuZnvBR9ycWiARB5v1xHZ0emLjjkUPaw7+3Z47/s2l1jCG@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTWgHcJZi0N+M1MsrtISsndFnRrTlyjhYbgLwSM+LUIFuzwWi
	+Ol1+nDQz8NxHQXjVTOG//WVEko/AeEKnX2RrMAo9DHFBujeOgaYcZSkkh6vvFY/fKMvcYu9G/y
	wZq2cNNKloe2ihFyLNAoUm686uk4qRxg=
X-Gm-Gg: AfdE7cnx3PQvtcvIOhAfCCB3jhiVqM91+IL6pEwHq1b+/j7KvSXvNVrzPZ6pEllkapb
	bVXdjvKHdPbMdB3WYM5e66n3QCcjzHbXuTsywHJK5iPK0E8xQ9ki5CpANCR3TRlATFuMfQdegad
	IZjK5V1i+1adrM+Y4308fY2ilomav+Jy84SBoFpFadkIuKJ19OP0iKeBaF4pQ4FOViFuDPnkf0u
	GqxwcFJNnt/3n7oxNXiExOj++zldWgJdxU5tTV8YptTjPT22vJSWkbEROgr76jbpxcCtgYprWUY
	fEt0F76VS9tK3j4XyzLQDVHRZAfMTSojxYm5YBw40BsXJD7bj/guWGdF82bQNRcuPUGKb91DK9E
	PjUAl1GWIYZ82
X-Received: by 2002:a17:90b:3c91:b0:380:7688:fc06 with SMTP id
 98e67ed59e1d1-382a00c393dmr1939916a91.8.1783166815700; Sat, 04 Jul 2026
 05:06:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net> <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5> <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
In-Reply-To: <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Jul 2026 14:06:43 +0200
X-Gm-Features: AVVi8CeN0NxX0ZLOJRqhkKDxHsqq9U2h7wqzAkcu-6flNW27WVBFjGlMVJO_1R8
Message-ID: <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org, 
	will@kernel.org, longman@redhat.com, mingo@kernel.org, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 12:15=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Basic constraint is
> https://github.com/google/syzkaller/blob/master/docs/syzbot.md#no-custom-=
patches .

No, that section talks about two different things: patches that are
fixes as well as temporary debugging patches.

For the former, it just says you should talk to maintainers to land
the fix. That is: you need agreement from maintainers, which is what
we have been saying.

For the latter, it simply says that sometimes debugging patches have
been added in the past to linux-next. It doesn't say it was done
unilaterally. (And even if it did, it is just a third-party document).

Critically, the section also explicitly ends with:

  "One can also always run syzkaller locally on any kernel for better
stress testing
   of a particular subsystem and/or patch."

...which sounds logical to me and is precisely what I was asking. So
to me it seems you don't actually need to put it in linux-next.

Now, reading the Google Groups thread you link, it seems like your
*actual constraint* doesn't come from syzkaller, but rather that you
want to use the compute resources Google allocates for big trees like
linux-next.

I understand it may be nice to use such resources, but the solution is
to talk to both sides, as you do in that thread. From what I see, they
even offered to add a mailing list for those patches:

  "Aleksandr says we can create a special mailing list to test draft
  patches, so the series sent to that list is fuzzed for some time,
  similarly to how upstream patch testing works now.
  Do you think that would help you to debug these issues? "

So what happened with that? It seems there was a way forward there,
no? (Cc'ing Alexander from that thread)

Cheers,
Miguel
