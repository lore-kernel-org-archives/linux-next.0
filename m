From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 3 Jul 2008 07:56:45 +0200
Message-ID: <20080703055644.GB4863@elte.hu>
References: <20080703150328.44061d16.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:40622 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755063AbYGCF5F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 01:57:05 -0400
Content-Disposition: inline
In-Reply-To: <20080703150328.44061d16.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got a conflict in 
> kernel/stop_machine.c between commit 
> 961ccddd59d627b89bd3dc284b6517833bbdf25d ("sched: add new API 
> sched_setscheduler_nocheck: add a flag to control access checks") from 
> the sched tree (which appears to also be in the rr tree) and commit 
> e5e62fcd081b0837f6210eb4ed022e9d8920bc59 ("stop_machine:simplify") 
> from the rr tree.
> 
> I used the version in the rr tree.  Probably worth a look when I 
> publish the tree.

hm, is there any difference between the content of the two commits?

The "home tree" of the commit is tip/sched/new-API-sched_setscheduler, 
and that's integrated to the auto-sched-next branch. If there's any 
update to the patch we should iterate it there.

	Ingo
