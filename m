From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the m68knommu tree with the m68k tree
Date: Wed, 9 Nov 2011 11:15:02 +1100
Message-ID: <20111109111502.83ac206d957142cf44840d22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__9_Nov_2011_11_15_02_+1100_QsEjH.ZZcQyhGIow"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__9_Nov_2011_11_15_02_+1100_QsEjH.ZZcQyhGIow
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the m68knommu tree got a conflict in
arch/m68k/kernel/Makefile between commits 4936f63cb790 ("m68k/irq: Add
genirq support") and d890d7399525 ("m68k/irq: Remove obsolete m68k irq
framework") from the m68k tree and commit 7bf6f100a307 ("m68k: merge the
init_task code for mmu and non-mmu targets") from the m68knommu tree.

I fixed it up (see below) and can carry the fixes as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/m68k/kernel/Makefile
index c569619,01ae30e..0000000
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@@ -6,15 -6,16 +6,11 @@@ extra-$(CONFIG_MMU)	:=3D head.
  extra-$(CONFIG_SUN3)	:=3D sun3-head.o
  extra-y			+=3D vmlinux.lds
 =20
- obj-y	:=3D entry.o irq.o m68k_ksyms.o module.o process.o ptrace.o setup.o=
 \
- 	   signal.o sys_m68k.o syscalltable.o time.o traps.o
 -obj-y	:=3D entry.o init_task.o m68k_ksyms.o module.o process.o ptrace.o
++obj-y	:=3D entry.o irq.o init_task.o m68k_ksyms.o module.o process.o ptra=
ce.o
+ obj-y	+=3D setup.o signal.o sys_m68k.o syscalltable.o time.o traps.o
 =20
 -obj-$(CONFIG_MMU)	+=3D ints.o devres.o vectors.o
 -devres-$(CONFIG_MMU)	=3D ../../../kernel/irq/devres.o
 +obj-$(CONFIG_MMU)	+=3D ints.o vectors.o
 =20
  ifndef CONFIG_MMU_SUN3
  obj-y			+=3D dma.o
  endif
--ifndef CONFIG_MMU
- obj-y			+=3D init_task.o
- endif
-=20
 -obj-y			+=3D irq.o
 -endif
 -

--Signature=_Wed__9_Nov_2011_11_15_02_+1100_QsEjH.ZZcQyhGIow
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOucYGAAoJEECxmPOUX5FER4cP/A0s6U7K2h70UaNJnGPJIxXX
KX9atst2voV5gs3VZtePqxGpUJ8MsrGBMUMRw9Bv6/5tvq9HTL/GUpmizzizgUv3
9nm0SNBGthD5+b8/B597mbHy/ls+AyhI904YazS4nxZHM/FTG0N/Qc9EyZNhzfDw
1pVHS6h09WpziN/VdEypeIQVULaicqyHnPobOd85hMtj10pJSyBCJ1nwaHg0jFNL
kfK3QozZ1fkvrrKGl+6WfHv7xx5gMbScmnaVMZJh47Y3YjUtkJnfTaH0SNvBVQph
v+SJa/Z6p4vEoI5CIDoc0pK/VDHwQ8OghRfAyKEuRuEVhRYlcFEGKp+TgfPUa1hx
hc6Jxk2suAlU1hXnjKghXSILvqO2djBkR0LMylVri0TEu0glW+95IUNxVplzmDup
qmrZEyrJOe8OB5rsd0wmcgUySIUiwN3VniuCLPSii+GH1nHN83wPzkqmOE6iZqbC
iGvXWDRbhAaW02M/BNiLyadx70wDa/5YZi16SyGEPejV8Re7OgPVLYNPX+3Zdcwv
ro2apbntlsH1npQFLMEk59L0gVgqY+eiy14BAkYF2lzBGLpIi+Algq2hNTWiNBKN
iZYxZ7v45K8gPxx7JlaFjSg2IrU6ehEw1J7U9fSu94qAUfJM5Bf9DOSMw+l5gWmV
G5xUp6JFcysOKjHcO6Y8
=xfdu
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Nov_2011_11_15_02_+1100_QsEjH.ZZcQyhGIow--
