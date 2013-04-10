From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the arm-soc tree with the pm tree
Date: Wed, 10 Apr 2013 17:36:49 +0900
Message-ID: <30ad01ce35c6$8b13cb10$a13b6130$%kim@samsung.com>
References: <20130410171743.2ffa67388b330991228a6775@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38012 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935214Ab3DJIhH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Apr 2013 04:37:07 -0400
In-reply-to: <20130410171743.2ffa67388b330991228a6775@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Olof Johansson' <olof@lixom.net>, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Viresh Kumar' <viresh.kumar@linaro.org>, 'Alexander Shiyan' <shc_work@mail.ru>, "'Rafael J. Wysocki'" <rjw@sisk.pl>

Stephen Rothwell wrote:
> 
> Hi all,
> 
Hi,

> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-s3c24xx/Kconfig between commit 785f40040874 ("cpufreq:
> s3c24xx: move cpufreq driver to drivers/cpufreq") from the pm tree and

As I know, Rafael will drop it in his tree.
http://lists-archives.com/linux-kernel/27815851-cpufreq-s3c24xx-move-cpufreq
-driver-to-drivers-cpufreq.html

> commits fb278af74b28 ("ARM: S3C24XX: Removed unneeded dependency on
> CPU_S3C2410") and a4e4d22c6f53 ("ARM: S3C24XX: Removed unneeded
> dependency on CPU_S3C2412") from the arm-soc tree.
> 
> I fixed it up by removing the sections from arch/arm/mach-s3c24xx/Kconfig
> and can carry thefix as necessary (no action is required).
> 
Thanks.

> P.S. those arm-soc tree commits have a bad Author email address ...

Oops :-( it's my fault due to e-mail client problem...

Arnd, it happened in next/dt-exynos, next/mct-exynos and
next/cleanup-samsung branches in my tree.

And I sorted out in my local just now. Could you please re-pull them into
arm-soc? Then, I will push forced. Sorry about that.

- Kukjin
