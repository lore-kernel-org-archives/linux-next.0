From: Tejun Heo <tj@kernel.org>
Subject: Re: problems in linux-next (Was: Re: linux-next: Tree for December
 1)
Date: Thu, 03 Dec 2009 08:00:40 +0900
Message-ID: <4B16F198.20100@kernel.org>
References: <20091201190301.0fb7abad.sfr@canb.auug.org.au> <4B14D6E2.2040704@petalogix.com> <20091201210343.f0a1d353.sfr@canb.auug.org.au> <4B152D22.9070001@kernel.org> <alpine.DEB.2.00.0912010946340.8841@router.home> <20091201160119.GA10826@elte.hu> <4B15A5A6.2090200@kernel.org> <alpine.DEB.2.00.0912020853320.31731@router.home> <4B16E727.9070104@kernel.org> <alpine.DEB.2.00.0912021623560.6282@router.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:51124 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754950AbZLBW7k (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Dec 2009 17:59:40 -0500
In-Reply-To: <alpine.DEB.2.00.0912021623560.6282@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, michal.simek@petalogix.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

Hello,

On 12/03/2009 07:24 AM, Christoph Lameter wrote:
> On Thu, 3 Dec 2009, Tejun Heo wrote:
> 
>> For colored workqueue flushing, it ends up using more than three bits.
>> I haven't decided it fully yet but total of six or seven depending on
>> how many colors are used.  So, we need forced alignment anyway.
> 
> If it is that much then why not stick it into the structure?

There'll only be a handful of cwqs but a lot of works.  Adding a flags
field to work_struct might not hurt too much but all the code to
handle it is already there except for alignment on UP, so I'm a bit
reluctant to enlarge work_struct just for it.

> It only makes sense to use the flags in the address if you otherwise
> do not touch the structure.

work_struct isn't being changed at all.  What gets aligned is
cpu_workqueue_struct which allows more bits for flags in work_struct.

Thanks.

-- 
tejun
