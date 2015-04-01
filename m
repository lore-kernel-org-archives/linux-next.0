From: Daniel Mack <daniel@zonque.org>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Wed, 01 Apr 2015 08:13:39 +0200
Message-ID: <551B8C93.8010204@zonque.org>
References: <20150401000221.21961ecd@canb.auug.org.au>	<20150331161640.GA16540@roeck-us.net>	<20150331230749.GA6564@kroah.com> <20150401104233.563d0022@canb.auug.org.au> <551B56E0.7090209@roeck-us.net> <551B5BDC.5060706@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from svenfoo.org ([82.94.215.22]:33066 "EHLO mail.zonque.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750908AbbDAGNn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Apr 2015 02:13:43 -0400
In-Reply-To: <551B5BDC.5060706@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>

On 04/01/2015 04:45 AM, Guenter Roeck wrote:
> On 03/31/2015 07:24 PM, Guenter Roeck wrote:

>> Now I am left with the question if the samples build should be
>> masked for alpha and mips, or if I should drop building samples
>> from my 'allmodconfig' builds. I think I'll do the latter;
>> there seems to be an expectation that samples are built with
>> a recent toolchain, and I can not keep rebuilding toolchains for
>> the rest of my life.
>>
> 
> Weird - the kdbus sample doesn't have its own configuration option,
> unlike other samples. So it's all or nothing for alpha and mips.

I've already sent a patch for this yesterday, and I'm sure Greg will
merge it anytime soon:

  https://lkml.org/lkml/2015/3/31/306

I wouldn't mind if we masked that config symbol for archs which don't
have memfds wired, but I'm also open to other suggestions.


Thanks,
Daniel
