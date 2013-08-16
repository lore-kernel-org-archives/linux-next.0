From: Li Zefan <lizefan@huawei.com>
Subject: Re: [RFC PATCH next]cgroup: use css_get() in cgroup_create() to check
 CSS_ROOT
Date: Fri, 16 Aug 2013 18:16:18 +0800
Message-ID: <520DFBF2.5050903@huawei.com>
References: <1376647034.2642.22.camel@ThinkPad-T5421>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from szxga01-in.huawei.com ([119.145.14.64]:56019 "EHLO
	szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752257Ab3HPKQW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2013 06:16:22 -0400
In-Reply-To: <1376647034.2642.22.camel@ThinkPad-T5421>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Li Zhong <zhong@linux.vnet.ibm.com>
Cc: linux-next list <linux-next@vger.kernel.org>, Tejun Heo <tj@kernel.org>

On 2013/8/16 17:57, Li Zhong wrote:
> It seems that the root css doesn't have refcnt allocated(not needed?),
> and would cause the booting error attached.
> 
> This patch tries to use css_get() to not increase the refcnt if parent
> is root.
...
> diff --git a/kernel/cgroup.c b/kernel/cgroup.c
> index 723194f..781f8cd 100644
> --- a/kernel/cgroup.c
> +++ b/kernel/cgroup.c
> @@ -4485,7 +4485,7 @@ static long cgroup_create(struct cgroup *parent, struct dentry *dentry,
>  		struct cgroup_subsys_state *css = css_ar[ss->subsys_id];
>  
>  		dget(dentry);
> -		percpu_ref_get(&css->parent->refcnt);
> +		css_get(css->parent);

We use css_put() to drop this refcnt, so it makes sense to use css_get()
for consistency.

Acked-by: Li Zefan <lizefan@huawei.com>
