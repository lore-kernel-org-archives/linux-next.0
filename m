From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the pci tree
Date: Tue, 17 Nov 2009 15:54:17 +1100
Message-ID: <20091117155417.e0514040.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Nov_2009_15_54_17_+1100_98jNolKPjQBUbN3a"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752935AbZKQEyU@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?IkFuZHLDqSBHb2RkYXJkIFJvc2Ei?= <andre.goddard@gmail.com>, Yinghai Lu <yinghai@kernel.org>, Jesse Barnes <jbarnes@virtuousgeek.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__17_Nov_2009_15_54_17_+1100_98jNolKPjQBUbN3a
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
arch/x86/pci/amd_bus.c between commit
99935a7a59eaca0292c1a5880e10bae03f4a5e3d ("x86/PCI: read root resources
from IOH on Intel") from the pci tree and commit
17530b1c635dfd1f258afc6b07b986b425d66ebd ("tree-wide: fix assorted typos
all over the place") from the trivial tree.

The comment fixed up by the trivial tree patch has moved to
arch/x86/pci/bus_numa.h and I haven't bothered to fix it there.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Nov_2009_15_54_17_+1100_98jNolKPjQBUbN3a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksCLHkACgkQjjKRsyhoI8wXEACfVlJBV+UgwiUCr6BZaaVg78qP
3TEAn0Gr2bce3tGKeOyT7OXlfXXLYGiw
=OQUe
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Nov_2009_15_54_17_+1100_98jNolKPjQBUbN3a--
