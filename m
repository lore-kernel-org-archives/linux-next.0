From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the mfd tree
Date: Tue, 13 Nov 2012 10:48:58 -0800
Message-ID: <20121113184858.GB24793@kroah.com>
References: <20121113145043.031831301647d5e0a68807f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121113145043.031831301647d5e0a68807f0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Patil, Rachna" <rachna@ti.com>, Samuel Ortiz <sameo@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 13, 2012 at 02:50:43PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in
> drivers/iio/adc/Kconfig and drivers/iio/adc/Makefile between commit
> 5e53a69b44e8 ("IIO : ADC: tiadc: Add support of TI's ADC driver") from
> the mfd tree and commit 168c9d95a940 ("iio:adc:max1363 move from
> staging") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks fine to me, thanks.

greg k-h
