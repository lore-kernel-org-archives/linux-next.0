From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: genirq tree build warning
Date: Thu, 23 Apr 2009 16:13:28 +1000
Message-ID: <20090423161328.c81ecb3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Apr_2009_16_13_28_+1000_gBg0MjP=CWhHl8gd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45774 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753279AbZDWGNh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 02:13:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Luis Henriques <henrix@sapo.pt>

--Signature=_Thu__23_Apr_2009_16_13_28_+1000_gBg0MjP=CWhHl8gd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc allyesconfig gcc4.4.0) produced this
warning:

kernel/irq/manage.c: In function 'request_threaded_irq':
kernel/irq/manage.c:933: warning: suggest parentheses around operand of '!'=
 or change '&' to '&&' or '!' to '~'

Introduced by commit ba71604fad348656071a2a76eef9a67dab85a773 ("genirq:
do not execute DEBUG_SHIRQ when irq setup failed") from the genirq tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Apr_2009_16_13_28_+1000_gBg0MjP=CWhHl8gd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknwBwgACgkQjjKRsyhoI8zplQCfSAGxC+aIH3jDCfIMVAOiScGb
8usAmwfskkjXjEyWt9vp6IdMaklGk17b
=qMV+
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Apr_2009_16_13_28_+1000_gBg0MjP=CWhHl8gd--
