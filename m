From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: linux-next: build failure after merge of the at91 tree
Date: Tue, 23 Apr 2019 09:22:54 +0200
Message-ID: <20190423072254.qa772iolhha7xb6l@M43218.corp.atmel.com>
References: <20190423084042.29fd9c03@canb.auug.org.au>
 <CAK7LNAQWMVqbN9Bytz7WWrUvJ_fe8joUR+R4jmszV54pkucvyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNAQWMVqbN9Bytz7WWrUvJ_fe8joUR+R4jmszV54pkucvyA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 23, 2019 at 01:27:52PM +0900, Masahiro Yamada wrote:
> External E-Mail
> 
> 
> On Tue, Apr 23, 2019 at 10:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the at91 tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > arch/arm/mach-at91/pm_suspend.S:17:10: fatal error: pm_data-offsets.h: No such file or directory
> >  #include "pm_data-offsets.h"
> >           ^~~~~~~~~~~~~~~~~~~
> >
> > Caused by commit
> >
> >   ab690fa1eb4b ("ARM: at91: move platform-specific asm-offset.h to arch/arm/mach-at91")
> >
> > I used the version of the at91 tree from next-20190418 for today.
> 
> 
> Sorry, I missed to test the out-of-tree build.
> 
> -I $(srctree)/$(src) is not added
> when check-in assembly files include a generated header.
> (I think this should be automatically cared by Kbuild, though.)
> 
> 
> Ludovic,
> 
> Could you drop this patch for now?

Yes I dropped it from my PR for 5.2 and remove it from at91-next.

Regards

Ludovic
