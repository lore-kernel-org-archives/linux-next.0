From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] lib: Move find_last_bit.o to obj-y to enable use
	by modules.
Date: Sun, 26 Apr 2009 18:42:09 +0200
Message-ID: <20090426164209.GE6236@elte.hu>
References: <20090416030704.GH16961@linux-sh.org> <20090423141237.GA27102@linux-sh.org> <1240504730.11148.13.camel@heimdal.trondhjem.org> <200904262219.07148.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:57077 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752703AbZDZQmh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Apr 2009 12:42:37 -0400
Content-Disposition: inline
In-Reply-To: <200904262219.07148.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, Paul Mundt <lethal@linux-sh.org>, Benny Halevy <bhalevy@panasas.com>, linux-next@vger.kernel.org, Andy Adamson <andros@netapp.com>, Fredric Isaman <iisaman@citi.umich.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Beregalov <a.beregalov@gmail.com>, Subrata Modak <subrata@linux.vnet.ibm.com>, sachinp <sachinp@linux.vnet.ibm.com>


* Rusty Russell <rusty@rustcorp.com.au> wrote:

> On Fri, 24 Apr 2009 02:08:50 am Trond Myklebust wrote:
> > > > On Thu, 2009-04-23 at 22:25 +0900, Paul Mundt wrote:
> > > > > > In any case, this patch does not belong in the NFS tree since it touches
> > > > > > generic library code, not NFS code. Benny, if nobody else wants to
> > > > > > shepherd it, then just send it directly to Linus.
> ...
> > > The nfs tree should be dropped on the floor immediately until this issue
> > > is resolved. 
> > 
> > Whatever...
> 
> FWIW Trond, I would have taken the patch and pushed it.  It 
> happens: it's not your fault, but it suddenly became your problem.

To double check things: is it clear now who pushes the fix and when? 
I'm obviously acking it and can push it to Linus if needed.

Thanks,

	Ingo
