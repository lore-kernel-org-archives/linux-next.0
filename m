From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build warning
Date: Thu, 8 Jan 2009 15:54:46 +1100
Message-ID: <20090108155446.c4cd1aa8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__8_Jan_2009_15_54_46_+1100_9/mLuPBpbbQ2jZJu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49620 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753509AbZAHEy5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Jan 2009 23:54:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__8_Jan_2009_15_54_46_+1100_9/mLuPBpbbQ2jZJu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc allnoconfig) produced this new warning:

kernel/workqueue.c: In function 'current_is_keventd':
kernel/workqueue.c:742: warning: unused variable 'cpu'

A UP config interacting with per_cpu_ptr()?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__8_Jan_2009_15_54_46_+1100_9/mLuPBpbbQ2jZJu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkllhxYACgkQjjKRsyhoI8xAkACfTYDJjHQ0oKitxjL/zOoDzkJr
c7MAn17HEQfnxTT58EvPsHG9u2TAC/Oy
=t2rA
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Jan_2009_15_54_46_+1100_9/mLuPBpbbQ2jZJu--
