From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tracing tree with the net tree
Date: Fri, 22 May 2009 16:15:19 +1000
Message-ID: <20090522161519.97c8968b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756760AbZEVGPj@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Neil Horman <nhorman@tuxdriver.com>, Steven Rostedt <srostedt@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tracing tree got a conflict in
net/core/drop_monitor.c between commit
4ea7e38696c7e798c47ebbecadfd392f23f814f9 ("dropmon: add ability to detect
when hardware dropsrxpackets") from the net tree and commit
ad8d75fff811a6a230f7f43b05a6483099349533 ("tracing/events: move trace
point headers into include/trace/events") from the tracing tree.

I fixed it up (see below) and can carry the fix as necessary.  I suspect
that trace/napi.h should eventually go into trace/events as well.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc net/core/drop_monitor.c
index a6c2ac2,b75b6ce..0000000
--- a/net/core/drop_monitor.c
+++ b/net/core/drop_monitor.c
@@@ -22,10 -22,8 +22,10 @@@
  #include <linux/timer.h>
  #include <linux/bitops.h>
  #include <net/genetlink.h>
 +#include <net/netevent.h>
  
- #include <trace/skb.h>
+ #include <trace/events/skb.h>
 +#include <trace/napi.h>
  
  #include <asm/unaligned.h>
  
