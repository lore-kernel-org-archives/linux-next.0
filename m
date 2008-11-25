From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the cputime tree
Date: Tue, 25 Nov 2008 11:06:52 +0100
Message-ID: <1227607612.4259.1428.camel@twins>
References: <20081125202105.2e80cf92.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:49718 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752231AbYKYKHF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 05:07:05 -0500
In-Reply-To: <20081125202105.2e80cf92.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar <mingo@elte.hu>

On Tue, 2008-11-25 at 20:21 +1100, Stephen Rothwell wrote:
> Hi Martin,
> 
> Today's linux-next merge of the cputime tree got a conflict in
> kernel/sched.c between commit 74fcd524e808975dd546dac847119f1995a7c622
> ("account_steal_time: kill the unneeded account_group_system_time()")
> from the tip-core tree and commit
> b7f4776b7f575ed8f288c44b64befd241fd44458 ("[PATCH] idle cputime
> accounting") from the cputime tree.
> 
> The latter removes the call to account_group_system_time() as a side
> effect of further changes.  So the fixup is to just take the latter
> change.  I can carry the merge fix.

Martin,

Why does s390 do its own cpu accounting?
