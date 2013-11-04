From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the random tree with Linus' tree
Date: Mon, 4 Nov 2013 04:39:12 -0800
Message-ID: <20131104123912.GA22288@kroah.com>
References: <20131104170411.ccd38895fb4cdc347f9cf912@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131104170411.ccd38895fb4cdc347f9cf912@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Nov 04, 2013 at 05:04:11PM +1100, Stephen Rothwell wrote:
> Hi Ted,
> 
> Today's linux-next merge of the random tree got a conflict in
> drivers/base/core.c between commit 63967685605b ("driver core: add
> #include <linux/sysfs.h> to core files") from Linus' tree and commit
> f0ed2b943a53 ("random: use device attach events for entropy") from the
> random tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

I think Ted is going to drop this patch from his tree as it didn't work
properly, right Ted?

thanks,

greg k-h
