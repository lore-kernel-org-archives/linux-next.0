From: Paul Mackerras <paulus@samba.org>
Subject: Re: linux-next: sched tree build warning
Date: Mon, 22 Dec 2008 20:44:15 +1100
Message-ID: <18767.24943.183634.866661@cargo.ozlabs.ibm.com>
References: <20081222152247.b934ed5b.sfr@canb.auug.org.au>
	<b040c32a0812212249p45aba306tbb68a960b79cd0ee@mail.gmail.com>
	<20081222070426.GD29160@elte.hu>
	<18767.19576.286910.148623@cargo.ozlabs.ibm.com>
	<20081222081811.GA10950@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:59734 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750992AbYLVJoW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 04:44:22 -0500
In-Reply-To: <20081222081811.GA10950@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Ken Chen <kenchen@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

Ingo Molnar writes:

> which APIs do you mean exactly, could you give me an example please and 
> the type of breakage you suspect?

Any struct with a __u64 or __s64 in it that gets exported to userland
will have a different type signature with the change, hence has the
potential to cause compile warnings or errors on correct code
(e.g. warnings on printf's that use %ld to print an __s64 field on
ppc64).  It's possible that C++ stuff will fail to link because of
mangled names coming out differently.  And so on.

> I cannot see how the binary representation could ever change from this. 
> (and that is all that an ABI is about - it is an application Binary 
> interface. I.e. there's no ABI breakage.)

Yes, the bits are the same, but that doesn't mean the types are the
same.  And we do export type definitions.

I once wanted to change the ppc32 size_t definition from unsigned int
to unsigned long to match up with ppc64.  That caused more pain than
it was worth because of exactly this issue (and also because gcc has
fixed ideas about size_t) so I abandoned it.  That's why I'm cautious
about changing user-visible types.  I'm not saying we can't do it, I'm
saying we shouldn't do it unilaterally.

Paul.
