From: Arun MURTHY <arun.murthy@stericsson.com>
Subject: RE: linux-next: build failure after merge of the final tree (mfd
 tree related)
Date: Tue, 14 Sep 2010 07:05:23 +0200
Message-ID: <F45880696056844FA6A73F415B568C69532D594AA0@EXDCVYMBSTM006.EQ1STM.local>
References: <20100914134321.5eee798a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100914134321.5eee798a.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@linux.intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus WALLEIJ <linus.walleij@stericsson.com>, Mattias WALLIN <mattias.wallin@stericsson.com>, Srinidhi KASAGAR <srinidhi.kasagar@stericsson.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen/Samuel,
	The following patch fixes the build issue.

Thanks and Regards,
Arun R Murthy
-------------
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig index fbfe14a..841ce47 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -475,7 +475,7 @@ config EZX_PCAP

 config AB8500_CORE
        bool "ST-Ericsson AB8500 Mixed Signal Power Management chip"
-       depends on GENERIC_HARDIRQS && ABX500_CORE
+       depends on GENERIC_HARDIRQS && ABX500_CORE && ARCH_U8500
        select MFD_CORE
        help
          Select this option to enable access to AB8500 power management
------------

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Tuesday, September 14, 2010 9:13 AM
> To: Samuel Ortiz
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Arun
> MURTHY
> Subject: linux-next: build failure after merge of the final tree (mfd
> tree related)
> 
> Hi Samuel,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/mfd/built-in.o: In function `__crc_pwm_free':
> (*ABS*+0x24ba6d1e): multiple definition of `__crc_pwm_free'
> drivers/mfd/built-in.o: In function `.pwm_free':
> (.text+0x1ab3c): multiple definition of `.pwm_free'
> drivers/misc/built-in.o:(.text+0x2620c): first defined here
> drivers/mfd/built-in.o: In function `__crc_pwm_request':
> (*ABS*+0xc1f4ec93): multiple definition of `__crc_pwm_request'
> drivers/mfd/built-in.o: In function `__crc_pwm_enable':
> (*ABS*+0x9d09808d): multiple definition of `__crc_pwm_enable'
> drivers/mfd/built-in.o: In function `.pwm_enable':
> (.text+0x1abc8): multiple definition of `.pwm_enable'
> drivers/misc/built-in.o:(.text+0x26278): first defined here
> drivers/mfd/built-in.o: In function `.pwm_request':
> (.text+0x1a774): multiple definition of `.pwm_request'
> drivers/misc/built-in.o:(.text+0x2604c): first defined here
> drivers/mfd/built-in.o: In function `pwm_config':
> (.opd+0x1ce0): multiple definition of `pwm_config'
> drivers/misc/built-in.o:(.opd+0x3000): first defined here
> drivers/mfd/built-in.o: In function `pwm_free':
> (.opd+0x1d28): multiple definition of `pwm_free'
> drivers/misc/built-in.o:(.opd+0x2fd0): first defined here
> drivers/mfd/built-in.o: In function `pwm_request':
> (.opd+0x1cf8): multiple definition of `pwm_request'
> drivers/misc/built-in.o:(.opd+0x2f58): first defined here
> drivers/mfd/built-in.o: In function `__crc_pwm_disable':
> (*ABS*+0xb0493b18): multiple definition of `__crc_pwm_disable'
> drivers/mfd/built-in.o: In function `.pwm_disable':
> (.text+0x1aa24): multiple definition of `.pwm_disable'
> drivers/misc/built-in.o:(.text+0x2613c): first defined here
> drivers/mfd/built-in.o: In function `pwm_enable':
> (.opd+0x1d40): multiple definition of `pwm_enable'
> drivers/misc/built-in.o:(.opd+0x2fe8): first defined here
> drivers/mfd/built-in.o: In function `.pwm_config':
> (.text+0x1a648): multiple definition of `.pwm_config'
> drivers/misc/built-in.o:(.text+0x26358): first defined here
> drivers/mfd/built-in.o: In function `pwm_disable':
> (.opd+0x1d10): multiple definition of `pwm_disable'
> drivers/misc/built-in.o:(.opd+0x2fb8): first defined here
> drivers/mfd/built-in.o: In function `__crc_pwm_config':
> (*ABS*+0xc23f5b9): multiple definition of `__crc_pwm_config'
> 
> Caused by commit 03f582a93ecca6e9584b622570022abf08ed03ec ("misc: Add
> ab8500 pwm driver").  I have reverted that commit for today.
> 
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
