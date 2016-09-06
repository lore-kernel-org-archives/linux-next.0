From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20160906 build: 2 failures 0 warnings (next-20160906)
Date: Tue, 06 Sep 2016 12:53:56 +0200
Message-ID: <4307762.H85fQucTpI@wuerfel>
References: <E1bhC0l-0003y3-Ls@optimist> <20160906104652.GJ3950@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:58278 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933053AbcIFKyF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Sep 2016 06:54:05 -0400
In-Reply-To: <20160906104652.GJ3950@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linaro-kernel@lists.linaro.org
Cc: Mark Brown <broonie@kernel.org>, Jisheng Zhang <jszhang@marvell.com>, Thierry Reding <thierry.reding@gmail.com>, Antoine =?ISO-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org

On Tuesday, September 6, 2016 11:46:52 AM CEST Mark Brown wrote:
> On Tue, Sep 06, 2016 at 09:45:43AM +0100, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build arm and arm64 defconfigs due to:
> 
> > 	arm64-allmodconfig
> > ../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'
> 
> > 	arm-allmodconfig
> > ../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'
> 
> due to fd47f104003c6 (pwm: berlin: Add suspend/resume support) which was
> applied yesterday.
> 

I've prepared a patch, will send as soon as I have a clean build again.

	Arnd
