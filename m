From: Suresh Siddha <suresh.b.siddha@intel.com>
Subject: Re: next-1007: dmar fails to build
Date: Wed, 07 Oct 2009 10:05:45 -0700
Message-ID: <1254935147.2635.0.camel@sbs-t61.sc.intel.com>
References: <a4423d670910070150v6b8df19bt733eac1b32f04257@mail.gmail.com>
	 <20091007085958.GA12537@orion>
Reply-To: Suresh Siddha <suresh.b.siddha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:15352 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751692AbZJGRHL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Oct 2009 13:07:11 -0400
In-Reply-To: <20091007085958.GA12537@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, "Woodhouse, David" <david.woodhouse@intel.com>

On Wed, 2009-10-07 at 01:59 -0700, Alexander Beregalov wrote:
> On Wed, Oct 07, 2009 at 12:50:39PM +0400, Alexander Beregalov wrote:
> > drivers/pci/dmar.c: In function 'dmar_parse_one_rhsa':
> > drivers/pci/dmar.c:360: error: implicit declaration of function
> > 'acpi_map_pxm_to_node'
> > 
> > $ grep NUMA .config
> > $
> 
> By the way, shouldn't it be as following?
> 
> diff --git a/drivers/pci/dmar.c b/drivers/pci/dmar.c
> index 63aa529..474c7e8 100644
> --- a/drivers/pci/dmar.c
> +++ b/drivers/pci/dmar.c
> @@ -362,8 +362,8 @@ dmar_parse_one_rhsa(struct acpi_dmar_header *header)
>  			if (!node_online(node))
>  				node = -1;
>  			drhd->iommu->node = node;
> -		return 0;
> -	}
> +			return 0;
> +		}
>  
>  	return -ENODEV;
>  }

Thanks. Just posted fixes for both these issues!
