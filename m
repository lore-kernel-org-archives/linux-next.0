From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the rdma tree
Date: Fri, 9 Mar 2018 07:51:19 +1100
Message-ID: <20180309075119.7b536dcd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LlBxNeKIfEg24y=8bDH65p0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/LlBxNeKIfEg24y=8bDH65p0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  63cf1a902c9d ("IB/srpt: Add RDMA/CM support")
  86af61764151 ("IB/rxe: remove unnecessary skb_clone")
  31f1bd14cbfe ("IB/rxe: remove unnecessary rxe in rxe_send")
  befd8d98f230 ("IB/rxe: change the function rxe_init_device_param type")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/LlBxNeKIfEg24y=8bDH65p0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqhokcACgkQAVBC80lX
0GyHyQgApLL5laroPtc+4Z2GOyunGs1dmdfMTfMGxeTVm2FQzRAeFIxtRc/0SK3B
sW+cfyKMOaZMxaWl0uZbin03WyKS/Tj/1NdewrAaTqnUZ4cJ7/ui+r1vU5qd8v83
PFZhGvzeje7O2P/zwpPjrez86H2+W8IKE+s41Fqd5A9TLNvDc6z+gj0NK962xunh
6SJWup0HwVEBW4AHeZRyJkTRdjP5Qgv6uOo+mM/KmikHcP9CNJcR6cmY2kGVs6oG
JqiRMljLCCT96kt7A1Q0Hs7jbiBDDa8FI15IhZMAhWEzof/c79vQt3CxYny6ubcK
nUCwxSTDiaozmz9AHrP8bpee+7t7yQ==
=dKGq
-----END PGP SIGNATURE-----

--Sig_/LlBxNeKIfEg24y=8bDH65p0--
