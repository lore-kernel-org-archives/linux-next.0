From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build failure
Date: Mon, 30 Jun 2008 15:11:17 +1000
Message-ID: <20080630151117.f257710b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_15_11_17_+1000_1JU9RJgVxtSC=qDf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39816 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751882AbYF3FLU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 01:11:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Alan Stern <stern@rowland.harvard.edu>, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Mon__30_Jun_2008_15_11_17_+1000_1JU9RJgVxtSC=qDf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Resent due to failing to pass vger's filters]

Hi Jesse,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/usb/core/driver.c: In function 'do_unbind_rebind':
drivers/usb/core/driver.c:865: error: 'struct dev_pm_info' has no member na=
med 'sleeping'

Due to commit 1eede070a59e1cc73da51e1aaa00d9ab86572cfc ("Introduce new
top level suspend and hibernation callbacks") from the pci tree (which
removed the sleeping field of the dev_pm_info structure) and commit
fafa0857b87640d4c297777d432174b8778ac4fd ("USB: Force unbinding of
drivers lacking reset_resume or other methods") from the usb tree which
adds a reference.

For now I have reverted commit fafa0857b87640d4c297777d432174b8778ac4fd
("USB: Force unbinding of drivers lacking reset_resume or other methods")
from the usb tree since that gives me a building tree without the pain of
trying to revert 1eede070a59e1cc73da51e1aaa00d9ab86572cfc (which has
several dependent commits).

A better solution would be nice (hint, hint).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/


--Signature=_Mon__30_Jun_2008_15_11_17_+1000_1JU9RJgVxtSC=qDf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhoavUACgkQjjKRsyhoI8ysOQCeKpSMVqInh8ubAHLpbGoDBxQh
PqgAnAhpYYcXlr+XAqAcuPFVHERurCO0
=g41N
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_15_11_17_+1000_1JU9RJgVxtSC=qDf--
