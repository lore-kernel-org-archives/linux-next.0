Return-Path: <SRS0=Pnbl=UJ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2415C28CC7
	for <linux-next@archiver.kernel.org>; Mon, 10 Jun 2019 11:22:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D075B20679
	for <linux-next@archiver.kernel.org>; Mon, 10 Jun 2019 11:22:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388315AbfFJLWi (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 10 Jun 2019 07:22:38 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:32987 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389075AbfFJLWe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Jun 2019 07:22:34 -0400
Received: by mail-lf1-f68.google.com with SMTP id y17so6357534lfe.0
        for <linux-next@vger.kernel.org>; Mon, 10 Jun 2019 04:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C+DUG5gvBn9h1kdmvK6lAg2KMQY86nV/4xNYIFvnPfM=;
        b=gsBJS4KY9HbhqysMV2pdU81fnaugYGYDktG5F6K5spBltHrJEYy/YhYQsAZiclKD+E
         QJ4N4hErP1GS/Ui78lCuoj1iwQy6ys44Jc3nKEbJeSzjQf34WPquNNiXkXj8Lut57Fp5
         nyWsFMussurIaSteiH8SOSAIzv93JFIHigU9Lck3Ta5vCchYDF148868J+myc8WZrxpA
         Fw3J69+i4+DIbIXeKHIhgRA2I25diuf8kpbu3iwMndjx3OarW223JvEPjs0tgutEmBsx
         KyiJM3bKVQCGBz31N0eBb8vaeAUPvWDleAzajJja5wZN0xNl+xcUOWydq7k846qOkNnX
         4oTw==
X-Gm-Message-State: APjAAAVcdelHPw36Ojzg1sChoTbpaO7BbDuMhKn8Ux//7VFaugjCu7gP
        mHxidf/u4xIcDPi2wmkRCrI82YGkGADUq/9eb6virg==
X-Google-Smtp-Source: APXvYqyFhWgwkY+lN5/wJ3TG9fJOX1LrleYCil0BJ8UCkwJy1pR6KhVGfR0miB4CWzzTFFmU2jtNuaoZ9YLRuRSbSD0=
X-Received: by 2002:ac2:4466:: with SMTP id y6mr7220999lfl.0.1560165752377;
 Mon, 10 Jun 2019 04:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190530035339.hJr4GziBa%akpm@linux-foundation.org>
 <5a9fc4e5-eb29-99a9-dff6-2d4fdd5eb748@infradead.org> <2b1e5628-cc36-5a33-9259-08100a01d579@infradead.org>
 <CAGnkfhyO0gtg=RGUMGHYH43UhUV1htmqa-56nuK2tt_CACzOfg@mail.gmail.com>
In-Reply-To: <CAGnkfhyO0gtg=RGUMGHYH43UhUV1htmqa-56nuK2tt_CACzOfg@mail.gmail.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Mon, 10 Jun 2019 13:21:56 +0200
Message-ID: <CAGnkfhyGQXL+Bybjbe3omdXkZ8ivWgEOAB9za47yDGD_=Wu9AA@mail.gmail.com>
Subject: Re: mmotm 2019-05-29-20-52 uploaded (mpls) +linux-next
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        mhocko@suse.cz, mm-commits@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 7, 2019 at 2:24 AM Matteo Croce <mcroce@redhat.com> wrote:
>
> On Wed, Jun 5, 2019 at 12:29 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 5/30/19 3:28 PM, Randy Dunlap wrote:
> > > On 5/29/19 8:53 PM, akpm@linux-foundation.org wrote:
> > >> The mm-of-the-moment snapshot 2019-05-29-20-52 has been uploaded to
> > >>
> > >>    http://www.ozlabs.org/~akpm/mmotm/
> > >>
> > >> mmotm-readme.txt says
> > >>
> > >> README for mm-of-the-moment:
> > >>
> > >> http://www.ozlabs.org/~akpm/mmotm/
> > >>
> > >> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > >> more than once a week.
> > >>
> > >> You will need quilt to apply these patches to the latest Linus release (5.x
> > >> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> > >> http://ozlabs.org/~akpm/mmotm/series
> > >>
> > >> The file broken-out.tar.gz contains two datestamp files: .DATE and
> > >> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> > >> followed by the base kernel version against which this patch series is to
> > >> be applied.
> > >>
> > >
> > > on i386 or x86_64:
> > >
> > > when CONFIG_PROC_SYSCTL is not set/enabled:
> > >
> > > ld: net/mpls/af_mpls.o: in function `mpls_platform_labels':
> > > af_mpls.c:(.text+0x162a): undefined reference to `sysctl_vals'
> > > ld: net/mpls/af_mpls.o:(.rodata+0x830): undefined reference to `sysctl_vals'
> > > ld: net/mpls/af_mpls.o:(.rodata+0x838): undefined reference to `sysctl_vals'
> > > ld: net/mpls/af_mpls.o:(.rodata+0x870): undefined reference to `sysctl_vals'
> > >
> >
> > Hi,
> > This now happens in linux-next 20190604.
> >
> >
> > --
> > ~Randy
>
> Hi,
> I've just sent a patch to fix it.
>
> It seems that there is a lot of sysctl related code is built
> regardless of the CONFIG_SYSCTL value, but produces a build error only
> with my patch because I add a reference to sysctl_vals which is in
> kernel/sysctl.c.
>
> And it seems also that the compiler is unable to optimize out the
> unused code, which gets somehow in the final binary:
>
> $ grep PROC_SYSCTL .config
> # CONFIG_PROC_SYSCTL is not set
> $ readelf vmlinux -x .rodata |grep -A 2 platform_lab
>   0xffffffff81b09180 2e630070 6c617466 6f726d5f 6c616265 .c.platform_labe
>   0xffffffff81b09190 6c730069 705f7474 6c5f7072 6f706167 ls.ip_ttl_propag
>   0xffffffff81b091a0 61746500 64656661 756c745f 74746c00 ate.default_ttl.
>
> If the purpose of disabling sysctl is to save space, probably this
> code and definitions should all go under an #ifdef
>
> Regards,
> --
> Matteo Croce
> per aspera ad upstream

A proper fix was just merged in davem/net.git

commit c1a9d65954c68e13a6adc0225b0d38188fff68ca
Author: Matteo Croce <mcroce@redhat.com>
Date:   Sat Jun 8 14:50:19 2019 +0200

    mpls: fix af_mpls dependencies

Regards,
-- 
Matteo Croce
per aspera ad upstream
