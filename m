From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 driver-core tree
Date: Fri, 27 Apr 2012 10:05:48 -0700
Message-ID: <20120427170548.GB2789@kroah.com>
References: <20120427143114.d141038158ea4923399d1d1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120427143114.d141038158ea4923399d1d1a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 27, 2012 at 02:31:14PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/Kconfig drivers/Makefile between commit de55d8716ac5 ("Extcon
> (external connector): import Android's switch class and modify") from the
> driver-core tree and commits a980e046098b ("IIO: Move the core files to
> drivers/iio") and db3b9e990e75 ("Staging: VME: move VME drivers out of
> staging") from the staging tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Thanks, that looks correct.

greg k-h
