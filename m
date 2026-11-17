Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907233;
	b=OnlaHo5zhc3uv4HgLUrwgGwZfCLGJXydc4O7Eh3PbKGi9g1PyttufmJhrVI1UkXUR+Ro
	 ShCvXM4QMLeSI67nv6xe2Knw82gxp+5bkjckR+oVvWm6ixnBaWZhnm+c29cMd5jm4YQzL
	 cGZMjzvLu7f5kVqX2y/NnHcayj0U1ycuP1pIL+YAJWgBvPXXzQddKtV1iQk0qHprHXXkg
	 0GYvjEoRHVcajIteUFn7k0kSBQcpJbHFVQdurwW3V20Iqsaw+24y7aXzFOrtC4ewAchHK
	 DobtAvC24FB2YJjDlh+lesLEivZYm4JbyQj2qK+eJMe0vfHJI1zW+gi3XPEeutsRLQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907233;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=YxyWb61l9bZpPKlQ2mqo+AuSKiMQlhMQ26ZWLgbv6HE=;
	b=u2JTcPZHuKd2tKHOr8QZ96C3E7mZeBZjwocTyebgGv6uyhCJuv7ySAh924MC5hTcKWCS
	 7ifNJptDS0rI1LmBVZfhTfGeBe2k5lQw5c/816YE+ZXF0XllwVO+NNsd6mqdJk2P4rHj5
	 Be7OCGfUaQYGZ+JQNr4HNgQ5R6Phh8yznYYBZg7HKJe8D1h1nG6u24hYWw9EL3ByJK10N
	 5rkdXD9qSp7a/0w8LvAUGGkyLSNTUhCPH+XyYtQFHzwC51qff3pKC/7pNuMe/l0VzP5ZV
	 nEbz7WZtPTFa0PaIGRUL6KbufKOwdsz4m9KHGa3MUhPI3pmfAPeNATdrLg79kzKgzRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A9606A331
	for <linux-next@vger.kernel.org>; Tue, 17 Nov 2026 09:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65A9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99071945aa7so3179229241.3
        for <linux-next@vger.kernel.org>; Tue, 17 Nov 2026 01:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907232; x=1795512032;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YxyWb61l9bZpPKlQ2mqo+AuSKiMQlhMQ26ZWLgbv6HE=;
        b=0VyttsNmSc8DuOa1Dopx22zvQ0R6lREMNGOuVQvow797bEIAbMUy6oU7+oqHcL2zYH
         ttgsDT0y0Q1ZF2PghhGfugmTYEkMNlLH9sROCcuz5yKjJbLyiqNe5jY1Hf8jotYGrZGA
         4qZdJYwvaKGD8aCVMhrSoVybuCcWUzQ/qnQE1TteyRMjPPI4Bsf+YTMTfkqLUPNYEhSH
         FAg8JsVLqkW8bvk5UwAbuiJBIaFNZrySv/GI0yfcuK1G1zlaqFhDBadsPuvmx9x7h3/E
         /rbzhJYqVlLLiuw/GnAbgNj4/R3yOmX3w5WphZ1Qivs0wkp2MUwrSCbFyylRSDyCOyO+
         sIXg==
X-Forwarded-Encrypted: i=1; AL+hErFjoKWyZD5JaKDuRCyITtXMJv4v+fCfKHfrZRomcgaCvIPhX1Z0CowxIWNzl6TX/x5HWnqlNw+SABbS@vger.kernel.org
X-Gm-Message-State: APuU4Z9lLJ7RmAQGBqZDqp1Y0dpx41ArW0uMhex/9M1nnle1kSpRb+Sk
	SNIB2WqKmkcJVD//4oFaa9wGhMH6Oo9Sl00qM8zPFBqI1DojNQkSvU+In613YGWN
