Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040BB30C16B
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787039097; cv=none; b=lk9Ar4r7iqJ3r6HT2zb/PJfHhF5Hktquc0w9t4KRJ/xd0RatJ+EXljHSrkcMYag0qzBq0t+Wh7MpzcWHexDwy+AglvVdfjrW503afrhQen5urFZZrzeBkD1HGHCEa82opAghRpXSRTrmSUc4nG5kodUDOOaumW93MTY5T17a+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787039097; c=relaxed/simple;
	bh=Iej4eU5W78oziB5zm4NfwEF1ium/94tlFfi6eWFUw1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hftAp3odpzfGlulFPBLr0cjXNQAZcS5YQWK0IyRVHFAFbxQQVSVOgUlgSOGYl0BqGfFppTMddR2MzumL+gBedcN0lhF11LkBCz21HVevq3ACopyWbcfXh/kU9gFKA95noHEhL91tUowLjeYwUHCLI97DNh9CZy0VOsok6THjDmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c30d9adfa7so1437550e0c.3
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 00:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039092; x=1787643892;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vIQdH00bLKUzNocHq++D7HzcsBQN8QHWHN9amRSakpE=;
        b=jWdpwq830rb9yjVSI37p/63kSpFZJoUWFPPN4uUpTEN0+vQF2yhVxs+CrtK4lNU4uW
         M77Q9uwzr1Ehb1yt3YU8tvHAgl5ciui7OVwxderoBrMt0UpGD7a10WH1soAUw3qH/o02
         1U6vgJ6xYYHiCSm5OTrlrkRr2fex6x81s1REdeIe+WiN7jlypHC++YEpjfZWqi3HTGr/
         4O1Pt8QnUo5Nhb4TKJt4jrDUAaKSUzGm/sq5b5MOegTzYAmH9hdEx9J5bFLEsAZ02Ywj
         cioYzXPY74GhxP/7LexLnpjlUDRWkszN6I6lTwaj915tzlhBdyQQ6OaAhkOk0vR+YexN
         V9pA==
X-Forwarded-Encrypted: i=1; AHgh+RpnQVuk5v8FbhpRoFUXZFX+aBs0yKL9hly9m4d50aHPmQFdg/IpT8WKfwexdM3YDoRN0V8TFMqrOOfV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+TRWbaXH7IsUc4iWfL5iM9P0Kqy6AKMGiAAHg2WSpxSPS9NtN
	erA44FhvNbDfWrCCtAENZY4Os54aHHCMqOwd9SuYGVuFo5GQFDGl3S1Kt4kinWpq
X-Gm-Gg: AR+sD100Ur/fqZhJ+lcKaCIjOxNLEiT534QzC8BCguls8CgDIX+fhDWcoRPgCDVMTXO
	d0vDAQtSH4xdxEbw32Kl0ozFwCaFI5nZEkthivcqShgMqXa385+6w0rVq9lCu9tHlU03orxElbA
	Yp3tj7vqARNMFeMovo7dxSLkA1mWE41xObKJkz5But5FBgdz3ZWX937AXTAz92sqdzXaMWvL/LG
	QyUkUcmayJJyrnED1JW5PzwQAoa1aktxKmR/M+3LuGpYH2KY3U+nrqUtWLm0IYSqSILT6ZSWaPW
	pni5tXCU7H1WlA/IrQ8UV0ZqBXXXv16hjWQbB3qIuAQz2p9NClyucFqujEJBVw9rtoix7SOmaFI
	zNcUGZ+UYGFAO6gUU4g9GHWoD25dYuq7KGKSe0XSyi42RpWHhwW1AoQhE/VMGfpi/rNqoFDKzGZ
	O2F7wf6PquKtYprlHrSaddwqahedEeNGa7bNpRHvo2NiZ7WttMUkRDz0hzLKv7ZWvwncblhPgE7
	i0E4mSiLOtYwsOb58yGQOf6V0M+ZA==
X-Received: by 2002:a05:6102:5124:b0:775:369:4671 with SMTP id ada2fe7eead31-7750369a6e6mr697578137.4.1787039091950;
        Tue, 18 Aug 2026 00:44:51 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c5089913sm2866680137.8.2026.08.18.00.44.51
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 00:44:51 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c2c0e261aeso1214331e0c.0
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 00:44:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpmxgL/2bJGbVEINRLbTvu55aSErT9hUUuKzG1Oq5lyFl7llraAasZmNKEwpAry5vILRYB0Omctawbv@vger.kernel.org
X-Received: by 2002:a05:6122:3c48:b0:5bd:c27a:dafd with SMTP id
 71dfb90a1353d-5c591c4062cmr6183693e0c.3.1787039091069; Tue, 18 Aug 2026
 00:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <anyjJ6DSHWCjuB97@sirena.org.uk>
In-Reply-To: <anyjJ6DSHWCjuB97@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Aug 2026 09:44:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgoTR-ThkUnbjE9tOH89FwXRChZTY-tu1q9QY78tZDng@mail.gmail.com>
X-Gm-Features: AcwNN1VWkY6H3Fxugs4F-nml2llKqZBADH-wv_PyLnWNaEq_C4m2brkOjyw2ugI
Message-ID: <CAMuHMdUgoTR-ThkUnbjE9tOH89FwXRChZTY-tu1q9QY78tZDng@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Alex Tran <alex.tran@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Wed, 12 Aug 2026 at 18:59, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   drivers/gpio/gpio-by-pinctrl.c
>
> between commit:
>
>   67ff4bf723c8b ("gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper")
>
> from the origin tree and commit:
>
>   408866669ce01 ("gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper")
>
> from the gpio-brgl tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for your resolution!

> --- a/drivers/gpio/gpio-by-pinctrl.c
> +++ b/drivers/gpio/gpio-by-pinctrl.c
> @@@ -54,11 -54,11 +54,11 @@@ static int pin_control_gpio_direction_o
>   {
>         int ret;
>
>  -      ret = pin_control_gpio_set(chip, offset, val);
>  +      ret = pinctrl_gpio_direction_output(chip, offset);
>         if (ret)
>                 return ret;
>
>  -      return pinctrl_gpio_direction_output(chip, offset);
>  +      return pin_control_gpio_set(chip, offset, val);
>   }
>
>   static int pin_control_gpio_probe(struct platform_device *pdev)

I think this is wrong: the origin tree has v2, while the gpio-brgl tree
has v3 of the same patch.

[v2] https://lore.kernel.org/20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com/
[v3]https://lore.kernel.org/20260810-gpio-pinctrl-output-set-val-v3-1-8e35222b5c8c@oss.qualcomm.com/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
