Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D57F361969
	for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 07:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786606333; cv=none; b=oq9zA952OlNi04fx12ZfEvkIwrGiJHYyEIdQZuRI+2/I0hbK/P2V3wlHEoT9bs/UngEHq+0l4L4fwUmnxsyKAo2gXnIuSW9tXgd2ly42GmDoU0qwCK6f5AKkjqKOyzz3z6D7WQdM0La9FXrqf3zqOj9HSD78HNFve5VShwsuiqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786606333; c=relaxed/simple;
	bh=L6VmV2wHFw6fVMQWJXA+ZVVfLl5QtAuk4TVYMI/hbhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJ41/dDbwAjLL4zwt8Fyw5Qy5wjThlBwfB+ad/GandLBk5S2Bks8CQX1cIWfyp3NGUO1jaYMClN8HWFkkOTnsrjuS7dLtdj2DNt2AE+ndVQLu9/+OfORhmZSqtoKCcJt2LImukiFmkL5vMbuinL0HiTfhHsMbwRYPFKLxB7FxNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so241510e0c.3
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 00:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786606330; x=1787211130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQ64i/mh3N/Us8b3ePHrhZ0GoeQMFWgUccEYmGi/yd0=;
        b=mGh0UYZeraIVzXZuf9qO5nIUOd77of6TL4KWmOmAP6c6VUPnLdpMVgtPwhj15wA2/1
         JGPKDS7RgUHTNKW+ug40FPvOUDRgjJBtnZqA7a7yHxOJR5wahdI+JKfKd0lHDu9pDwTg
         d2J+Rtu8enrP5u1ALm4RU2JSiBfQBQyWt0YI84hYfbDlSpNfB6swUBwUnpO6E7C8kkCR
         LuYrxT2eYLlXFdEojWvQ5iA32jYfI075PtIJg7ncsz+ddfTbdkc6FyHhx5ZQWT9JDD6t
         sRjdZ9QrmJ88MuwInLNB/te73vhK1Tk+2DDefJeQojqrtvZTNhZuGqtgEOQdyEZAVAoz
         H5lg==
X-Forwarded-Encrypted: i=1; AHgh+RrynUZC4lAqEwn0eDg6zHaPaXU5XL/xUEv5pmKsFg3oRY31/Q7Ebfspm12R5/45fMx7LUPVdxhRlY/V@vger.kernel.org
X-Gm-Message-State: AOJu0YwslHZdusTdyGxfLvL3PXvfaRCMUFGVvNI6EzSShEoHUOAiuZQQ
	UUQJxu1fpgdUTD46Hffq8U8+xCPNbgFYRba2M18QOHm3oUBjWpg6vfo0uDnYYWy+
X-Gm-Gg: AR+sD131KunZWvJDV9x1L2bN1mRSFHaa8TW6asfhi41nyer22wAbDNFbHObyhKygkiJ
	cvQl+wIQ9Lj90NcSjQ9/8yjsEZjlbdtfimbaUPe4nwYM3YmDkBFjpeN6js5bekRvHSxEw5h72gY
	ojsIosRRMaklnUt7EBHjPETXqIXvZDZTbWK7sdjHoJnbQkBQMlRzcslIabL2rxpTzjmTDE0TPWp
	ZT/wdl2zmZNt5wyQzYmciqxd6cdlUucHiPDBPUh93MQldY9jhNXTrSkQhuCH7k1cVjx6lFknszW
	rUF/Z8y4CJIS0USnYGA7ksfy2/7WBb3HzWXw2F/ACzKQLx7Ye46aZiGQNY6SOoEK+BE+NPm/10E
	KO/9t/yMiWqOFABLDQzVsAaagIm3Ro8PjXqjbvaz1MoJ4Bodl66a5DpI3wD5ulD1KA/CJhEKmxW
	52C8rHtinakdlksW9C57sP0jNhz1pLkfexRBH5LOluxpvGx6GuekFCeISk2mDfVZ6vrNlpNk8sN
	Y+H8itXGpGIJqUlTXL0KcrKLQ==
X-Received: by 2002:a05:6122:8b16:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5c5799817e7mr598617e0c.2.1786606330556;
        Thu, 13 Aug 2026 00:32:10 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c57be75b40sm477595e0c.14.2026.08.13.00.32.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:32:10 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-73791ee3612so230815137.1
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 00:32:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqjR300RoIDjDxeJmRhDaUVf3WWTYy8CTrXzf+5Itrm9d24gdsDN3JuYkG2/tyB35dlCr2qHty+NcZN@vger.kernel.org
X-Received: by 2002:a05:6102:5547:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-76db5b7eabbmr1166492137.5.1786606329697; Thu, 13 Aug 2026
 00:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxTFWS4KAMqGNGT@monoceros> <1a34c486-2fb5-41e3-991f-23bf82468412@sirena.org.uk>
In-Reply-To: <1a34c486-2fb5-41e3-991f-23bf82468412@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 09:31:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEejuG-Dyr4DXgg3MhtDY6n5cDYPotRiGXeSGv0AcA+g@mail.gmail.com>
X-Gm-Features: AUfX_mxlm1llwIHAv5dHtSvB3E8Ho2ParcaRRIkn_9t7lBAuc-2zpmmyfEuSEDY
Message-ID: <CAMuHMdVEejuG-Dyr4DXgg3MhtDY6n5cDYPotRiGXeSGv0AcA+g@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
To: Mark Brown <broonie@debian.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>, 
	Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, 12 Aug 2026 at 18:44, Mark Brown <broonie@debian.org> wrote:
> On Wed, Aug 12, 2026 at 01:19:05PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
> > > Any other ideas?
>
> > One thing I recently wondered is if it would make sense to not merge on=
e
> > tree after another into the same tree, but first create pairs, then
> > merge two pairs, ...
>
> > The advantage is that if commit B breaks something there are less
> > intermediate trees that don't contain B and you can still test on e.g.
> > D+E.

Sounds like a nice idea to me!
And you can put the trees that usually cause the most conflicts in
the same subgroup ;-)

It may also help in bisecting an issue.  I have the impression "git
bisect" on linux-next (against Linus' tree, not against yesterday's
next) shows me more "a merge base must be tested" test points than
expected/optimal.

> There's also the issue of incremental build benefits.

That should be more or less the same as before. After all you're
building the same number of times, it's just the changes that are
reshuffled. And you do use ccache, I hope?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
