From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Date: Sat, 30 Dec 2017 10:44:55 +1100
Message-ID: <20171230104455.10f9efa5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38501 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750709AbdL2Xo6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 Dec 2017 18:44:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Borislav Petkov <bp@suse.de>

Hi all,

Commit

  113702e96dc7 ("x86/insn-eval: Add utility functions to get segment selector")

is missing a Signed-off-by from its author and committer.

It's possible its author and committer were both changed by the
cherry-pick ... Also, the commit message does not seem to describe what
this patch does.

-- 
Cheers,
Stephen Rothwell
