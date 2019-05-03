From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the usb-gadget tree
Date: Fri, 3 May 2019 15:31:44 +1000
Message-ID: <20190503153144.06eaae7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FdUO02xCRC3zY.1zL.XTFS3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
List-Id: linux-next.vger.kernel.org

--Sig_/FdUO02xCRC3zY.1zL.XTFS3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Felipe,

In commit

  9f8dc24f7f5d ("usb: gadget: f_fs: don't free buffer prematurely")

Fixes tag

  Fixes: 772a7a724f6 ("usb: gadget: f_fs: Allow scatter-gather buffers")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/FdUO02xCRC3zY.1zL.XTFS3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzL0kEACgkQAVBC80lX
0Gw7qQf+JwVEjPgY7PgCB6VQzYYqo3fCcOw+UwpCdtrUNY0PuQdBE9O1nJTAROvg
My2DFkDW+nB8xTBMRrOy5pkeK/AitCkaFLv4nEaI1E6UsylnLHiVLwGBqW34cJDS
lKAUcxNnb0rbSabeomIKM9BR5BVAjCY/EQ2k9HHh9zupFYz2n82M/DpFG67HDlRX
HcB2m9ZQI6ugxOmz4Mku0KsEGAjIxOAky9HlxUuC4sNlnOwIm02rGWHeBKUTZ13A
UfK7FvBJf8W2GAi13iXorioXCNMtVD5x0pNSzuTWc4F3SBwbvVTPsU6MLAo4fQrv
NprjJ8nuNsxb+E2MtFwHiUwl1uuArw==
=REs9
-----END PGP SIGNATURE-----

--Sig_/FdUO02xCRC3zY.1zL.XTFS3--
