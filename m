From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pinctrl tree
Date: Thu, 12 May 2016 14:14:11 +1000
Message-ID: <20160512141411.731ba5c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Linus,

After merging the pinctrl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/thread_info.h:11:0,
                 from include/asm-generic/preempt.h:4,
                 from arch/arm/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:59,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:35,
                 from include/linux/time.h:5,
                 from include/linux/stat.h:18,
                 from include/linux/module.h:10,
                 from drivers/pinctrl/tegra/pinctrl-tegra20.c:20:
include/linux/bug.h:34:45: error: unknown field 'parked_reg' specified in initializer
 #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
                                             ^
include/linux/compiler-gcc.h:64:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
 #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                            ^
include/linux/kernel.h:54:59: note: in expansion of macro '__must_be_array'
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                           ^
drivers/pinctrl/tegra/pinctrl-tegra20.c:2027:12: note: in expansion of macro 'ARRAY_SIZE'
   .npins = ARRAY_SIZE(drive_##pg_name##_pins), \
            ^
drivers/pinctrl/tegra/pinctrl-tegra20.c:2050:2: note: in expansion of macro 'DRV_PG_EXT'
  DRV_PG_EXT(pg_name, r, 2,  3,  4, 12, 20, 28, 2, 30, 2)
  ^
drivers/pinctrl/tegra/pinctrl-tegra20.c:2178:2: note: in expansion of macro 'DRV_PG'
  DRV_PG(ao1,        0x868),
  ^

and many more.

I cannot figure out what caused it, but using the pinctrl tree from
next-20160511 makes it build again.

I am using gcc 5.2.0 hosted on powerpcle, if that matters.

-- 
Cheers,
Stephen Rothwell
