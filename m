From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the workqueues tree with the tip tree
Date: Thu, 26 Nov 2009 09:12:37 +0100
Message-ID: <20091126081237.GA31034@elte.hu>
References: <20091126190018.88a6dd77.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:40880 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759480AbZKZIMz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 03:12:55 -0500
Content-Disposition: inline
In-Reply-To: <20091126190018.88a6dd77.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Tejun,
> 
> Today's linux-next merge of the workqueues tree got a conflict in
> kernel/sched.c between commit eae0c9dfb534cb3449888b9601228efa6480fdb5
> ("sched: Fix and clean up rate-limit newidle code") from the tip tree and
> commit 710c15b748f5ce9c573cc047f419cf007a677a9a ("sched: refactor
> try_to_wake_up() and implement try_to_wake_up_local()") from the
> workqueues tree.

Tejun,

Please submit scheduler patches to the scheduler tree. Such level of 
refactoring of a critical scheduler component needs to go through the 
regular scheduler channels. This is a frequently modified piece of code 
and conflicts are likely in the future.

Thanks,

	Ingo
