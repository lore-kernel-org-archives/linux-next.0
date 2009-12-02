From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: problems in linux-next (Was: Re: linux-next: Tree for December
 1)
Date: Wed, 2 Dec 2009 08:55:17 -0600 (CST)
Message-ID: <alpine.DEB.2.00.0912020853320.31731@router.home>
References: <20091201190301.0fb7abad.sfr@canb.auug.org.au> <4B14D6E2.2040704@petalogix.com> <20091201210343.f0a1d353.sfr@canb.auug.org.au> <4B152D22.9070001@kernel.org> <alpine.DEB.2.00.0912010946340.8841@router.home> <20091201160119.GA10826@elte.hu>
 <4B15A5A6.2090200@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi129.sbcis.sbc.com ([207.115.36.143]:35167 "EHLO
	nlpi129.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753380AbZLBO4G (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2009 09:56:06 -0500
In-Reply-To: <4B15A5A6.2090200@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, michal.simek@petalogix.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

On Wed, 2 Dec 2009, Tejun Heo wrote:

> This isn't usual alignment.  struct work_struct has one data fields
> which is overloaded for two purposes.  Lower few bits are used to
> carry flags while upper bits are used to point to sruct
> cpu_workqueue_struct.  So, the number of available bits for flags are
> determined by the alignment of cpu_workqueue_struct.  Memory usage for

The default mininum slab alignment in UP is 8 bytes which means you can
use 3 bits. And as far as I can see only the lower two bits are used. You
still have one bit leftover. (current upstream that is did not check if
you modified it).
