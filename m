From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: linux-next: Tree for Oct 11 (gpio regulator)
Date: Tue, 11 Oct 2011 22:22:24 +0200
Message-ID: <201110112222.24646.heiko@sntech.de>
References: <20111011201127.455df266dcbffb1d621f8576@canb.auug.org.au> <4E9499BB.6030607@xenotime.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4E9499BB.6030607@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

Hi Randy,

Am Dienstag 11 Oktober 2011, 21:32:11 schrieb Randy Dunlap:
> On 10/11/11 02:11, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The linux-next tree is now available from
> > git://github.com/sfrothwell/linux-next.git as a temporary measure while
> > the kernel.org servers are unavailable.
> > 
> > It may also turn up on git.kernel.org (depending on the mirroring).  The
> > patch set is still absent, however.
> > 
> > Changes since 20111007:
> > 
> > The gpio tree still has its build failure so I used the version from
> > next-20111005.
> 
> (maybe fixed there?)
> (i386 build)
> 
> drivers/regulator/gpio-regulator.c:121:3: error: invalid use of undefined
> type 'struct gpio' drivers/regulator/gpio-regulator.c:121:29: error:
> dereferencing pointer to incomplete type
> drivers/regulator/gpio-regulator.c:191:32: error: invalid application of
> 'sizeof' to incomplete type 'struct gpio'
> drivers/regulator/gpio-regulator.c:281:3: error: invalid use of undefined
> type 'struct gpio' drivers/regulator/gpio-regulator.c:281:20: error:
> dereferencing pointer to incomplete type
> 
> (GPIOLIB is not enabled.)
> Full randconfig file is attached.

thanks for catching this.

I would guess the Kconfig entry of the gpio-regulator needs a
		"depends on GENERIC_GPIO"
as it won't be able to function without gpiolib - correct?

Heiko
