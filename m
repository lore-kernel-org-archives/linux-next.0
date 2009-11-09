From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the  tree
Date: Mon, 9 Nov 2009 15:43:05 +1100
Message-ID: <20091109154305.49d3eb7c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__9_Nov_2009_15_43_05_+1100_GIwItpMIJCG+UgG7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58434 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753571AbZKIEnF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Nov 2009 23:43:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "John W. Linville" <linville@tuxdriver.com>

--Signature=_Mon__9_Nov_2009_15_43_05_+1100_GIwItpMIJCG+UgG7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
drivers/net/wireless/rt2x00/rt2800usb.c between commit
fcf5154118849cca3cdf424e83f863225d8173e7 ("rt2800: add rt2800lib (part
three)") from the wireless tree and commit
305409a25f7df3c359ba67cbeb62763eeb7156e9 ("tree-wide: fix some typos and
punctuation in comments") from the trivial tree.

The misspelling is moved to a new file
(drivers/net/wireless/rt2x00/rt2800lib.c), but I didn't bother fixing it up.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__9_Nov_2009_15_43_05_+1100_GIwItpMIJCG+UgG7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr3ndkACgkQjjKRsyhoI8xiAQCdFrHbrlrGmfpRLBm38zQSLWRJ
b3YAn2g7kXIJnnTc1z6U47/E5aQ+P7yY
=tnJK
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Nov_2009_15_43_05_+1100_GIwItpMIJCG+UgG7--
