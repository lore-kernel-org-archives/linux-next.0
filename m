Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1529235A385
	for <linux-next@vger.kernel.org>; Tue, 11 Aug 2026 19:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786476737; cv=none; b=nMM9NftgOo+EvQTLoYBGN5zbGiWp+39jCH9472qK8BWw6oPXpqlgB1iEqRGNGJqllyckc4HXbY1q6L+dgxTB57D4s5kN5eB9tqWAkN4vt67QbLFYVp7Tpr3+U1niB7ovt3BnT8l8Nkz9CjuXtc3Hu/Xm7OmGc2kZ1+SEoZuUDMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786476737; c=relaxed/simple;
	bh=8sXu92IbswWFhdVnXtiUMswKltcBL+HinntoBxpVHYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=speJo9QpoDRWmMkgYbhBcpcomRJouiwONUH6M15dPk3q9c8frxc0ecF6hbmqRmAnMRdkzbzdSoJgn9ZoAHBMEkbmrolcMM5Bax02GlOQ1DAtWi9Z1HadubO3jXGU66KcqMUg5d2nyt13ErUR+xzOHUH0S1+qjW6/s8+njhLDHMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so92786e0c.1
        for <linux-next@vger.kernel.org>; Tue, 11 Aug 2026 12:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786476724; x=1787081524;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6dxU6rP+//DIRi/ippTzhmVJSz9UFoWNDvQlc4klwCQ=;
        b=ho2fnZ1b2XGs3hiKRqbNb1uwGABAW65O4XWUmbRneAESQHwHU1AOwKpSzfFeGgMhTU
         gdCOjybdyZEagZCINWkdkdPUGeD3VFw2qSOiibtqRfwqRmiCnlSgugVzKgb4rDbZRxKP
         hHu9ESezEAprJAEYyZWK0O6n1E+U9jjxAyA+rNp+5G+ZdPnCt3GnLse253Oo12bNm0+v
         YWBeDJg8UY+ld0oc+jskxkulgivH8Y4llj3P0IhpmSqyxOE3tWMhbR6wpcUjyiqpeGKy
         gZ6L2hP2Got8LrnqGBMspPnL8AAnxdxulSlJrsvuCdVNJg7K7kgcN/LLo00Aezdcsed9
         6jPg==
X-Forwarded-Encrypted: i=1; AHgh+RpUBKRSPMYD+RYtXXkWypf/spiHjRo8r45b3iMYNYkI5nfyEpmsfA/pf7MlnblA1cp4X/gJgv5onazq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwzd2NMMdSFiEkUumuuwtCTl2Zn9Nj7QjSgjWXzvM+d5FIwPvH
	GfkDNhzdXzDXtGsN13tcgo9qKdmoiXBdU0aP8t2kwcLcDKr4/agPuBG/HZoUqY/o
X-Gm-Gg: AR+sD11ojITiwi1Is6Vm8AV+zFxlcyooWsY9hF9TGylZpihBAjMZbplLSbXRgfAYqXb
	Uq6I6D53Xxrhx084RAPCpZfKKmBTbnisgsnpwmgZREuAINgfbRTVgZXKrRNzKY/11EY/cbqmmBA
	JJ1bTneIH9z2mdansVfu4JdaWyK5jjy6cxdgkIlIKUWM5c2LWBQELyhnr42aNmAutdrzD4aXCSV
	v9cT3PVhxflEeX+fqP1rRWOsv0bCQ8ijDMC8midBXsZJ6q5J2f9hMMKda/M7bOUL/xFiSHBQVwg
	zRnsKE9FQdQOa5Vw9UZHv9X/EfgaFJzWy8bznZpIbJ76CD/Q1VCxDBaKeqD2qgpBQjV3fonQpjT
	3gu/ss1j3BUF9Br9ZYNoAxBQVfRJHnZZ3RanCKo3wEPab8Kx6qSumnioPGtltrVpYfyK8ZPA8mp
	nutwUlzO7Netxkz5FkvdsUhY7jbrE7yiPb5UgaDzm/xPhXatsR4ZZZwR7BBYMSDaSmIyEQ0IUzG
	jVScUK1nieEzls+H4VaWJyFxw==
X-Received: by 2002:a05:6122:218e:b0:5c1:31ed:157 with SMTP id 71dfb90a1353d-5c45050123amr866302e0c.13.1786476724522;
        Tue, 11 Aug 2026 12:32:04 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b12affesm379816e0c.0.2026.08.11.12.32.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 12:32:03 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-74748e3a4d1so77081137.3
        for <linux-next@vger.kernel.org>; Tue, 11 Aug 2026 12:32:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpZETbCMwGNs0VGWPSP14hv8cRR4e/BM5H2+3/jhggAX3Vy3muKdcdC+DuVTSQ22qzV/qaCwmkNf77C@vger.kernel.org
X-Received: by 2002:a05:6102:5f04:b0:74d:cef6:af78 with SMTP id
 ada2fe7eead31-76b5598e33fmr1625891137.7.1786476723540; Tue, 11 Aug 2026
 12:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
In-Reply-To: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 21:31:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+L4ETtgYtmovtXWDSLuAT82q1PLYn9JwXswH0m5qxKg@mail.gmail.com>
X-Gm-Features: AUfX_mziC06PKWgCBftkgZ_Em2aRuwDQ3gIZrRcp47cIrrphe5thKj2xx_2tvgc
Message-ID: <CAMuHMdW+L4ETtgYtmovtXWDSLuAT82q1PLYn9JwXswH0m5qxKg@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
To: Mark Brown <broonie@kernel.org>
Cc: ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>, 
	Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark (et al),

On Tue, 11 Aug 2026 at 19:16, Mark Brown <broonie@kernel.org> wrote:
> I was reminded by some of the maintainers summit threads that it would
> be a good idea to check in about how things are going with -next and if
> anyone has any ideas for things that could be done better.  I've flagged
> this as a maintainers summit topic just in case but I think it's quite
> probably more of a list thing.
>
> Mostly it's been business as usual, hopefully I'll get better at doing
> merges as time goes on.  That said the list of visible changes I wrote
> seems a bit long:

[...[

>  - Started sending out a weekly summary of the state of the world -
>    perhaps there's extra stuff I could be adding in there?

Thanks, I wasn't aware of that!

>  - I live in Europe not Austraila which has messed with some people's
>    schedules.

If this is the only minus point I could come up with, then everything
must be working fine ;-)

Seriously, linux-next is working as well as ever before!
Thanks a lot!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
