From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rdma tree
Date: Thu, 14 Feb 2019 11:23:00 +1100
Message-ID: <20190214112300.41c0c7bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MSSFTuMe8sp0nPz+it+nlDX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kaike Wan <kaike.wan@intel.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/MSSFTuMe8sp0nPz+it+nlDX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/infiniband/hw/hfi1/tid_rdma.c: In function 'hfi1_tid_rdma_wqe_inter=
lock':
drivers/infiniband/hw/hfi1/tid_rdma.c:3251:3: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
   switch (prev->wr.opcode) {
   ^~~~~~
drivers/infiniband/hw/hfi1/tid_rdma.c:3259:2: note: here
  case IB_WR_RDMA_READ:
  ^~~~

Introduced by commit

  c6c231175ccd ("IB/hfi1: Add interlock between TID RDMA WRITE and other re=
quests")

I get this warning because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (assuming that the fall through is intentional).

--=20
Cheers,
Stephen Rothwell

--Sig_/MSSFTuMe8sp0nPz+it+nlDX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxktOQACgkQAVBC80lX
0GxC0Qf7BVZ2hN4cB9kXnA7InYLEWZvykziVmOsx8qXNrJC/2r+QbEMLTtJhZx9t
YYyJ8Mq14qoxoXVlsem2fY2ZBlZA/lXJy7og5Lm8ErJC8Ofr27G6jL1AEIQrqflH
AKXTUJDD9hxUYMYCmdykUGEHOiBoUqjwH+J2l0SLjger2LKwwIjR6x/23/dCZ5dE
Jd0tRoY1zD/OW1deipStqXVeZT//Cs8iin+5koEF27+16vcjyg375tdedl2sRZLM
1VGkYYfMQcGkTL0rlYed04SW7snjGao88W8VbZPzX1SEXdptALJOWDWgCrymkl18
yqPF/LOVsrye6JtVz83Z6U4G/PluqA==
=umc/
-----END PGP SIGNATURE-----

--Sig_/MSSFTuMe8sp0nPz+it+nlDX--
