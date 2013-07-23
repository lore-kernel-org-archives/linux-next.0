From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: status of various trees
Date: Tue, 23 Jul 2013 13:38:45 +0100
Message-ID: <CACxGe6tjrFG1aLc9Scmmuunjb9hTm5vyH6LqXiys8484YY=Zzw@mail.gmail.com>
References: <20130723095513.19b9638ab4a19157e9834dcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:43623 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756432Ab3GWMjH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Jul 2013 08:39:07 -0400
Received: by mail-oa0-f41.google.com with SMTP id n10so11200745oag.14
        for <linux-next@vger.kernel.org>; Tue, 23 Jul 2013 05:39:06 -0700 (PDT)
In-Reply-To: <20130723095513.19b9638ab4a19157e9834dcf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Mark Brown <broonie@kernel.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Jul 23, 2013 at 12:55 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> Currently linux-next has the following gpio trees:
>
> gpio-current    git://git.secretlab.ca/git/linux-2.6#gpio/merge
> gpio            git://git.secretlab.ca/git/linux-2.6#gpio/next
> gpio-lw         git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#for-next
>
> Given commit a0062d4e3a0a ("MAINTAINERS: Remove Grant Likely") in the
> devicetree-current tree today, should I remove the first two and rename
> the third to be just "gpio"?  (And does Linus have an alternative
> "current" tree?)
>
> I also have the irqdomain tree:
>
> irqdomain       git://git.secretlab.ca/git/linux-2.6.git#irqdomain/next
>
> Should I remove that?  And is there going to be an alternative?
>
> And for spi, I have:
>
> spi             git://git.secretlab.ca/git/linux-2.6#spi/next
> spi-mb          git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git#for-next
>
> again, should I remove the first and rename the second?

Yes on all of the above. Thanks.

g.
