From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rr tree
Date: Wed, 2 Jun 2010 12:03:45 +1000
Message-ID: <20100602120345.e530c53b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__2_Jun_2010_12_03_45_+1000_z/Kb8XemOpJ9tjpI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__2_Jun_2010_12_03_45_+1000_z/Kb8XemOpJ9tjpI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the rr tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

kernel/debug/kdb/kdb_main.c: In function 'kdb_lsmod':
kernel/debug/kdb/kdb_main.c:1897: error: 'struct module' has no member name=
d 'modules_which_use_me'
kernel/debug/kdb/kdb_main.c:1897: error: 'struct module' has no member name=
d 'modules_which_use_me'

I have used the rr tree from next-20100531 again for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Jun_2010_12_03_45_+1000_z/Kb8XemOpJ9tjpI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwFvAEACgkQjjKRsyhoI8yJsACdGW3o06xftpv76GBns9TTHeg/
xl0AnR/b6m0SCt7RAYXiR9RVElgnhjm+
=XYLr
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jun_2010_12_03_45_+1000_z/Kb8XemOpJ9tjpI--
