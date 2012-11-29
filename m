From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the mfd
 tree
Date: Wed, 28 Nov 2012 21:20:49 -0800
Message-ID: <20121129052049.GQ4375@kroah.com>
References: <20121129145039.dc5c58ab8990d7ffe35d3291@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121129145039.dc5c58ab8990d7ffe35d3291@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Fabio Estevam <fabio.estevam@freescale.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2012 at 02:50:39PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/mfd/da9052-core.c between commit 8bad1abd6303 ("mfd: da9052:
> Introduce da9052-irq.c") from the mfd tree and commit a9e9ce4c4167 ("mfd:
> remove use of __devinitdata") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
