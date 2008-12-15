From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build warning
Date: Tue, 16 Dec 2008 00:35:39 +1100
Message-ID: <20081216003539.75ecce70.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Dec_2008_00_35_39_+1100_LpadrbG1mMWOl7A4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48658 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751383AbYLONft (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 08:35:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

--Signature=_Tue__16_Dec_2008_00_35_39_+1100_LpadrbG1mMWOl7A4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ,

Today's linux-next build (powerpc allnoconfig) produced this warning:

kernel/hrtimer.c: In function 'hrtimer_cpu_notify':
kernel/hrtimer.c:1574: warning: unused variable 'dcpu'

Introduced by commit 37810659ea7d9572c5ac284ade272f806ef8f788 ("hrtimer:
removing all ur callback modes, fix hotplug") from the timers.  dcpu is onl=
y used if
CONFIG_HOTPLUG_CPU is set.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Dec_2008_00_35_39_+1100_LpadrbG1mMWOl7A4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklGXSsACgkQjjKRsyhoI8xgtQCfXItbZWKbFXYJeN93mBauOLaO
d2IAnAvShPRkkXVT0S+ryz92M4VKlogj
=DJJV
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Dec_2008_00_35_39_+1100_LpadrbG1mMWOl7A4--
