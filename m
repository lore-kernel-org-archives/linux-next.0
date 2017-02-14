From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree with the powerpc tree
Date: Tue, 14 Feb 2017 14:34:01 +0100
Message-ID: <4a43b8ed-bd08-f8e8-e749-178bb3bac815@redhat.com>
References: <20170210145943.5bf98310@canb.auug.org.au>
 <60b17c77-fb90-20e7-8cc7-a5970d2e5691@redhat.com>
 <87k28tma8d.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <87k28tma8d.fsf@concordia.ellerman.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org



On 14/02/2017 09:45, Michael Ellerman wrote:
>> If possible, please pull only up to "powerpc/64: Allow for relocation-on
>> interrupts from guest to host" and cherry-pick the top two patches
>> ("powerpc/64: CONFIG_RELOCATABLE support for hmi interrupts" and
>> "powerpc/powernv: Remove separate entry for OPAL real mode calls") into
>> your next branch, but leave the rest for my tree only.
>
> I don't see how that helps anything.
> 
> In fact it guarantees a mess because those two commits would now go to
> Linus via my tree (cherry picked) and via Paul's as part of his second
> merge of the topic branch.
>
> So unless you can give me a good reason I'll merge the tip of the topic
> branch into my next, as planned.

Yes, Paul's second merge did guarantee a mess, so go ahead.

However, the reason was that this is simply not how topic branches
should work: topic branches should be the base for other work, they
shouldn't contain _all_ the work.  So the right workflow would have been:

- Paul submits topic branch A to you

- you merge A

- Paul merges topic branch A into his "next" branch

- Paul applies KVM-specific patches B1 on top of his "next" branch.

- Paul sends pull request to me (with A + kvmppc work).

As far as I understand, there was no reason for you to get B1.

The last two patches (let's call them B2) also didn't need to go through
the kvm-ppc branch at all.  You could have applied them directly on top
of A.  Linus then would get A and B2 from you, and A and B1 from me:

                  base -→ A -----→ B1
                          ↓        ↓
                   ppc -→ ▪        ▪ ←- kvm
                          ↓        |
                          B2       |
                          ↓        ↓
                      torvalds/linux.git


If necessary, things could have been arranged so that Linus got A and B2
from you, and all three of A/B1/B2 from me:

- Paul submits topic branch B2 to you, based on topic branch A

- you merge B2

- Paul merges B2 and I get it from him

The result would have been:

                  base -→ A -----→ B1
                          ↓ ↘      ↓
                   ppc -→ ▪   B2 → ▪
                          ↓ ↙      ↓
                          ▪        ▪ ←- kvm
                          ↓        ↓
                      torvalds/linux.git

Paolo
