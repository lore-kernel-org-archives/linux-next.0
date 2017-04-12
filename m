From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Wed, 12 Apr 2017 22:53:41 +0200
Message-ID: <bd7abc05-da24-8c65-c93e-ec30fe582233@suse.cz>
References: <20170412164606.08578271@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34404 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755104AbdDLUxo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 16:53:44 -0400
In-Reply-To: <20170412164606.08578271@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>, Michal Hocko <mhocko@kernel.org>

On 12.4.2017 8:46, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got conflicts in:
> 
>   drivers/block/nbd.c
>   drivers/scsi/iscsi_tcp.c
>   net/core/dev.c
>   net/core/sock.c
> 
> between commit:
> 
>   717a94b5fc70 ("sched/core: Remove 'task' parameter and rename tsk_restore_flags() to current_restore_flags()")
> 
> from the tip tree and commit:
> 
>   61d5ad5b2e8a ("treewide: convert PF_MEMALLOC manipulations to new helpers")
> 
> from the akpm-current tree.

Yeah, the first patch from Neil renames a function (as its subject says) and the
second patch from me converts most of its users to new helpers specific to the
PF_MEMALLOC flags.

> I fixed it up (the latter is just a superset of the former, so I used

It's not a complete superset though, more on that below.

> that) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Hmm I could redo my patch on top of Neil's patch, but then Andrew would have to
carry Neil's patch as well just to have a working mmotm? And then make sure to
send my patch (but not Neil's) only after the tip tree is pulled? Would that
work for the maintainers involved?

> It looks like there may be more instances that the latter patch should
> update.

I see two remaining instances of current_restore_flags(). One in __do_softirq()
is even for PF_MEMALLOC, but there the flag is cleared first and then set back,
which is opposite of the common case that my helpers provide. The other in nfsd
is for PF_LESS_THROTTLE which is not common enough to earn own helpers yet. IIRC
Neil originally wanted to add a new one?
