From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] percpu: fix compile warnings
Date: Sun, 04 Oct 2009 19:15:46 -0700
Message-ID: <4AC956D2.4010301@oracle.com>
References: <20091002134718.f577be51.sfr@canb.auug.org.au> <20091002094030.ffbde6ca.randy.dunlap@oracle.com> <4AC7EB84.1060506@kernel.org> <4AC7EE39.6010605@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:31203 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758292AbZJECS6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 4 Oct 2009 22:18:58 -0400
In-Reply-To: <4AC7EE39.6010605@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Tejun Heo wrote:
> Fix the following two compile warnings which show up on i386.
> 
> mm/percpu.c:1873: warning: comparison of distinct pointer types lacks a cast
> mm/percpu.c:1879: warning: format '%lx' expects type 'long unsigned int', but argument 2 has type 'size_t'
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Randy Dunlap <randy.dunlap@oracle.com>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> ---
> This patch has been committed to percpu#for-next.  Thanks.
> 
>  mm/percpu.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/percpu.c b/mm/percpu.c
> index e4e08b8..ec158bb 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -1868,13 +1868,14 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, ssize_t dyn_size,
>  	max_distance = 0;
>  	for (group = 0; group < ai->nr_groups; group++) {
>  		ai->groups[group].base_offset = areas[group] - base;
> -		max_distance = max(max_distance, ai->groups[group].base_offset);
> +		max_distance = max_t(size_t, max_distance,
> +				     ai->groups[group].base_offset);
>  	}
>  	max_distance += ai->unit_size;
>  
>  	/* warn if maximum distance is further than 75% of vmalloc space */
>  	if (max_distance > (VMALLOC_END - VMALLOC_START) * 3 / 4) {
> -		pr_warning("PERCPU: max_distance=0x%lx too large for vmalloc "
> +		pr_warning("PERCPU: max_distance=0x%zx too large for vmalloc "
>  			   "space 0x%lx\n",
>  			   max_distance, VMALLOC_END - VMALLOC_START);
>  #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK


-- 
~Randy
