From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the pm tree
Date: Fri, 7 Jun 2013 10:38:59 -0700
Message-ID: <20130607173859.GC29615@kroah.com>
References: <20130607144936.6ea0c2d9a7fcf321e59cc6d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130607144936.6ea0c2d9a7fcf321e59cc6d6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Fontenot <nfont@linux.vnet.ibm.com>, "Rafael J. Wysocki" <rjw@sisk.pl>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 07, 2013 at 02:49:36PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/base/memory.c between commit 4960e05e2260 ("Driver core:
> Introduce offline/online callbacks for memory blocks") from the pm tree
> and commit 96b2c0fc8e74 ("drivers/base: Use attribute groups to create
> sysfs memory files") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
