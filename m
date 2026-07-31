Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C438B379C50
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535414; cv=none; b=Z/D4t9jMDNYH/dUxxm1ulM47oqvnZC1hGVb4VhF5Y21Nkf/hRaXAvmC9BXyU2Jvx4kror0EnHdpmQx+hX9W/aYi8JOhRIq6LkF9jKolnmJ5vQGHE/cJ342V1jaP+t3ZFL+8MTOPMzqw0RukqF9YTUaPihJl2FrL/skgTt9JAOOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535414; c=relaxed/simple;
	bh=aHJSiorvNNA0LWJDNwtQ/PwLyg8Fnv5waALDtKjBrVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7SrkssK7rnLl8GPDt6dPQNybQUW/+VKBFL2cLhz3H2i/Phry9JvSeZmVaS1w3nI86uZRCQQXgLDzaILKgwzolewldIUP43OmhQM3+1+PzaLZFUtJbd1PkEyleF2tC2oEwy8Ca948OZHn1ZpFoLmFWNMdN1/ATeemZhzu/FeaZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tmbusklv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tmbusklv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D441F00ADE
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535413;
	bh=0oMrMRPH7764wz9nY2NhF2XH9e4JpPr0wKXVauEEvHU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TmbusklvmfD4+AyzHd/3DxUfgLb9q6276fq2O0cy74QHZ3VlD667JsFYyAjKtrYqa
	 hV+DmBa0b46LCmK2xLkBdmFm10KxGMJ7ClLkfhRmhLX/JUYMFc09DMK+TEtm1aWNP3
	 esoFvXLTIHhPm+FSIVzmJxvwjGhKWma9IcmxTSjEno/OyRBgaL2g98HmYuWegSXrSK
	 QWjjOt3q8Mc1Y9kF1MLDFCnq7zpx6OgF9pw/oS9/1yuAjW0mg/0g0APrY6904NgYSQ
	 YArBEvOXfBcPXOSfyCI0LWYVDcM2lO4hMIAurbIOvTXF325hN8vS3cq0zzHELrbU5x
	 hqghZy+EL8d2Q==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so1541122e87.2
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 15:03:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrsTvJx49f8A3s1J80reuKDnCcGsMmmE7VOmsTKEC9qjV2gwqTcHWNLc3CUFSncuzLZ4hcHx0HRnC6p@vger.kernel.org
X-Gm-Message-State: AOJu0YybnywQ/Ve3fNQOEE60q+/d3gKcAzDbluBk/Ze7Nadaed7UGo7U
	acqVNvB3t7bxsmHcr7EhhOpy3yKiD8eFog6KMmczHJG7+f1CC3dc8rnQUbhg8RdMYUWjlBEBk0f
	vj/PTPq18P3S6YTDFZpuvD/FOpAb4JCw=
X-Received: by 2002:ac2:4307:0:b0:5b0:82d:e90e with SMTP id
 2adb3069b0e04-5b2e4f3405fmr168343e87.19.1785535412420; Fri, 31 Jul 2026
 15:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <32fb10a1-c070-4f0f-bf89-796bb5e946d9@sirena.org.uk>
In-Reply-To: <32fb10a1-c070-4f0f-bf89-796bb5e946d9@sirena.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 1 Aug 2026 00:03:20 +0200
X-Gmail-Original-Message-ID: <CAD++jL=DCXDsJJJ6C5WU2FX_YEHnnZrso_jDGiapTTNafa8Uug@mail.gmail.com>
X-Gm-Features: AUfX_mzjhTC1hzih0Gdav8LGOrOPmqC7Rjd_pchs1IuZhnyRfSVvgTF8q6dmz5s
Message-ID: <CAD++jL=DCXDsJJJ6C5WU2FX_YEHnnZrso_jDGiapTTNafa8Uug@mail.gmail.com>
Subject: Re: linux-next: build failure in final build
To: Mark Brown <broonie@kernel.org>
Cc: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>, 
	Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 5:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> After in the final build, today's linux-next build (arm64 allyesconfig)
> failed like this:
>
> /tmp/next/build/drivers/pinctrl/nxp/pinctrl-s32cc.c: In function 's32_pin=
ctrl_probe':
> /tmp/next/build/drivers/pinctrl/nxp/pinctrl-s32cc.c:1565:33: error: assig=
nment to 'int (*)(struct gpio_regmap *, enum gpio_regmap_operation,  unsign=
ed int,  unsigned int,  unsigned int *, unsigned int *)' from incompatible =
pointer type 'int (*)(struct gpio_regmap *, unsigned int,  unsigned int,  u=
nsigned int *, unsigned int *)' [-Wincompatible-pointer-types]
>  1565 |         gpio_cfg.reg_mask_xlate =3D s32_gpio_reg_mask_xlate;
>       |                                 ^
>
> Caused by commit
>
>     94cb9e8f27079 (pinctrl: s32cc: implement GPIO functionality)
>
> which I have reverted for today.

Nah it's rather caused by
commit 6c53312b7e2d9a972e509f5bac002e169e241eca
from the GPIO tree.

Bartosz do you have an immutable branch for this so I can try to
pull that in and fix up the damager or shall I just revert this commit
and see if it's clean enough to rebase and apply to the GPIO tree instead?

Yours,
Linus Walleij
