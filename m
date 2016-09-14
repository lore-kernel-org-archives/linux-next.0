From: Lee Jones <lee.jones@linaro.org>
Subject: Re: next-20160914 build: 2 failures 3 warnings (next-20160914)
Date: Wed, 14 Sep 2016 20:58:30 +0100
Message-ID: <20160914195830.GF638@dell>
References: <E1bk5OS-0000Vu-1C@optimist>
 <20160914171137.GF27974@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35042 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755879AbcINT4e (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Sep 2016 15:56:34 -0400
Received: by mail-wm0-f47.google.com with SMTP id i130so66126529wmf.0
        for <linux-next@vger.kernel.org>; Wed, 14 Sep 2016 12:56:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160914171137.GF27974@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, 14 Sep 2016, Mark Brown wrote:

> On Wed, Sep 14, 2016 at 09:18:08AM +0100, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build both arm and arm64 allmodconfig due to:
> 
> > 	arm64-allmodconfig
> > ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!
> > 
> > 	arm-allmodconfig
> > ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!
> 
> due to 262d5cc6ceb293 (mfd: tps65217: Add support for IRQs) since
> irq_set_parent() isn't exported.

Arnd is talking to Thomas about a possible solution.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
