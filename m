From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Fri, 27 Feb 2015 09:42:02 -0800
Message-ID: <54F0AC6A.6070707@codeaurora.org>
References: <20150227140855.74020ea4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42038 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754632AbbB0RmF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Feb 2015 12:42:05 -0500
In-Reply-To: <20150227140855.74020ea4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/26/15 19:08, Stephen Rothwell wrote:
> Hi Mike,
>
> After merging the clk tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from include/trace/define_trace.h:90:0,
>                  from include/trace/events/clk.h:198,
>                  from drivers/clk/clk.c:26:
> include/trace/events/clk.h: In function 'ftrace_get_offsets_clk':
> include/trace/events/clk.h:30:40: error: dereferencing pointer to incomplete type
>    __string(        name,           core->name       )
>                                         ^
> include/trace/ftrace.h:465:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
>   tstruct;       \
>   ^
> include/trace/events/clk.h:29:2: note: in expansion of macro 'TP_STRUCT__entry'
>   TP_STRUCT__entry(
>   ^
> include/trace/ftrace.h:430:29: note: in expansion of macro '__dynamic_array'
>  #define __string(item, src) __dynamic_array(char, item,   \
>                              ^
> include/trace/events/clk.h:30:3: note: in expansion of macro '__string'
>    __string(        name,           core->name       )
>    ^
>
> and many more ...
>
> Caused by commit 0742a46667e3 ("clk: Add tracepoints for hardware
> operations").
>
> I have used the version of the clk tree from next-20150225 for today
> (since yesterday's tree had a different build problem).

The problem is the patch was written before struct clk_core moved into
the clk.c file and then applied after it moved. So before the move the
order of includes would cause the struct definition to be before the
place where the tracepoint macros were expanded. The fix is to move the
tracepoint include after the struct clk_core definition:

-----8<----

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9aee501b8284..392477033990 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -22,9 +22,6 @@
 #include <linux/init.h>
 #include <linux/sched.h>
 
-#define CREATE_TRACE_POINTS
-#include <trace/events/clk.h>
-
 #include "clk.h"
 
 static DEFINE_SPINLOCK(enable_lock);
@@ -80,6 +77,9 @@ struct clk_core {
 	struct kref		ref;
 };
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/clk.h>
+
 struct clk {
 	struct clk_core	*core;
 	const char *dev_id;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
