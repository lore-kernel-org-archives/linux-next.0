From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clockevents tree
Date: Tue, 7 Jun 2016 13:12:54 +1000
Message-ID: <20160607131254.55ec84d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51708 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751049AbcFGDM5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Jun 2016 23:12:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Daniel,

After merging the clockevents tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/clocksource/versatile.c: In function 'versatile_sched_clock_init':
drivers/clocksource/versatile.c:33:11: error: 'EXNIO' undeclared (first use in this function)
   return -EXNIO;
           ^
drivers/clocksource/versatile.c:33:11: note: each undeclared identifier is reported only once for each function it appears in
drivers/clocksource/versatile.c:33:10: warning: 'return' with a value, in function returning void
   return -EXNIO;
          ^
drivers/clocksource/versatile.c:39:9: warning: 'return' with a value, in function returning void
  return 0;
         ^
In file included from include/linux/clocksource.h:18:0,
                 from drivers/clocksource/versatile.c:14:
drivers/clocksource/versatile.c: At top level:
include/linux/of.h:1002:20: warning: comparison of distinct pointer types lacks a cast
        .data = (fn == (fn_type)NULL) ? fn : fn  }
                    ^
include/linux/of.h:1018:3: note: in expansion of macro '_OF_DECLARE'
   _OF_DECLARE(table, name, compat, fn, of_init_fn_1_ret)
   ^
include/linux/clocksource.h:247:2: note: in expansion of macro 'OF_DECLARE_1_RET'
  OF_DECLARE_1_RET(clksrc_ret, name, compat, fn)
  ^
drivers/clocksource/versatile.c:41:1: note: in expansion of macro 'CLOCKSOURCE_OF_DECLARE'
 CLOCKSOURCE_OF_DECLARE(vexpress, "arm,vexpress-sysreg",
 ^
include/linux/of.h:1002:20: warning: comparison of distinct pointer types lacks a cast
        .data = (fn == (fn_type)NULL) ? fn : fn  }
                    ^
include/linux/of.h:1018:3: note: in expansion of macro '_OF_DECLARE'
   _OF_DECLARE(table, name, compat, fn, of_init_fn_1_ret)
   ^
include/linux/clocksource.h:247:2: note: in expansion of macro 'OF_DECLARE_1_RET'
  OF_DECLARE_1_RET(clksrc_ret, name, compat, fn)
  ^
drivers/clocksource/versatile.c:43:1: note: in expansion of macro 'CLOCKSOURCE_OF_DECLARE'
 CLOCKSOURCE_OF_DECLARE(versatile, "arm,versatile-sysreg",
 ^

Caused by commit

  339ecd4051c3 ("clocksource/drivers/versatile: Convert init function to return error")

I have used the clockevents tree from next-20160606 for today.

-- 
Cheers,
Stephen Rothwell
