From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Tue, 11 Dec 2018 08:52:57 +1100
Message-ID: <20181211085257.6e689038@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VrS5QPttYezG16fiWIRB03H"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/VrS5QPttYezG16fiWIRB03H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got conflicts in:

  Documentation/arm64/silicon-errata.txt
  arch/arm64/Kconfig

between commit:

  ce8c80c536da ("arm64: Add workaround for Cortex-A76 erratum 1286807")

from Linus' tree and commit:

  a457b0f7f50d ("arm64: Add configuration/documentation for Cortex-A76 erra=
tum 1165522")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/arm64/silicon-errata.txt
index 8f9577621144,04f0bc4690c6..000000000000
--- a/Documentation/arm64/silicon-errata.txt
+++ b/Documentation/arm64/silicon-errata.txt
@@@ -57,7 -57,7 +57,8 @@@ stable kernels
  | ARM            | Cortex-A73      | #858921         | ARM64_ERRATUM_8589=
21        |
  | ARM            | Cortex-A55      | #1024718        | ARM64_ERRATUM_1024=
718       |
  | ARM            | Cortex-A76      | #1188873        | ARM64_ERRATUM_1188=
873       |
+ | ARM            | Cortex-A76      | #1165522        | ARM64_ERRATUM_1165=
522       |
 +| ARM            | Cortex-A76      | #1286807        | ARM64_ERRATUM_1286=
807       |
  | ARM            | MMU-500         | #841119,#826419 | N/A               =
          |
  |                |                 |                 |                   =
          |
  | Cavium         | ThunderX ITS    | #22375, #24313  | CAVIUM_ERRATUM_223=
75        |
diff --cc arch/arm64/Kconfig
index 0d9a45f948c2,4dbef530cf58..000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -478,24 -504,18 +485,36 @@@ config ARM64_ERRATUM_118887
 =20
  	  If unsure, say Y.
 =20
+ config ARM64_ERRATUM_1165522
+ 	bool "Cortex-A76: Speculative AT instruction using out-of-context transl=
ation regime could cause subsequent request to generate an incorrect transl=
ation"
+ 	default y
+ 	help
+ 	  This option adds work arounds for ARM Cortex-A76 erratum 1165522
+=20
+ 	  Affected Cortex-A76 cores (r0p0, r1p0, r2p0) could end-up with
+ 	  corrupted TLBs by speculating an AT instruction during a guest
+ 	  context switch.
+=20
+ 	  If unsure, say Y.
+=20
 +config ARM64_ERRATUM_1286807
 +	bool "Cortex-A76: Modification of the translation table for a virtual ad=
dress might lead to read-after-read ordering violation"
 +	default y
 +	select ARM64_WORKAROUND_REPEAT_TLBI
 +	help
 +	  This option adds workaround for ARM Cortex-A76 erratum 1286807
 +
 +	  On the affected Cortex-A76 cores (r0p0 to r3p0), if a virtual
 +	  address for a cacheable mapping of a location is being
 +	  accessed by a core while another core is remapping the virtual
 +	  address to a new physical page using the recommended
 +	  break-before-make sequence, then under very rare circumstances
 +	  TLBI+DSB completes before a read using the translation being
 +	  invalidated has been observed by other observers. The
 +	  workaround repeats the TLBI+DSB operation.
 +
 +	  If unsure, say Y.
 +
  config CAVIUM_ERRATUM_22375
  	bool "Cavium erratum 22375, 24313"
  	default y

--Sig_/VrS5QPttYezG16fiWIRB03H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwO4DkACgkQAVBC80lX
0GxUKAgAoEbJ1qc+Ct7woPIsnJYrNJI/SFxoQ79RJQGVPR5yaMOkOl7ng3G8dMY+
w36bKwtndk+yKWFEt2RaEFTi8k5G5GPBwd5/vSCAHxlmbxcTlLQ0JAb8abhTg4pa
g2Lo0qeemDTWUkDJc5sMbydZO5Drxy//EBAYu1jmjnj9lgPVrdNBUCz1fnXSd7aW
yLqSsM6lOvrdy4KMu1kJ3vjYFts6IUrx0xHVaTjXonUXZk79c8Cht6ylzEN1GESx
OQi96uTnZTKry0nlUEL4Wqtu3QOIeJo1X5VzY2svo6bCbtkIXwVtqhSYQeD+vouD
QTALj2bhMA7dHLmNLJEUFSNTqsRWGg==
=/k/H
-----END PGP SIGNATURE-----

--Sig_/VrS5QPttYezG16fiWIRB03H--
