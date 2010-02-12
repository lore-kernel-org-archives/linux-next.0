From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the suspend tree
Date: Fri, 12 Feb 2010 15:57:50 +1100
Message-ID: <20100212155750.3f95932f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Feb_2010_15_57_50_+1100_WLXxre/DfG3jPG9R"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55999 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756082Ab0BLE6E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Feb 2010 23:58:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

--Signature=_Fri__12_Feb_2010_15_57_50_+1100_WLXxre/DfG3jPG9R
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the suspend tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/usb/core/hcd-pci.c:153: warning: return type defaults to 'int'
drivers/usb/core/hcd-pci.c: In function 'clear_hs_companion':
drivers/usb/core/hcd-pci.c:153: warning: control reaches end of non-void fu=
nction

Introduced by commit 708efd3eb95d318442da39ad6e5c01d5c9b85dbf ("USB:
implement non-tree resume ordering constraints for PCI host controllers").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Feb_2010_15_57_50_+1100_WLXxre/DfG3jPG9R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkt0384ACgkQjjKRsyhoI8x4VwCfbAYSgWHtfNivNnlj/E3UlPVl
KGQAoKlD6R8Rf/lncJ7OvmHWyo1uFqid
=Q2B7
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Feb_2010_15_57_50_+1100_WLXxre/DfG3jPG9R--
