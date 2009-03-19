From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 19 (wireless/p54)
Date: Thu, 19 Mar 2009 11:49:48 -0700
Message-ID: <49C293CC.6020009@oracle.com>
References: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au> <49C280BE.8090106@oracle.com> <200903191850.17825.mb@bu3sch.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:55697 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756453AbZCSSsM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Mar 2009 14:48:12 -0400
In-Reply-To: <200903191850.17825.mb@bu3sch.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Buesch <mb@bu3sch.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Michael Buesch wrote:
> On Thursday 19 March 2009 18:28:30 Randy Dunlap wrote:
>> Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20090318:
>>
>> ERROR: "led_classdev_register" [drivers/net/wireless/p54/p54common.ko] undefined!
>> ERROR: "led_classdev_unregister" [drivers/net/wireless/p54/p54common.ko] undefined!
>>
>> One possible option (fix) is to have CONFIG_MAC80211_LEDS also select
>> LEDS_CLASS (that would build the missing functions).
> 
> Does p54 select CONFIG_MAC80211_LEDS? If that's the case, I think it should

  No, it doesn't.  p54common.c just has a large block of code that is
surrounded by
#ifdef CONFIG_MAC80211_LEDS
...
#endif

so we could argue that it's just purely a p54 bug.

> probably do it the other way around. p54 should build its LED code if CONFIG_MAC80211_LEDS
> is available. Otherwise it should not.
> 
> This way you don't enter the SELECT dependency hell and still have automagic configuration.
> 
> Take a look at b43 for an example.


-- 
~Randy
