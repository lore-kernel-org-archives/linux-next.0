From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jan 6 (clocksource/fsl_ftm_timer.c)
Date: Wed, 6 Jan 2016 09:26:41 -0800
Message-ID: <568D4E51.9030606@infradead.org>
References: <20160106190119.3fb848fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:50830 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751595AbcAFR0s (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jan 2016 12:26:48 -0500
In-Reply-To: <20160106190119.3fb848fd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Xiubo Li <Li.Xiubo@freescale.com>

On 01/06/16 00:01, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160105:
> 

on i386:
when CLKSRC_MMIO is not enabled:

drivers/built-in.o: In function `ftm_timer_init':
fsl_ftm_timer.c:(.init.text+0x6842): undefined reference to `clocksource_mmio_readl_up'
fsl_ftm_timer.c:(.init.text+0x6855): undefined reference to `clocksource_mmio_init'


Looks like FSL_FTM_TIMER needs to select CLKSRC_MMIO.



-- 
~Randy
