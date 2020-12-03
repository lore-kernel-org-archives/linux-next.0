Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E82C4167B
	for <linux-next@archiver.kernel.org>; Thu,  3 Dec 2020 16:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D5D9207A5
	for <linux-next@archiver.kernel.org>; Thu,  3 Dec 2020 16:31:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgLCQbc (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 3 Dec 2020 11:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgLCQbb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 11:31:31 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A29FC061A54;
        Thu,  3 Dec 2020 08:30:38 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id f9so1026687pfc.11;
        Thu, 03 Dec 2020 08:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V4IuP8YWl53NVXyF1X3K4dpJU1zaL/9M33UjNpsb5QI=;
        b=B7YPjogIBmdqxxSAg/b1KHN/rYcudVWNg30IJm0DgHzcM3COTXJF74lQHQU/4+gGXE
         57r/zFdXOqBGnPIZzRRQ8zSXMMluTkhkYDInt0Wmp3CRWFgzR9ZtSIynmujbhTwFV2aM
         eqs/maKw8ybcr9oV48T2MkezU5p9qaSz6IEzUYVZrMZTNSa/PUUOMw+ya4z4/lrvyZ9t
         PCPx4b56rkF0C+Yp+aIp3cgyMXGLyk2yTdJvWWCiD/DFvjt+h7zOOQhoSM7o7gwcRU2g
         JdDvl8Q+XwTa9DFF/sTFbRtRaowV9lrUQ25lMfSfNnMUtUGa6HPIvgPEEHdzoeJAnahG
         YLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V4IuP8YWl53NVXyF1X3K4dpJU1zaL/9M33UjNpsb5QI=;
        b=C3dVIPYz/V/bS1YdbPXK9Fw82Ti3W5GBES18UK23tCqpkzlwgjyOYl+oCWj2xGJUWu
         z513/NW3rl2JYmLYGFImBxly+/Len15zsAAVCLnSuxONgE29m0tlHKoR937U+2au7e/e
         cekfv/ObYjuRpKEmD78uXIsoC9/bhgRv1FJT7phR53+e2JaPxQnertxfaU6Xt2ZSKIl3
         jts7qve4CseQfqqosD68GAqukeYzTVeqT8RAhcuz1RE1oDgH1CbLdmYad6G+cY5oTYVt
         7mfqftuw8ZHZNiPGfRowa33OqNah4dOR3T0bQfmSoONIm6pLA64TRnP3BdStIMorSclk
         iyZQ==
X-Gm-Message-State: AOAM532AN0g4iZrZnlLn9IloW0RVGoZQRBtrlUslb+t0r0icm+sohI9F
        oYjKS33GNys+n6m34fN3dVqdwnWl3t984qIvAA==
X-Google-Smtp-Source: ABdhPJyx95/2/0AUUf5TNa8xderL1IY2KPAkq+tbLfvDX3H5bpZg+1PG1/x1RybnQ4+3/yNbYyE/vB/8HmT6nBFmXwQ=
X-Received: by 2002:a62:1408:0:b029:18b:78d:4c4b with SMTP id
 8-20020a6214080000b029018b078d4c4bmr3828540pfu.25.1607013037990; Thu, 03 Dec
 2020 08:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20201203200837.68df59a1@canb.auug.org.au> <CALjTZvZkVzpzCO7r0_+UDS0BEtOvQJGVh70iBgjnoLztBOYO_w@mail.gmail.com>
In-Reply-To: <CALjTZvZkVzpzCO7r0_+UDS0BEtOvQJGVh70iBgjnoLztBOYO_w@mail.gmail.com>
From:   Rui Salvaterra <rsalvaterra@gmail.com>
Date:   Thu, 3 Dec 2020 16:30:26 +0000
Message-ID: <CALjTZvY5pP6HO3E4nzfHJsNGWQi4up08B+HbZSqcD8wiYa4SyQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 3 Dec 2020 at 09:37, Rui Salvaterra <rsalvaterra@gmail.com> wrote:
>
> Thanks for the heads-up, I think I know where the problem is.

Then again, maybe not. I don't have a PowerPC machine to test, at the
moment, and all my x86(-64) machines work fine. If no one beats me to
it, I can debug on an iBook G4, but only next week.
