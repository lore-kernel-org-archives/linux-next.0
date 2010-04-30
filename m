From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging-next tree
Date: Fri, 30 Apr 2010 15:52:24 +1000
Message-ID: <20100430155224.ab570260.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_Apr_2010_15_52_24_+1000_90rLmH_yvH3Y8Kk4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__30_Apr_2010_15_52_24_+1000_90rLmH_yvH3Y8Kk4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/media/video/tlg2300/pd-main.c: In function 'poseidon_probe':
drivers/media/video/tlg2300/pd-main.c:457: error: 'struct usb_device' has n=
o member named 'autosuspend_disabled'
drivers/net/wimax/i2400m/usb.c: In function 'i2400mu_probe':
drivers/net/wimax/i2400m/usb.c:508: error: 'struct usb_device' has no membe=
r named 'autosuspend_disabled'

Caused by commit 3a03bb2443e8fb3b35666dc598e7f626519c544a ("USB: use PM
core routines to enable/disable autosuspend") from the usb tree.  I have
reverted that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__30_Apr_2010_15_52_24_+1000_90rLmH_yvH3Y8Kk4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvacBgACgkQjjKRsyhoI8zhZACcDg5uQ0eV+7XsX9yDmc4KvTSO
Uu4AoJ2D3rMMtTSwGIsC4bb4DieGmSYC
=mr4q
-----END PGP SIGNATURE-----

--Signature=_Fri__30_Apr_2010_15_52_24_+1000_90rLmH_yvH3Y8Kk4--
