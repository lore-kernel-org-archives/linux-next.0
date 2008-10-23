From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Fri, 24 Oct 2008 00:32:06 +1100
Message-ID: <200810240032.06609.rusty@rustcorp.com.au>
References: <20081023150130.f8fdfd5e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:47536 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752155AbYJWNcM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 09:32:12 -0400
In-Reply-To: <20081023150130.f8fdfd5e.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>, Mike Travis <travis@sgi.com>

On Thursday 23 October 2008 15:01:30 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next merge of the rr tree got a conflict in kernel/sched.c
> between commit tg_shares_up ("sched: optimize group load balancer") from
> the sched tree and commit 1a39c64ec96acde2a0f43bbe408efc328541a73e
> ("cpumask:for_each_cpu") from the rr tree.
>
> Overlapping changes.  I fixed it up (see below) and can carry the fix.

Ideal.

Thanks,
Rusty.
