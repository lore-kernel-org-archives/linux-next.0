From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the sh tree
Date: Wed, 31 Mar 2010 16:03:08 +1100
Message-ID: <20100331160308.e1cfcc4e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__31_Mar_2010_16_03_08_+1100_uoQYfRJm9VcNGNWb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36514 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755243Ab0CaFDQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 31 Mar 2010 01:03:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>

--Signature=_Wed__31_Mar_2010_16_03_08_+1100_uoQYfRJm9VcNGNWb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/base/platform.c between commit
bd05086bbe3f241cd552068f9ceba9e19c6ce427 ("driver core: Convert to
kasprintf() for early dev_name()") from the sh tree and commit
d08bd4bf3c0d8ea211eae36ab849787d67cb35e4 ("driver core: Early dev_name()
support") from the driver-core tree (which is also in the sh tree).

I used the version from the sh tree.  Paul, you should submit that patch
to Greg (if you haven't already).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__31_Mar_2010_16_03_08_+1100_uoQYfRJm9VcNGNWb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuy14wACgkQjjKRsyhoI8ypGACdH7VhGdnSZjMKeY8ncdJ+giEb
baQAoKMKz9wz2ekXnT01btiHT1XLBuj5
=2dfm
-----END PGP SIGNATURE-----

--Signature=_Wed__31_Mar_2010_16_03_08_+1100_uoQYfRJm9VcNGNWb--
