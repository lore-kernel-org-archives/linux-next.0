From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ieee1394 tree with the  tree
Date: Fri, 6 Mar 2009 14:20:32 +1100
Message-ID: <20090306142032.0442213d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Mar_2009_14_20_32_+1100_Mak6lVlLSHegzrij"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40736 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755309AbZCFDUy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 22:20:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stefan Richter <stefanr@s5r6.in-berlin.de>, linux1394-devel@lists.sourceforge.net
Cc: linux-next@vger.kernel.org

--Signature=_Fri__6_Mar_2009_14_20_32_+1100_Mak6lVlLSHegzrij
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ieee1394 tree got a conflict in
drivers/media/dvb/firewire/firedtv-avc.c between commit
154907957f9391b1af997b57507b16c018cc4995 ("firedtv: massive refactoring")
from Linus' tree and commit 0435392b2594edeba33b2173326e73fdcd67bd50
("DVB: firedtv: fix printk format mismatch") from the ieee1394 tree.

I used the latter version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Mar_2009_14_20_32_+1100_Mak6lVlLSHegzrij
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmwloAACgkQjjKRsyhoI8xKIQCeLlN8px4GszGifg3VWbaw1pKE
MV4An2z6k/2RyXFuruoQpf+sUD4TVMda
=jfc6
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Mar_2009_14_20_32_+1100_Mak6lVlLSHegzrij--
