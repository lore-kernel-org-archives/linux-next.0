From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the kvm tree with the powerpc tree
Date: Wed, 15 Feb 2017 22:16:41 +1100
Message-ID: <8760kbln52.fsf@concordia.ellerman.id.au>
References: <20170210145943.5bf98310@canb.auug.org.au> <60b17c77-fb90-20e7-8cc7-a5970d2e5691@redhat.com> <87k28tma8d.fsf@concordia.ellerman.id.au> <4a43b8ed-bd08-f8e8-e749-178bb3bac815@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37803 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751108AbdBOLQp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Feb 2017 06:16:45 -0500
In-Reply-To: <4a43b8ed-bd08-f8e8-e749-178bb3bac815@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 14/02/2017 09:45, Michael Ellerman wrote:
>>> If possible, please pull only up to "powerpc/64: Allow for relocation-on
>>> interrupts from guest to host" and cherry-pick the top two patches
>>> ("powerpc/64: CONFIG_RELOCATABLE support for hmi interrupts" and
>>> "powerpc/powernv: Remove separate entry for OPAL real mode calls") into
>>> your next branch, but leave the rest for my tree only.
>>
>> I don't see how that helps anything.
>> 
>> In fact it guarantees a mess because those two commits would now go to
>> Linus via my tree (cherry picked) and via Paul's as part of his second
>> merge of the topic branch.
>>
>> So unless you can give me a good reason I'll merge the tip of the topic
>> branch into my next, as planned.
>
> Yes, Paul's second merge did guarantee a mess, so go ahead.

OK, glad we agree on that.

I've now merged it and most of the conflicts are gone. The one remaining
one will be fixed if you take Paul's second pull, or otherwise it's
trivial for Linus to fix.

> However, the reason was that this is simply not how topic branches
> should work: topic branches should be the base for other work, they
> shouldn't contain _all_ the work.

I think that's an overly specific definition of what a topic branch is.

It's just a branch related to some "topic", in this case powerpc kvm,
where commits can go so they can be shared between two trees.


> So the right workflow would have been:
>
> - Paul submits topic branch A to you

That never existed though. Paul had a series of 20 patches to enable KVM
with the radix MMU.

So to create 'A' he would have to split his series in two. Which he can
obviously do, but it's unnecessary IMHO.

> - you merge A
>
> - Paul merges topic branch A into his "next" branch
>
> - Paul applies KVM-specific patches B1 on top of his "next" branch.
>
> - Paul sends pull request to me (with A + kvmppc work).

Yeah we could have done it that way. But it unnecessarily splits the
series across the trees, and means I have no way of testing the whole in
my tree.

> As far as I understand, there was no reason for you to get B1.

Well no reason other than it's ~1300 lines of code in my arch, which I
would like to go through my normal testing procedures.

I also don't see how it hurts in any way for B1 to go to Linus via both
trees.

> The last two patches (let's call them B2) also didn't need to go through
> the kvm-ppc branch at all.  You could have applied them directly on top
> of A.

I'm pretty sure Paul did need the last patch to fix a bug, but maybe
he reworked that code, I forget.

You're right the second last patch didn't need to go via kvm-ppc. I put
it in the topic branch because it was based on earlier patches in there,
but I could have put it in my tree and fixed up the conflict when I
merged the topic branch.

cheers
