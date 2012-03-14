From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the uprobes tree with the tip tree
Date: Wed, 14 Mar 2012 10:25:44 +0530
Message-ID: <20120314045544.GA4644@linux.vnet.ibm.com>
References: <20120314151444.a34eef495739e13506ac5b1a@canb.auug.org.au>
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e5.ny.us.ibm.com ([32.97.182.145]:38666 "EHLO e5.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752191Ab2CNE7C (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Mar 2012 00:59:02 -0400
Received: from /spool/local
	by e5.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <srikar@linux.vnet.ibm.com>;
	Wed, 14 Mar 2012 00:59:01 -0400
Content-Disposition: inline
In-Reply-To: <20120314151444.a34eef495739e13506ac5b1a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

> The linux-next merge of the uprobes tree gets several conflicts against
> the tip tree because the same patches appear in both threes and there are
> further changes to some files in the uprobes tree.
> 
> Merging uprobes/for-next (1fe509b uprobes/core: Handle breakpoint and singlestep exception.)
> CONFLICT (add/add): Merge conflict in kernel/events/uprobes.c
> CONFLICT (content): Merge conflict in kernel/events/Makefile
> CONFLICT (add/add): Merge conflict in include/linux/uprobes.h
> CONFLICT (add/add): Merge conflict in arch/x86/kernel/uprobes.c
> CONFLICT (add/add): Merge conflict in arch/x86/include/asm/uprobes.h
> 
> The easiest way to remove these conflicts would be for you to rebase the
> uprobes tree onto the perl/uprobes branch of the tip tree (I assume that
> all the uprobes code will eventually be merged to Linus via the tip tree)
> or a subset of that branch that is the common set of patches.


Okay, I will go with this suggestion. Infact this is actually easier for
me.

-- 
Thanks and Regards
Srikar
