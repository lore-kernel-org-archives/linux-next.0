Return-Path: <SRS0=JB9f=U2=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8099C48BD6
	for <linux-next@archiver.kernel.org>; Thu, 27 Jun 2019 00:32:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A1CE217D7
	for <linux-next@archiver.kernel.org>; Thu, 27 Jun 2019 00:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D5wRjxHq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfF0Acr (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 26 Jun 2019 20:32:47 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36596 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbfF0Acq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2019 20:32:46 -0400
Received: by mail-qt1-f194.google.com with SMTP id p15so630655qtl.3
        for <linux-next@vger.kernel.org>; Wed, 26 Jun 2019 17:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w03qy6EFSZddlaeR4XXdByXLhXgkUgXil3c6GHJxhvU=;
        b=D5wRjxHq9V5XbBgZSnROW+7DALOrUfCiALI8vABHmruViVFI0BRgspDKxnC0HJ5HT2
         2HA4bSMYcmJ79NZlDerGsvkniJ9FTvqcEe17W+wpYWqKKBRI/9ocf3rsBrF/osJJSbmW
         JZOQjYpfnFOVm9Yu0Dpgy/tjUjQMRGr6xKCQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w03qy6EFSZddlaeR4XXdByXLhXgkUgXil3c6GHJxhvU=;
        b=ulIJpxqqDNNqAzSmofhMgUf5hQfKl1mOMoJaGf9JKJ/2k2kxtz2E9Gt/T2Bb4r4aP4
         TOygYV/gLnZpf0kxJrQI9wdI74+mQmADynnK4hp9AtEtp3jj8mTP5sUxqRBIwe+qjah3
         oizWcenLGknFXdw3oSkJlsHqH4mWKxgZW7Nu3PhjL1AK34RDSQgUQQNl8q+DJld/xHvk
         0biqsIKH9e3JQQqn4uLcHuogpUXqknHkzVJ4eVSH5cmXDuP/Wm1fKND+qIxoCoNYHYAL
         uxhlNmV4tf9zVDWep3SYd/zjplq7m/DIuRTKRiSZWI2c/Tm9gdfwJmydHrp4UijRO7UI
         h6Cg==
X-Gm-Message-State: APjAAAUsWZkAELM1dZZ6ZPPQMRhd8Cxf+izL1FD5in3/4Uch9MShKnEt
        xTYhHoSgFUjztnQe1r9t+FTVJ6JmaW/BxZBd90Xofw==
X-Google-Smtp-Source: APXvYqwBiufSpaNS4K0NRDMFfS68Z7VQqnw29e4Y3PdeVHTHONuH06tjKC8sgyVCBx0XYwXFHzsWTD7QTp1HGjEJ65s=
X-Received: by 2002:a0c:9591:: with SMTP id s17mr674217qvs.100.1561595565741;
 Wed, 26 Jun 2019 17:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190626235011.7b449eb0@canb.auug.org.au> <CACRpkdaHyb=o=9YzSvKWRbbyPCbsOUxC=zoz+acnTWNvp=vu5w@mail.gmail.com>
In-Reply-To: <CACRpkdaHyb=o=9YzSvKWRbbyPCbsOUxC=zoz+acnTWNvp=vu5w@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 27 Jun 2019 08:32:34 +0800
Message-ID: <CANMq1KCUfsKdJD8=DKR7ya-zhV0fgpHBi=PUtD030nFo8k9_ng@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 26, 2019 at 10:11 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jun 26, 2019 at 3:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> > In commit
> >
> >   99fd24aa4a45 ("pinctrl: mediatek: Ignore interrupts that are wake only during resume")
> >
> > Fixes tag
> >
> >   Fixes: bf22ff45bed ("genirq: Avoid unnecessary low level irq function calls")
> >
> > has these problem(s):
> >
> >   - SHA1 should be at least 12 digits long
> >     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
> >     or later) just making sure it is not set (or set to "auto").
>
> Thanks Stephen, fixed this.

Ouch, sorry, for some reasons I thought it was 10, not 12...

>
> Yours,
> Linus Walleij
