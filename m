From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH -next] lib: Move find_last_bit.o to obj-y to enable use by modules.
Date: Sun, 26 Apr 2009 22:19:05 +0930
Message-ID: <200904262219.07148.rusty@rustcorp.com.au>
References: <20090416030704.GH16961@linux-sh.org> <20090423141237.GA27102@linux-sh.org> <1240504730.11148.13.camel@heimdal.trondhjem.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:44668 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752416AbZDZMtL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Apr 2009 08:49:11 -0400
In-Reply-To: <1240504730.11148.13.camel@heimdal.trondhjem.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Benny Halevy <bhalevy@panasas.com>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Andy Adamson <andros@netapp.com>, Fredric Isaman <iisaman@citi.umich.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Beregalov <a.beregalov@gmail.com>, Subrata Modak <subrata@linux.vnet.ibm.com>, sachinp <sachinp@linux.vnet.ibm.com>

On Fri, 24 Apr 2009 02:08:50 am Trond Myklebust wrote:
> > > On Thu, 2009-04-23 at 22:25 +0900, Paul Mundt wrote:
> > > > > In any case, this patch does not belong in the NFS tree since it touches
> > > > > generic library code, not NFS code. Benny, if nobody else wants to
> > > > > shepherd it, then just send it directly to Linus.
...
> > The nfs tree should be dropped on the floor immediately until this issue
> > is resolved. 
> 
> Whatever...

FWIW Trond, I would have taken the patch and pushed it.  It happens: it's
not your fault, but it suddenly became your problem.

And Paul: being right doesn't excuse being an asshole.[1]

Thanks,
Rusty.
[1] As this rule applies to this message, I ponder my own failings.
