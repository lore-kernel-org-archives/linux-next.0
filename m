From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with Linus' tree
Date: Thu, 31 Jul 2014 15:30:32 +0100
Message-ID: <86mwbpwqgn.fsf@arm.com>
References: <20140731163004.474501fb@canb.auug.org.au>
	<CAEDV+gJ1oSPzgZMO=kdFDNPnzy-EOHGuLxHqTB8KO6d_8yPrxQ@mail.gmail.com>
	<87mwbpiv0z.fsf@approximate.cambridge.arm.com>
	<20140731142347.GB589@cbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:42848 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750852AbaGaOar convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2014 10:30:47 -0400
In-Reply-To: <20140731142347.GB589@cbox> (Christoffer Dall's message of "Thu,
	31 Jul 2014 15:23:47 +0100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>
Cc: Christoffer Dall <christofferdall@christofferdall.dk>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>

On Thu, Jul 31 2014 at 03:23:47 PM, Christoffer Dall <cdall@cs.columbia=
=2Eedu> wrote:
> On Thu, Jul 31, 2014 at 01:15:40PM +0100, Marc Zyngier wrote:
>> On Thu, Jul 31 2014 at 12:53:03 pm BST, Christoffer Dall
>> <christofferdall@christofferdall.dk> wrote:
>>=20
>> Hi Christoffer,
>>=20
>> > On Thu, Jul 31, 2014 at 8:30 AM, Stephen Rothwell
>> > <sfr@canb.auug.org.au> wrote:
>> >
>> >     Hi all,
>> >   =20
>> >     Today's linux-next merge of the kvm-arm tree got a conflict in
>> >     virt/kvm/arm/vgic.c between commit 63afbe7a0ac1 ("kvm: arm64: =
vgic: fix
>> >     hyp panic with 64k pages on juno platform") from Linus' tree a=
nd commit
>> >     8f186d522c69 ("KVM: ARM: vgic: split GICv2 backend from the ma=
in vgic
>> >     code") and others from the kvm-arm tree.
>> >   =20
>> >     I fixed it up (the latter extensively rewrites the function, s=
o I just
>> >     used that) and can carry the fix as necessary (no action is re=
quired).
>> >
>> > Hmm that doesn't look correct, the checks =C2=A0for
>> > PAGE_ALIGNED(vcpu_res.start) and PAGE_ALIGNED(resource_size(vcpu_r=
es))
>> > still need to be enforced for both vgic-v2 and vgic-v3. =C2=A0How =
do we
>> > provide a correct fix for Linux-next?
>>=20
>> I've provided a resolution for GICv2 in a separate email. For GICv3,=
 I
>> have the following patch in my tree, which can be added at a later t=
ime.
>>=20
> The GICv3 build fix and the GICv3 fix you provided here are now both
> in kvmarm/next.

Excellent, thanks Christoffer.

Cheers,

	M.
--=20
Jazz is not dead. It just smells funny.
