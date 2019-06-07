Return-Path: <SRS0=26vq=UG=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA21CC468BC
	for <linux-next@archiver.kernel.org>; Fri,  7 Jun 2019 18:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92A4020868
	for <linux-next@archiver.kernel.org>; Fri,  7 Jun 2019 18:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731628AbfFGSVT (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 7 Jun 2019 14:21:19 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38824 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731454AbfFGSVT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Jun 2019 14:21:19 -0400
Received: by mail-lf1-f68.google.com with SMTP id b11so2320053lfa.5
        for <linux-next@vger.kernel.org>; Fri, 07 Jun 2019 11:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kcUcDDcC5mC90UP39oOfydyRccLWkfoYEANrC6Q5vzo=;
        b=Pp8ElYwRAZ1JiAFiBuhH3vO4CaOQXDbnXEeFH8Npv+/5RrDFe5YHTzztCutNZQrweA
         0YgTig82p/6ZYEE9s2Qoj5ghnFlqLELMqNia1Zqb1SPI+BENQLxfLDUUP1QnT6EodyUt
         xLu8TU5ZXdGzvBDqq5g2/n/kL+2A8L9fDv5OmT0EA6vHMAEl9SWuB3jZD/mnm4vRU+wV
         4BgKbDcDZ8rCjR6EAgcS9wRx8SypC4CrQv23UGj3gWoea0twF5zCCVM5pF+5GLpbyry2
         sZnJJlka6pHYBUgUoHRBy8l3Fw2A0OJl+otpc0JKvgyHzO60G56rVHB0KCMLqANxbsYn
         T59A==
X-Gm-Message-State: APjAAAUEIm4XSGJ5KIRz/PCi5vP0PIjUZyS12n7oiihhEt543wjz4jcw
        5N3A+4NvgwuOFUUO8Q8t2nJu7M1swEhqo09C5odLiw==
X-Google-Smtp-Source: APXvYqxS5uzW3XR5kdyFjRpxOZreggJNwlHKkhL6Tmcr675Z5ilYvHwgYSkiUD3WZM5T1zybdCcFiR7fD7A9J2bVdkU=
X-Received: by 2002:a19:22d8:: with SMTP id i207mr25716706lfi.97.1559931677223;
 Fri, 07 Jun 2019 11:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190607003646.10411-1-mcroce@redhat.com> <ea97df59-481b-3f05-476c-33e733b5c4ba@gmail.com>
In-Reply-To: <ea97df59-481b-3f05-476c-33e733b5c4ba@gmail.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Fri, 7 Jun 2019 20:20:40 +0200
Message-ID: <CAGnkfhx_h1d6k+wZk7xZXnECDZ+Z+oLw9zAWvDFRe+mHLksszA@mail.gmail.com>
Subject: Re: [PATCH linux-next v2] mpls: don't build sysctl related code when
 sysctl is disabled
To:     David Ahern <dsahern@gmail.com>
Cc:     netdev <netdev@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 7, 2019 at 7:14 PM David Ahern <dsahern@gmail.com> wrote:
>
> On 6/6/19 6:36 PM, Matteo Croce wrote:
> > Some sysctl related code and data structures is never referenced
> > when CONFIG_SYSCTL is not set.
> > While this is usually harmless, it produces a build failure since sysctl
> > shared variables exists, due to missing sysctl_vals symbol:
> >
> >     ld: net/mpls/af_mpls.o: in function `mpls_platform_labels':
> >     af_mpls.c:(.text+0x162a): undefined reference to `sysctl_vals'
> >     ld: net/mpls/af_mpls.o:(.rodata+0x830): undefined reference to `sysctl_vals'
> >     ld: net/mpls/af_mpls.o:(.rodata+0x838): undefined reference to `sysctl_vals'
> >     ld: net/mpls/af_mpls.o:(.rodata+0x870): undefined reference to `sysctl_vals'
> >
> > Fix this by moving all sysctl related code under #ifdef CONFIG_SYSCTL
> >
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Matteo Croce <mcroce@redhat.com>
> > ---
> >
> > v1 -> v2: fix a crash on netns destroy
> >
> >  net/mpls/af_mpls.c | 393 ++++++++++++++++++++++++---------------------
> >  1 file changed, 207 insertions(+), 186 deletions(-)
> >
>
> As I recall you need to set platform_labels for the mpls code to even
> work, so building mpls_router without sysctl is pointless.

This would explain why so much code went under the #ifdef.
Should we select or depend on sysctl maybe?

Regards,
-- 
Matteo Croce
per aspera ad upstream
