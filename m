Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1836C0B2
	for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796674; cv=pass; b=kSFWBKNuRzjavbBhdXRpqKsGXK0zP3M1njC2jMMufUIY+Paa3TmVqk1F93UkY9Ai5ES90Oj+S6WFcugI8VXrvKCGSQGB3706LqcMCTjqE5hTCL6ddvZCIaBN+tbrSYADMmNLwfIkQRVTCGSJGTfhSSzycY0AKwY7LgaKteQAerc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796674; c=relaxed/simple;
	bh=MERQg1C6IZ343zcOAZleJo2BzWbg4OGEsKEpkWTTTz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/SO0oe0s7NbosfgEsMSkHljm8Mx5tCSJ1FEowbCvwGk5rKFelaQKRfX+7O7K1bxFocjhQdHxw0v8UMI9CtqbBpD9eAkUe99gXN5r8ME0q6fNnvb7kevYtHm0toQKMmxTund8Xoim8jDkYqGLvuKpnvq22BxuQzajzAmUuIZTm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dXC3NoXx; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dXC3NoXx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so515a12.0
        for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 10:11:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769796672; cv=none;
        d=google.com; s=arc-20240605;
        b=ROuS/dtPwiW9jMC5gvPg4zp3gQOk/mkmZpLtf+KQ3PtrHtf6aJl/IiWK1qI4fMbv8z
         Pje2mP0nJcUkW45AE2Hy9ETCj3xL6DgHfc4cB0YdctWHiWU9tXWeUCmvfwfMX8hLaS5j
         cdY7JRFAKZbh30+sSm1TlwXtiFY8LoeSre7wxoxXObNCtP0MK4FcWmGc9p45DKK2gbDO
         Iq1mv/uF7JjjvipDK/SIMYp/IaZDv+qF2F1LaCr+zIbCZKJU5NMVx0y6eTuxtA6mQM66
         AhE6Sx/fSmpaq91imm/xh/JrHuGxIQ/uaEBL3+J9sRf2/8enDW04kZ7B2sffiR6LTsr2
         IMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MERQg1C6IZ343zcOAZleJo2BzWbg4OGEsKEpkWTTTz4=;
        fh=qk1o1Ew13Fy6MC8Ld1pCSx0vznfbhVObCsOyzyOofFo=;
        b=d+BRKHixU7z3echwIC5GEdluIyxXCJAgWhWYJ+yUWj7LYMAfCNVA+4k/QMFZs4acer
         b5hnD9bKgiAAMvJmi98+n1AqFp5bGMCRKWr3H0XlEHdaIuMgGIausr3HwnOJJ3z2fB1R
         TIL+pjhR+L24d2T21BktoGLLSv110MHRoYQZyoDcwjCTDALdjrOIOo36ATkM2Fe2P8xq
         UZnC1MzDtVofCbpbh8Vw1gnvtxF/lG8ZZLvT2hSiMht0fv3E4gFyp6egPOUtWQASGBuJ
         vDq1Ea5SocT7B9d/tXhHB/tg5GbhRn2mjJLYggYHl51sVZr8ual9qRfnXUFwBzWUdiSw
         J57g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769796672; x=1770401472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MERQg1C6IZ343zcOAZleJo2BzWbg4OGEsKEpkWTTTz4=;
        b=dXC3NoXxMqX0tgAWN58O0LyYMi78tRDtjGuIjuM4TXhufqfWKACuF4qKxL48eHhi0R
         wudwUXt+SCorK/WlEKtxPgHP3PJV1kvDE9fkFiva3VXSVXy7mK/PVYU1vaDPYPehcNFd
         okBeAdNOH3JKKUoHyGwbmqA+XMlczVTfXhvg2nOyl0dFXAgQDw1EN/THXza0k/cNUZYZ
         cWZpy72RTKchBgvZ0NGtFC2AIRWL+w83rB4KnQfR3WEUJQKwvoOwK86cqBJQfZ+G6x7Z
         dFcDxOu2Z1Zvb0C6RgNIyy2vxPNLsbNd/hpbx76nQdkmM6qCo5DPhbeCaz/1L0ABwK7y
         WeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769796672; x=1770401472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MERQg1C6IZ343zcOAZleJo2BzWbg4OGEsKEpkWTTTz4=;
        b=KAYUpKF79nZlifEGLTQNd19/neNHt8Lu4Y+7Huw7hMOHdN4PedzaLl2ucEIQQYEuH8
         H4MeBuzZ6POAdd+Q1FMdTgwuS1MGuBiSskSZ8Ns5nVRETrxvBxdDE0OPjNi0/bl8vfco
         rap1N/pyA0tBo3BXxvhbsX1rofZwRK+l7qkQvqEAG9U0ZszLfPfOh+QjyB+84bGl4zjL
         J6JQsfvUOUxmxBr741K6exY9HRRvAy1b7AHbtCPIKYKOAb1SnOQFs0L6hevc14toXr86
         GZlagl4CjulxXcU8VZD6ezQ3ot5ivGDQg0bS5NFm7vwpM4JFTWsa2ISnHisVYE9+0h/1
         U8jw==
