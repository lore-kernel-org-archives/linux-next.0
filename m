From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 19 Sep 2016 18:12:18 +0200
Message-ID: <20160919161218.GA5073@kozik-book>
References: <20160914142747.1553f1c8@canb.auug.org.au>
 <CGME20160914213244epcas1p12dc9e18680105107404e1715ebcd40f8@epcas1p1.samsung.com>
 <1589961933.1419204.1474270644855.JavaMail.weblogic@ep1ml103c>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35694 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751146AbcISQMZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2016 12:12:25 -0400
Content-Disposition: inline
In-Reply-To: <1589961933.1419204.1474270644855.JavaMail.weblogic@ep1ml103c>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Mon, Sep 19, 2016 at 07:37:24AM +0000, MyungJoo Ham wrote:
> > On Wednesday, September 14, 2016 02:27:47 PM Stephen Rothwell wrote:
> > > Hi Rafael,
> > > 
> > > After merging the pm tree, today's linux-next build (powerpc allyesconfig)
> > > failed like this:
> > > 
> > > drivers/devfreq/tegra-devfreq.c: In function 'tegra_devfreq_target':
> > > drivers/devfreq/tegra-devfreq.c:500:2: error: implicit declaration of function 'clk_set_min_rate' [-Werror=implicit-function-declaration]
> > >   clk_set_min_rate(tegra->emc_clock, rate);
> > >   ^
> > > 
> > > Caused by commit
> > > 
> > >   797da5598f3a ("PM / devfreq: Add COMPILE_TEST for build coverage")
> 
> @Rafael: Thank you!
> 
> 
> @Kozlowski:
> 
> It looks like COMMON_CLK is required to be "selected" for TEGRA.
> 
> Although COMMON_CLK is supposed to be widely used by most ARM platforms
> especially if "Multiple platfrom selection" for ARMv7 is used,
> COMPILE_TEST won't recognize it.
> 
> Adding COMMON_CLK for TEGRA will solve this instance of issue; however,
> for COMPILE_TEST to be reasonably robust, each "COMPILE_TEST"ed item
> should "select" every required item. How do you want to proceed with
> COMPILE_TEST on SoC-specific device drivers?

I think drivers should depend on COMMON_CLK in such case. This tegra
driver probably does not require strict ARCH_TEGRA_124_SOC dependency
because it does not use any SoC-specific data/functions etc. However it
uses common clock framework so explicit dependency looks proper to me.

In fact this is already seen in kernel like SND_SOC_TEGRA, SND_MXS_SOC,
PWM_IMG(with compile test), SND_SOC_RCAR (even without compile test).

Best regards,
Krzysztof
