From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr_cpumask tree
Date: Mon, 15 Dec 2008 17:11:34 +1030
Message-ID: <200812151711.36134.rusty@rustcorp.com.au>
References: <20081215170945.b91f3b9c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42316 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751238AbYLOGls (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 01:41:48 -0500
In-Reply-To: <20081215170945.b91f3b9c.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@elte.hu>

On Monday 15 December 2008 16:39:45 Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr_cpumask tree got a conflict in
> arch/x86/kernel/io_apic.c between commit
> 3145e941fcfe2548fa2270afb1a05bab3a6bc418 ("x86, MSI: pass irq_cfg and
> irq_desc") from the sparseirq tree and commit
> 0de26520c7cabf36e1de090ea8092f011a6106ce ("cpumask: make irq_set_affinity
> () take a const struct cpumask") from the rr_cpumask tree.
> 
> There are lots of overlapping changes.  I fixed it up (see below) and can carry the
> fix as necessary.

I have performed this merge before.  The results are in
	git://git.kernel.org/pub/scm/linux/kernel/git/rusty/linux-2.6-for-ingo.git

Ingo, can you pull these into cpus4096?  It's just the cpumask/cpus4096 merge.

Thanks,
Rusty.
