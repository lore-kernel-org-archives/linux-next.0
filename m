From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: please don't start adding v3.21 stuff yet
Date: Thu, 19 Feb 2015 07:44:31 +1100
Message-ID: <20150219074431.77e56ef8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oScBrs1lr5X/yIh_6jc7a6T"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60597 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751955AbbBRUoj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Feb 2015 15:44:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/oScBrs1lr5X/yIh_6jc7a6T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

=46rom my daily release notes:

"Please do not add any material destined for v3.21 to your linux-next
included trees until after v3.20-rc1 has been released."

Commit 38e0e413ca1d ("Merge branch 'for-3.21/logitech' into for-next"),
commit e0ab74fe569d ("Merge branch 'for-3.21/rmi' into for-next"),
commit ee2de8fc6c18 ("Merge branch 'for-3.21/genius' into for-next")
(though this last contains what looks like a fix).

:-(

Also, at some point you might want to reset your tree to Linus' to get
rid of all those (now useless) old merge commits.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/oScBrs1lr5X/yIh_6jc7a6T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU5Pm1AAoJEMDTa8Ir7ZwVmP4QAJaSWdo0I44Kwv8jJ0sa0oYj
lmBELzy+N6qISVOz7KDtd0HiYwpy4yatqZYrnFNi6xrgEJM2wbhgMSiHj22EhpCU
1RggiAZbaEbLX77arLFRmfYzSAPMoiEHcutE6KoFy0mHcxrXTc5+VcAxil1KUdtZ
OIzty40rPNmsT0vPDAk17qQNVa1uWNEEHW85JFlMjhhOXURQCyFmjHnVZsxKc4pW
iAVHaJpbOct9IW5PEgyxg4+JJtYyxKkRUgYOZf3cEq/5n8PgAZ1ArXcjdQIyfgw3
fxkbCng0ksWUpKgzLPXdO55pHrzvumGASGlw1yZoqEKWYV0scTKpK4kmZ6UDUr7Z
MwZrtqrmxmeu1cv2kHDwTL80Kb+LqFBJFqQlT7pUO+1xf7adGPp/YyCaJJzgcyJ2
BmqloqIqclBMlu5QcOfsBaT+KrTlf+gvqwysyPnjdzdb3H8R8lzBk3K2rQUb7dSi
bF+Em8C6JMHaViIgyTR0WCcBV6fBEeoONZ/7PtslJfhOpKiCrGTsx/TGMfD5rfCs
x3VL0XEgjJzCmoTV01I5kbHMgib8JtQlXVUgf8ewGlYPO3CdTZ5mr3kfYatZMMk5
33wxorNyRjkWVcZ1A8zxl30cRYYdKfQDJr04tcfdzw1OwljgCMctIPsKLqq+XwPz
rhAjUGUJXsWDI6BIN22W
=8xHJ
-----END PGP SIGNATURE-----

--Sig_/oScBrs1lr5X/yIh_6jc7a6T--
