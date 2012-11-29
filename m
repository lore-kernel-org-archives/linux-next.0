From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 battery tree
Date: Wed, 28 Nov 2012 21:20:05 -0800
Message-ID: <20121129052005.GL4375@kroah.com>
References: <20121129150933.6c47da49d1bae2cbf94f94da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121129150933.6c47da49d1bae2cbf94f94da@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, "Rajanikanth H.V" <rajanikanth.hv@stericsson.com>, Anton Vorontsov <avorontsov@ru.mvista.com>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2012 at 03:09:33PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/power/ab8500_btemp.c between commit bd9e8ab2d58d ("ab8500: Add
> devicetree support for btemp") from the battery tree and commit
> c8afa6406e60 ("power: remove use of __devinit") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
