Return-Path: <SRS0=dKUF=VG=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE05C73C41
	for <linux-next@archiver.kernel.org>; Tue,  9 Jul 2019 13:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C51EE2171F
	for <linux-next@archiver.kernel.org>; Tue,  9 Jul 2019 13:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlotDVqU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfGINUT (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 9 Jul 2019 09:20:19 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39018 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbfGINUT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Jul 2019 09:20:19 -0400
Received: by mail-lf1-f65.google.com with SMTP id v85so10465945lfa.6
        for <linux-next@vger.kernel.org>; Tue, 09 Jul 2019 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GKRMa+Kxr/0AVlCfTGD8ya+QzV6VZBsG8RNlbGuSaXU=;
        b=NlotDVqUGttPOKvpca7ffuSwOx3mdZOtNeefjZVANPbNjTeMqB11gYruAonGJzIBCM
         KrMoIrxmDSXxiWsQeMmMPeC7qDoIT51QuBBn8IXkxh5rNnLMDhcIPP4tqHMu8XkH+40+
         0ikv6AqK1ccSNRtpzQvMT/Kyz4Xa+NNKJw2Vd+k6px6HvtvizWFgfzfbjeBOxJEiBTNt
         GJvwN6JUNrsi480Qw3w6B4JePL/Y3h3Q5+gE+q0Lxktj1Mq7z9BVJNRW6Wd+YFz5qymK
         T1wLisEIRPDBJdYhN7PfgFpvFbF8tOF+eJJgq+4XeAKA7NsK/7xIZ8r/TKdhiOjKYCn6
         8yEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GKRMa+Kxr/0AVlCfTGD8ya+QzV6VZBsG8RNlbGuSaXU=;
        b=rMDeW6kKRe7QdQxxie/tC7KdgEEspcCl5YmVO6rJMQIwb+Rko8uk00bqmAN7fioaTK
         Hp1kPIHFHn96o9JYb55T+DX6UsnAN67sCrU+IPKiNDZ9KEMuRfXZLKg3GCSs03SU7/iS
         TSPVHrAsTNx106ZKOxt6UWQHaqdxsrHx8TG61CGBfFWlSUwMQGsYVr3xKHO2FjPwLh7M
         U3Ds0JirJEkqxslPN7Akyvf2NRgTL2/gz1BzPQ69t3218sdHpuxgc3GAp3YngMHGTsAE
         oK5EsWip7Q0Ey0C8gbbfPd7aeWUXKL+DVTC7SR+evkH6uZzOaiJypzMjybynYimtTzxm
         Kjdw==
X-Gm-Message-State: APjAAAWvPTFykF+AnAo+aUO9sBXxYGqtdrzzuQgfZlLRFp9JRzGYQ19p
        oyYAzAjTH45JgRbgLMnOLYSi5b4yxijuaMbOA4rVog==
X-Google-Smtp-Source: APXvYqypndextSv7lD0G/DINvYDcmg4OLd7rXOvdO556BBK3HPFwOKmfetXYHPn7V8VLnu7Riy6N1iNhpUYiWdIHbqM=
X-Received: by 2002:a19:e006:: with SMTP id x6mr11338723lfg.165.1562678417264;
 Tue, 09 Jul 2019 06:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190628172807.4ae7edfc@canb.auug.org.au> <20190709101557.3e950748@canb.auug.org.au>
In-Reply-To: <20190709101557.3e950748@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Jul 2019 15:20:05 +0200
Message-ID: <CACRpkdZHVGUamcVfVK_-0G4EJ6S0tJfZ1YULGMR_pg7WPfBM6w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio tree with the mfd tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen, Linus

On Tue, Jul 9, 2019 at 2:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > Today's linux-next merge of the gpio tree got a conflict in:
> >
> >   drivers/gpio/Makefile
> >
> > between commit:
> >
> >   18bc64b3aebf ("gpio: Initial support for ROHM bd70528 GPIO block")
> >
> > from the mfd tree and commit:
> >
> >   db16bad6efd9 ("gpio: Sort GPIO drivers in Makefile")
> >
> > from the gpio tree.
(...)
> I am still getting this conflict (the commit ids may have changed).
> Just a reminder in case you think Linus may need to know.

Of course I forgot to mention that in my pull request to Torvalds.

Linus: there might be some trival merge conflict in the Makefile
because Geert made a patch restructuring the Makefile and a
new GPIO driver was merged orthogonally in the MFD tree.

The resolution should be trivial, and the end result that we see
less of this because now the files are in alphabetic order so
we (or so it is believed) get a rectangular distribution of
conflicts since all filenames are equally plausible (yeah right).
It's a best effort to keep some sane order at least.

Yours,
Linus Walleij
