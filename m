From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the kvm-arm tree
Date: Fri, 25 Jan 2019 07:14:50 +1100
Message-ID: <20190125071450.5107222b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SJ=ngjBB2bSqh5H2YMogom/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/SJ=ngjBB2bSqh5H2YMogom/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  188922da4992 ("KVM: arm64: Reuse sys_reg() macro when searching the trap =
table")
  ef40b3d5528e ("arm/arm64: KVM: Statically configure the host's view of MP=
IDR")
  31fc83bdbaba ("ARM: KVM: Teach some form of type-safety to kvm_call_hyp")
  74bdc394c5a3 ("arm64: KVM: Drop VHE-specific HYP call stub")
  051a0ebd09ce ("arm64: KVM: Allow for direct call of HYP functions when us=
ing VHE")
  1fbfa15343a0 ("arm/arm64: KVM: Introduce kvm_call_hyp_ret()")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/SJ=ngjBB2bSqh5H2YMogom/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxKHLoACgkQAVBC80lX
0Gxh+Af+KNurm3MNFwX0BwGPBGpgy5hL28aSqRJ13CpBQBwAxR/qOvkT2hHuJllC
8zLDQOXIzVw0V5QzKz5Lm80pr+R0H8RyOlJd+ebOD9CXkIT0jnTFEBq1JA05w8ZX
d+38UqDLoZQ0IGCJ/PJ3zdm08lrdA6VnCgqNCDuwfgPOsqXcxYJ2ZdbJeGqRNk4Z
zqdp4MBWKByUrOpNGCSNmDOBRhdDFAb2967L2e7KiUw3hWdcAu6UxDmREM61oA3k
w+wCUA78b15eZysMH2jMNX8RdKNopszi5f3SbQ30onbdG3iVCD55DdWqPetGnK+U
U0Qe5e8Xnm01jOTscs22EoPToNsEgg==
=O3DQ
-----END PGP SIGNATURE-----

--Sig_/SJ=ngjBB2bSqh5H2YMogom/--
