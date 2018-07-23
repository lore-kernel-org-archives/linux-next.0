From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Mon, 23 Jul 2018 14:46:41 +1000
Message-ID: <20180723144641.62b2b226@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0WPm=Aqjwvk1Mj=Z27khy9a"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/0WPm=Aqjwvk1Mj=Z27khy9a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/cpucaps.h

between commit:

  314d53d29798 ("arm64: Handle mismatched cache type")

from the arm64 tree and commit:

  e48d53a91f6e ("arm64: KVM: Add support for Stage-2 control of memory type=
s and cacheability")

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

diff --cc arch/arm64/include/asm/cpucaps.h
index be3bf3d08916,ed84d6536830..000000000000
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@@ -49,8 -49,8 +49,9 @@@
  #define ARM64_HAS_CACHE_DIC			28
  #define ARM64_HW_DBM				29
  #define ARM64_SSBD				30
 -#define ARM64_HAS_STAGE2_FWB			31
 +#define ARM64_MISMATCHED_CACHE_TYPE		31
++#define ARM64_HAS_STAGE2_FWB			32
 =20
--#define ARM64_NCAPS				32
++#define ARM64_NCAPS				33
 =20
  #endif /* __ASM_CPUCAPS_H */

--Sig_/0WPm=Aqjwvk1Mj=Z27khy9a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltVXbIACgkQAVBC80lX
0GxHZwf+OdwXgHSo9R6xNtzRCERmDtbHyxrkkQz4aYRqO+jpW5d+rFR0SEFfWntx
ddERQo7nOqPnmBW9ytnjjIsk0SmbS5adiozNf8Wn95rMQhcccLmm1ymAbAhI92mW
MsubBfzIR0ZORB6v3mARXXjwlmY6Y/52PCinuFIut2miTnHNBaooDgHlWQOAlZhJ
Y6u5qzNopik6AAgWidyKBEjslP+7ayZ7Lyu2AuTBA+fOkYBHnGTdGXbpdbJ/mS7c
giWQTcBR8QpENAxIfHD5ARknZkceqsUsjkFXP8Qt9fpMFUF67/YT9scBvH7BEo6I
qEqsVuo76jZ9t/ErgJmHC3XPcNJ+JA==
=FtT+
-----END PGP SIGNATURE-----

--Sig_/0WPm=Aqjwvk1Mj=Z27khy9a--
