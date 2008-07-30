From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Suspend errors in 2.6.26-next-20080729
Date: Wed, 30 Jul 2008 09:01:21 +0200
Message-ID: <20080730070121.GA5725@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.schottelius.org ([62.65.138.77]:49825 "EHLO
	mx2.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751167AbYG3HB0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Jul 2008 03:01:26 -0400
Received: from denkbrett.schottelius.org (natgw.netstream.ch [62.65.128.28])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.schottelius.org (Postfix) with ESMTPSA id 6830C1D8098
	for <linux-next@vger.kernel.org>; Wed, 30 Jul 2008 09:01:22 +0200 (CEST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

When running 2.6.26-next-20080729, 9bead9ae16728973cd31d9fd60c496e0e2fabbd1
and doing

   echo mem > /sys/power/state

The monitor on the ibm t60 stays blank after wake up.
When selecting numlock and switching consoles, it looks like it is still
switchable. Though logging in does not work (tried blindly entering usernam=
e,
password, "find /"; which should result in hdd led activity).

When running 2.6.26-next-20080725, 73cfc9c5b914f27124c3f96d38d4f7e13aa18a15,
it works.

I am using the configuration "ibm-t60-jfs" from
http://unix.schottelius.org/cgi-bin/gitweb.cgi?p=3Dlinux-config

Sincerly,

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiQEcEACgkQuL75KpiFGIyQ6QCaAs/71jkTwjAmrzZWC/z/nVwF
MMsAn3vteNfkebPdJH8rUuVKPmT98qXV
=5g2x
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
