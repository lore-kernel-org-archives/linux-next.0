From: Amit Kachhap <amit.kachhap@linaro.org>
Subject: Re: [PATCH -next] thermal: cpu_cooling.c needs to select CPU_FREQ_TABLE
Date: Thu, 13 Sep 2012 17:46:02 +0900
Message-ID: <CAK44p21WAmcvFFqVOwhUfT8onR9QxgTPcAM8ernRGtw4s396bw@mail.gmail.com>
References: <20120912184644.48e4e2e7d59b12893a42f60a@canb.auug.org.au>
	<5050CF0E.3080502@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5050CF0E.3080502@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On 13 September 2012 03:06, Randy Dunlap <rdunlap@xenotime.net> wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
>
> cpu_cooling.c (CONFIG_CPU_THERMAL) uses cpu frequency table
> intefaces so it should select CPU_FREQ_TABLE.
> Fixes these build errors:
>
> drivers/built-in.o: In function `cpufreq_get_max_state':
> cpu_cooling.c:(.text+0x4e1297): undefined reference to `cpufreq_frequency_get_table'
> drivers/built-in.o: In function `cpufreq_set_cur_state':
> cpu_cooling.c:(.text+0x4e138b): undefined reference to `cpufreq_frequency_get_table'
>
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc: Amit Daniel <amit.kachhap@linaro.org>
> ---
>  drivers/thermal/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> Also, please add info in the MAINTAINERS file for drivers/thermal/.
>
> --- linux-next-20120912.orig/drivers/thermal/Kconfig
> +++ linux-next-20120912/drivers/thermal/Kconfig
> @@ -22,6 +22,7 @@ config THERMAL_HWMON
>  config CPU_THERMAL
>         bool "generic cpu cooling support"
>         depends on THERMAL && CPU_FREQ
> +       select CPU_FREQ_TABLE

This change looks good to me. Even similar select is present platform
cpufreq drivers which uses the cpufreq API's.

Thanks,
Amit Daniel
>         help
>           This implements the generic cpu cooling mechanism through frequency
>           reduction, cpu hotplug and any other ways of reducing temperature. An
