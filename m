From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build failure
Date: Tue, 30 Jun 2009 12:07:27 +1000
Message-ID: <20090630120727.24450bab.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__30_Jun_2009_12_07_27_+1000_BafRszOHhfXccwBq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37704 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751680AbZF3CHa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jun 2009 22:07:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

--Signature=_Tue__30_Jun_2009_12_07_27_+1000_BafRszOHhfXccwBq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "pci_claim_resource" [drivers/pcmcia/yenta_socket.ko] undefined!

Caused by commit 6bb04b65dbff5a5bb01617351dbb0af577084752 ("yenta: Use
pci_claim_resource").  yenta can be built as a module, but
pci_claim_resource is not exported ...

I have used the pci tree from next-20090629 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__30_Jun_2009_12_07_27_+1000_BafRszOHhfXccwBq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpJc18ACgkQjjKRsyhoI8xSkACdGky5a6WV/6qSok7ttDugdFD2
OUcAoLtUNjXQRX3DMr6Q7wd47swnZ5v5
=QJ+B
-----END PGP SIGNATURE-----

--Signature=_Tue__30_Jun_2009_12_07_27_+1000_BafRszOHhfXccwBq--
