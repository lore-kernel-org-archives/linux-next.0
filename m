From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rdma tree
Date: Thu, 14 Feb 2019 11:18:39 +1100
Message-ID: <20190214111839.6300f9b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z6z9P2TDF6nR6NmJ0Ch481J"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kaike Wan <kaike.wan@intel.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Z6z9P2TDF6nR6NmJ0Ch481J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/infiniband/hw/hfi1/qp.c: In function 'hfi1_setup_wqe':
drivers/infiniband/hw/hfi1/qp.c:328:3: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
   hfi1_setup_tid_rdma_wqe(qp, wqe);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/infiniband/hw/hfi1/qp.c:329:2: note: here
  case IB_QPT_UC:
  ^~~~

Introduced by commit

  f1ab4efa6d32 ("IB/hfi1: Enable TID RDMA READ protocol")

I get this warning because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (assuming that the fall through is intentional).

--=20
Cheers,
Stephen Rothwell

--Sig_/Z6z9P2TDF6nR6NmJ0Ch481J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxks98ACgkQAVBC80lX
0GzLsAgApDA+uARjRgKYMgJAdCyAOCw48OWijHGbacKOgpFQ2s3ro9B7Z7+XJuL6
Dr6AJ1FHQa73NXsSj/wPOCaf0tG+MyRzcrSeamWPp6VR9WURkYkNZH6vz69eK5I7
3Qh3EUf7UmEJufUR43g8aSQMa7451WdsBEdeyWZk6Uan+X7d2cyi22NDqRDqjZva
KAmO507k4E0FtuVhLNpbzaf/F7bWbqQHSon7OcSpKrwCbtSWfHmXdKWHkXWljrd6
keHHZZlsvlENiHeWIzgGGev2e5tgUTjk94kAm/ZJZ7+7sudb/ImB2d0z9r28HZ+s
lK3uDOHvfc/lOPf5rRls2R24Ya2FHQ==
=k1OV
-----END PGP SIGNATURE-----

--Sig_/Z6z9P2TDF6nR6NmJ0Ch481J--
