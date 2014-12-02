From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the pm tree
Date: Tue, 2 Dec 2014 10:10:21 -0800
Message-ID: <20141202181021.GC11700@kroah.com>
References: <20141111154146.3fb1dfa3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141111154146.3fb1dfa3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 11, 2014 at 03:41:46PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/base/Makefile between commit b31384fa5de3 ("Driver core:
> Unified device properties interface for platform firmware") from the pm
> tree and commit 246246cbde5e ("drivers: base: support cpu cache
> information interface to userspace via sysfs") from the driver-core
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/base/Makefile
> index 53c3fe1aeb29,e81a55ca513c..000000000000
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@@ -4,7 -4,7 +4,7 @@@ obj-y			:= component.o core.o bus.o dd.
>   			   driver.o class.o platform.o \
>   			   cpu.o firmware.o init.o map.o devres.o \
>   			   attribute_container.o transport_class.o \
> - 			   topology.o container.o property.o
>  -			   topology.o container.o cacheinfo.o
> ++			   topology.o container.o property.o cacheinfo.o
>   obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
>   obj-$(CONFIG_DMA_CMA) += dma-contiguous.o
>   obj-y			+= power/



Looks fine, thanks.

greg k-h
