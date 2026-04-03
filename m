Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC4027281E
	for <linux-next@vger.kernel.org>; Fri,  3 Apr 2026 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224101; cv=pass; b=fEh8OSoGgYew7z0IPMwwoYDTtH9zi+cksCCYGfUKcEeKq84wFFD5bkCM4ZDVbATKSmT9b/5MRlV155fFJbWlGFbr1trOVJJ4d9lk3WmENtevEVJXlxErN2Yk1AWArFczPpcjux2xC2l8HSJxb767i7YVPYp4Wrf0v/209lXVefE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224101; c=relaxed/simple;
	bh=/6n3KCej5MQV9Bk01yyr59P1O7+vxsy+mzauqkV/VeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lp7h1w28AOXYczBQe51Oy3rojxk70I/Kj0Yh2qJxB54mYTsUM7Tffc+1P/m5SThs+qG8SGAiIaGSRoQ72FAowcMBE4+HURzBReDhv/smjRfLLwrOqAro1YQNIeoiEpzkpbjMZsFRbeu9AfNMQJSBU5MvQTYiVvbhZyrGbPIy6jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qbzjx6Wd; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qbzjx6Wd"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bda3b4318dso139474eec.1
        for <linux-next@vger.kernel.org>; Fri, 03 Apr 2026 06:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775224100; cv=none;
        d=google.com; s=arc-20240605;
        b=agi/f2k2UjM24oGrs6NJSfC60IVye5tqwGTsSGxPT3LLRoiGw6W72kbcZ0asnYTbw4
         zMv5egp7wbbxFChsczXfrj1/fNUfQA5GIykTY97RL2kfOLTxn3TC4A+R0VkKheknfClZ
         JQ+ycfXkEMmCSpOJMv03RDH/iD3GkHSslokT733mYv32ityEMK7oQfvit8ptJeho6VBz
         Ph6krzIk0n0VA8iqxm7oq0Pr+kL8XW/FeCN09s9cEtMf9fByLhWB7tnyDb5U9Al0D5mH
         aP8kmMEqTh/6QzU/3GPooZvic3ML32M+CfGLikvbJGJDtL0XUsur8/6PCgxJRaQjj4BZ
         dbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/6n3KCej5MQV9Bk01yyr59P1O7+vxsy+mzauqkV/VeI=;
        fh=Q0ZHX0mYMcZss1D9YMIAvWnTO41151RXrstn2vXpm0M=;
        b=JLkmzou6CQz+3EUruurPHAm6jlQxjVu181tb4achBw2X5JRBg/NPdNfdP0vC6CUweN
         vw7QFh4jZ2G/vaszMnclBQMFCDnK8dDi7+srOUv7G5OHj4UdA+GVunVB2LEyFQOGPYbp
         NX1ySNimC9WK/VxEiq5vY8p8wCJl4z3+oj/H0IW3YGZPpZuWlThxW3MI4pb/RUuv/aun
         agDfU8FNVAammzfGAN2jGkNNhqmhDwBxVeyyfxJ3naqg3M4CWZRJc39YUhx7OGftpsCK
         OyBjzIWSvRyuJh/EO9uTVQv40kxstHd/NK919l4gutm0F42GTIeY8KRmVfRg6hGE9j7Z
         RyHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775224100; x=1775828900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6n3KCej5MQV9Bk01yyr59P1O7+vxsy+mzauqkV/VeI=;
        b=Qbzjx6Wdfgc2uQOA1RDnF4Bm8ntGCT18tNLJFpUNZ2QAThfFyvzfd40JaXqR1KsVR5
         wNVpqib+ILf/QQqWjP08jETpKKcepu+vbDDR0e4VIHro7TIf3hfvLqgBTXpgYeCIlJ1p
         L/c53TedtUfCS93qBbiq+JCUBwkJ/1CV34rRmdioHk2inAZT80WcmJtKMk6jqP3hoCq0
         QTRNcadwaM2DPNqX7DRlGWunfis3XmEHW39dPjTTSwnaZDAw7SAEht9b1lULIuci70hR
         pC45swYJGuOJva99ci3PjrZsUVPZvBUg4P8hMewRFzW4eweUepimxv/VJvdmoP3yLPFF
         iAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224100; x=1775828900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/6n3KCej5MQV9Bk01yyr59P1O7+vxsy+mzauqkV/VeI=;
        b=hTOGGvrsLGRxqImF2ca18puERTXJIAkLCkGG+FUIrbr8UMt+idGGPPARO6Crgr+PZI
         3H2JgwAucpvF5FBea3UX4gyj9A4bbv40EXr7HXGjyHBRxJM4FlYRO6d7jo4IFUlYR7eR
         knwd8b6R/fR3ySbnpwZMOwwC5ZHoIv61eIkXlKDgGTwfmplPk6ITPhZ2p1ReeacSh3DB
         xnXHq/rgvmMwPru5rNQulm13NlNcM+6CBmRsOUmEHHyiTF1nlHhEx4KwAQYWE7UclDFm
         qlt4vavcsT69zEN+m3GdNHbbR5TuaqQqezBuuO3yLDHfROzyPq44f3nvcTysPNBqsEFL
         moww==
