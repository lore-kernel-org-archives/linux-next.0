Return-Path: <SRS0=JT2A=3C=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F9DC33CA9
	for <linux-next@archiver.kernel.org>; Mon, 13 Jan 2020 17:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A60C207FF
	for <linux-next@archiver.kernel.org>; Mon, 13 Jan 2020 17:52:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="MfRDokUB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgAMRw0 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 13 Jan 2020 12:52:26 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:43422 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbgAMRwZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jan 2020 12:52:25 -0500
Received: by mail-il1-f196.google.com with SMTP id v69so8898223ili.10
        for <linux-next@vger.kernel.org>; Mon, 13 Jan 2020 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tR/PVmec9Acg9lLoWkjAACYeH6TaFlhfszmRPXAXo1I=;
        b=MfRDokUBQY6p/kpal7XLw/g38Gh/IYdjm7i351TEXrATsDe15BahgFzUxUw2OmWv3l
         PYV4Mv2Il9WIz8LTiICJ1SBtYdi5VjGf38h8gB80wwGQAUlIlbhv7UhJhatiNCgeoZqk
         JM+eizhJUClZ7yCT3TMjSjHSi++Sn0aZWVSBOv53ifvZlTrnUsu+yNtpcbvb46ywW/TC
         Sb536csF4MpO14QhxwoKAlHNmxLu++s2/9SMwgGmd+4wnm1E+JUuxkJZSlGgL9zxpGzD
         3Zelh6J1MpWq1zuisaeDHXlCuztNvunhxSLppqDpUE8fmnD09ZPY7oFLG0MX/nyceWlV
         3umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tR/PVmec9Acg9lLoWkjAACYeH6TaFlhfszmRPXAXo1I=;
        b=WIa8unryJXGrNvQbzGXZLhG7bb/jIaaYP4cBTOAxZk56kjODjRR1mw6iOb3UNxOy+W
         WWzGpONTrAyQfBpOx2gpIgu7itL5V4/Erg08S/mI3tuqRD6ZRCvIiETRic4UlYeNggtQ
         +37YpiBPJwt35In+9pVSxYrrqlUOYRf8ajpuZ1VlSys7rt3wynhrKJp7AZZBJEjbCUCs
         SAG7DYeCgfdT7tVPqGYmQd4b9PiATJMiC56EgyRyTmkZWdlSlQksGLEq1ePIWubMRfF0
         +WhEyZptfi+izyeUZqch6/Bcd2QP1DTah5x4LI8bCZaFPffzc7MFZnbmqiU/g/LiUBOO
         l8Jg==
X-Gm-Message-State: APjAAAUU/kjfRSe3YHKKCR3xhgR53iydRPzRnY0ljLChKDqzaRlG6nuN
        bGT22ientwFtqZawrwPQi0NQSHdX5gLyhSGwkdb3cQ==
X-Google-Smtp-Source: APXvYqwmifsPMIM7NR3deurhYvdhd2YslDh3Tb150YC7L/n4Un9cMt8a1ojcsrjY1X3Jknn0LNc6fVsXk09C2r1UTTE=
X-Received: by 2002:a92:db49:: with SMTP id w9mr14818680ilq.277.1578937945418;
 Mon, 13 Jan 2020 09:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20200113065808.25f28c40@canb.auug.org.au> <CAOesGMifHn6DbNgYm6YUbdKjSL5rNgdWrq+HX9dEusrOr9xX2A@mail.gmail.com>
 <20200113113837.130c3936@canb.auug.org.au> <caeb1af8-4aa2-71dc-0a70-127c0b474f93@st.com>
 <20200113224620.5d33fa63@canb.auug.org.au>
In-Reply-To: <20200113224620.5d33fa63@canb.auug.org.au>
From:   Olof Johansson <olof@lixom.net>
Date:   Mon, 13 Jan 2020 09:52:13 -0800
Message-ID: <CAOesGMh0yfq_0RPzASjNPUgff4P+PMdo2fEB3BFO++Y6zz1n0g@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ludovic Barre <ludovic.barre@st.com>,
        Yann Gautier <yann.gautier@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 13, 2020 at 3:46 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Alexandre,
>
> On Mon, 13 Jan 2020 09:17:08 +0100 Alexandre Torgue <alexandre.torgue@st.com> wrote:
> >
> > Sorry for this oversight. DO I have something to do ? (except to not
> > forget to check my signed-off next time).
>
> That is up to the arm-soc tree maintainers.

Nothing needed at this time.

The point of making sure maintainers sign off on patches is to track
their path into the tree. In this case we still know it comes in via
you. But make sure you're diligent on this for future patches.


Thanks!

-Olof
