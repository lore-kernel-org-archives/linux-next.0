From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Mon, 7 May 2012 09:05:20 -0700
Message-ID: <20120507160520.GB23505@kroah.com>
References: <20120503144410.3aab6165a98e4f36bf50fcf5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120503144410.3aab6165a98e4f36bf50fcf5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Stephen Warren <swarren@wwwdotorg.org>, Venu Byravarasu <vbyravarasu@nvidia.com>
List-Id: linux-next.vger.kernel.org

On Thu, May 03, 2012 at 02:44:10PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/host/ehci-tegra.c between commit ebf20de45304 ("EHCI: update
> PM methods in ehci-tegra.c") from the usb.current tree and commit
> fe375774bd88 ("usb: host: tegra: code clean up") from the usb tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

This should now be resolved in my tree, thanks.

greg k-h
