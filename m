From: Christoffer Dall <cdall@cs.columbia.edu>
Subject: Re: linux-next: manual merge of the kvm-arm tree with Linus' tree
Date: Thu, 31 Jul 2014 16:23:47 +0200
Message-ID: <20140731142347.GB589@cbox>
References: <20140731163004.474501fb@canb.auug.org.au>
 <CAEDV+gJ1oSPzgZMO=kdFDNPnzy-EOHGuLxHqTB8KO6d_8yPrxQ@mail.gmail.com>
 <87mwbpiv0z.fsf@approximate.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87mwbpiv0z.fsf@approximate.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Christoffer Dall <christofferdall@christofferdall.dk>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 31, 2014 at 01:15:40PM +0100, Marc Zyngier wrote:
> On Thu, Jul 31 2014 at 12:53:03 pm BST, Christoffer Dall <christoffer=
dall@christofferdall.dk> wrote:
>=20
> Hi Christoffer,
>=20
> > On Thu, Jul 31, 2014 at 8:30 AM, Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> >
> >     Hi all,
> >   =20
> >     Today's linux-next merge of the kvm-arm tree got a conflict in
> >     virt/kvm/arm/vgic.c between commit 63afbe7a0ac1 ("kvm: arm64: v=
gic: fix
> >     hyp panic with 64k pages on juno platform") from Linus' tree an=
d commit
> >     8f186d522c69 ("KVM: ARM: vgic: split GICv2 backend from the mai=
n vgic
> >     code") and others from the kvm-arm tree.
> >   =20
> >     I fixed it up (the latter extensively rewrites the function, so=
 I just
> >     used that) and can carry the fix as necessary (no action is req=
uired).
> >
> > Hmm that doesn't look correct, the checks =A0for
> > PAGE_ALIGNED(vcpu_res.start) and PAGE_ALIGNED(resource_size(vcpu_re=
s))
> > still need to be enforced for both vgic-v2 and vgic-v3. =A0How do w=
e
> > provide a correct fix for Linux-next?
>=20
> I've provided a resolution for GICv2 in a separate email. For GICv3, =
I
> have the following patch in my tree, which can be added at a later ti=
me.
>=20
The GICv3 build fix and the GICv3 fix you provided here are now both in
kvmarm/next.

Stephen, did you pick up the resolution provided by Marc for the gicv2
fix patch so that it applies to tomorrow's next/kvmarm merge?

Thanks,
-Christoffer
