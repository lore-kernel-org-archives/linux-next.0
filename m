From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Sat, 27 Feb 2016 09:49:48 +1100
Message-ID: <20160227094948.29d86317@canb.auug.org.au>
References: <20160226164406.065a1ffc@canb.auug.org.au>
	<56D0B11E.2050402@linux.intel.com>
	<20160226133350.911293e1582f07134febdf48@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43505 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754003AbcBZWtv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Feb 2016 17:49:51 -0500
In-Reply-To: <20160226133350.911293e1582f07134febdf48@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>

Hi Andrew,

On Fri, 26 Feb 2016 13:33:50 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> I've moved add-compile-time-check-for-__arch_si_preamble_size.patch to
> be after linux-next and have added this patch (as
> add-compile-time-check-for-__arch_si_preamble_size-fix.patch) to be
> folded into add-compile-time-check-for-__arch_si_preamble_size.patch
> later on.
> 
> So no -tip changes should be needed.

But the fix should go into the tip tree since the tip tree patch is not
correct even without this new build time check.

-- 
Cheers,
Stephen Rothwell
