From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Current suspend issues on Lenovo X200
Date: Thu, 23 Oct 2008 22:43:26 +0200
Message-ID: <20081023204326.GB4175@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:58547 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752027AbYJWVYX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 17:24:23 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

All recent kernels can suspend the Lenovo X200, but almost none
can awake:

 - 2.6.27-rc9: can suspend once, wakeup: ok
   second suspend: system freeze instead of wakeup
   -> shows parts of the X screen, but does not react on ping
 - 2.6.27: system freeze instead of wakeup
   -> shows parts of the X screen, but does not react on ping
 - 2.6.27-next-20081023:
   -> no X running (because xorg does not work with that kernel)
   -> wakes up
   -> console is blank after suspend
   -> can reboot / shutdown blindly

Sincerly,

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkA4e4ACgkQuL75KpiFGIyJdACglo14p0qimleKVHcp6k40CUYj
YSEAnRytBFpWXeN20Giyr8q1H1TODvzx
=cKRG
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
