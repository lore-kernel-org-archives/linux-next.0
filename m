Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A250EC636CA
	for <linux-next@archiver.kernel.org>; Sun, 18 Jul 2021 23:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FB0760FD7
	for <linux-next@archiver.kernel.org>; Sun, 18 Jul 2021 23:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhGRXSX (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 18 Jul 2021 19:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbhGRXSX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 18 Jul 2021 19:18:23 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB02C061762;
        Sun, 18 Jul 2021 16:15:24 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id gh6so7490738qvb.3;
        Sun, 18 Jul 2021 16:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pC//UlGL2tBsaq1J/2oGAcBab+g7b1Ce2mbgtTrvx74=;
        b=YweT5m/Cd8r66w8ScwQXjo3iiAnZk58Bk52wu/8wdBKGE7SB5fABYR1SNlauuYsIlO
         pzmnu9xCMh+cYznoaVIMSoWdHniKOhWZGzIdNetdrcCYUi/XXgf3JPnyUvlEDrmH8Zdp
         GIp7b5iSWCvQvhxs/atlAiRSKjrKHYSjUOEw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pC//UlGL2tBsaq1J/2oGAcBab+g7b1Ce2mbgtTrvx74=;
        b=EePXAW8rbZ7Isnd9y3wpw2ZvdgEWlraGQjJAv05QRO66mzvELDFUljO47Gf3FfAiC7
         eLX7x0emVCIHn2j9SDuA/wamWcSUOhg4kSYl8u6VIAAEsNRDtJ5IlvvAazrb2ZJdBR7I
         ACOusYlcvNZWQ2/eer47kWNU2qGan6FvJn23Ei9aJx+rHx5lpN1ZGC+Qa0aK+isqikwq
         vnrnSHVwOtq+YEAeIw+83Msgxijc1tsmTT+Xlhxs04DS9VpQpWgVYBAzYLOknAzu5OWr
         4FLMRK8YLWtO6Hx8+xdjRfSzj5SixH18/eqYf6NjaGXCwDchVvonOOeJWcskc7uXmREj
         1LcA==
X-Gm-Message-State: AOAM5303ae43QMxDQTNWR1LS2qeCk+MhNQs5gvYH4ZLYgvwm7fz/Ivax
        zO03/bVayiSHvf+BymRC4FsGnr+Nss99A32Yb/2iGBiV
X-Google-Smtp-Source: ABdhPJyHRp6Na4mapKHvSHCbmwN/Z6jNqE/q0M6HOUsBLntVISnbpXO/4bL6mwRhB6jrk1Ij49+ogQPqIO/WjNb4Tes=
X-Received: by 2002:a0c:f808:: with SMTP id r8mr21984318qvn.10.1626650123103;
 Sun, 18 Jul 2021 16:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210719080327.161df5fe@canb.auug.org.au>
In-Reply-To: <20210719080327.161df5fe@canb.auug.org.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Sun, 18 Jul 2021 23:15:11 +0000
Message-ID: <CACPK8XewyxCg_uoK-sg5v+u4-sjLHA-e9tUjQu82mjr=9JtM-w@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the aspeed tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, 18 Jul 2021 at 22:03, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   3d5e36b84467 ("ARM: dts: aspeed-g6: Fix HVI3C function-group in pinctrl dtsi")
>
> is missing a Signed-off-by from its committer.

Thanks, I've fixed the commit and re-pushed the branch.

Cheers,

Joel
