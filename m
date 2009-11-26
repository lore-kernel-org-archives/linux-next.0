From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the workqueues tree with the tip
 tree
Date: Thu, 26 Nov 2009 18:15:45 +0900
Message-ID: <4B0E4741.10509@kernel.org>
References: <20091126190018.88a6dd77.sfr@canb.auug.org.au> <20091126081237.GA31034@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:43885 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760066AbZKZJQE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 04:16:04 -0500
In-Reply-To: <20091126081237.GA31034@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

11/26/2009 05:12 PM, Ingo Molnar wrote:
> Please submit scheduler patches to the scheduler tree. Such level of 
> refactoring of a critical scheduler component needs to go through the 
> regular scheduler channels. This is a frequently modified piece of code 
> and conflicts are likely in the future.

Sure, which sched/* branch should I base these patches on?
Alternatively, pulling the following branch into one of sched/* should
do the trick too.

 git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-sched

Thanks.

-- 
tejun