X-Forwarded-Encrypted: i=1; AJvYcCVSaSd2IP9WiLBl0pFYybm+vjP2/t7YPm1pHnYZFh2g+FjlTUGpATbkbR4j588ODNjzxGAHg5Yijq8j@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQECSnEoqpsYMAbv9bElv7aoyAQPhO+Q+g9jcc4PgsCw5WPFo
	Rd34NsspWFxREspCH3mL0bmxGfeIzp2cn9SZYnLEy3srvgYroG/S9cj8FpTOgKTw7SN2MpXK2pz
	iLOb6RidBFQgpSdJSstdZVX9i0UNOX6trvUnz6Qei
X-Gm-Gg: AZuq6aLkOjZ0xWy/8DQ8cbY7K6f2sdGZmeksujxhU/d5FqntH+c53xgcv/3Ob2CEQC3
	zh1qjGyf2sAsaGWk7yfF3W23HuASOiE2Rq+733aJPNPV8AXv3MV9F7qjbtSQ5HZ6UvU4Lke8ahE
	IRFXynH8pU3xyRctfztSTc0KQJJY7ThSXV1axiTkR1RVhGVjjS9wA8vxgzDY7YGw4vVzuTsFvh8
	dcNQjg7CBFZ1lDEW3nr3qXOm4WLrtNdr9O2YUcOpiCmHXDeNxskpF1t03HZOAjKR2T7
X-Received: by 2002:a05:6402:42c9:b0:658:eee:f21a with SMTP id
 4fb4d7f45d1cf-658f7cf2aaemr910a12.10.1769796671512; Fri, 30 Jan 2026 10:11:11
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXzoSci8NPhIwDf-@sirena.org.uk> <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com>
 <2274419.1769795849@warthog.procyon.org.uk>
In-Reply-To: <2274419.1769795849@warthog.procyon.org.uk>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 30 Jan 2026 10:10:34 -0800
X-Gm-Features: AZwV_QgSxitGmxVzK1MltqA6sUCfpgWaPz4_Gb7KaGpgwIfUq3mFlfVWdCXReTo
Message-ID: <CABCJKuf10mJnunp0gt0r-5Jnumss5LS1VjN51WQmJgnggE+BGA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules tree
To: David Howells <dhowells@redhat.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 9:57=E2=80=AFAM David Howells <dhowells@redhat.com>=
 wrote:
>
> Sami Tolvanen <samitolvanen@google.com> wrote:
>
> > Thanks, Mark. David, I see the patches in keys-next were updated just
> > a few hours ago. Would it make sense for you to rebase them on top of
> > next-20260129? Petr's patch removed the use_signed_attrs variable, so
> > we should ensure it's still initialized correctly. Otherwise the
> > resolution looks trivial.
>
> Wouldn't that mean having to rebase before sending to Linus?

Do you plan to send these to Linus for 7.0-rc1? The patches already
depend on libcrypto-next landing first, right? If the patches were
last rebased 6h ago, I'm not sure if rebasing them on top of
modules-next would significantly affect the linux-next soak time, but
I'm fine either way.

> What's your branch that is being taken into linux-next?

https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/log/?h=3D=
modules-next

Sami
