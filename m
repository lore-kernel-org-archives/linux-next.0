From: Lee Jones <lee.jones@linaro.org>
Subject: Re: next-20160927 build: 2 failures 4 warnings (next-20160927)
Date: Tue, 27 Sep 2016 20:36:45 +0100
Message-ID: <20160927193645.GI21388@dell>
References: <E1bop0x-0001YK-4h@optimist>
 <20160927160036.y3ti3gzt4ebg2vyz@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:35423 "EHLO
        mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935513AbcI0Teh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2016 15:34:37 -0400
Received: by mail-pa0-f41.google.com with SMTP id oz2so8497243pac.2
        for <linux-next@vger.kernel.org>; Tue, 27 Sep 2016 12:34:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160927160036.y3ti3gzt4ebg2vyz@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, arnd@arndb.de, Thomas Gleixner <tglx@linutronix.de>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, 27 Sep 2016, Mark Brown wrote:

> On Tue, Sep 27, 2016 at 10:49:27AM +0100, Build bot for Mark Brown wrote:
> 
> -next is still failing to build an arm and arm64 allmodconfig due to:
> 
> > 	arm64-allmodconfig
> > ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!
> 
> > 	arm-allmodconfig
> > ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!
> 
> due to 262d5cc6ceb293 (mfd: tps65217: Add support for IRQs) since
> irq_set_parent() isn't exported.  There was a fix posted adding the
> export to the IRQ subsystem but it's still not been applied, the
> function is being used in order to enable lazy IRQ disabling for
> threaded interrupts:
> 
>    https://www.spinics.net/lists/arm-kernel/msg532864.html

Right H-hour is fast approaching.  How are we going to resolve this?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
