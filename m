From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree
Date: Mon, 30 Jun 2008 14:44:10 +1000
Message-ID: <20080630144410.45b89069.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_14_44_10_+1000_GpC//7I_tCn8tt1C"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47307 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751299AbYF3EoO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 00:44:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__30_Jun_2008_14_44_10_+1000_GpC//7I_tCn8tt1C
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a trivial conflict in
drivers/media/video/cx18/cx18-cards.h between commit
1f09e8a25c9aaa4066b4593c1bf99a4cbcc38120 ("V4L/DVB (8068): cx18: Add I2C
slave reset via GPIO upon initialization") from Linus' tree (which also
appears in the  v4l-dvb tree and commit
a03a7daf6fe02d87a1919e1dc6c156c8ea46134b ("V4L/DVB (8089): cx18: add
support for Conexant Raptor PAL/SECAM card") from the v4l-dvb tree.

I just fixed it up and will carry it. If you rebase your tree on
Linus' (or merge Linus' tree into yours) this should go away.

You should consider running a separate branch for bug fixes that are fed
to Linus during the -rc series as that would isolate these conflicts
somewhat (and it would test those bug fixes in isolation).  You can then
merge that branch into your "stable" branch (which is for the next merge
window) whenever there may be conflicts and fix those conflicts
yourself.  I would also carry this bug fix tree/branch and merge it
earlier (it would mostly be empty as Linus would be merging it).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_14_44_10_+1000_GpC//7I_tCn8tt1C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhoZJoACgkQjjKRsyhoI8xxdQCePoucuGw8l97q+zZNfG20HxEx
0OQAn3Eu05EvFdCslgFPki8qfRFy206p
=pJom
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_14_44_10_+1000_GpC//7I_tCn8tt1C--
