From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: build warning after merge of the rtc tree
Date: Thu, 6 Jul 2017 08:59:01 +0200
Message-ID: <20170706065901.op7tk2rhzmyay7md@piout.net>
References: <20170706142407.71e3b513@canb.auug.org.au>
 <f8ad4233-93b8-b643-a272-9f9b3b89261a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:44292 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750778AbdGFG7D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jul 2017 02:59:03 -0400
Content-Disposition: inline
In-Reply-To: <f8ad4233-93b8-b643-a272-9f9b3b89261a@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 06/07/2017 at 07:54:58 +0200, Heiner Kallweit wrote:
> Am 06.07.2017 um 06:24 schrieb Stephen Rothwell:
> > Hi Alexandre,
> > 
> > After merging the rtc tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> > 
> > drivers/rtc/rtc-ds1307.c: In function 'ds1307_get_time':
> > drivers/rtc/rtc-ds1307.c:342:26: warning: unused variable 'chip' [-Wunused-variable]
> >   const struct chip_desc *chip = &chips[ds1307->type];
> >                           ^
> > 
> > Introduced by commit
> > 
> >   436c93db60a4 ("rtc: ds1307: factor out century bit handling")
> > 
> Right, if RTC_DRV_DS1307 is defined but RTC_DRV_DS1307_CENTURY is not
> then variable chip isn't used in ds1307_get_time.
> We could fix this by simply defining variable chip only if
> RTC_DRV_DS1307_CENTURY is defined.
> 
> However the current situation leaves the question why
> RTC_DRV_DS1307_CENTURY isn't set in the ppc64 defconfig.
> This config option should be n only temporarily if a system has
> to be fixed, see description of this option.
> Maybe we should set this config option to "default y" ?
> 

Well, the code would still have to be fixed.

> Rgds, Heiner

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
