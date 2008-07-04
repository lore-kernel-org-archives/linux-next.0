From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Fri, 4 Jul 2008 10:29:36 +1000
Message-ID: <200807041029.36246.rusty@rustcorp.com.au>
References: <20080703150328.44061d16.sfr@canb.auug.org.au> <20080703055644.GB4863@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:50376 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752576AbYGDA3o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 20:29:44 -0400
In-Reply-To: <20080703055644.GB4863@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Thursday 03 July 2008 15:56:45 Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Rusty,
> >
> > Today's linux-next merge of the rr tree got a conflict in
> > kernel/stop_machine.c between commit
> > 961ccddd59d627b89bd3dc284b6517833bbdf25d ("sched: add new API
> > sched_setscheduler_nocheck: add a flag to control access checks") from
> > the sched tree (which appears to also be in the rr tree) and commit
> > e5e62fcd081b0837f6210eb4ed022e9d8920bc59 ("stop_machine:simplify")
> > from the rr tree.
> >
> > I used the version in the rr tree.  Probably worth a look when I
> > publish the tree.
>
> hm, is there any difference between the content of the two commits?
>
> The "home tree" of the commit is tip/sched/new-API-sched_setscheduler,
> and that's integrated to the auto-sched-next branch. If there's any
> update to the patch we should iterate it there.

No they should be identical.  It's just that my stop_machine patch happens to 
use it.

Rusty.
