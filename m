From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: manual merge of the xen tree with the
	swiotlb tree
Date: Tue, 3 Aug 2010 09:48:29 -0400
Message-ID: <20100803134829.GB4751@phenom.dumpdata.com>
References: <20100803141646.594e0fee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <xen-devel-bounces@lists.xensource.com>
Content-Disposition: inline
In-Reply-To: <20100803141646.594e0fee.sfr@canb.auug.org.au>
List-Unsubscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xensource.com>
List-Help: <mailto:xen-devel-request@lists.xensource.com?subject=help>
List-Subscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=subscribe>
Sender: xen-devel-bounces@lists.xensource.com
Errors-To: xen-devel-bounces@lists.xensource.com
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konrad@rcsinet12.oracle.com, Jeremy Fitzhardinge <jeremy@goop.org>, Xen Devel <Xen-devel@lists.xensource.com>, Ian Campbell <ian.campbell@citrix.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, linux-kernel@vger.kernel.org, Alex Nixon <alex.nixon@citrix.com>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Aug 03, 2010 at 02:16:46PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xen tree got a conflict in
> include/xen/xen-ops.h between commit
> 08bbc9da92f7e44b9c208c6a1adba70c403b255e ("xen: Add
> xen_create_contiguous_region") from the swiotlb tree and commit
> 016b6f5fe8398b0291cece60b749d7c930a2e09c ("xen: Add suspend/resume
> support for PV on HVM guests") from the xen tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.

Thank you. 

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc include/xen/xen-ops.h
> index d789c93,46bc81e..0000000
> --- a/include/xen/xen-ops.h
> +++ b/include/xen/xen-ops.h
> @@@ -14,10 -15,6 +15,12 @@@ void xen_mm_unpin_all(void)
>   void xen_timer_resume(void);
>   void xen_arch_resume(void);
>   
>  +extern unsigned long *xen_contiguous_bitmap;
>  +int xen_create_contiguous_region(unsigned long vstart, unsigned int order,
>  +				unsigned int address_bits);
>  +
>  +void xen_destroy_contiguous_region(unsigned long vstart, unsigned int order);
>  +
> + int xen_setup_shutdown_event(void);
> + 
>   #endif /* INCLUDE_XEN_OPS_H */
> 
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xensource.com
> http://lists.xensource.com/xen-devel
