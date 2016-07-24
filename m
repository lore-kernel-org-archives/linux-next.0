From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Sun, 24 Jul 2016 15:32:33 +1000
Message-ID: <20160724153233.49f1574d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Rich Felker <dalias@libc.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

In file included from include/linux/clocksource.h:18:0,
                 from include/linux/clockchips.h:13,
                 from drivers/clocksource/jcore-pit.c:14:
include/linux/of.h:1004:20: warning: comparison of distinct pointer types lacks a cast
        .data = (fn == (fn_type)NULL) ? fn : fn  }
                    ^
include/linux/of.h:1020:3: note: in expansion of macro '_OF_DECLARE'
   _OF_DECLARE(table, name, compat, fn, of_init_fn_1_ret)
   ^
include/linux/clocksource.h:247:2: note: in expansion of macro 'OF_DECLARE_1_RET'
  OF_DECLARE_1_RET(clksrc, name, compat, fn)
  ^
drivers/clocksource/jcore-pit.c:277:1: note: in expansion of macro 'CLOCKSOURCE_OF_DECLARE'
 CLOCKSOURCE_OF_DECLARE(jcore_pit, "jcore,pit", jcore_pit_init);
 ^

Introduced by commits

  b7c4db861683 ("clocksource/drivers/clksrc-probe: Introduce init functions with return code")
  177cf6e52b0a ("clocksources: Switch back to the clksrc table")

interacting with commit

  e0aa0655c60b ("clocksource: add J-Core timer/clocksource driver")

from the sh tree.

-- 
Cheers,
Stephen Rothwell
