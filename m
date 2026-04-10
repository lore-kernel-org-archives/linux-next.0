Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ED63DF015
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844717; cv=none; b=gM101lnXdv70NGWPqMJUTcrILIkqipSiEC8zXTOatBbbTb/LredshIvsonQ9MpnM4Ruq6EZraLWGv5Mw6yKKD7P316fguoMp8AzCdA/axSLTN/uApCZoVFiZ8WhYuagIrTFV4hN/SChGY5GG+tX7Zrltxr3i87np2i/ckxCxVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844717; c=relaxed/simple;
	bh=F5aoPhGlIl3zAvdKTI5BJ3PDwA5OP678GzsszRrGWuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0AYyBj9LrugMDoQf+/y2QGv06yhSeRI8cqV3zX9KwSvlRDFpmlqmS6cdyOlEheXeRvFLQLDZteA95cbEHPYFyv4b62rZrWTZgZWrKdSneDI7T860bJjIOZYGy60vjtrMjjBRgjoYcF/CjypvD4lAGXVYx3TuxJvSgGaQhzFwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRMQTWog; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRMQTWog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F126EC2BCAF
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775844717;
	bh=F5aoPhGlIl3zAvdKTI5BJ3PDwA5OP678GzsszRrGWuk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cRMQTWogWNYK8QsEVWrgZYyTCsONlwdcgFg+lKjkKyp31na14Uy47CjKLD17/wlnR
	 iXKVsi7OEOZ7cUX/6yWA3S0hhMVJRHXgRSL5g1CJtoqokEthJ67cLLaUJ40ppfa8wS
	 B7C7lKIvyXqsBF4KsTVTWk1bbGt7bvz6Ly46XNGq6tG+2AD3vsON5JPTQLpLCiDr1y
	 aUZfD8J33mIkXmVnjUSSOlYsD91GvTtC3N5qmamkMlGq/zpmZJ54hou1dNA/FOlztd
	 jMfq2k4YKvZiX9RsSDQiNJCSZ4iaKVmPlB1u16q1VMwJRHDcPWE9iN3Z9OyA+ssD67
	 8L+AZL9SDDvZw==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6501e465a8eso2591388d50.1
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 11:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXl99jCanvyT+L8N/g+ghJJpJzAjcKPE9KfMEBMAKUxvveFAYi1IadT4pvOG7StZCOADLvByDdDSak1@vger.kernel.org
X-Gm-Message-State: AOJu0YzSzXGTltVx4v/D6yk+bsFXW4ZgkZ6DAnM61hVIzIBaa4LfAorb
	Bfber7dXluDEmE3OOYjMxeWhMC8K3o8Gf3PhufZx3fLco1Zy7OSfHKzjwfASn6Ju5Ob4kAHVexC
	u7HfCdn+FL1xWtceeXocG7P+eBCK9iWg=
X-Received: by 2002:a05:690e:1488:b0:64f:443:8f8c with SMTP id
 956f58d0204a3-65187278f83mr7093628d50.45.1775844716367; Fri, 10 Apr 2026
 11:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adj99f9oz7Oon5nl@sirena.co.uk>
In-Reply-To: <adj99f9oz7Oon5nl@sirena.co.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Apr 2026 20:11:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLkMArkh9AjhZj6h3Yebx1fLMjon7N=n9Pec9dsg2rqnBA@mail.gmail.com>
X-Gm-Features: AQROBzDWLiftkfFdtu_xCqOoNOoHhNsQVR146Q7iEPX6H8dTGoI9GQJ4aEYlu2w
Message-ID: <CAD++jLkMArkh9AjhZj6h3Yebx1fLMjon7N=n9Pec9dsg2rqnBA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To: Mark Brown <broonie@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 3:41=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> After merging the pincrl, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: modpost: "pinctrl_generic_to_map" [drivers/pinctrl/pinctrl-generic=
-mux.ko] undefined!
>
> Caused by commit
>
>    62f97854fd4bf5 (pinctrl: add generic board-level pinctrl driver using =
mux framework)
>
> I have used the tree from next-20260409 instead.

I had this merged from a separate branch so I've just backed
all of this out.

Yours,
Linus Walleij
