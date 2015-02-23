From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 23 (rtc-ds1685)
Date: Mon, 23 Feb 2015 10:36:24 -0800
Message-ID: <54EB7328.5060704@infradead.org>
References: <20150223140944.6ed640cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:41366 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752356AbbBWSgb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Feb 2015 13:36:31 -0500
In-Reply-To: <20150223140944.6ed640cf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Joshua Kinard <kumba@gentoo.org>

On 02/22/15 19:09, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material destined for v3.21 to your linux-next
> included trees until after v3.20-rc1 has been released.
> 
> OK, so that was interesting :-)  v4.0-rc1 is out, so go crazy ...
> 
> Changes since 20150222:
> 
> *crickets*


for the last 4 days or so, I have been seeing this build error on
i386 and x86_64:

../drivers/rtc/rtc-ds1685.c:919:22: error: 'ds1685_rtc_alarm_irq_enable' undeclared here (not in a function)
  .alarm_irq_enable = ds1685_rtc_alarm_irq_enable,

when CONFIG_RTC_INTF_DEV is not enabled.



-- 
~Randy
