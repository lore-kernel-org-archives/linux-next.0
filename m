From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Thu, 4 Oct 2018 14:07:37 +1000
Message-ID: <20181004140737.214df900@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/03S_PquRkNovGEDg+fb2OkM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/03S_PquRkNovGEDg+fb2OkM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/cpufeature.h

between commit:

  520ad98871a0 ("arm64/cpufeatures: Factorize emulate_mrs()")

from the arm64 tree and commit:

  ce00e3cb4fb4 ("arm64: Add a helper for PARange to physical shift conversi=
on")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/cpufeature.h
index 6db48d90ad63,072cc1c970c2..000000000000
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@@ -536,7 -530,26 +536,28 @@@ void arm64_set_ssbd_mitigation(bool sta
  static inline void arm64_set_ssbd_mitigation(bool state) {}
  #endif
 =20
+ static inline u32 id_aa64mmfr0_parange_to_phys_shift(int parange)
+ {
+ 	switch (parange) {
+ 	case 0: return 32;
+ 	case 1: return 36;
+ 	case 2: return 40;
+ 	case 3: return 42;
+ 	case 4: return 44;
+ 	case 5: return 48;
+ 	case 6: return 52;
+ 	/*
+ 	 * A future PE could use a value unknown to the kernel.
+ 	 * However, by the "D10.1.4 Principles of the ID scheme
+ 	 * for fields in ID registers", ARM DDI 0487C.a, any new
+ 	 * value is guaranteed to be higher than what we know already.
+ 	 * As a safe limit, we return the limit supported by the kernel.
+ 	 */
+ 	default: return CONFIG_ARM64_PA_BITS;
+ 	}
+ }
++
 +extern int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
  #endif /* __ASSEMBLY__ */
 =20
  #endif

--Sig_/03S_PquRkNovGEDg+fb2OkM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu1kgkACgkQAVBC80lX
0GzllggAmWJr0gflzWrLVWaiyAcMDH6B86g4XbTMbvDb+UaM0hQbQBKwG5QeIHAv
YL3X4tFXLzMpNKBHIbBe6n6ETsxayeg7j6WDl8pWklL1EGx6YkcloERLFBF/171C
JPiFUshd+M217RWxw53D3YBq1uHE+I57gYaRvPJGGsTEuH2wdlesAuqhqXNBKP8s
oRE0j696SA59bYFdgNkdjTEgDuSRH9xgs7q0PRXwzeSYO2I1FpWud2r9RBU8P7j9
DQxCkgK7zwUKBU4G5kiyyTJtCKUoSRwl4LLYTVGEl+jT1wQAGtEhKhqrprW3od5L
Ew4rH24gX08hfentzAxsr6T6qsBaDQ==
=oYES
-----END PGP SIGNATURE-----

--Sig_/03S_PquRkNovGEDg+fb2OkM--
