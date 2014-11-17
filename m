From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: linux-next: build warning after merge of the pm tree
Date: Tue, 18 Nov 2014 00:45:09 +0100
Message-ID: <1416267909.7024.3.camel@x220>
References: <20141117134414.7f4d8d21@canb.auug.org.au>
	 <1416223903.22252.11.camel@x220> <1721522.tICxlGjU6i@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1721522.tICxlGjU6i@vostro.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@linaro.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2014-11-18 at 00:14 +0100, Rafael J. Wysocki wrote:
> I'll drop the commit for now, but this looks strange.
> 
> Had you cleaned up the kernel configuration after dropping the PM_RUNTIME select
> from ARCH_EXYNOS?

I retested this again:

[linux * (next-20141117)]$ git status
HEAD detached at next-20141117
nothing to commit (use -u to show untracked files)
[linux * (next-20141117)]$ make clean
[linux * (next-20141117)]$ cp arch/arm/configs/omap2plus_defconfig .config
[linux * (next-20141117)]$ vim arch/arm/mach-exynos/Kconfig:24:
[linux * (next-20141117)]$ git diff
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index e4a00bafffc1..02ff8534238b 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -21,7 +21,6 @@ menuconfig ARCH_EXYNOS
        select HAVE_S3C_RTC if RTC_CLASS
        select PINCTRL
        select PINCTRL_EXYNOS
-       select PM_GENERIC_DOMAINS if PM_RUNTIME
        select S5P_DEV_MFC
        select SRAM
        select MFD_SYSCON
[linux * (next-20141117)]$ yes "" | make  ARCH=arm oldconfig >/dev/null
kernel/power/Kconfig:145:error: recursive dependency detected!
kernel/power/Kconfig:145:	symbol PM depends on PM_RUNTIME
kernel/power/Kconfig:132:	symbol PM_RUNTIME is selected by PM_GENERIC_DOMAINS
kernel/power/Kconfig:272:	symbol PM_GENERIC_DOMAINS is selected by PM

Can you reproduce the above?


Paul Bolle
