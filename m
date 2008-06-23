From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of pcmcia tree
Date: Mon, 23 Jun 2008 17:32:41 +1000
Message-ID: <20080623173241.3ac77e63.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Jun_2008_17_32_41_+1000_VAWDekPpRU7w.TUb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59091 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750752AbYFWHc6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 03:32:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org, Kristoffer Ericson <kristoffer_e1@hotmail.com>

--Signature=_Mon__23_Jun_2008_17_32_41_+1000_VAWDekPpRU7w.TUb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dominik,

Today's linux-next merge of the pcmcia tree got a conflict in
drivers/ide/legacy/ide-cs.c between commit
a17bf220231a5061a29a27a99a273246eb3b156e ("pcmcia: add another pata/ide
ID") from Linus' tree and commit f3aa02c57dec52fbe519c51f741e3a94d19dcb4c
("pcmcia: add another pata/ide ID") from the pcmcia tree.

>From the discussion on LKML, I assume the upstream version is correct and
took that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Jun_2008_17_32_41_+1000_VAWDekPpRU7w.TUb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhfUZkACgkQTgG2atn1QN9+gQCggtLu3V8dPEWeDba1Uj0LlqRg
sL0An3VCk0vFRSoY0Paasbhzhq6LeV9z
=1aqs
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Jun_2008_17_32_41_+1000_VAWDekPpRU7w.TUb--
