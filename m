From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the mfd
 tree
Date: Wed, 28 Nov 2012 21:20:58 -0800
Message-ID: <20121129052058.GR4375@kroah.com>
References: <20121129144712.d6fcfdc94dbdd6f2d4bc7e79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121129144712.d6fcfdc94dbdd6f2d4bc7e79@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2012 at 02:47:12PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/mfd/ab8500-core.c between commit 8ae754ebd5ed ("mfd: ab8500-core:
> Remove unused ab8500-gpio IRQ ranges") from the mfd tree and commit
> a9e9ce4c4167 ("mfd: remove use of __devinitdata") from the driver-core
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
