From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Fri, 13 May 2011 16:12:00 -0700
Message-ID: <20110513231200.GA27663@kroah.com>
References: <20110513140821.bfef61a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110513140821.bfef61a3.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Max Vozeler <max@hinterhof.net>, matt mooney <mfm@muteddisk.com>
List-Id: linux-next.vger.kernel.org

On Fri, May 13, 2011 at 02:08:21PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/usbip/vhci_sysfs.c between commit d1b2e95ab016 ("staging:
> usbip: vhci: fix oops on subsequent attach") from Linus' tree and commit
> 7aaacb43ed97 ("staging: usbip: fix header includes") from the staging
> tree.
> 
> The latter superceded the former for the conflict in the includes.

Ah, missed that, thanks, I'll merge these together soon and resolve
them.

greg k-h
