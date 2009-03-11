From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [RESEND GIT PATCH tj-percpu] percpu: fix spurious alignment
	WARN in legacy SMP percpu allocator
Date: Wed, 11 Mar 2009 10:31:10 +0100
Message-ID: <20090311093110.GA11637@elte.hu>
References: <20090310195534.8f8f3c7a.sfr@canb.auug.org.au> <49B67552.5070307@in.ibm.com> <49B73B15.3040101@in.ibm.com> <49B75215.5010707@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:44101 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751938AbZCKJbe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2009 05:31:34 -0400
Content-Disposition: inline
In-Reply-To: <49B75215.5010707@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: "Sachin P. Sant" <sachinp@in.ibm.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@ozlabs.org, LKML <linux-kernel@vger.kernel.org>


* Tejun Heo <tj@kernel.org> wrote:

> Impact: remove spurious WARN on legacy SMP percpu allocator
> 
> Commit f2a8205c4ef1af917d175c36a4097ae5587791c8 incorrectly added too
> tight WARN_ON_ONCE() on alignments for UP and legacy SMP percpu
> allocator.  Commit e317603694bfd17b28a40de9d65e1a4ec12f816e fixed it
> for UP but legacy SMP allocator was forgotten.  Fix it.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Sachin P. Sant <sachinp@in.ibm.com>
> ---
> (RESEND: cc'ing Ingo. :-)
> 
> Oops, that was a stupid omission.  This patch should fix it.  Ingo,
> please pull from the following git vector to receive the first first
> four patches from the use-dynamic-percpu-allocator-by-default patchset
> (without the actual conversion which can disrupt archs) + this patch.
> I moved the actual conversion patch into #tj-percpu-exp branch, so the
> pull should be safe.
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tj/misc.git tj-percpu
> 
> Thanks.

Pulled into tip:core/percpu, thanks a lot Tejun!

	Ingo
