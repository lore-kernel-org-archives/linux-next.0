From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: linux-next: build failure after merge of the rpmsg tree
Date: Wed, 25 Apr 2018 20:46:39 -0700
Message-ID: <20180426034639.GA11526@tuxbook-pro>
References: <20180426133310.0ec74122@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180426133310.0ec74122@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>
List-Id: linux-next.vger.kernel.org

On Wed 25 Apr 20:33 PDT 2018, Stephen Rothwell wrote:

> Hi Bjorn,
> 
> After merging the rpmsg tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/remoteproc/remoteproc_core.c: In function 'rproc_handle_devmem':
> drivers/remoteproc/remoteproc_core.c:557:8: error: implicit declaration of function 'iommu_map_sync'; did you mean 'iommu_map_sg'? [-Werror=implicit-function-declaration]
>   ret = iommu_map_sync(rproc->domain, rsc->da,
>         ^~~~~~~~~~~~~~
>         iommu_map_sg
> drivers/remoteproc/remoteproc_core.c: In function 'rproc_resource_cleanup':
> drivers/remoteproc/remoteproc_core.c:845:14: error: implicit declaration of function 'iommu_unmap_sync'; did you mean 'iommu_unmap_fast'? [-Werror=implicit-function-declaration]
>    unmapped = iommu_unmap_sync(rproc->domain, entry->da,
>               ^~~~~~~~~~~~~~~~
>               iommu_unmap_fast
> 
> Caused by commit
> 
>   aace25b18cbd ("remoteproc: Use sychronized interface of the IOMMU-API")
> 
> I suspect that part of the commit is missing ...
> 

Sorry about that, now I've actually pushed the branch with this commit
removed again.

> I have use the rpmsg tree from next-20180424 for today.
> 

Thanks, should be good tomorrow again!

Regards,
Bjorn
