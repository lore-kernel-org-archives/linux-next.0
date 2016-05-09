From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20160503 build: 1 failures 12 warnings (next-20160503)
Date: Mon, 9 May 2016 20:53:15 +1000
Message-ID: <20160509205315.631e0c68@canb.auug.org.au>
References: <E1axZpG-000664-AK@optimist>
	<20160503141723.GR6292@sirena.org.uk>
	<2280495.M9rYajvqUJ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37513 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751248AbcEIKxT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 May 2016 06:53:19 -0400
In-Reply-To: <2280495.M9rYajvqUJ@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linaro-kernel@lists.linaro.org, Mark Brown <broonie@kernel.org>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Ray Jui <ray.jui@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org

Hi Arnd and all,

On Tue, 03 May 2016 17:02:39 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tuesday 03 May 2016 15:17:23 Mark Brown wrote:
> > On Tue, May 03, 2016 at 01:53:18PM +0100, Build bot for Mark Brown wrote:
> > 
> > Today's -next fails to build an ARM allmodconfig due to:
> >   
> > >       arm-allmodconfig
> > > ../drivers/pinctrl/bcm/pinctrl-ns2-mux.c:540:17: error: 'pinctrl_utils_dt_free_map' undeclared here (not in a function)  
> > 
> > caused by b5aa1006e4a93 (pinctrl: ns2: add pinmux driver support for
> > Broadcom NS2 SoC) - presumably just a missing dependency.
> >   
> 
> No, the function got renamed in another patch. I already prepared a fix
> yesterday, but haven't gotten around to submit the patches for the last
> two days, I'll try to send it out today, but it might end up being
> tomorrow, or Linus could fix this one himself first.

Can we, please, get this fixed ... less than a week to the merge window
opening ...
-- 
Cheers,
Stephen Rothwell
