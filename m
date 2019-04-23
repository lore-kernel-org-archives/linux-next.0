From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: build failure after merge of the at91 tree
Date: Tue, 23 Apr 2019 13:27:52 +0900
Message-ID: <CAK7LNAQWMVqbN9Bytz7WWrUvJ_fe8joUR+R4jmszV54pkucvyA@mail.gmail.com>
References: <20190423084042.29fd9c03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423084042.29fd9c03@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 23, 2019 at 10:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the at91 tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> arch/arm/mach-at91/pm_suspend.S:17:10: fatal error: pm_data-offsets.h: No such file or directory
>  #include "pm_data-offsets.h"
>           ^~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   ab690fa1eb4b ("ARM: at91: move platform-specific asm-offset.h to arch/arm/mach-at91")
>
> I used the version of the at91 tree from next-20190418 for today.


Sorry, I missed to test the out-of-tree build.

-I $(srctree)/$(src) is not added
when check-in assembly files include a generated header.
(I think this should be automatically cared by Kbuild, though.)


Ludovic,

Could you drop this patch for now?




-- 
Best Regards
Masahiro Yamada
