From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Wed, 1 Apr 2015 06:16:46 +0300
Message-ID: <CAMo8Bf+D0wrvVt5H2XTqpHOo=6x2jZdwbOg7pW=zXhv2ZCBM2g@mail.gmail.com>
References: <20150401000221.21961ecd@canb.auug.org.au>
	<20150331161640.GA16540@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150331161640.GA16540@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 31, 2015 at 7:16 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>
> xtensa
>
> Lots of 'dangerous relocation: l32r: literal placed after use' all over the
> place, causing all xtensa builds to fail.
>
> Introduced by commit 779c88c94c34 ("ARM: 8321/1: asm-generic: introduce
> .text.fixup input section").

I'm looking at it.

-- 
Thanks.
-- Max
