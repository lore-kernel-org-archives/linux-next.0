From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] [v4] x86, pkeys: fix siginfo ABI breakage from new field
Date: Thu, 3 Mar 2016 16:41:04 +0100
Message-ID: <20160303154104.GA18424@gmail.com>
References: <20160301125451.02C7426D@viggo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35381 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbcCCPlI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2016 10:41:08 -0500
Content-Disposition: inline
In-Reply-To: <20160301125451.02C7426D@viggo.jf.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Hansen <dave@sr71.net>
Cc: linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de


* Dave Hansen <dave@sr71.net> wrote:

> To fix this, we replace the u64 with an '__u32'.  The __u32 is guaranteed to 
> union well with the pointers from _addr_bnd.  It is also plenty large enough to 
> store the 16-bit pkey we have today on x86.

The 'union well' sentence is really a leftover from the earlier changelog (the 
problem was never about interaction between union members) - a better explantion 
is:

> To fix this, we replace the u64 with an '__u32'.  The __u32 does not change the 
> minimum alignment requirements of the structure and it is also plenty large 
> enough to store the 16-bit pkey we have today on x86.

I fixed this up locally, no need to resend.

Thanks,

	Ingo
