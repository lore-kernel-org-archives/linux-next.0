From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the mfd tree
Date: Tue, 3 Jul 2012 16:03:04 -0700
Message-ID: <20120703230304.GA15624@kroah.com>
References: <20120703140938.b2ae0cf0ce2a3a470bb6cec6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120703140938.b2ae0cf0ce2a3a470bb6cec6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russ Dill <Russ.Dill@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 03, 2012 at 02:09:38PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/host/ehci-omap.c between commit 996439f8fa07 ("mfd: USB: Fix
> the omap-usb EHCI ULPI PHY reset fix issues") from the mfd tree and
> commit 984e97483a14 ("ARM: OMAP: USB: Fixup ehci_hcd_omap_probe error
> path") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks good to me, thanks.

greg k-h
