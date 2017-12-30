From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Date: Sat, 30 Dec 2017 09:20:31 +0100
Message-ID: <20171230082031.6bij6bukw5lgri74@gmail.com>
References: <20171230104455.10f9efa5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:37830 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750815AbdL3IUf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 30 Dec 2017 03:20:35 -0500
Content-Disposition: inline
In-Reply-To: <20171230104455.10f9efa5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Borislav Petkov <bp@suse.de>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Commit
> 
>   113702e96dc7 ("x86/insn-eval: Add utility functions to get segment selector")
> 
> is missing a Signed-off-by from its author and committer.
> 
> It's possible its author and committer were both changed by the
> cherry-pick ... Also, the commit message does not seem to describe what
> this patch does.

It's a partial cherry-pick of 32d0b95300db03c - I've updated the changelog and 
fixed the SOB line.

Thanks,

	Ingo
