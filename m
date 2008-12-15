From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: manual merge of the rr_cpumask tree
Date: Mon, 15 Dec 2008 08:27:09 -0800
Message-ID: <4946855D.7070403@sgi.com>
References: <20081215170945.b91f3b9c.sfr@canb.auug.org.au> <200812151711.36134.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:35625 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753252AbYLOQ1K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 11:27:10 -0500
In-Reply-To: <200812151711.36134.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@elte.hu>

Rusty Russell wrote:
> On Monday 15 December 2008 16:39:45 Stephen Rothwell wrote:
>> Hi Rusty,
>>
>> Today's linux-next merge of the rr_cpumask tree got a conflict in
>> arch/x86/kernel/io_apic.c between commit
>> 3145e941fcfe2548fa2270afb1a05bab3a6bc418 ("x86, MSI: pass irq_cfg and
>> irq_desc") from the sparseirq tree and commit
>> 0de26520c7cabf36e1de090ea8092f011a6106ce ("cpumask: make irq_set_affinity
>> () take a const struct cpumask") from the rr_cpumask tree.
>>
>> There are lots of overlapping changes.  I fixed it up (see below) and can carry the
>> fix as necessary.
> 
> I have performed this merge before.  The results are in
> 	git://git.kernel.org/pub/scm/linux/kernel/git/rusty/linux-2.6-for-ingo.git
> 
> Ingo, can you pull these into cpus4096?  It's just the cpumask/cpus4096 merge.
> 
> Thanks,
> Rusty.

Hi Rusty,

Did you update your tip/cpus4096 branch?  The resultant code in the above tree
does not have the additions from the sparseirq branch, which was the 6 hour merge
I did last week (but used the wrong tip branch.)  I'm re-doing the merge based
on the latest tip/cpus4096 which has this as the HEAD commit:


commit 8299608f140ae321e4eb5d1306184265d2b9511e
Merge: 45ab6b0... 30cb367... 69b88af... 8daa190...
Author: Ingo Molnar <mingo@elte.hu>
Date:   Fri Dec 12 13:49:17 2008 +0100

    Merge branches 'irq/sparseirq', 'x86/quirks' and 'x86/reboot' into cpus4096

    We merge the irq/sparseirq, x86/quirks and x86/reboot trees into the
    cpus4096 tree because the io-apic changes in the sparseirq change
    conflict with the cpumask changes in the cpumask tree, and we
    want to resolve those.

It will be done as soon as I figure out what arguments to git-rebase (or whatever)
are correct to get the output that Ingo needs, to apply to his tip/cpus4096 branch.

Thanks,
Mike
