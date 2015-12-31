From: "Elliott, Robert (Persistent Memory)" <elliott@hpe.com>
Subject: RE: linux-next: manual merge of the akpm-current tree with the
 jc_docs tree
Date: Thu, 31 Dec 2015 17:47:31 +0000
Message-ID: <94D0CD8314A33A4D9D801C0FE68B40295BEE0147@G9W0745.americas.hpqcorp.net>
References: <20151231214307.53f62bd2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151231214307.53f62bd2@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Taku Izumi <izumi.taku@jp.fujitsu.com>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Thursday, December 31, 2015 4:43 AM
> To: Andrew Morton <akpm@linux-foundation.org>; Jonathan Corbet
> <corbet@lwn.net>
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org;
> Elliott, Robert (Persistent Memory) <elliott@hpe.com>; Taku Izumi
> <izumi.taku@jp.fujitsu.com>
> Subject: linux-next: manual merge of the akpm-current tree with the
> jc_docs tree
> 
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   Documentation/kernel-parameters.txt
> 
> between commit:
> 
>   9daacf51b428 ("Documentation/kernel-parameters: update KMG units")
> 
> from the jc_docs tree and commit:
> 
>   f0a906868be1 ("mm/page_alloc.c: introduce kernelcore=mirror
> option")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no
> action
> is required).
> 
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc Documentation/kernel-parameters.txt
> index adf540032a9d,2cfb638d138b..000000000000
> --- a/Documentation/kernel-parameters.txt
> +++ b/Documentation/kernel-parameters.txt
> @@@ -1710,7 -1696,8 +1714,8 @@@ Such letter suffixes can also be
> entire
> 
>   	keepinitrd	[HW,ARM]
> 
> - 	kernelcore=nn[KMGTPE]	[KNL,X86,IA-64,PPC] This parameter
>  -	kernelcore=	Format: nn[KMG] | "mirror"
> ++	kernelcore=	Format: nn[KMGTPE] | "mirror"
> + 			[KNL,X86,IA-64,PPC] This parameter
>   			specifies the amount of memory usable by the
> kernel
>   			for non-movable allocations.  The requested
> amount is
>   			spread evenly throughout all nodes in the system.
> The

There's a pretty strong convention that the [KNL,X86,IA-64,PPC] line
stay on the first line for grep, which seems more important than
keeping the format on that line. So, it might be better to resolve
using three lines like this:

	kernelcore=  [KNL,X86,IA-64,PPC] 
	Format: nn[KMGPTE] | "mirror"  
	This parameter specifies...
