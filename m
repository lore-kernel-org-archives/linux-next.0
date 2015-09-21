From: Vladimir Davydov <vdavydov@parallels.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 21 Sep 2015 10:58:59 +0300
Message-ID: <20150921075859.GB4995@esperanza>
References: <20150921141039.5bfbb9ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150921141039.5bfbb9ca@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Sep 21, 2015 at 02:10:39PM +1000, Stephen Rothwell wrote:
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> mm/vmscan.c: In function 'sane_reclaim':
> mm/vmscan.c:178:2: error: implicit declaration of function 'cgroup_on_dfl' [-Werror=implicit-function-declaration]
>   if (cgroup_on_dfl(memcg->css.cgroup))
>   ^
> 
> Caused by commit
> 
>   d08255ab4d66 ("vmscan: fix sane_reclaim helper for legacy memcg")
> 
> interacting with commit
> 
>   9e10a130d9b6 ("cgroup: replace cgroup_on_dfl() tests in controllers with cgroup_subsys_on_dfl()")
> 
> from the cgroup tree.
> 
> I don't know what the correct firx is here (help, please) so I have just
> open coded the cgroup_on_dfl() call for now:

Quoting Tejun (http://www.spinics.net/lists/linux-mm/msg94556.html):

: Just a heads-up.  I'm applying a patch which replaces cgroup_on_dfl()
: with cgroup_subsys_on_dfl() to cgroup/for-4.4, so this patch would
: need to be adjusted to do cgroup_subsys_on_dfl(memory_cgrp_subsys)
: instead.

Thanks,
Vladimir
