From: Michal Hocko <mhocko@suse.cz>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 12 Aug 2013 09:23:18 +0200
Message-ID: <20130812072318.GA15963@dhcp22.suse.cz>
References: <20130812160733.b14fa70ef8ab575a3e42cd1b@canb.auug.org.au>
 <20130812160911.50722d217a4912d68b62d5bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49852 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752924Ab3HLHXV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Aug 2013 03:23:21 -0400
Content-Disposition: inline
In-Reply-To: <20130812160911.50722d217a4912d68b62d5bd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Mon 12-08-13 16:09:11, Stephen Rothwell wrote:
> [Just adding some missed ccs]
> 
> On Mon, 12 Aug 2013 16:07:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi Andrew,
> > 
> > After merging the akpm-current tree, today's linux-next build
> > (x86_64 allmodconfig) failed like this:
> > 
> > mm/memcontrol.c: In function '__mem_cgroup_iter_next':
> > mm/memcontrol.c:982:4: error: 'prev_cgroup' undeclared (first use in this function)
> >     prev_cgroup = next_cgroup;
> >     ^
> > mm/memcontrol.c:982:18: error: 'next_cgroup' undeclared (first use in this function)
> >     prev_cgroup = next_cgroup;
> >                   ^
> > 
> > I applied this patch:

Yes it looks good. Sorry, I have missed it when sending merge
resolution.

Thanks for the fixup.

> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 12 Aug 2013 16:04:36 +1000
> > Subject: [PATCH] memcontrol: further merge fix patch
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  mm/memcontrol.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 624d69e..a367145 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -979,7 +979,7 @@ skip_node:
> >  
> >  		switch (mem_cgroup_filter(mem, root, cond)) {
> >  		case SKIP:
> > -			prev_cgroup = next_cgroup;
> > +			prev_css = next_css;
> >  			goto skip_node;
> >  		case SKIP_TREE:
> >  			if (mem == root)
> > @@ -998,7 +998,7 @@ skip_node:
> >  			if (css_tryget(&mem->css))
> >  				return mem;
> >  			else {
> > -				prev_cgroup = next_cgroup;
> > +				prev_css = next_css;
> >  				goto skip_node;
> >  			}
> >  			break;
> > -- 
> > 1.8.4.rc0
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



-- 
Michal Hocko
SUSE Labs
