Return-Path: <SRS0=e4DQ=ZU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C414C432C0
	for <linux-next@archiver.kernel.org>; Thu, 28 Nov 2019 08:11:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E4142176D
	for <linux-next@archiver.kernel.org>; Thu, 28 Nov 2019 08:11:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cl1m+ngm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfK1ILd (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 28 Nov 2019 03:11:33 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41836 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbfK1ILc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Nov 2019 03:11:32 -0500
Received: by mail-lj1-f193.google.com with SMTP id m4so27423191ljj.8
        for <linux-next@vger.kernel.org>; Thu, 28 Nov 2019 00:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQKC4XjNawjx8UihF73jPTynfejgzTobCtcLwz1KiN4=;
        b=Cl1m+ngm9B1zsqaGUJq5+srw8mVDYw3Ti2qHEyuJNN+CYaXDJ30XF6uq6DJcTP7DT6
         sBU3gIwLUskKxFFMwire1VY73ol4U7oS5ijC1ZarvN1dNW95ebXE9/7RN2ghVbGQ53gT
         f66ExH9RdyuFNsVXOeIP2O0TQKxM5Q2y8227Lc9Gv9Y0jbYweHnbocp6UQjXuedf897G
         UoiFWGc+TJ08Zuux3tjMUH60FD9cvWMEltMak+Uh9s+VspwUQ9dYHs54VYgvkAQZr8bx
         Ez6bXaxxjw+ZMmDikpCJ4CRHsLA/0RTv/GrGKnzRf4EZCK0liJVeAzrjdLV5PcumUTpG
         iE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQKC4XjNawjx8UihF73jPTynfejgzTobCtcLwz1KiN4=;
        b=qvT6XhmM3ePw6PbBRCFK0PpWnZjQZCKcQMoPW34AaLUPpGU6jNvGuvl9E8hphQA2mU
         Uw5Ek65K7g+s5qeh80AyJV1UTJ0wbvRb35mVMD3Uv8mftPs9NTP6DkCGdb39dXrM5pPJ
         mg4bXmysiOCkKGaHkp1R+/R1laN6iUtH/RA7Qjx8+SbyzePGZcZPqFSV1mqD5MWk3rpJ
         hh3d07WxMBulOgLQMTLzhUTxwOl1PbDeCl77dWmqcVlGhZKlAAzL16347U8KwJIpnR6k
         BU/UCyoh7HjbirqY1Nd7UsKWXNUrRkqGDFnZU6VSkgspddat0FEFnR8cnGHWr+qC0CmG
         5HDw==
X-Gm-Message-State: APjAAAUiTVGdSRiu5m5yALAVdQlF9ewI5tYDIdPy1GHzQatiCZ5kmBmC
        jvtXYcfjIuDNVNA/04Ubh7zzFBFyVQ2fLhdp+JLljgPKohc=
X-Google-Smtp-Source: APXvYqz5nkwjjdQwpz01FwuUfVWnvVn7URNoGfUSFywURs48wxahUxF8+aUY6P/DWPjSzP7pd8UG/lozc/jqKYyqoKU=
X-Received: by 2002:a05:651c:102a:: with SMTP id w10mr4479922ljm.77.1574928689174;
 Thu, 28 Nov 2019 00:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20191128075903.78c39170@canb.auug.org.au>
In-Reply-To: <20191128075903.78c39170@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 09:11:17 +0100
Message-ID: <CACRpkdYBppy5H0iOAczWentoAtB5OY9LHarVncUKDVhZdvDy6g@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the origin tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 27, 2019 at 9:59 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the origin tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/pinctrl-equilibrium.o
> see include/linux/module.h for more information
>
> Introduced by commit
>
>   1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")
>
> This commit was not in linux-next before being merged by Linus :-(

Sorry about that, I pushed it to the 0day testers and for some reason
that did not complain about this, then I thought I had also merged it
down for -next ... :/

I'll try to be more careful.

Thanks,
Linus Walleij
