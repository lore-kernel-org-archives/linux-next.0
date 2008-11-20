From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Thu, 20 Nov 2008 14:50:18 +1100
Message-ID: <20081120145018.07044c64.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__20_Nov_2008_14_50_18_+1100_p4DXyzZY4VzunU6d"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55775 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751920AbYKTDub (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 22:50:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__20_Nov_2008_14_50_18_+1100_p4DXyzZY4VzunU6d
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/usb/core/usb.c:958: error: expected ')' before 'bool'

line 958 is:
core_param(nousb, nousb, bool, 0444);

core_param is only defined for !MODULE in moduleparam.h ...

I have dropped the rr tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__20_Nov_2008_14_50_18_+1100_p4DXyzZY4VzunU6d
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkk3noACgkQjjKRsyhoI8xCGQCglJqti4jXGjMKEm13vNjeYb6n
9MsAn0dCxF6PW4RzpatB1YNwXeN+Mort
=JR+m
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Nov_2008_14_50_18_+1100_p4DXyzZY4VzunU6d--
