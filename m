From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the arm-soc tree with the pm tree
Date: Fri, 19 Apr 2013 19:59:57 +0900
Message-ID: <064401ce3ced$07bd3840$1737a8c0$%kim@samsung.com>
References: <20130410171743.2ffa67388b330991228a6775@canb.auug.org.au>
 <30ad01ce35c6$8b13cb10$a13b6130$%kim@samsung.com>
 <20130411083702.GE31465@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12161 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967914Ab3DSK77 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Apr 2013 06:59:59 -0400
In-reply-to: <20130411083702.GE31465@quad.lixom.net>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Viresh Kumar' <viresh.kumar@linaro.org>, 'Alexander Shiyan' <shc_work@mail.ru>, "'Rafael J. Wysocki'" <rjw@sisk.pl>

Olof Johansson wrote:
> 
> On Wed, Apr 10, 2013 at 05:36:49PM +0900, Kukjin Kim wrote:
> > Stephen Rothwell wrote:
> > >
> > > Hi all,
> > >
> > Hi,
> >
> > > Today's linux-next merge of the arm-soc tree got a conflict in
> > > arch/arm/mach-s3c24xx/Kconfig between commit 785f40040874 ("cpufreq:
> > > s3c24xx: move cpufreq driver to drivers/cpufreq") from the pm tree and
> >
> > As I know, Rafael will drop it in his tree.
> > http://lists-archives.com/linux-kernel/27815851-cpufreq-s3c24xx-move-
> cpufreq
> > -driver-to-drivers-cpufreq.html
> >
> > > commits fb278af74b28 ("ARM: S3C24XX: Removed unneeded dependency on
> > > CPU_S3C2410") and a4e4d22c6f53 ("ARM: S3C24XX: Removed unneeded
> > > dependency on CPU_S3C2412") from the arm-soc tree.
> > >
> > > I fixed it up by removing the sections from arch/arm/mach-
> s3c24xx/Kconfig
> > > and can carry thefix as necessary (no action is required).
> > >
> > Thanks.
> >
> > > P.S. those arm-soc tree commits have a bad Author email address ...
> >
> > Oops :-( it's my fault due to e-mail client problem...
> >
> > Arnd, it happened in next/dt-exynos, next/mct-exynos and
> > next/cleanup-samsung branches in my tree.
> >
> > And I sorted out in my local just now. Could you please re-pull them
> into
> > arm-soc? Then, I will push forced. Sorry about that.
> 
> Given that it's "just" formatting errors, I would prefer not repulling and
> rebuilding just because of it. For someone reading the information it's

Hmm...if possible, I'm still hoping, you could replace previous branches
which including 'wrong format' for author e-mail :-) But up to you.

> pretty
> obvious what the valid email address would be. Please try to be mindful of
> it

OK.

> in the future though (and we'll try to double-check these things too).
> 
BTW, if you don't want to pull, I need to re-send for '[GIT PULL 4/4]
dt-exynos 2 for v3.10'...

But I'm not sure it's possible...

Anyway, sorry for noise.

- Kukjin
