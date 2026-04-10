Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5472E3E3DA9
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 18:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844642; cv=none; b=K4QDa2e4wizarS9ZgwLR9soEla98Zq06z6uc+w4KeQzfFHYlG6Bg2oLi+Ti40qgtRvJFz0WU4Yxsdt/oSVzZb7ZgM54aVR91AO/xdfVlstAKuDdtuAXeqdkMTXOTookdzLxQYKcOKKv+L7x5s7KQttld7AcgGVnFjb+vA3Pue7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844642; c=relaxed/simple;
	bh=YIeSssKwb7yUfUPbmAPVEnPmEMs6ZqMxsVI1vvXGt9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pL9S9WzuWFDx6tbZT7VWq7VyfAlxAbcwrSHfCzlC6/dyou/ZTPPIL2KwLD6WSKUgycC01fMEJPfIJohl8xOUMNQg7OY2tNbUf7o2lAWTjXe3XrfD51qh1Sh77TxfC/zZqs5y/DVYQKaVVVj6moeKltE4/O2JA/Mqnorx4KwmP+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/pf3yM9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/pf3yM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF337C2BCB1
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775844642;
	bh=YIeSssKwb7yUfUPbmAPVEnPmEMs6ZqMxsVI1vvXGt9g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b/pf3yM9qzVmW/mdZbkbMmnKj11l189NDJTcyVw7f0SeLqyU2ahAbqMbqi/MsAvXI
	 9Ry1beMizMlYKLDG12T0VAvUWxHPbKAv/dZurIayNdr17cGuQAAy783KGttdsfGTAW
	 oLZc9AGopZHhAu/42GKyNEA8+3pTGPoTDLM4t55mqH6tO89dF2nrA889wT52N41uj5
	 +bk23/QHOtRS96KduFycmSoP9+zv07xjRWNjyxh/zNEJ8qQLAkd2hboPVhaBEYDH1i
	 BT2ubfU6bYSMwLTzH0pysKkxf37OXanAEkp2JPP5Oe4KjKNsBn76QWStCIVXcp+4Gf
	 0OFCIb+Q28Dzw==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ef161129bso1884057d50.1
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 11:10:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRh8BfdVCE7o5rGrhWgiy+LLqCzocnwUg3eKPvIx4oEQ6IIMZqzxoF+mduUoyzzkyM5N38RL+rgG+K@vger.kernel.org
X-Gm-Message-State: AOJu0YzUmVQ1Jv9AqfLnGWZf89eQIH69nV/k7jjZbhMRxSKUbfafVj2M
	GLbN49mNjouOZ05IQncrcDYyJ1DLY5/XA8vT+YgoU0UtyvDjp8pkYQ5Kx4jIaP5V6n0ajMRjqPp
	S+78zbbAkDKQuPh51Ei4UEZnm8m/L1ic=
X-Received: by 2002:a05:690c:c50f:b0:79e:edff:4e97 with SMTP id
 00721157ae682-7af6ee45c6fmr43401517b3.9.1775844641312; Fri, 10 Apr 2026
 11:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adj61MnOca5D8-rA@sirena.co.uk> <adj7sSzHRAPGlVpT@sirena.co.uk> <CAPDyKFq_0+5gu3OEuvXSxnkVVxY4wKd6iHTFHMHJrXJaRkjfmQ@mail.gmail.com>
In-Reply-To: <CAPDyKFq_0+5gu3OEuvXSxnkVVxY4wKd6iHTFHMHJrXJaRkjfmQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Apr 2026 20:10:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLnNtX908s5pLRxHBwF0eZsfbV3gmjOP8iD6mxdiL9Rz3g@mail.gmail.com>
X-Gm-Features: AQROBzDNP0mfUo7n67WJTFg9AdordP4xxWi6qgIj0zPRF2-ckEk--2bNbgf0Z7s
Message-ID: <CAD++jLnNtX908s5pLRxHBwF0eZsfbV3gmjOP8iD6mxdiL9Rz3g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pinctrl tree with the mmc tree
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Josua Mayer <josua@solid-run.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 3:37=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
> On Fri, 10 Apr 2026 at 15:31, Mark Brown <broonie@kernel.org> wrote:

> > > This fixup is very quick and hacky, I don't have huge confidence in i=
t.
> > > Indeed since making it I see more failures due to devm_mux_control_ge=
t()
> > > not being exported, I have a hard time seeing how exactly
> > > devm_get_mux_control_from_np() is intended to work given that it igno=
res
> > > the np parameter and is just a straight rename/reprototype of that
> > > function.
>
> Linus, if possible, I suggest you drop the patch from your pinctrl tree.
>
> If it's urgent to get this into v7.1 for pinctrl, you may pull my
> immutable mux branch from my mmc tree and let the author of the patch
> base the mux change on that.

Nah, I dropped it, this patchset has had many issues so I just
backed out that branch. We will move this forward to 7.2.

Yours,
Linus Walleij
