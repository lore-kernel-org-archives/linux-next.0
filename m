From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the net tree
Date: Wed, 29 Jul 2009 05:44:06 -0700
Message-ID: <20090729124406.GA26931@kroah.com>
References: <20090729165211.c13f3ca3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755296AbZG2M6v@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090729165211.c13f3ca3.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 29, 2009 at 04:52:11PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/epl/VirtualEthernetLinux.c between commit
> 6ed106549d17474ca17a16057f4c0ed4eba5a7ca ("net: use NETDEV_TX_OK instead
> of 0 in ndo_start_xmit() functions") from the net tree and commit
> 49acb975a21d150c4beba4e581f3e1d004dd2867 ("Staging: remove epl driver")
> from the staging tree.
> 
> The latter just removes the file, so I did that.

Thanks a lot.  Yes, the epl driver has been dropped from staging, so
that's the right thing to do.

greg k-h
