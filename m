From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Thu, 23 Oct 2008 15:12:41 +1100
Message-ID: <20081023151241.d5ad0919.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38663 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751845AbYJWFCA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 01:02:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in kernel/smp.c
between commit 562d8c23497402eb7eb9caf8dab84439a03a49ea ("smp: reduce
stack requirements for smp_call_function_mask") from the cpus4096 tree
and commit  ("1855648ee0b5ed8fe800edf401bbe25a3f2ed94a") from the rr tree.

Overlapping changes.  I have used the version from the rr tree, but I am
not sure if that is the correct thing to do.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
