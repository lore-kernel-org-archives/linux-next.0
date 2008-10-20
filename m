From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Mon, 20 Oct 2008 19:06:00 +1100
Message-ID: <20081020190600.65a8b298.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__20_Oct_2008_19_06_00_+1100_YHUrdD2aEK/Tfibg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33471 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750878AbYJTIGL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 04:06:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Lee Howard <lee.howard@mainpine.com>

--Signature=_Mon__20_Oct_2008_19_06_00_+1100_YHUrdD2aEK/Tfibg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/serial/8250_pci.c: In function 'pci_oxsemi_tornado_init':
drivers/serial/8250_pci.c:1869: error: 'PCI_VENDOR_OXSEMI' undeclared (firs=
t use in this function)
drivers/serial/8250_pci.c: In function 'pciserial_init_ports':
drivers/serial/8250_pci.c:1903: error: expected ')' before 'pci_oxsemi_torn=
ado_init'
drivers/serial/8250_pci.c:1969: error: expected expression before '}' token

Caused by commit fd13cafdcc95c68e9ea3af4ea1d629abeac55638
("8250-oxsemi-mainpine") which was clearly never even built!  :-(

I reverted it (I shouldn't have to fix simple typos).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__20_Oct_2008_19_06_00_+1100_YHUrdD2aEK/Tfibg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj8O+gACgkQjjKRsyhoI8yjjwCfXtMfFUIeh8pSd+x9gQZ2Pggh
FigAniuVnS5c6bJuXqtFds+vYV/UUUWr
=dEzG
-----END PGP SIGNATURE-----

--Signature=_Mon__20_Oct_2008_19_06_00_+1100_YHUrdD2aEK/Tfibg--
