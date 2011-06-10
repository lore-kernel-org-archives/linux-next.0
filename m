From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for May 26 (drivers/base/node.c)
Date: Fri, 10 Jun 2011 11:31:08 -0700
Message-ID: <20110610183108.GB10575@kroah.com>
References: <20110526163941.7dfcad1a.sfr@canb.auug.org.au>
 <20110526120121.db0506de.randy.dunlap@oracle.com>
 <20110610084405.c34a166d.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4.smtp.messagingengine.com ([66.111.4.28]:37917 "EHLO
	out4.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755904Ab1FJSbS (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Jun 2011 14:31:18 -0400
Content-Disposition: inline
In-Reply-To: <20110610084405.c34a166d.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jun 10, 2011 at 08:44:05AM -0700, Randy Dunlap wrote:
> On Thu, 26 May 2011 12:01:21 -0700 Randy Dunlap wrote:
> 
> > On Thu, 26 May 2011 16:39:41 +1000 Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > [The kernel.org mirroring is being slow today]
> > 
> > 
> > when CONFIG_PROC_FS is not enabled:
> > 
> > drivers/built-in.o: In function `node_read_vmstat':
> > node.c:(.text+0x56ffa): undefined reference to `vmstat_text'
> 
> Hi Greg,
> 
> How do you want this build problem fixed?  (still around in
> linux-next-20110610)

A patch would be great.

But honestly, I really find that CONFIG_PROC_FS disabled to not be a
valid configuration anymore.  I don't know anyone who can successfully
run a machine in that manner, do you?

thanks,

greg k-h