X-Gm-Gg: AYBFou0MehZAkouMXPjJd1ri7YeEp9LV8Jik9IYPoyPqO8Peck+jDfGR74FMiDdgWnx
	QIl7xku+R5eG+12w1OgFvl4+QRjwdXzyyiXdwqIYNCNs4dCuPWPB9pL1zotp/6p5y8sjRKkTW0h
	FGLPGQ8AFK0D2C/BMC3R0OEqLumtuCwF6zrUn7SvYUBertH2lc5D3QqNpGCJdejP+hjb3D1vK1n
	ejqxMR7CPRdDS2kj4GT88xohvSZF2Z7qgozTGeIeVDx4D2EZE6kRSeJEJRcxa/c8Q62QOtxIbs+
	rL0Onf/g9WW409CFCk7GVOsbFugcflpWyDjO+GtFhfiBuqN+uNgRkjJAl/v/Qgj9NnDKto7tEeY
	yqUaQDObgufrJye/D7FFrgkWl55cC4KyMU82Ctu2KhRwHzO9My1PwBnLvCpwsVGI2bZ+jO6eULN
	nOdI5eJlRiCx9eeO2RbHlCSpuK2dBXOPQzI8IBef0mLSr4ZgOtvNwaljkcBXRsKHnqGu1DL6vO5
	5jyKkFgIlHhNfUlHS5XUpc/4x9Dwnw4qcSHLvXGyq94o9sRqT8V7Nn6H2DJ9ESTi9u6I7A6VSpv
	yB/maWT/8UQ1yAF49Cn61C85P3JaU6Bz0iZy+DjOse+d+CwjuFYm+yBc1NuIOBJVVWg=
X-Received: by 2002:a67:e111:0:b0:7d2:7654:86ac with SMTP id ada2fe7eead31-7d64d47658dmr4172739137.4.1794907231573;
        Tue, 17 Nov 2026 01:20:31 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69dfa2e66sm1977065137.3.2026.11.17.01.20.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:20:31 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2da166818so3269965137.0
        for <linux-next@vger.kernel.org>; Tue, 17 Nov 2026 01:20:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGoIWYoEwXAUahmQkhYsnss6rUM3eXnN7O4jh8uN5P+jouuRR7mINetKpKip+TtVvIhpNbdoYvEB32m@vger.kernel.org
X-Received: by 2002:a05:6102:54a8:b0:7cc:26a8:e716 with SMTP id
 ada2fe7eead31-7d64d78cb41mr5011377137.18.1794907230719; Tue, 17 Nov 2026
 01:20:30 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avG9T_NrXRjVDgjh@sirena.co.uk>
In-Reply-To: <avG9T_NrXRjVDgjh@sirena.co.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 10:20:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7hahoo3OPkA1XzVrtDH=AYFqSuMvut3StbO=PKjOYQg@mail.gmail.com>
X-Gm-Features: Aa3M54rvviiSiYUNpCwRJXk2f2O_bmZMXY6_kw3Tpa7INoLk_tUjtbybsex3TUE
Message-ID: <CAMuHMdX7hahoo3OPkA1XzVrtDH=AYFqSuMvut3StbO=PKjOYQg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-memory-fixes tree with
 the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	Kees Cook <kees+treewide@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Mon, 9 Nov 2026 at 13:48, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the drivers-memory-fixes tree got a
> conflict in:
>
>   drivers/memory/fsl_ifc.c
>
> between commit:
>
>   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
>
> from the origin tree and commit:
>
>   a78ee2e05f7c7 ("memory: fsl_ifc: Clear fsl_ifc_ctrl_dev on probe failure and removal")
>
> from the drivers-memory-fixes tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for your resolution!

> --- a/drivers/memory/fsl_ifc.c
> +++ b/drivers/memory/fsl_ifc.c
> @@@ -207,15 -210,15 +210,15 @@@ static int fsl_ifc_ctrl_probe(struct pl
>
>         dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");
>
> -       fsl_ifc_ctrl_dev = devm_kzalloc_obj(&dev->dev, *fsl_ifc_ctrl_dev);
> -       if (!fsl_ifc_ctrl_dev)
>  -      ctrl = devm_kzalloc(&dev->dev, sizeof(*ctrl), GFP_KERNEL);
> ++      ctrl = devm_kzalloc_obj(&dev->dev, *fsl_ifc_ctrl_dev);

"*fsl_ifc_ctrl_dev" should be replaced by "*ctrl".

> +       if (!ctrl)
>                 return -ENOMEM;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
