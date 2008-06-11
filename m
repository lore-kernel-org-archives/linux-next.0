From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci/x86 merge conflicts
Date: Wed, 11 Jun 2008 13:10:51 +1000
Message-ID: <20080611131051.2180c664.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_Jun_2008_13_10_51_+1000_W+.aJyThawW4_iDT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37374 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754688AbYFKDLA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 23:11:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Miklos Vajna <vmiklos@frugalware.org>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Wed__11_Jun_2008_13_10_51_+1000_W+.aJyThawW4_iDT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next merge of the pci tree got trivial conflicts in
arch/x86/pci/irq.c between commit
7058b06188232381c13ff05a3caf458bb892b834 ("x86: coding style fixes to
arch/x86/pci/irq") from the x86 tree and commit
273c11270d3715c4c06d4df1607a1a60034d887b ("x86/PCI: janitor work in
irq.c") from the pci tree.

They were just formatting differences so I chose the pci versions.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_Jun_2008_13_10_51_+1000_W+.aJyThawW4_iDT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhPQjsACgkQTgG2atn1QN9ikQCfdGFSxe0/sQ/3elbmT9+m6Bwa
KVMAn3XnqKVseJ1SCM7nN1/UAn7tCOT/
=k8iA
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Jun_2008_13_10_51_+1000_W+.aJyThawW4_iDT--
