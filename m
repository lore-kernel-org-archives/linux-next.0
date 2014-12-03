From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the pm tree
Date: Wed, 3 Dec 2014 15:01:53 +1100
Message-ID: <20141203150153.7bbf3eb1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JnPYxDg8ZjP6m.6EJq3liVq"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36864 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751231AbaLCECA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Dec 2014 23:02:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>

--Sig_/JnPYxDg8ZjP6m.6EJq3liVq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
drivers/pci/pci-driver.c between commit 0144fd0c8842 ("PCI / PM: Drop
CONFIG_PM_RUNTIME from the PCI core") from the pm tree and commit
2386dc4fb001 ("PCI: Fix comment typo 'COMFIG_PM_OPS") from the trivial
tree.

I fixed it up (the pm tree change was a subset of the trivial tree one)
and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/JnPYxDg8ZjP6m.6EJq3liVq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUfos2AAoJEMDTa8Ir7ZwVOLYP/i17K/PjAg1Ass3RmlWYLSw8
FYOOJ5/JVe83UVUa1Ho1KzaQrwdlPpmhph2AZAJ0dLUuuPQewZIRmWyqezmKctAN
QXfqR9DGnUZGkUfWJtMElqnKdJmtWJQ0DgpALSpiPTG7xwBCKHF4m63gnocws1eg
bbM3KAwkzR+9XfgLb0xeSIUZfvdRKswgdLsW6JojqI0hR8o3AAhtZnY9+9pA11gP
0Uu/yf0yZ+FHcBWSUHWaQBVapNFILzB+ClOHuswGsJPkdxrMKx/9xuly3BtV+ETP
5/hVXwUi4PMPvb29R6C0KdRU0QudYjG69siAqviVILuWVHsxxaYhNKc14dzU3ggK
fi79BrXZaWPBeDDceHZhiVQM6Dd1mYgF3JqxeDRfkfyeczOgrqraPGZvp/kYtnjI
+J+t6f8Qwq2Jo8Uwk6bsxBzeaL7Y86Hphs+W2kr5IgyEV5VJBwDOEflwAAm6qBoW
86qF6856VTocAiX5gPLesH/AA/vJOkU39g7+CEzhamclawPchobMCne389uxHqUi
eVqte9E8VR3/GoclC8tLDvmzYP7EuPHaIxC4/3hIIsET2ebZEUALWV8nCV30hBnq
ZYuqxRzgs7DM4nvpxYIbqcERxc82yOsN+dXzzZ2mOscDJ4BrcRRSA5YPfw99d6oy
3VZCRknNIBvVL6v5+x0k
=4I1L
-----END PGP SIGNATURE-----

--Sig_/JnPYxDg8ZjP6m.6EJq3liVq--
