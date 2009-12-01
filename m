From: Ingo Molnar <mingo@elte.hu>
Subject: Re: problems in linux-next (Was: Re: linux-next: Tree for December 1)
Date: Tue, 1 Dec 2009 17:01:19 +0100
Message-ID: <20091201160119.GA10826@elte.hu>
References: <20091201190301.0fb7abad.sfr@canb.auug.org.au>
 <4B14D6E2.2040704@petalogix.com>
 <20091201210343.f0a1d353.sfr@canb.auug.org.au>
 <4B152D22.9070001@kernel.org>
 <alpine.DEB.2.00.0912010946340.8841@router.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:59181 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753821AbZLAQBl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Dec 2009 11:01:41 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.0912010946340.8841@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, michal.simek@petalogix.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>


* Christoph Lameter <cl@linux-foundation.org> wrote:

> On Tue, 1 Dec 2009, Tejun Heo wrote:
> 
> > The problem is that on UP configurations.  Percpu memory allocator 
> > becomes a simple wrapper around kmalloc and there's no way to 
> > specify larger alignment when requesting memory from kmalloc.
> 
> There is usually no point in aligning in UP. Alignment is typically 
> done for smp configurations to limit cache line bouncing and control 
> cache line use/

There is a natural minimum alignment for UP and it's smaller than the 
cache-line size: machine word size. All our allocators (except bootmem) 
align to machine word so there's no need to specify this explicitly.

Larger alignment than that just wastes memory - which waste UP systems 
can afford the least.

	Ingo
