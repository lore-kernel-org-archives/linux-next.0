From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Mon, 22 Sep 2014 07:31:05 -0700
Message-ID: <20140922143105.GA22674@kroah.com>
References: <20140922150124.4f24bb6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140922150124.4f24bb6f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
List-Id: linux-next.vger.kernel.org

On Mon, Sep 22, 2014 at 03:01:24PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/iio/accel/bma180.c between commit 0668a4e4d297 ("iio: accel:
> bma180: Fix indio_dev->trig assignment") from Linus' tree and commit
> 16ed8692fa48 ("iio:bma180: Enable use of device without IRQ") from the
> staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks, the fix looks correct.

greg k-h
