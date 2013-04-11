From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: manual merge of the arm-soc tree with the pm tree
Date: Thu, 11 Apr 2013 01:37:02 -0700
Message-ID: <20130411083702.GE31465@quad.lixom.net>
References: <20130410171743.2ffa67388b330991228a6775@canb.auug.org.au>
 <30ad01ce35c6$8b13cb10$a13b6130$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <30ad01ce35c6$8b13cb10$a13b6130$%kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Viresh Kumar' <viresh.kumar@linaro.org>, 'Alexander Shiyan' <shc_work@mail.ru>, "'Rafael J. Wysocki'" <rjw@sisk.pl>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 10, 2013 at 05:36:49PM +0900, Kukjin Kim wrote:
> Stephen Rothwell wrote:
> > 
> > Hi all,
> > 
> Hi,
> 
> > Today's linux-next merge of the arm-soc tree got a conflict in
> > arch/arm/mach-s3c24xx/Kconfig between commit 785f40040874 ("cpufreq:
> > s3c24xx: move cpufreq driver to drivers/cpufreq") from the pm tree and
> 
> As I know, Rafael will drop it in his tree.
> http://lists-archives.com/linux-kernel/27815851-cpufreq-s3c24xx-move-cpufreq
> -driver-to-drivers-cpufreq.html
> 
> > commits fb278af74b28 ("ARM: S3C24XX: Removed unneeded dependency on
> > CPU_S3C2410") and a4e4d22c6f53 ("ARM: S3C24XX: Removed unneeded
> > dependency on CPU_S3C2412") from the arm-soc tree.
> > 
> > I fixed it up by removing the sections from arch/arm/mach-s3c24xx/Kconfig
> > and can carry thefix as necessary (no action is required).
> > 
> Thanks.
> 
> > P.S. those arm-soc tree commits have a bad Author email address ...
> 
> Oops :-( it's my fault due to e-mail client problem...
> 
> Arnd, it happened in next/dt-exynos, next/mct-exynos and
> next/cleanup-samsung branches in my tree.
> 
> And I sorted out in my local just now. Could you please re-pull them into
> arm-soc? Then, I will push forced. Sorry about that.

Given that it's "just" formatting errors, I would prefer not repulling and
rebuilding just because of it. For someone reading the information it's pretty
obvious what the valid email address would be. Please try to be mindful of it
in the future though (and we'll try to double-check these things too).


-Olof
