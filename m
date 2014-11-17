From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: linux-next: build warning after merge of the pm tree
Date: Mon, 17 Nov 2014 12:31:43 +0100
Message-ID: <1416223903.22252.11.camel@x220>
References: <20141117134414.7f4d8d21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cpsmtpb-ews10.kpnxchange.com ([213.75.39.15]:52653 "EHLO
	cpsmtpb-ews10.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751513AbaKQLbq (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Nov 2014 06:31:46 -0500
In-Reply-To: <20141117134414.7f4d8d21@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@linaro.org>

On Mon, 2014-11-17 at 13:44 +1100, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (arm multi_v7_defconfig)
> produced this warning:
> 
> kernel/power/Kconfig:132:error: recursive dependency detected!
> kernel/power/Kconfig:132:	symbol PM_RUNTIME is selected by PM_GENERIC_DOMAINS
> kernel/power/Kconfig:272:	symbol PM_GENERIC_DOMAINS is selected by PM_RUNTIME
> 
> Caused by commit 9cdd5fd742e6 ("PM / domains: Kconfig: always enable
> PM_RUNTIME when genpd enabled").

This error also popped up when I fiddled with omap2plus_defconfig on top
of next-20141117. Note that I ended up with a .config which has
CONFIG_ARCH_MULTI_V7 set. The error appears to be triggered by the
Kconfig entry for ARCH_EXYNOS (in arch/arm/mach-exynos/Kconfig). It
contains
        select PM_GENERIC_DOMAINS if PM_RUNTIME

(Perhaps the :272: line needs rephrasing in the error Stephen quoted. It
confused me quite a bit.)

Naively dropping that select statement from ARCH_EXYNOS triggered yet
another error:
    kernel/power/Kconfig:145:error: recursive dependency detected!
    kernel/power/Kconfig:145:	symbol PM depends on PM_RUNTIME
    kernel/power/Kconfig:132:	symbol PM_RUNTIME is selected by PM_GENERIC_DOMAINS
    kernel/power/Kconfig:272:	symbol PM_GENERIC_DOMAINS is selected by PM

After that I admitted defeat.


Paul Bolle
