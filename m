From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with Linus' tree
Date: Wed, 18 Mar 2015 14:41:11 +1100
Message-ID: <20150318144111.1e56c6d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DXyNdRQ1ZrIO_vdG1iJo=/0"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53053 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754686AbbCRDlS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Mar 2015 23:41:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>

--Sig_/DXyNdRQ1ZrIO_vdG1iJo=/0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in
virt/kvm/arm/vgic.c between commit ae705930fca6 ("arm/arm64: KVM: Keep
elrsr/aisr in sync with software model") from Linus' tree and commit
71760950bf3d ("arm/arm64: KVM: add a common vgic_queue_irq_to_lr fn")
from the kvm-arm tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc virt/kvm/arm/vgic.c
index c9f60f524588,ffd937ca5141..000000000000
--- a/virt/kvm/arm/vgic.c
+++ b/virt/kvm/arm/vgic.c
@@@ -982,9 -1092,7 +1098,8 @@@ bool vgic_queue_irq(struct kvm_vcpu *vc
  		if (vlr.source =3D=3D sgi_source_id) {
  			kvm_debug("LR%d piggyback for IRQ%d\n", lr, vlr.irq);
  			BUG_ON(!test_bit(lr, vgic_cpu->lr_used));
- 			vlr.state |=3D LR_STATE_PENDING;
- 			vgic_set_lr(vcpu, lr, vlr);
+ 			vgic_queue_irq_to_lr(vcpu, irq, lr, vlr);
 +			vgic_sync_lr_elrsr(vcpu, lr, vlr);
  			return true;
  		}
  	}
@@@ -1001,12 -1109,8 +1116,9 @@@
 =20
  	vlr.irq =3D irq;
  	vlr.source =3D sgi_source_id;
- 	vlr.state =3D LR_STATE_PENDING;
- 	if (!vgic_irq_is_edge(vcpu, irq))
- 		vlr.state |=3D LR_EOI_INT;
-=20
- 	vgic_set_lr(vcpu, lr, vlr);
+ 	vlr.state =3D 0;
+ 	vgic_queue_irq_to_lr(vcpu, irq, lr, vlr);
 +	vgic_sync_lr_elrsr(vcpu, lr, vlr);
 =20
  	return true;
  }

--Sig_/DXyNdRQ1ZrIO_vdG1iJo=/0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVCPPbAAoJEMDTa8Ir7ZwVoJMQAIBvKPgYfcXu0Ovo16nP+UmW
vx3sOv7An1fziwkVfJl95T74a0TWXyBiqHVSKSwHkg7b50+1alooU3cz2QYES4T3
44L+iMr8MIrWNsVLZH0QBb1vRAme3hgN+IQJK9dmeSUK697wUA8X/s+BjUaF6CAH
HIOahMS1+jZH+Ww3wzpDDMUo/+UIqmVTz8jDNXLAMx/MfB7w2D/X+hpETjLmPQv7
t5qHWhtw6OgY1apgutTKXiEJCmTeUFv7QFmTlAikHft/3lJZxCu0Pm68gnZW0icp
X38/+s8JW+OwncOnhZQF3AtBovCzPsnrMQROyprdnSDiyCF++K0DEXCuVcPfutRy
b3hcI1zINp6lEKJDX0gIsVgm8PcLdbPLJijnLwQokDrFuRFrXl/+WnYH/am19QYz
hG1ygu10a5RrtHOANkIWLPrS8YDUqQMJ3QQCJioo/XyyO9UPGCiMYcm3Eer1zZbt
eEejf+VHQ5b6ZcSVb2uLbvYlJNwB+zaFxdPdlSJCE0rHpKQK2dOcGmNcDr7k/QT5
VxD8glEJjJK2qPIKME3tNkkhI/ChvudX1KzyxGrXxjJ/5CExdrnh4h3WqwRpNpNt
OeYwC1n5+EFglVGOYIJakcI6laTuBzYnTfl4G7rYYIP93xIvrYfhHKjfPgK0C13N
VPldzgFMiDE1322bZWtM
=7nn7
-----END PGP SIGNATURE-----

--Sig_/DXyNdRQ1ZrIO_vdG1iJo=/0--
