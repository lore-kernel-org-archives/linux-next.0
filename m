From: Joshua Kinard <kumba@gentoo.org>
Subject: Re: linux-next: Tree for Feb 23 (rtc-ds1685)
Date: Mon, 23 Feb 2015 18:50:21 -0500
Message-ID: <54EBBCBD.8000800@gentoo.org>
References: <20150223140944.6ed640cf@canb.auug.org.au> <54EB7328.5060704@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from resqmta-po-06v.sys.comcast.net ([96.114.154.165]:33327 "EHLO
	resqmta-po-06v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751848AbbBWXuc (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2015 18:50:32 -0500
In-Reply-To: <54EB7328.5060704@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>

On 02/23/2015 13:36, Randy Dunlap wrote:
> On 02/22/15 19:09, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any material destined for v3.21 to your linux-next
>> included trees until after v3.20-rc1 has been released.
>>
>> OK, so that was interesting :-)  v4.0-rc1 is out, so go crazy ...
>>
>> Changes since 20150222:
>>
>> *crickets*
> 
> 
> for the last 4 days or so, I have been seeing this build error on
> i386 and x86_64:
> 
> ../drivers/rtc/rtc-ds1685.c:919:22: error: 'ds1685_rtc_alarm_irq_enable' undeclared here (not in a function)
>   .alarm_irq_enable = ds1685_rtc_alarm_irq_enable,
> 
> when CONFIG_RTC_INTF_DEV is not enabled.

A patch was sent upstream already for this:
http://ozlabs.org/~akpm/mmots/broken-out/rtc-ds1685-fix-ds1685_rtc_alarm_irq_enable-build-error.patch

I'm not sure when it will appear in linux-next (still new to this process).

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
4096R/D25D95E3 2011-03-28
