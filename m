From: Tejun Heo <tj@kernel.org>
Subject: Re: [RFC PATCH next]cgroup: use css_get() in cgroup_create() to
 check CSS_ROOT
Date: Fri, 16 Aug 2013 10:58:05 -0400
Message-ID: <20130816145805.GE2505@htj.dyndns.org>
References: <1376647034.2642.22.camel@ThinkPad-T5421>
 <520DFBF2.5050903@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:63079 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751330Ab3HPO6J (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2013 10:58:09 -0400
Received: by mail-qc0-f171.google.com with SMTP id n1so1132577qcw.16
        for <linux-next@vger.kernel.org>; Fri, 16 Aug 2013 07:58:08 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <520DFBF2.5050903@huawei.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Li Zefan <lizefan@huawei.com>
Cc: Li Zhong <zhong@linux.vnet.ibm.com>, linux-next list <linux-next@vger.kernel.org>

On Fri, Aug 16, 2013 at 06:16:18PM +0800, Li Zefan wrote:
> On 2013/8/16 17:57, Li Zhong wrote:
> > It seems that the root css doesn't have refcnt allocated(not needed?),
> > and would cause the booting error attached.
> > 
> > This patch tries to use css_get() to not increase the refcnt if parent
> > is root.
> ...
> > diff --git a/kernel/cgroup.c b/kernel/cgroup.c
> > index 723194f..781f8cd 100644
> > --- a/kernel/cgroup.c
> > +++ b/kernel/cgroup.c
> > @@ -4485,7 +4485,7 @@ static long cgroup_create(struct cgroup *parent, struct dentry *dentry,
> >  		struct cgroup_subsys_state *css = css_ar[ss->subsys_id];
> >  
> >  		dget(dentry);
> > -		percpu_ref_get(&css->parent->refcnt);
> > +		css_get(css->parent);
> 
> We use css_put() to drop this refcnt, so it makes sense to use css_get()
> for consistency.
> 
> Acked-by: Li Zefan <lizefan@huawei.com>

Heh, this doesn't trigger on my test setup for some reason.  Applied.
Thanks a lot.

-- 
tejun
