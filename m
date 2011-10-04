From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Tue, 04 Oct 2011 11:39:31 +0200
Message-ID: <4E8AD453.8000809@atmel.com>
References: <20111004112623.aa04e959d29cb19af8053739@canb.auug.org.au> <201110040940.12876.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from newsmtp5.atmel.com ([204.2.163.5]:5367 "EHLO sjogate2.atmel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755668Ab1JDKRJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Oct 2011 06:17:09 -0400
In-Reply-To: <201110040940.12876.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org

On 10/04/2011 09:40 AM, Arnd Bergmann :
> On Tuesday 04 October 2011, Stephen Rothwell wrote:
>> After merging the arm-soc tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> ERROR: "clk_enable" [drivers/misc/atmel_pwm.ko] undefined!
>> ERROR: "clk_disable" [drivers/misc/atmel_pwm.ko] undefined!
>> ERROR: "clk_put" [drivers/misc/atmel_pwm.ko] undefined!
>> ERROR: "clk_get_rate" [drivers/misc/atmel_pwm.ko] undefined!
>> ERROR: "clk_get" [drivers/misc/atmel_pwm.ko] undefined!
>>
>> Caused by commit 9dccc010c816 ("ARM: at91: remove dependency for Atmel
>> PWM driver selector in Kconfig").
>>
>> I have used the arm-soc tree from next-20110930 for today.
> 
> Ah, thanks for tracking this down. I actually noticed the same
> problem on an ARM build but did not realize it was from one of
> the patches I had jut put in there myself.
> 
> I'm really glad I didn't send this to Linus cc:stable yet then.
> Nicolas, in my randconfig branch, I've fixed this by adding
> 
> 	depends on HAVE_CLK
> 
> which I think is the right solution. I'll replace your patch
> with one that does this if you don't mind.

Sure, thanks a lot for fixing this!

> I'd also remove the stable tag for this patch, because it can
> have unintended side-effects on other architectures.

Yes, I have not figured out it can have such an impact.

Thanks for your help, best regards,
-- 
Nicolas Ferre
