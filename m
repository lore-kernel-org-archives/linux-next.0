From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the tracing
 tree
Date: Mon, 1 Jun 2009 17:55:39 +1000
Message-ID: <20090601175539.a3a3d60c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43760 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754677AbZFAILK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2009 04:11:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lai Jiangshan <laijs@cn.fujitsu.com>, Steven Rostedt <rostedt@goodmis.org>

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
include/linux/ring_buffer.h between commit
334d4169a6592d3fcd863bbe822a8f6985ffa9af ("ring_buffer: compressed event
header") from the tracing tree and commits
9b7ff384ee76ced9638ab236db588a6f13916336 ("trace: annotate bitfields in
struct ring_buffer_event") and 3467e18b1cf34c7d316af5717e7053ce845d014e
("kmemcheck: make bitfield annotations be valid C") from the kmemcheck
tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/ring_buffer.h
index f134582,771ee90..0000000
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@@ -11,7 -12,10 +12,10 @@@ struct ring_buffer_iter
   * Don't refer to this struct directly, use functions below.
   */
  struct ring_buffer_event {
+ 	kmemcheck_bitfield_begin(bitfield);
 -	u32		type:2, len:3, time_delta:27;
 +	u32		type_len:5, time_delta:27;
+ 	kmemcheck_bitfield_end(bitfield);
+ 
  	u32		array[];
  };
  
