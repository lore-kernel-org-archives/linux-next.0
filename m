From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree
Date: Wed, 25 Jun 2008 13:01:04 +1000
Message-ID: <20080625130104.b376c221.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_13_01_04_+1000_UCy==v4q7oaUk9yP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37950 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752036AbYFYDBR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 23:01:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Robert Richter <robert.richter@amd.com>, Gary Hade <garyhade@us.ibm.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__25_Jun_2008_13_01_04_+1000_UCy==v4q7oaUk9yP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
arch/x86/pci/pci.h between commit
547084aab406ea46c1b9bebb115dc86787720c11 ("x86: Move PCI IO ECS code to
x86/pci") from the x86 tree and commit
bb71ad880204b79d60331d3384103976e086cb9f ("PCI: boot parameter to avoid
expansion ROM memory allocation") from the pci tree.

Both commits wanted to use 0x40000 for a define (PCI_HAS_IO_ECS and
PCI_NOASSIGN_ROMS).  I set PCI_NOASSIGN_ROMS to 0x80000.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_13_01_04_+1000_UCy==v4q7oaUk9yP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhhtPAACgkQTgG2atn1QN+ckACeNOpHJyYCgqDngcmzfsw+izuZ
KcwAn2pQ0gQSZXq5Gq46m+Eo8hHV0c8J
=Ug8k
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_13_01_04_+1000_UCy==v4q7oaUk9yP--
