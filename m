From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with Linus' tree
Date: Thu, 31 Jul 2014 13:15:40 +0100
Message-ID: <87mwbpiv0z.fsf@approximate.cambridge.arm.com>
References: <20140731163004.474501fb@canb.auug.org.au>
	<CAEDV+gJ1oSPzgZMO=kdFDNPnzy-EOHGuLxHqTB8KO6d_8yPrxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:27619 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750782AbaGaMPn convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2014 08:15:43 -0400
In-Reply-To: <CAEDV+gJ1oSPzgZMO=kdFDNPnzy-EOHGuLxHqTB8KO6d_8yPrxQ@mail.gmail.com>
	(Christoffer Dall's message of "Thu, 31 Jul 2014 12:53:03 +0100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <christofferdall@christofferdall.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>

On Thu, Jul 31 2014 at 12:53:03 pm BST, Christoffer Dall <christofferda=
ll@christofferdall.dk> wrote:

Hi Christoffer,

> On Thu, Jul 31, 2014 at 8:30 AM, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
>     Hi all,
>   =20
>     Today's linux-next merge of the kvm-arm tree got a conflict in
>     virt/kvm/arm/vgic.c between commit 63afbe7a0ac1 ("kvm: arm64: vgi=
c: fix
>     hyp panic with 64k pages on juno platform") from Linus' tree and =
commit
>     8f186d522c69 ("KVM: ARM: vgic: split GICv2 backend from the main =
vgic
>     code") and others from the kvm-arm tree.
>   =20
>     I fixed it up (the latter extensively rewrites the function, so I=
 just
>     used that) and can carry the fix as necessary (no action is requi=
red).
>
> Hmm that doesn't look correct, the checks =C2=A0for
> PAGE_ALIGNED(vcpu_res.start) and PAGE_ALIGNED(resource_size(vcpu_res)=
)
> still need to be enforced for both vgic-v2 and vgic-v3. =C2=A0How do =
we
> provide a correct fix for Linux-next?

I've provided a resolution for GICv2 in a separate email. For GICv3, I
have the following patch in my tree, which can be added at a later time=
=2E

Thanks,

	M.

=46rom 3eedf1d172230a117ec90832748879e88d9c3471 Mon Sep 17 00:00:00 200=
1
=46rom: Marc Zyngier <marc.zyngier@arm.com>
Date: Thu, 31 Jul 2014 11:42:18 +0100
Subject: [PATCH] KVM: arm64: GICv3: mandate page-aligned GICV region

Just like GICv2 was fixed in 63afbe7a0ac1
(kvm: arm64: vgic: fix hyp panic with 64k pages on juno platform),
mandate the GICV region to be both aligned on a page boundary and
its size to be a multiple of page size.

This prevents a guest from being able to poke at regions where we
have no idea what is sitting there.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 virt/kvm/arm/vgic-v3.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/virt/kvm/arm/vgic-v3.c b/virt/kvm/arm/vgic-v3.c
index f01d446..1c2c8ee 100644
--- a/virt/kvm/arm/vgic-v3.c
+++ b/virt/kvm/arm/vgic-v3.c
@@ -215,6 +215,22 @@ int vgic_v3_probe(struct device_node *vgic_node,
 		ret =3D -ENXIO;
 		goto out;
 	}
+
+	if (!PAGE_ALIGNED(vcpu_res.start)) {
+		kvm_err("GICV physical address 0x%llx not page aligned\n",
+			(unsigned long long)vcpu_res.start);
+		ret =3D -ENXIO;
+		goto out;
+	}
+
+	if (!PAGE_ALIGNED(resource_size(&vcpu_res))) {
+		kvm_err("GICV size 0x%llx not a multiple of page size 0x%lx\n",
+			(unsigned long long)resource_size(&vcpu_res),
+			PAGE_SIZE);
+		ret =3D -ENXIO;
+		goto out;
+	}
+
 	vgic->vcpu_base =3D vcpu_res.start;
 	vgic->vctrl_base =3D NULL;
 	vgic->type =3D VGIC_V3;
--=20
2.0.0


--=20
Jazz is not dead. It just smells funny.
