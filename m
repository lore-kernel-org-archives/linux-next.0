From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: next-20160914 build: 2 failures 3 warnings (next-20160914)
Date: Thu, 15 Sep 2016 09:49:46 +1000
Message-ID: <87d1k6nisl.fsf@concordia.ellerman.id.au>
References: <E1bk5OS-0000Vu-1C@optimist> <20160914171137.GF27974@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34630 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1762269AbcINXts (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Sep 2016 19:49:48 -0400
In-Reply-To: <20160914171137.GF27974@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Marcin Niestroj <m.niestroj@grinn-global.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Mark Brown <broonie@kernel.org> writes:

> [ Unknown signature status ]
> On Wed, Sep 14, 2016 at 09:18:08AM +0100, Build bot for Mark Brown wrote:
>
> Today's -next fails to build both arm and arm64 allmodconfig due to:
>
>> 	arm64-allmodconfig
>> ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!
>> 
>> 	arm-allmodconfig
>> ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!
>
> due to 262d5cc6ceb293 (mfd: tps65217: Add support for IRQs) since
> irq_set_parent() isn't exported.

And powerpc too.

cheers
