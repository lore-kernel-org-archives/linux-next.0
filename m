From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: linux-next: build warning after merge of the rtc tree
Date: Thu, 6 Jul 2017 07:54:58 +0200
Message-ID: <f8ad4233-93b8-b643-a272-9f9b3b89261a@gmail.com>
References: <20170706142407.71e3b513@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170706142407.71e3b513@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Am 06.07.2017 um 06:24 schrieb Stephen Rothwell:
> Hi Alexandre,
> 
> After merging the rtc tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> drivers/rtc/rtc-ds1307.c: In function 'ds1307_get_time':
> drivers/rtc/rtc-ds1307.c:342:26: warning: unused variable 'chip' [-Wunused-variable]
>   const struct chip_desc *chip = &chips[ds1307->type];
>                           ^
> 
> Introduced by commit
> 
>   436c93db60a4 ("rtc: ds1307: factor out century bit handling")
> 
Right, if RTC_DRV_DS1307 is defined but RTC_DRV_DS1307_CENTURY is not
then variable chip isn't used in ds1307_get_time.
We could fix this by simply defining variable chip only if
RTC_DRV_DS1307_CENTURY is defined.

However the current situation leaves the question why
RTC_DRV_DS1307_CENTURY isn't set in the ppc64 defconfig.
This config option should be n only temporarily if a system has
to be fixed, see description of this option.
Maybe we should set this config option to "default y" ?

Rgds, Heiner
