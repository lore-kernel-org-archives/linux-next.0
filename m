From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the kvm-arm tree
Date: Wed, 20 Feb 2019 07:38:05 +1100
Message-ID: <20190220073801.3cb6082a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/k78+FvmXYI+NSxj2YGr6R6H"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/k78+FvmXYI+NSxj2YGr6R6H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  32296b9048b7 ("KVM: arm64: Fix comment for KVM_PHYS_SHIFT")
  bfc871bad87c ("KVM: arm/arm64: fix spelling mistake: "auxilary" -> "auxil=
iary"")
  1c1c37e5600b ("KVM: arm/arm64: Update MAINTAINERS entries")
  b1206bfb39d6 ("KVM: arm/arm64: Prefix header search paths with $(srctree)=
/")
  507f5a8474ef ("KVM: arm/arm64: Remove -I. header search paths")
  af8c5901d5e3 ("KVM: arm/arm64: Fix TRACE_INCLUDE_PATH")
  d116a11d3ccc ("KVM: arm/arm64: arch_timer: Mark physical interrupt active=
 when a virtual interrupt is pending")
  17925ec8a87d ("arm64: KVM: Describe data or unified caches as having 1 se=
t and 1 way")
  eabb8caadca8 ("arm64: KVM: Expose sanitised cache type register to guest")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/k78+FvmXYI+NSxj2YGr6R6H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxsaS0ACgkQAVBC80lX
0GzQjAf+NWA40y/iJlRA9RE6gK3SVcBtezJaNKWR+9d7eO9HkFNgbl441OfGMAcQ
9KLDI5dXwYA5/J3LeqrJJQokQ5f3tthkVsb2WeOJT8DglIn+QNLR7xRd2bgZBtg8
idXnIHkz7ZFZIllh/y7wGfq9mPHBN6QO9A0Sg/BINaCi2lxRczi/VNJrF3Uh/nDq
p8E2hzI/TfvTEHf7gAmyD9BKjcEkAErwUP83cijfZl6jjEt69DOk+e009EnUgd4M
U0FnIzxTdIjbSjk2lUYd+u53b23M3TxC1Z2rlpO5zwVXtcwJPnjzsNciSrqqxv+N
8Bm9dgCaPeP4fuJBG2QUM39IQdcFQA==
=K9ro
-----END PGP SIGNATURE-----

--Sig_/k78+FvmXYI+NSxj2YGr6R6H--
