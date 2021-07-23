Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E551C4338F
	for <linux-next@archiver.kernel.org>; Fri, 23 Jul 2021 07:04:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B94C60F02
	for <linux-next@archiver.kernel.org>; Fri, 23 Jul 2021 07:04:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234143AbhGWGYR (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 23 Jul 2021 02:24:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:59302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234089AbhGWGYQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Jul 2021 02:24:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FF9360EE6;
        Fri, 23 Jul 2021 07:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627023890;
        bh=DCsKrN0g4U+p0j8lMp4QRD981nSKbcvaw3GI4wpQI94=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IVbc6uihAGjrxfBoD9wEXMXQyAPeCi2iO7SRWhWYXAq85eyWx/oodiMwu238eEbT8
         4aPNu+te9EXJWyICzYHpCdZWhsGgO/MgR11jPBrfZdsq9jzSxoMHAf44j730Kjx9Vz
         tDABOeRGDvKmcqlrzfCoxKWW6dzA5c9t1K+pIN5Pth9FZGw+TCO72sR6c1N4dBlHRd
         FzAu1FljrJMqmDusZz7LJPKkH0Is5Fv02/ShHdAy1KQeEKFn1kx89fNuUcukKwR85Z
         c4FVO94CHwMHDZBtYhsT7ErxEbjZCoQCeL4yoR4kjJIJ2RTFxbk3CLQMLwfmK9aWXj
         dm4hltnJETgbg==
Date:   Fri, 23 Jul 2021 09:04:46 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Yizhuo Zhai <yzhai003@ucr.edu>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
Message-ID: <20210723090446.40e4579e@coco.lan>
In-Reply-To: <CABvMjLTTtAwH7tT96TQ8THkCjTGUe-bMij449UALoyTSS94amQ@mail.gmail.com>
References: <20210723085145.1ce7ee5c@canb.auug.org.au>
        <CABvMjLTTtAwH7tT96TQ8THkCjTGUe-bMij449UALoyTSS94amQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Thu, 22 Jul 2021 17:38:13 -0700
Yizhuo Zhai <yzhai003@ucr.edu> escreveu:

> All:
> I've fixed this issue and resend the patch to the maintainers. I'm so
> sorry for the inconvenience.
> Stephen:
> It seems you are not in the maintainers' mailing list, should I send a
> copy to you as well?
> 
> 
> On Thu, Jul 22, 2021 at 3:51 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > In commit
> >
> >   c275e5d349b0 ("media: atomisp: fix the uninitialized use and rename "retvalue"")
> >
> > Fixes tag
> >
> >   Fixes: ad85094 (media / atomisp: fix the uninitialized use of model ID)
> >
> > has these problem(s):
> >
> >   - SHA1 should be at least 12 digits long
> >     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
> >     or later) just making sure it is not set (or set to "auto").
> >   - Subject does not match target commit subject
> >     Just use
> >         git log -1 --format='Fixes: %h ("%s")'
> >
> > maybe you meant
> >
> > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")

Fixes tag updated.

Regards,
Mauro
