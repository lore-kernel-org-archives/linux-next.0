Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870816;
	b=sg1vAZF/Ifo3qebOoi2qG5HeoKl2kpQtUNmtpN2xwt1T0ZU6s+o35/5bq3gYilGQDUKV
	 7V3vg1yH3RS+pruAVT//cLIasnO4aIH2tsiwWlkxzzY4YGLcTP9m/jklCOhEWIEdtl0qK
	 WLPmFL0nwHOs4Yhacmzhvi20TPAVV6ImwM4eBX1Wq7KQ/K8YY4EP9COV+FknQnMmFqWU7
	 VlNTT5wtLzmCN06aae+t6EUQW9O0s0KsTTmaCA3/+ij0L2jEelUi2UY11qVcyEow+JNBX
	 BeQJM4Y+nAOYpCye/3kLWwjzSSlZFrohpDUtBPBLznCMzG2P7lKHA9tNTP0U/zNlcLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870816;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OmfvxRXQ0BHi/BQTK/TG5VhiqB2b9cF2okAg5Dh/I2k=;
	b=sdpXOlBOHHBIVo1aZRiUV+Jw1FZXCGknPAnPsiV8M2RDyViZgGXT0kCkXuwh3xRfRGAh
	 mQCNeQV7ZQfIYZzV9cuQOOKBMQFUh4D/5PJHWlztAff1/GsBQ/i0R8XUtFDtO3ic3CVbD
	 reZRzQMplUzlfGMz9iaBuCY2zWhGpymt+M2Pl2CnUfgdF7RyhSpc+fckVydYKAQyg5oa3
	 0zgz7iqzPLb2EB8A/wUOJahj1p5MplcJSRrSo4rl+dRwMgvLWimF/P50+lNVIM4a3wLjS
	 16uCmc3ltIC4ryObwgWZMM9h2rsU7S52vUO/REda9Kgnp6B87GGycMLttQkeVvmXqng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3EmIUPm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCD8606A329
	for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 23:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3EmIUPm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0B11F000C5
	for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 23:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870815;
	bh=OmfvxRXQ0BHi/BQTK/TG5VhiqB2b9cF2okAg5Dh/I2k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b3EmIUPme11fl9s8JuDtxMD+KcpjIu+fDbakRGpSL6GeX1GGeU2ukMB+LW4XK+raf
	 HZcC7LfhrJ7nATCf/iOfAh5R3pfCrXnkBFO4PCLOYwvwYO+fG2SoWZfd6iLB2oxjGs
	 BotySNGSlcFEum2LCXByJBbrrJn4iP/4g6GEKEJgQRG+Kr4t86VV6eWl5Q3X00hDt6
	 t3GRv5YLR0DtVEd2veD3Hmc97xOHqOl4NRRC8Cbhy2pRrnjYh5SfAaQLyj4KqiqYyD
	 OeBMvTE869MPAQ6mEGIfhtt7a5/BLIyys55dkjgF4IgVZ40jnFxt/l0SevdRajHy1S
	 ewll16ylQwK/A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c08539c827so3137595e87.2
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 15:13:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGe0yd2LwOdoIOZuu1/4r/7XWstWjzNwmu+G/j8sGOPtlUUV/owJ946qZG6D0k3HCZGJmvFJvX5JDa9@vger.kernel.org
X-Gm-Message-State: APuU4Z+jH9Ae9yoDW6kazQU5VxCSK9YQDmGVMJX01Yn1G1rHfj0R0vcx
	HYRMsfo2mwdNq9Yz6+/m1dX/KcB5GScRCBxXN1Lko6FQ80T6nsqL1+TFRwmW6mnHxvoKQZM+vnq
	NnwwLj/adnNEyxIpG4P+H8B2MJB/qg9M=
X-Received: by 2002:a05:6512:220b:b0:5c1:4a42:fb19 with SMTP id
 2adb3069b0e04-5c17075c320mr4769343e87.16.1794870814365; Mon, 16 Nov 2026
 15:13:34 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avsf1H1sTOSsGe6C@sirena.org.uk>
In-Reply-To: <avsf1H1sTOSsGe6C@sirena.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 00:13:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=D-qo9h70QxY0E9Eb_MpUYNVP=RaKqM4hMzU95FmsM8A@mail.gmail.com>
X-Gm-Features: Aa3M54oxe1VCFrM5ItPsNcgXorHb6XWIgHwWrhtrQPXZMDUD97T8sdnmnLqGXyA
Message-ID: <CAD++jL=D-qo9h70QxY0E9Eb_MpUYNVP=RaKqM4hMzU95FmsM8A@mail.gmail.com>
Subject: Re: Fixes tags need work in the pinctrl tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 4:23=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> In commit
>
>   58a755c16c452 ("pinctrl: bcm: Use pinconf_generic_dt_free_map in bcm283=
5")
>
> Fixes tag
>
>   Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic pinctrl=
  binding")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format=3D'Fixes: %h ("%s")'

$  git log -1 --format=3D'Fixes: %h ("%s")' 0de704955ee4
Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic
pinctrl binding")

Is it a single space causing it?

How odd.

OK fixed it up.

There were also two fixes tags for the same commit, strange that *THAT*
didn't set off the script warnings.

Thanks Mark,
Linus
