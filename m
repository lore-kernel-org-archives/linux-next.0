From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip tree build warning
Date: Wed, 28 Oct 2009 08:50:12 +0100
Message-ID: <20091028075012.GD19402@elte.hu>
References: <20091028181443.50a09dbb.sfr@canb.auug.org.au> <20091028073145.GD6353@elte.hu> <20091028184126.b5f52d1b.sfr@canb.auug.org.au> <20091028184851.504752ef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:51241 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932517AbZJ1HwN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Oct 2009 03:52:13 -0400
Content-Disposition: inline
In-Reply-To: <20091028184851.504752ef.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Wed, 28 Oct 2009 18:41:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > static inline physid_mask_t default_apicid_to_cpu_present(int phys_apicid)
> > {
> >         return physid_mask_of_physid(phys_apicid);
> > }
> 
> I just noticed that this function (default_apicid_to_cpu_present) is 
> declared "static inline in a header" but looks like it is only used by 
> assigning its address to a function pointer.  Its only use for x86_64 
> is in arch/x86/kernel/apic/apic_noop.c ...

yes, that might be a real problem - returning the mask like that is 
messy. Thanks, will check.

	Ingo
