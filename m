From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: manual merge of the rr_cpumask tree
Date: Mon, 15 Dec 2008 10:40:32 -0800
Message-ID: <4946A4A0.5080806@sgi.com>
References: <20081215170945.b91f3b9c.sfr@canb.auug.org.au> <200812151711.36134.rusty@rustcorp.com.au> <4946855D.7070403@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:33596 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752939AbYLOSkg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 13:40:36 -0500
In-Reply-To: <4946855D.7070403@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>

Mike Travis wrote:
> Rusty Russell wrote:
>> On Monday 15 December 2008 16:39:45 Stephen Rothwell wrote:
>>> Hi Rusty,
>>>
>>> Today's linux-next merge of the rr_cpumask tree got a conflict in
>>> arch/x86/kernel/io_apic.c between commit
>>> 3145e941fcfe2548fa2270afb1a05bab3a6bc418 ("x86, MSI: pass irq_cfg and
>>> irq_desc") from the sparseirq tree and commit
>>> 0de26520c7cabf36e1de090ea8092f011a6106ce ("cpumask: make irq_set_affinity
>>> () take a const struct cpumask") from the rr_cpumask tree.
>>>
>>> There are lots of overlapping changes.  I fixed it up (see below) and can carry the
>>> fix as necessary.
>> I have performed this merge before.  The results are in
>> 	git://git.kernel.org/pub/scm/linux/kernel/git/rusty/linux-2.6-for-ingo.git
>>
>> Ingo, can you pull these into cpus4096?  It's just the cpumask/cpus4096 merge.
>>
>> Thanks,
>> Rusty.
> 
> Hi Rusty,
> 
> Did you update your tip/cpus4096 branch?  The resultant code in the above tree
> does not have the additions from the sparseirq branch, which was the 6 hour merge
> I did last week (but used the wrong tip branch.)  I'm re-doing the merge based
> on the latest tip/cpus4096 which has this as the HEAD commit:
> 

Hmm, building the tree a bit differently and the below commit does show up:

git-remote add linus git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
git-remote add tip git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git
git-remote add for-ingo git://git.kernel.org/pub/scm/linux/kernel/git/rusty/linux-2.6-for-ingo.git
git-remote update
git-checkout -b for-ingo for-ingo/master

Ingo - does this mean that the above "for-ingo" tree will merge into your tip/cpus4096 correctly?

(I'm doing a patch now to add in the missing pieces that were dropped after the rebase.)

> 
> commit 8299608f140ae321e4eb5d1306184265d2b9511e
> Merge: 45ab6b0... 30cb367... 69b88af... 8daa190...
> Author: Ingo Molnar <mingo@elte.hu>
> Date:   Fri Dec 12 13:49:17 2008 +0100
> 
>     Merge branches 'irq/sparseirq', 'x86/quirks' and 'x86/reboot' into cpus4096
> 
>     We merge the irq/sparseirq, x86/quirks and x86/reboot trees into the
>     cpus4096 tree because the io-apic changes in the sparseirq change
>     conflict with the cpumask changes in the cpumask tree, and we
>     want to resolve those.
> 
