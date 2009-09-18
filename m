From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty.current tree with the
 net-current tree
Date: Fri, 18 Sep 2009 10:27:34 -0700
Message-ID: <20090918172734.GA5543@kroah.com>
References: <20090917105442.297b6ea1.sfr@canb.auug.org.au>
 <20090917021202.GA7757@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:38176 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756803AbZIRR1j (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Sep 2009 13:27:39 -0400
Content-Disposition: inline
In-Reply-To: <20090917021202.GA7757@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>, Ken Kawasaki <ken_kawasaki@spring.nifty.jp>, "David S. Miller" <davem@davemloft.net>

On Wed, Sep 16, 2009 at 07:12:02PM -0700, Greg KH wrote:
> On Thu, Sep 17, 2009 at 10:54:42AM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next merge of the tty.current tree got a conflict in
> > drivers/serial/serial_cs.c between commit
> > 531afd64d027e3d798c416b2b37b3cfb1de417d9 ("pcnet_cs: add cis of Linksys
> > multifunction pcmcia card") from the net-current tree and commit
> > 5cea4a4e15a918f19d32fd3dc9a5056f333847c3 ("tty: serial/pcmcia: add ID for
> > Advantech card") from the tty.current tree.
> > 
> > Just context changes.  I fixed it up (see below) and can carry the fix
> > for a while.
> 
> Thanks, I'll handle this when I sync back up with Linus's tree tomorrow.

Now fixed up.

thanks,

greg k-h
