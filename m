From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] [v3] x86, pkeys: fix siginfo ABI breakage from new field
Date: Tue, 1 Mar 2016 09:09:04 +0100
Message-ID: <20160301080904.GA9644@gmail.com>
References: <20160229221733.DC2C56B7@viggo.jf.intel.com>
 <20160301074052.GA7201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36712 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751404AbcCAIJJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2016 03:09:09 -0500
Content-Disposition: inline
In-Reply-To: <20160301074052.GA7201@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Hansen <dave@sr71.net>
Cc: linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de


* Ingo Molnar <mingo@kernel.org> wrote:

> > I also shouldn't have been using a u64 in a userspace API to begin with.
> 
> Well, it's __u64 that we use in UAPIs, and they can be used just fine, as long 
> as the structure's field alignments is managed explicitly, i.e. there's no 
> automatic alignment padding done by the compiler.

Btw., what we should not have used in a modern user ABI are variable size 
pointers:

                                struct {
                                        void __user *_lower;
                                        void __user *_upper;
                                } _addr_bnd;

we should have used constant size structure elements for that, such as __u64.

Had we done that, the pkeys change would not have been a problem either.

Is it too late to change that, is there any si_code=SEGV_BNDERR usage in 
user-space?

Thanks,

	Ingo
