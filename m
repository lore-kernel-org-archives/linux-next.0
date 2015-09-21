From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 21 Sep 2015 20:10:29 +1000
Message-ID: <20150921201029.7d613e65@canb.auug.org.au>
References: <20150921141039.5bfbb9ca@canb.auug.org.au>
	<20150921075853.GA19811@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150921075853.GA19811@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Hocko <mhocko@kernel.org>, Vladimir Davydov <vdavydov@parallels.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Michal, Vladimir,

On Mon, 21 Sep 2015 09:58:53 +0200 Michal Hocko <mhocko@kernel.org> wrote:
>
> AFAIU your fix is correct but using
> cgroup_subsys_on_dfl(memory_cgrp_subsys) is more appropriate:
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index d62924ee8022..c3df03add73e 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -176,7 +176,7 @@ static bool sane_reclaim(struct scan_control *sc)
>  	if (!memcg)
>  		return true;
>  #ifdef CONFIG_CGROUP_WRITEBACK
> -	if (cgroup_on_dfl(memcg->css.cgroup))
> +	if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
>  		return true;
>  #endif
>  	return false;

Thanks, I will do that from tomorrow.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
