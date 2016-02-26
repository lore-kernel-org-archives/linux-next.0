From: Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 26 Feb 2016 08:14:48 -0800
Message-ID: <56D079F8.30409@linux.intel.com>
References: <20160226164406.065a1ffc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:12548 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754367AbcBZQOu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Feb 2016 11:14:50 -0500
In-Reply-To: <20160226164406.065a1ffc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>

On 02/25/2016 09:44 PM, Stephen Rothwell wrote:
> The addition of the "u64 _pkey" has presumably changed the alignment of
> the enclosing union on (some) 32 bit platforms and so added padding
> after the si_code field.  This is a user API issue. :-(
> 
> [As an aside, I am pretty sure that we should not be using "u64" in a
> uapi header in any case.]

Ahh, so if _addr_bnd wasn't 64-bit-aligned, the compiler is free to
align it and enlarge the structure.  But, this only applied to
architectures where _addr_bnd wasn't 64-bit-aligned:

Would anybody object to _pkey being an 'unsigned long'?  It would at
least keep existing 64-bit userspace (mostly my tests) from having to
change.

Here's the snippet of the struct in question:

>                         union {
>                                 /* used when si_code=SEGV_BNDERR */
>                                 struct {
>                                         void __user *_lower;
>                                         void __user *_upper;
>                                 } _addr_bnd;
>                                 /* used when si_code=SEGV_PKUERR */
>                                 u64 _pkey;
>                         };
