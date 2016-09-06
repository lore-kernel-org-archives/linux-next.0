From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: next-20160906 build: 2 failures 0 warnings (next-20160906)
Date: Tue, 6 Sep 2016 18:53:56 +0800
Message-ID: <20160906185356.673f572e@xhacker>
References: <E1bhC0l-0003y3-Ls@optimist>        <20160906104652.GJ3950@sirena.org.uk>
        <4307762.H85fQucTpI@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:34091 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933255AbcIFK6f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Sep 2016 06:58:35 -0400
In-Reply-To: <4307762.H85fQucTpI@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linaro-kernel@lists.linaro.org, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org

On Tue, 6 Sep 2016 12:53:56 +0200 Arnd Bergmann wrote:

> On Tuesday, September 6, 2016 11:46:52 AM CEST Mark Brown wrote:
> > On Tue, Sep 06, 2016 at 09:45:43AM +0100, Build bot for Mark Brown wrote:
> > 
> > Today's -next fails to build arm and arm64 defconfigs due to:
> >   
> > > 	arm64-allmodconfig
> > > ../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'  
> >   
> > > 	arm-allmodconfig
> > > ../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'  
> > 
> > due to fd47f104003c6 (pwm: berlin: Add suspend/resume support) which was
> > applied yesterday.
> >   
> 
> I've prepared a patch, will send as soon as I have a clean build again.
> 
> 	Arnd

Thierry has already fixed it

sorry for the inconvenience,
Jisheng
