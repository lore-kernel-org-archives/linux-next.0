From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the block tree
Date: Tue, 2 Apr 2019 05:08:42 +1100
Message-ID: <20190402050842.2db07437@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hoXIUXK4_nbbYG+QyaZ=iS5"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/hoXIUXK4_nbbYG+QyaZ=iS5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Commits

  837d7c7005c3 ("block: enable multi-page bvec for passthrough IO")
  df88a384baa3 ("block: pass page to xen_biovec_phys_mergeable")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/hoXIUXK4_nbbYG+QyaZ=iS5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyiU6oACgkQAVBC80lX
0GxYwAf/fQWS8rF7c1nzKnFqGDF53qMraksD1DjF6VVbzjZeR8Wa7UdrxDAt9x3q
tv++BUZoKhEGvHN6vuy0R6JrB3yb5gFP5flqxLpRWbkvqBLSlp9mOai26MU0yhQC
+HmfqycmvzlBRsnGRnuvZDpNlvqGRa5i5SdBN2b5fYTA4Ca8tM4K8MtbjCT1yMDI
HUT5SB0C4szs1pJr5Xgj7e+gNxBpNmeHvzRy1REEROyNP8Vth0/NLYUbI1k6FcVp
D7NQmc1fGhyF9lvT6pjz1OlKsGT2nSc96G54tzNHDW9zP81A29uqOqo8sJTWCMVX
8NHtaBhzd/P4xnInrnQR2+gk6QuuXw==
=vGtk
-----END PGP SIGNATURE-----

--Sig_/hoXIUXK4_nbbYG+QyaZ=iS5--
