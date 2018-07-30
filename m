From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nfs-anna tree
Date: Mon, 30 Jul 2018 18:52:00 +1000
Message-ID: <20180730185200.0d836ca7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XWlsjm0+0Mp=t5OOkAio75v"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Wysochanski <dwysocha@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/XWlsjm0+0Mp=t5OOkAio75v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nfs-anna tree, today's linux-next build (powerpc
ppc44x_defconfig, sparc defconfig) produced this warning:

net/sunrpc/stats.c: In function 'rpc_clnt_show_stats':
/home/sfr/next/next/net/sunrpc/stats.c:258:32: warning: excess elements in =
struct initializer
   struct rpc_iostats stats =3D { 0 };
                                ^

Introduced by commit

  c3b588a2d5be ("sunrpc: Change rpc_print_iostats to rpc_clnt_show_stats an=
d handle rpc_clnt clones")

--=20
Cheers,
Stephen Rothwell

--Sig_/XWlsjm0+0Mp=t5OOkAio75v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlte0bAACgkQAVBC80lX
0Gw/owf8CE6TE9bsTADqIAWVTxGUpzn2SlUKxi4van7tpNKAsBjuzZcAbDpiXZtB
ocVzdyKSA7RMJd92vSLIl+fb/au8HhW9Fm62YwZ5AJ8WbdVVpESxfWYprE/BKpl1
kgt9g9rVa2QX9tfP5k0OxDcpOnmiBOWIlLbcCoNIF4RhlO5IjuLcKitLvm+6RGHa
+SfRDPPQv/5kNO7Hk9Lih4IWpVScfazq3zNPNY7Cd4bIXZ5xmYZLEVSW7jnv7tu2
pNQz/ARNzBnnLUNZ66wcUe2wWfHtycWvwpM76K5sYfeRbeKarT2+BWhMBS6x9d8b
LRzdaexcD8qnbm3EPNlcl+IxymzBhw==
=Nxfx
-----END PGP SIGNATURE-----

--Sig_/XWlsjm0+0Mp=t5OOkAio75v--
