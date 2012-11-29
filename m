From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the mfd
 tree
Date: Wed, 28 Nov 2012 21:21:45 -0800
Message-ID: <20121129052145.GS4375@kroah.com>
References: <20121129144302.f19a1984d498e0cebae8d5d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121129144302.f19a1984d498e0cebae8d5d0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Laxman Dewangan <ldewangan@nvidia.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2012 at 02:43:02PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/gpio/gpio-tps6586x.c between commit fe39f2f4dc84 ("mfd: Implement
> tps6586x gpio_to_irq") from the mfd tree and commit 3836309d9346 ("gpio:
> remove use of __devinit") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
