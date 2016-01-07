From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next: Tree for Jan 6 (clocksource/fsl_ftm_timer.c)
Date: Thu, 7 Jan 2016 12:01:31 +0100
Message-ID: <568E458B.3040407@linaro.org>
References: <20160106190119.3fb848fd@canb.auug.org.au>
 <568D4E51.9030606@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <568D4E51.9030606@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: linux-next.vger.kernel.org

On 01/06/2016 06:26 PM, Randy Dunlap wrote:
> On 01/06/16 00:01, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20160105:
>>
>
> on i386:
> when CLKSRC_MMIO is not enabled:
>
> drivers/built-in.o: In function `ftm_timer_init':
> fsl_ftm_timer.c:(.init.text+0x6842): undefined reference to `clocksou=
rce_mmio_readl_up'
> fsl_ftm_timer.c:(.init.text+0x6855): undefined reference to `clocksou=
rce_mmio_init'
>
>
> Looks like FSL_FTM_TIMER needs to select CLKSRC_MMIO.

Noted.

Thanks for the head up.

  -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
