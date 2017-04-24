From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Mon, 24 Apr 2017 13:32:55 +1000
Message-ID: <20170424133255.0a75cff1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35417 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1164470AbdDXDdE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Apr 2017 23:33:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/tracepoint.c: In function 'tracepoint_remove_func':
kernel/tracepoint.c:253:4: error: implicit declaration of function 'static_key_slow_dec_cpuslocked' [-Werror=implicit-function-declaration]
    static_key_slow_dec_cpuslocked(&tp->key);
    ^

Caused by commit

  24db7a671bd5 ("trace/perf: Cure hotplug lock ordering issues")

static_key_slow_dec_cpuslocked() is only defined if HAVE_JUMP_LABEL is
set - which is only defined if defined(CC_HAVE_ASM_GOTO) &&
defined(CONFIG_JUMP_LABEL).  CONFIG_JUMP_LABEL is not set for this build.

I wasn't sure if just adding

  #define static_key_slow_dec_cpuslocked static_key_slow_dec

in the !HAVE_JUMP_LABEL case in include/linux/jump_label.h would be
sufficient, so I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
