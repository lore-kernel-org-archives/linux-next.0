From: Christoph Lameter <cl@linux.com>
Subject: Re: mmotm 2015-01-22-15-04: qemu failure due to 'mm: memcontrol:
 remove unnecessary soft limit tree node test'
Date: Fri, 23 Jan 2015 14:20:03 -0600 (CST)
Message-ID: <alpine.DEB.2.11.1501231419420.11767@gentwo.org>
References: <54c1822d.RtdGfWPekQVAw8Ly%akpm@linux-foundation.org> <20150123050802.GB22751@roeck-us.net> <20150123141817.GA22926@phnom.home.cmpxchg.org>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from resqmta-ch2-05v.sys.comcast.net ([69.252.207.37]:34924 "EHLO
	resqmta-ch2-05v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753191AbbAWUUH (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2015 15:20:07 -0500
In-Reply-To: <20150123141817.GA22926@phnom.home.cmpxchg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Guenter Roeck <linux@roeck-us.net>, akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz

On Fri, 23 Jan 2015, Johannes Weiner wrote:

>         struct mem_cgroup_tree_per_node *rtpn;
>         struct mem_cgroup_tree_per_zone *rtpz;
> -       int tmp, node, zone;
> +       int node, zone;
>
>         for_each_node(node) {

Do for_each_online_node(node) {

instead?

> -               tmp = node;
> -               if (!node_state(node, N_NORMAL_MEMORY))
> -                       tmp = -1;
> -               rtpn = kzalloc_node(sizeof(*rtpn), GFP_KERNEL, tmp);
> +               rtpn = kzalloc_node(sizeof(*rtpn), GFP_KERNEL, node);
>                 BUG_ON(!rtpn);
>
>                 soft_limit_tree.rb_tree_per_node[node] = rtpn;
>
> --
>
> Is the assumption of this patch wrong?  Does the specified node have
> to be online for the fallback to work?
>
> Thanks
>
