From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: sched tree build warning
Date: Mon, 22 Dec 2008 11:53:57 +0100
Message-ID: <20081222105357.GA21776@elte.hu>
References: <20081222152247.b934ed5b.sfr@canb.auug.org.au> <b040c32a0812212249p45aba306tbb68a960b79cd0ee@mail.gmail.com> <20081222070426.GD29160@elte.hu> <18767.19576.286910.148623@cargo.ozlabs.ibm.com> <20081222081811.GA10950@elte.hu> <18767.24943.183634.866661@cargo.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:52064 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752584AbYLVKyM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 05:54:12 -0500
Content-Disposition: inline
In-Reply-To: <18767.24943.183634.866661@cargo.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>
Cc: Ken Chen <kenchen@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Paul Mackerras <paulus@samba.org> wrote:

> > I cannot see how the binary representation could ever change from 
> > this. (and that is all that an ABI is about - it is an application 
> > Binary interface. I.e. there's no ABI breakage.)
> 
> Yes, the bits are the same, but that doesn't mean the types are the 
> same.  And we do export type definitions.
> 
> I once wanted to change the ppc32 size_t definition from unsigned int to 
> unsigned long to match up with ppc64.  That caused more pain than it was 
> worth because of exactly this issue (and also because gcc has fixed 
> ideas about size_t) so I abandoned it.  That's why I'm cautious about 
> changing user-visible types.  I'm not saying we can't do it, I'm saying 
> we shouldn't do it unilaterally.

okay, so what's the timeline to double check those details and to get this 
fix upstream?

	Ingo
