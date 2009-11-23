From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mfd tree build failure
Date: Mon, 23 Nov 2009 14:41:03 +1100
Message-ID: <20091123144103.73b4d64c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Nov_2009_14_41_03_+1100_w5meP58ucp_+kmlG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58968 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754229AbZKWDlH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Nov 2009 22:41:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

--Signature=_Mon__23_Nov_2009_14_41_03_+1100_w5meP58ucp_+kmlG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "irq_to_desc" [drivers/mfd/wm831x.ko] undefined!
ERROR: "handle_edge_irq" [drivers/mfd/wm831x.ko] undefined!
ERROR: "set_irq_chip_and_handler" [drivers/mfd/wm831x.ko] undefined!
ERROR: "set_irq_noprobe" [drivers/mfd/wm831x.ko] undefined!

Probably caused by commit 8fc686c7369173519817f0cfbb2df9a3671d5b8d ("mfd:
Move WM831x to generic IRQ").  Maybe a Kconfig dependency is missing?

I have used the mfd tree from next-20091120 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Nov_2009_14_41_03_+1100_w5meP58ucp_+kmlG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksKBE8ACgkQjjKRsyhoI8zyyACfYyDnIVrxoodSc3qSh+Bh7ELd
UIcAoL3ERYv9aHjMFYN+RBvfvrBzub/h
=JIUB
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Nov_2009_14_41_03_+1100_w5meP58ucp_+kmlG--
