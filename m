From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core/pci merge failure
Date: Mon, 19 May 2008 12:03:28 +1000
Message-ID: <20080519120328.40aa6d5d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_May_2008_12_03_28_+1000_pUF8=p6m_ij7RN9Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59050 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752959AbYESCDk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 18 May 2008 22:03:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Shaohua Li <shaohua.li@intel.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Mon__19_May_2008_12_03_28_+1000_pUF8=p6m_ij7RN9Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg, Jesse,

Today's linux-next merge of the pci tree got a conflict in
drivers/pci/pci-driver.c between commit
681e027ef934e9892b199180129be772208f735b ("PM: New suspend and
hibernation callbacks for PCI bus type") from the driver-core tree and
commit 176bc7cff4442d3795c0599b70ecbe9b11ccd775 ("Suspend/Resume bug in
PCI layer wrt quirks") from the pci tree.  The former changed
pci_default_resume() to pci_default_pm_resume() while the latter added a
call to pci_fixup_device() immediately after the call to
pci_default_resume() in pci_device_resume() (which became
pci_legacy_resume() in the former patch).  I assume the obvious fixup is
correct, but may be worth a check.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_May_2008_12_03_28_+1000_pUF8=p6m_ij7RN9Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMN/5TgG2atn1QN8RAqhHAJ0WZ8I/EpGUBZ71V5aPj4Dsb0Um7gCgh0Ky
vWhUX+uUTsrdhqg0tCAFobI=
=CYrG
-----END PGP SIGNATURE-----

--Signature=_Mon__19_May_2008_12_03_28_+1000_pUF8=p6m_ij7RN9Z--
