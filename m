From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the workqueues tree with the tip tree
Date: Thu, 26 Nov 2009 10:26:31 +0100
Message-ID: <20091126092631.GA17253@elte.hu>
References: <20091126190018.88a6dd77.sfr@canb.auug.org.au>
 <20091126081237.GA31034@elte.hu>
 <4B0E4741.10509@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:57097 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760162AbZKZJ0o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 04:26:44 -0500
Content-Disposition: inline
In-Reply-To: <4B0E4741.10509@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>


* Tejun Heo <tj@kernel.org> wrote:

> 11/26/2009 05:12 PM, Ingo Molnar wrote:
> > Please submit scheduler patches to the scheduler tree. Such level of 
> > refactoring of a critical scheduler component needs to go through the 
> > regular scheduler channels. This is a frequently modified piece of code 
> > and conflicts are likely in the future.
> 
> Sure, which sched/* branch should I base these patches on?

You could send the patch you rely on standalone (it seems to be a single 
patch) and we can look at applying it to the scheduler tree. That 
reduces the conflicts on an ongoing basis. Please Cc: PeterZ and Mike 
Galbraith as well.

Thanks,

	Ingo
