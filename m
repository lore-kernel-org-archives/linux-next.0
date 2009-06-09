From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH -next] nommu: Provide mmap_min_addr definition.
Date: Wed, 10 Jun 2009 09:25:11 +1000 (EST)
Message-ID: <alpine.LRH.2.00.0906100924590.17869@tundra.namei.org>
References: <20090609084856.GA18528@linux-sh.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:49377 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750810AbZFIXZg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 19:25:36 -0400
In-Reply-To: <20090609084856.GA18528@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org

On Tue, 9 Jun 2009, Paul Mundt wrote:

> With the "security: use mmap_min_addr indepedently of security models"
> change, mmap_min_addr is used in common areas, which susbsequently blows
> up the nommu build. This stubs in the definition in the nommu case as
> well.
> 

Thanks.


Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next

> Signed-off-by: Paul Mundt <lethal@linux-sh.org>
> Cc: Christoph Lameter <cl@linux-foundation.org>
> Cc: James Morris <jmorris@namei.org>
> 
> --
> 
>  mm/nommu.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/nommu.c b/mm/nommu.c
> index b571ef7..2fd2ad5 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -69,6 +69,9 @@ int sysctl_max_map_count = DEFAULT_MAX_MAP_COUNT;
>  int sysctl_nr_trim_pages = CONFIG_NOMMU_INITIAL_TRIM_EXCESS;
>  int heap_stack_gap = 0;
>  
> +/* amount of vm to protect from userspace access */
> +unsigned long mmap_min_addr = CONFIG_DEFAULT_MMAP_MIN_ADDR;
> +
>  atomic_long_t mmap_pages_allocated;
>  
>  EXPORT_SYMBOL(mem_map);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
James Morris
<jmorris@namei.org>
