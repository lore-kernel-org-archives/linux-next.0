From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build failure
Date: Mon, 2 Mar 2009 11:05:49 +1100
Message-ID: <20090302110549.38778423.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Mar_2009_11_05_49_+1100_256/G/10cZQN06gQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51723 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750920AbZCBAF6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Mar 2009 19:05:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Michael Krufky <mkrufky@linuxtv.org>

--Signature=_Mon__2_Mar_2009_11_05_49_+1100_256/G/10cZQN06gQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "sms_dbg" [drivers/media/dvb/siano/smsusb.ko] undefined!
ERROR: "sms_dbg" [drivers/media/dvb/siano/smsdvb.ko] undefined!

Probably caused by commit 33b67084d284779ee2a30deebd2115f79b8435b9
("V4L/DVB (10751): sms1xxx: fix checkpatch.pl violations introduced by
previous changeset").

I have dropped the v4l-dvb tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Mar_2009_11_05_49_+1100_256/G/10cZQN06gQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmrIt0ACgkQjjKRsyhoI8xKWACgt48pW8YgyCPjU+VIBkCj12bn
9poAmQGJHLlonx7T2riTLerppnOxBF4g
=fk3N
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Mar_2009_11_05_49_+1100_256/G/10cZQN06gQ--
