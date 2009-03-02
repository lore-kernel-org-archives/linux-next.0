From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kvm tree build warnings
Date: Mon, 2 Mar 2009 17:49:15 +1100
Message-ID: <20090302174915.91ccbe7f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Mar_2009_17_49_15_+1100_FhNT=9t=7LPm.s0V"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40784 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752253AbZCBGt0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Mar 2009 01:49:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Sheng Yang <sheng@linux.intel.com>

--Signature=_Mon__2_Mar_2009_17_49_15_+1100_FhNT=9t=7LPm.s0V
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next build (powerpc ppc44x_config) produced these warnings:

In file included from arch/powerpc/kernel/asm-offsets.c:52:
include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside =
parameter list
include/linux/kvm_host.h:368: warning: its scope is only this definition or=
 declaration, which is probably not what you want
In file included from arch/powerpc/kvm/booke.c:24:
include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside =
parameter list
include/linux/kvm_host.h:368: warning: its scope is only this definition or=
 declaration, which is probably not what you want
In file included from arch/powerpc/kvm/booke_emulate.c:21:
include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside =
parameter list
include/linux/kvm_host.h:368: warning: its scope is only this definition or=
 declaration, which is probably not what you want
In file included from arch/powerpc/kvm/44x.c:21:
include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside =
parameter list
include/linux/kvm_host.h:368: warning: its scope is only this definition or=
 declaration, which is probably not what you want
In file included from arch/powerpc/kvm/44x_tlb.c:24:
include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside =
parameter list
include/linux/kvm_host.h:368: warning: its scope is only this definition or=
 declaration, which is probably not what you want
In file included from arch/powerpc/include/asm/kvm_ppc.h:31,
                 from arch/powerpc/kvm/44x_emulate.c:21:
include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside =
parameter list
include/linux/kvm_host.h:368: warning: its scope is only this definition or=
 declaration, which is probably not what you want
In file included from arch/powerpc/kvm/../../../virt/kvm/coalesced_mmio.c:1=
3:
include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside =
parameter list
include/linux/kvm_host.h:368: warning: its scope is only this definition or=
 declaration, which is probably not what you want
In file included from arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:21:
include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside =
parameter list
include/linux/kvm_host.h:368: warning: its scope is only this definition or=
 declaration, which is probably not what you want
In file included from arch/powerpc/kvm/emulate.c:25:
include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside =
parameter list
include/linux/kvm_host.h:368: warning: its scope is only this definition or=
 declaration, which is probably not what you want
In file included from arch/powerpc/kvm/powerpc.c:24:
include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside =
parameter list
include/linux/kvm_host.h:368: warning: its scope is only this definition or=
 declaration, which is probably not what you want

Probably caused by commit 71c8a3f871fab4b54f7cace7d4626e67dfb51b2d ("KVM:
Unify the delivery of IOAPIC and MSI interrupts").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Mar_2009_17_49_15_+1100_FhNT=9t=7LPm.s0V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmrgWwACgkQjjKRsyhoI8woVACcC7VHGawY/dZg9lU0iUF5ayn9
Sj0AnRqfo1IUfPCGRyGZI+fb4Xu6mh9N
=PXra
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Mar_2009_17_49_15_+1100_FhNT=9t=7LPm.s0V--
