From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nfsd tree
Date: Thu, 10 May 2018 10:42:13 +1000
Message-ID: <20180510104213.31c41377@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EI2vkTHmtZh4SCfG5nYd4vQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/EI2vkTHmtZh4SCfG5nYd4vQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nfsd tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

net/sunrpc/xprtrdma/svc_rdma_transport.c: In function 'rdma_listen_handler':
net/sunrpc/xprtrdma/svc_rdma_transport.c:299:23: warning: unused variable '=
rdma' [-Wunused-variable]
  struct svcxprt_rdma *rdma =3D cma_id->context;
                       ^~~~

Introduced by commit

  d1ab72afe681 ("svcrdma: Trace key RDMA API events")

--=20
Cheers,
Stephen Rothwell

--Sig_/EI2vkTHmtZh4SCfG5nYd4vQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrzlWUACgkQAVBC80lX
0GwZiQf9HhEUdw0ZKG5710DeXUv4T3J5J7Jzo39XyWEnvxf8ydlcpjUS500nY4fj
Nb+JEmu1Rz0nDZqcN+21exEeGONHfnToHPlIA/IsQF7NLE9ubfxmDJEQTXHwxqhN
/w0vQm6Na/Un8/Nh/u74vnUvN5BYUTdn05KokfILo0rme5hDxGJ0ZQGCaCR1CdVu
HzqQSb3RGt7ODi/DnZCyGmDk6zlwcLkoegex5MfLz3DswKOrrdoaFxoxqhmAwLC/
18Y4C2ag4w0nAyHhXN66Uk0+9TzcuG8B3yBBy9JkiCQqPkI4UNgs8pCIBiFnajyw
OjiyjyGb/OPehO0kRwR45tqzCH6nbQ==
=qebK
-----END PGP SIGNATURE-----

--Sig_/EI2vkTHmtZh4SCfG5nYd4vQ--
