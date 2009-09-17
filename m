From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty.current tree with the
 net-current tree
Date: Wed, 16 Sep 2009 19:12:02 -0700
Message-ID: <20090917021202.GA7757@kroah.com>
References: <20090917105442.297b6ea1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759183AbZIQCMP@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090917105442.297b6ea1.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>, Ken Kawasaki <ken_kawasaki@spring.nifty.jp>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

On Thu, Sep 17, 2009 at 10:54:42AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty.current tree got a conflict in
> drivers/serial/serial_cs.c between commit
> 531afd64d027e3d798c416b2b37b3cfb1de417d9 ("pcnet_cs: add cis of Linksys
> multifunction pcmcia card") from the net-current tree and commit
> 5cea4a4e15a918f19d32fd3dc9a5056f333847c3 ("tty: serial/pcmcia: add ID for
> Advantech card") from the tty.current tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix
> for a while.

Thanks, I'll handle this when I sync back up with Linus's tree tomorrow.

greg k-h
