From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 6 Jan 2009 10:20:34 +0100
Message-ID: <20090106092034.GA30657@elte.hu>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901051727.11403.rusty@rustcorp.com.au> <20090105124745.GC29758@elte.hu> <200901061921.49131.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:37725 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751559AbZAFJVB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 04:21:01 -0500
Content-Disposition: inline
In-Reply-To: <200901061921.49131.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Christoph Lameter <cl@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Rusty Russell <rusty@rustcorp.com.au> wrote:

> On Monday 05 January 2009 23:17:45 Ingo Molnar wrote:
> > That would allow Mike, Christoph and you to work this out cleanly from 
> > scratch. It would also solve your merge conflict.
> > 
> > Does that sound like a good solution?
> 
> Sure, but it won't make this window.  I guess since those patches don't 
> do anything but lay groundwork it's not critical, but annoying they've 
> lain fallow so long.
> 
> I'm happy to put them with the cpualloc patches, since they're related 
> and going to conflict, but I still want to see if Mike has the rest of 
> them?

ok, i've zapped them from tip/core/percpu and will let you and Mike handle 
them.

	Ingo
