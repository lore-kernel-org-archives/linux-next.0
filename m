From: Michal Hocko <mhocko@kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 13 Nov 2017 09:09:55 +0100
Message-ID: <20171113080955.zcdzx2p5kzoa4d7s@dhcp22.suse.cz>
References: <20171113164206.187a790d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56148 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751946AbdKMIJ6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 03:09:58 -0500
Content-Disposition: inline
In-Reply-To: <20171113164206.187a790d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon 13-11-17 16:42:06, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> In file included from include/linux/mmzone.h:17:0,
>                  from include/linux/mempolicy.h:10,
>                  from mm/mempolicy.c:70:
> mm/mempolicy.c: In function 'mpol_to_str':
> include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
>  #define nodemask_pr_args(maskp) (maskp) ? MAX_NUMNODES : 0, (maskp) ? (maskp)->bits : NULL
>                                          ^
> mm/mempolicy.c:2817:11: note: in expansion of macro 'nodemask_pr_args'
>            nodemask_pr_args(&nodes));
>            ^

Hmm, this warning is quite surprising to me. Sure in this particular
case maskp will always be non-NULL so we always expand to
	MAX_NUMNODES, maskp->bits
which is what we want. But we have other users which may be NULL. Does
anybody understan why this warns at all?
-- 
Michal Hocko
SUSE Labs
