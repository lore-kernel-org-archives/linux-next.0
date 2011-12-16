From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Dec 16 (leds/tca6507)
Date: Fri, 16 Dec 2011 14:25:25 -0800
Message-ID: <4EEBC555.4010600@xenotime.net>
References: <20111216170042.650147ec79e792dce950f6e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:59896 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1760770Ab1LPVZP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Dec 2011 16:25:15 -0500
In-Reply-To: <20111216170042.650147ec79e792dce950f6e3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.de>, Richard Purdie <rpurdie@rpsys.net>

On 12/15/2011 10:00 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20111215:


When GPIOLIB is not enabled:

drivers/leds/leds-tca6507.c:158:20: error: field 'gpio' has incomplete type
drivers/leds/leds-tca6507.c: In function 'tca6507_gpio_set_value':
drivers/leds/leds-tca6507.c:534:29: warning: type defaults to 'int' in declaration of '__mptr'
drivers/leds/leds-tca6507.c:534:29: warning: initialization from incompatible pointer type
drivers/leds/leds-tca6507.c: In function 'tca6507_probe':
drivers/leds/leds-tca6507.c:618:3: error: implicit declaration of function 'gpiochip_add'
drivers/leds/leds-tca6507.c: In function 'tca6507_remove':
drivers/leds/leds-tca6507.c:651:3: error: implicit declaration of function 'gpiochip_remove'


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
