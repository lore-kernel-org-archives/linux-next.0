From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: manual merge of the cputime tree
Date: Tue, 25 Nov 2008 11:15:28 +0100
Message-ID: <1227608128.30264.2.camel@localhost>
References: <20081125202105.2e80cf92.sfr@canb.auug.org.au>
	 <1227607612.4259.1428.camel@twins>
Reply-To: schwidefsky@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate7.de.ibm.com ([195.212.29.156]:41986 "EHLO
	mtagate7.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038AbYKYKTF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 05:19:05 -0500
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate7.de.ibm.com (8.13.8/8.13.8) with ESMTP id mAPAJ2hJ379046
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 10:19:02 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mAPAIxko3629274
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 11:18:59 +0100
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mAPAIwn1021658
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 11:18:59 +0100
In-Reply-To: <1227607612.4259.1428.camel@twins>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar <mingo@elte.hu>

On Tue, 2008-11-25 at 11:06 +0100, Peter Zijlstra wrote:
> On Tue, 2008-11-25 at 20:21 +1100, Stephen Rothwell wrote:
> > Hi Martin,
> > 
> > Today's linux-next merge of the cputime tree got a conflict in
> > kernel/sched.c between commit 74fcd524e808975dd546dac847119f1995a7c622
> > ("account_steal_time: kill the unneeded account_group_system_time()")
> > from the tip-core tree and commit
> > b7f4776b7f575ed8f288c44b64befd241fd44458 ("[PATCH] idle cputime
> > accounting") from the cputime tree.
> > 
> > The latter removes the call to account_group_system_time() as a side
> > effect of further changes.  So the fixup is to just take the latter
> > change.  I can carry the merge fix.
> 
> Why does s390 do its own cpu accounting?

Is that a trick question? I invented the cputime accounting specifically
for s390 because it is a virtual architecture and the standard cpu
accounting numbers are just useless.

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.
