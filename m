From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rdma tree
Date: Thu, 26 Jul 2018 10:55:53 +1000
Message-ID: <20180726105553.00a36e3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kuj+vr4/UE=Y1Siy_7uRzl7"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>, Chuck Lever <chuck.lever@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/kuj+vr4/UE=Y1Siy_7uRzl7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

net/sunrpc/xprtrdma/svc_rdma_rw.c: In function 'svc_rdma_post_chunk_ctxt':
net/sunrpc/xprtrdma/svc_rdma_rw.c:350:5: warning: 'bad_wr' may be used unin=
itialized in this function [-Wmaybe-uninitialized]
  if (bad_wr !=3D first_wr)
     ^

Introduced by commit

  ed288d74a9e5 ("net/xprtrdma: Simplify ib_post_(send|recv|srq_recv)() call=
s")

This is an actual problem.

--=20
Cheers,
Stephen Rothwell

--Sig_/kuj+vr4/UE=Y1Siy_7uRzl7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltZHBkACgkQAVBC80lX
0Gw3aAf+JV+KQnRo61WjzWgK6G6qAfhvv3nu/pYhyOS7muHcix6l0yao/T4gxIms
x5IpTsJx/WFgPFZd40cIbQFvqwJ7hOq6nlAV7juIv2cfSWqEHKvW9j107fMvjuoa
GhHSXJY5ZCBAGPEwFJyLtjPEippo4V7wF2lYcWt/454PLLEPj/omzzv4VPrAPMDM
xKD8ntfL3TZnfNPhQPwnvdL9kjyPOoxIIFS6zbmNL3wLTR6qwkCMhN7JYLbh7h8D
mN8QojWiJVifTng5BtgmV5jItYP+IZ6+aRdNXCxtOEznELBAwLKfrzDfhsiyDrnQ
tO6BfM/hiMdsQU05kv+WS/LTh58sFw==
=FzSB
-----END PGP SIGNATURE-----

--Sig_/kuj+vr4/UE=Y1Siy_7uRzl7--
