Return-Path: <SRS0=XbQ9=V6=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05659C32750
	for <linux-next@archiver.kernel.org>; Fri,  2 Aug 2019 06:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD1BE20657
	for <linux-next@archiver.kernel.org>; Fri,  2 Aug 2019 06:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wEwvBGxN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388959AbfHBGti (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 2 Aug 2019 02:49:38 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52826 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388894AbfHBGti (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Aug 2019 02:49:38 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so66781437wms.2
        for <linux-next@vger.kernel.org>; Thu, 01 Aug 2019 23:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TGAJsFow4oMvJoAyzqu9xKkKaxXn/I4Jnuo/cQmMpV0=;
        b=wEwvBGxNylDsfl9AU2tOnTAPUMbIDlu6bC+58eAtIsa40xrYNdeuTn1ddqtNAgjlSk
         5rsXEjvTvjyS79ODllf/c6mf1/2f8yCnY4/+UFyT3ZnCljrJXd0USXCO+5leq7bQnaDr
         8iUZMycfQNC506+0SQn6jGhkDdHBbL6PconATmJRZfO+bNXsJAorp2D+ziMTnT2SD7Mr
         4f1Ly6JB34OEsNbZz2JXJfn+VlwGi/3QOP9g4n5/Rs+oFj8A4vBzHX/59IlREVI+3wSY
         CbtyBpvfjkmVStkWOVZru8MGgvYScxyN5BZ4ug6nXnlFHekzTYs9qTeTvUX0c5gERKng
         +U9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TGAJsFow4oMvJoAyzqu9xKkKaxXn/I4Jnuo/cQmMpV0=;
        b=a0v3MSlsehQkNlAnBr/5xjT/uTqOWDSjk8kzAnGG+AcYKZbJ2b4dDB46LE3/jNBUVk
         HGS/Fi0pbiYBP/X8yJDkq6P1KbJM/VhTbAJvpNIJLYoJQ+/GFPoy2lMd7Il6O4fpQDrK
         5zRONTuLX7Q71PHOeiOfRuiNqYebNbN3LTuOQn/XJAATk1JFP1D2QxPPmekn/1HZgUxY
         /PA9uOF3kjoxuY9F9wYM77atSzZAtupsKrbOf66cngKtD26wI8MQ1wPZPv8oSoat5HAy
         A6ma5qQ2xgiGsuiSBGXSgb5IWc2Dx8NKZF1D2Hz9GEZCzAKR4RprerP9VtdVdYu7IJUh
         HwdA==
X-Gm-Message-State: APjAAAXMcmM2kGe6DTpvA+7zccz9Csl3tCDTl4XsftzsZlit2CAaieQf
        CKJOeC2LFPKXPa2TOvL5IdVLwsLG5urxtZW8pda7bg==
X-Google-Smtp-Source: APXvYqzcN4vVQQ+dUrE17LULjD0uo7QmMWsTOc9nAoC4+6efRgoyLv9ZsqyERMEFFhMXp/U1ZBYlncyaBqnmLJI7QiA=
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr2548964wmh.136.1564728576312;
 Thu, 01 Aug 2019 23:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190731163915.3fdfcb14@canb.auug.org.au> <20190731085819.GA3488@osiris>
 <20190731110816.GA20753@gondor.apana.org.au> <20190731111520.GC3488@osiris>
 <20190731113216.GA21068@gondor.apana.org.au> <20190731114453.GD3488@osiris>
 <20190801122849.GB4163@osiris> <CAKv+Gu_1HP2NapMk5O_-XpJdga5zyFJDkVudTRT6CWm+tqPndA@mail.gmail.com>
 <20190802064605.GA4158@osiris>
In-Reply-To: <20190802064605.GA4158@osiris>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Fri, 2 Aug 2019 09:49:25 +0300
Message-ID: <CAKv+Gu_66Lrhrju_mUiONq_rxmBq-n0AyaFqeese5T2T=x3RJg@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 31 - s390 crypto build breakage
To:     Heiko Carstens <heiko.carstens@de.ibm.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Patrick Steuer <steuer@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 2 Aug 2019 at 09:46, Heiko Carstens <heiko.carstens@de.ibm.com> wrote:
>
> On Thu, Aug 01, 2019 at 08:28:56PM +0300, Ard Biesheuvel wrote:
> > On Thu, 1 Aug 2019 at 15:28, Heiko Carstens <heiko.carstens@de.ibm.com> wrote:
> > > Still not... with linux-next as of today I get this (s390 defconfig):
> > >
> > > ERROR: "crypto_aegis128_decrypt_chunk_simd" [crypto/aegis128.ko] undefined!
> > > ERROR: "crypto_aegis128_update_simd" [crypto/aegis128.ko] undefined!
> > > ERROR: "crypto_aegis128_encrypt_chunk_simd" [crypto/aegis128.ko] undefined!
> > > scripts/Makefile.modpost:105: recipe for target 'modules-modpost' failed
> > >
> >
> > Hello Heiko,
> >
> > Apologies for the breakage. The first two fixes addressed obvious
> > shortcomings in my code, but with this issue, I'm a bit puzzled tbh.
> > The calls to these missing functions should be optimized away, since
> > have_simd never gets assigned if CONFIG_CRYPTO_AEGIS128_SIMD is not
> > defined, but for some reason, this isn't working. Which version of GCC
> > are you using?
>
> Plain vanilla gcc 9.1.0.
>
> > Also, could you please try whether the patch below fixes the problem? Thanks
> > https://lore.kernel.org/linux-crypto/20190729074434.21064-1-ard.biesheuvel@linaro.org/
>
> Yes, with that patch applied the code compiles.
>

Thanks for confirming.

Since Voldis is reporting GCC 9.1.x as well, this might be a compiler
regression (and it explains why I did not see the issue locally)

In any case, the patches have been reverted now, so I will resubmit
them with the above change folded in.

Thanks,
Ard.
