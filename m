From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: microblaze tree build failure
Date: Fri, 20 Nov 2009 09:56:22 +1100
Message-ID: <20091120095622.5fefb9fa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Nov_2009_09_56_22_+1100_9JX._Pq4P8Ydxyrl"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757903AbZKSW40@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@petalogix.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Fontenot <nfont@austin.ibm.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__20_Nov_2009_09_56_22_+1100_9JX._Pq4P8Ydxyrl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/platforms/built-in.o: In function `.ofdt_write':
reconfig.c:(.text+0xca08): undefined reference to `.of_attach_node'
arch/powerpc/platforms/built-in.o: In function `.do_device_node':
vio.c:(.text+0x1be2c): undefined reference to `.of_attach_node'

Caused by commit 5d0c1c076548e1f8d590a2f70f281b4eb7b3aeb2 ("Merge
of_attach_node") which I have reverted for today.  That patch is missing
an update to drivers/of/Makefile at least ... and probably some other
stuff as well.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Nov_2009_09_56_22_+1100_9JX._Pq4P8Ydxyrl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksFzRYACgkQjjKRsyhoI8xy5ACgoFibWLxu7BC5zAuIZm2A38z4
l34AmwUnRamiHUvxbt7j1Z1o2+LvAK8a
=UHlP
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Nov_2009_09_56_22_+1100_9JX._Pq4P8Ydxyrl--