X-Forwarded-Encrypted: i=1; AJvYcCWQaXwTf4JL9HGZYvV7dqDgna3bukLOOG99zvO91O6EDaTZXlfgUIaKcJWPIJWRPImfqKtmf8fpQbiC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt7zGQECvJW1DkR+8CKYikhVfGEP5PnAKCDZHfg8VnFlKNukS2
	zMhAK1A2IYTso7HOW9JGuhq5CWF6K6+y04J+PpiT5USXGVpIuH7V2Ptclymm/wVzIKW4v69GtB+
	T2q0yAj1HcB2CEtRvfML9gkvQgynovKU=
X-Gm-Gg: AeBDievdXZHIHoMS23YMM8nqtdp05dhMAKIHv1pFBLU7FcPa06p3s3D7uFS3NVqYrml
	Cgc49HpvvJ1zs0jCi4uDNz8xHw5OSt3RkeKwACz1LViuI7NXGcODBpbLR+F2lPmbYsOwvy48w9a
	ttAR1GfOHPWmD+8qhEQvK3x6XX8K71rkmzorg+EoT/okaLZt1elwrIPKGms9bVgvY3F8+/MN1yP
	jpSSGXhFoD0mClgtVFAuAg6Z7sqRUxlgl2GwzYG9PT7nVK+sJmw+Z1PgZvDvXXwjba98Nf5vmB1
	nxedUO5/c9gZBu8CSXWWIMxkA0jrUj/S11ZAWpgeZJER9/tfua4mW1O2hpYnFNMvm7MI1f8IRro
	+7WVyEPAc5h7B1TI/2TFH/rpPa8Hfqd02Lg==
X-Received: by 2002:a05:7300:e8a7:b0:2cb:de38:c76f with SMTP id
 5a478bee46e88-2cbfc16ec47mr691086eec.6.1775224099687; Fri, 03 Apr 2026
 06:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ac_Byw5cYys_lJ1a@sirena.org.uk>
In-Reply-To: <ac_Byw5cYys_lJ1a@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 15:48:06 +0200
X-Gm-Features: AQROBzAgNLu3FVO2WbjFWnkQK_cV6Im7CR9MS8OnCMhCDor77Fm_bOLi5ArJBwQ
Message-ID: <CANiq72kj+NdJoEzoZHXs4B=y1eUFSmQwkYmNBuWjqQFg3pwfhA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the rust tree
To: Mark Brown <broonie@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 3:34=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, and I will build the tag later, but Cc'ing Daniel as well
so that he is aware.

Thanks!

Cheers,
Miguel
