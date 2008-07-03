From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 3 Jul 2008 10:19:06 +0200
Message-ID: <20080703081906.GB22246@elte.hu>
References: <20080703150328.44061d16.sfr@canb.auug.org.au> <20080703055644.GB4863@elte.hu> <20080703180729.1f6b8620.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fallback.mail.elte.hu ([157.181.151.13]:44779 "EHLO
	fallback.mail.elte.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752344AbYGCPG6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 11:06:58 -0400
Received: from mx3.mail.elte.hu ([157.181.1.138])
	by fallback.mail.elte.hu with esmtp (Exim)
	id 1KEKBQ-0003hj-DJ
	from <mingo@elte.hu>
	for <linux-next@vger.kernel.org>; Thu, 03 Jul 2008 10:28:52 +0200
Content-Disposition: inline
In-Reply-To: <20080703180729.1f6b8620.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > The "home tree" of the commit is 
> > tip/sched/new-API-sched_setscheduler, and that's integrated to the 
> > auto-sched-next branch. If there's any update to the patch we should 
> > iterate it there.
> 
> That would be a question for Rusty.  He may be able to split out the 
> conflicting part of his simplification patch and send it to you.  But 
> it may not be worth it.

should be all OK as long as Rusty sends his patches to Linus after the 
-tip changes go upstream. (in that case the base patch will fall out of 
Rusty's Quilt queue naturally, leaving the followup change.)

	Ingo
