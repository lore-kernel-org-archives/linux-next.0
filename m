From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the cgroup tree with the net-next
 tree
Date: Mon, 13 Nov 2017 16:26:28 +1100
Message-ID: <20171113162618.1b33e82d@canb.auug.org.au>
References: <20171009183836.cceczuqytzmgqubr@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750949AbdKMF0a (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 00:26:30 -0500
In-Reply-To: <20171009183836.cceczuqytzmgqubr@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Mark,

On Mon, 9 Oct 2017 19:38:36 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Hi Tejun,
> 
> Today's linux-next merge of the cgroup tree got a conflict in:
> 
>   kernel/cgroup/cgroup.c
> 
> between commit:
> 
>   324bda9e6c5ad ("bpf: multi program support for cgroup+bpf")
> 
> from the net-next tree and commit:
> 
>   041cd640b2f3c ("cgroup: Implement cgroup2 basic CPU usage accounting")
> 
> from the cgroup tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc kernel/cgroup/cgroup.c
> index 00f5b358aeac,c3421ee0d230..000000000000
> --- a/kernel/cgroup/cgroup.c
> +++ b/kernel/cgroup/cgroup.c
> @@@ -4765,8 -4785,9 +4788,11 @@@ static struct cgroup *cgroup_create(str
>   
>   	return cgrp;
>   
>  +out_idr_free:
>  +	cgroup_idr_remove(&root->cgroup_idr, cgrp->id);
> + out_stat_exit:
> + 	if (cgroup_on_dfl(parent))
> + 		cgroup_stat_exit(cgrp);
>   out_cancel_ref:
>   	percpu_ref_exit(&cgrp->self.refcnt);
>   out_free_cgrp:

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
