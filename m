From: Dave Hansen <dave@sr71.net>
Subject: Re: [PATCH] [v3] x86, pkeys: fix siginfo ABI breakage from new field
Date: Tue, 1 Mar 2016 04:48:36 -0800
Message-ID: <56D58FA4.7080001@sr71.net>
References: <20160229221733.DC2C56B7@viggo.jf.intel.com>
 <20160301074052.GA7201@gmail.com> <20160301080904.GA9644@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.sr71.net ([198.145.64.142]:59629 "EHLO blackbird.sr71.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751525AbcCAMsi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Mar 2016 07:48:38 -0500
In-Reply-To: <20160301080904.GA9644@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de

On 03/01/2016 12:09 AM, Ingo Molnar wrote:
> Btw., what we should not have used in a modern user ABI are variable size 
> pointers:
> 
>                                 struct {
>                                         void __user *_lower;
>                                         void __user *_upper;
>                                 } _addr_bnd;
> 
> we should have used constant size structure elements for that, such as __u64.
> 
> Had we done that, the pkeys change would not have been a problem either.
> 
> Is it too late to change that, is there any si_code=SEGV_BNDERR usage in 
> user-space?

Yes, the libmpx code that gcc links in looks for si_code=SEGV_BNDERR
and, by default, will just just warn about the bounds exception (rather
than letting the app die.

This bit of code will be linked into basically anything using MPX.
