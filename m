From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: i2c tree build failure
Date: Mon, 31 Aug 2009 11:19:35 +1000
Message-ID: <20090831111935.5059565b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__31_Aug_2009_11_19_35_+1000_nUlOpoz6lYl43u.F"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60746 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751721AbZHaBTp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Aug 2009 21:19:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__31_Aug_2009_11_19_35_+1000_nUlOpoz6lYl43u.F
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/i2c/i2c-core.c:234: warning: initialization from incompatible point=
er type
drivers/i2c/i2c-core.c:537: warning: initialization from incompatible point=
er type
drivers/i2c/i2c-core.c: In function 'i2c_register_adapter':
drivers/i2c/i2c-core.c:603: error: implicit declaration of function 'class_=
compat_create_link'
drivers/i2c/i2c-core.c: In function 'i2c_del_adapter':
drivers/i2c/i2c-core.c:789: error: implicit declaration of function 'class_=
compat_remove_link'
drivers/i2c/i2c-core.c: In function 'i2c_init':
drivers/i2c/i2c-core.c:999: error: implicit declaration of function 'class_=
compat_register'
drivers/i2c/i2c-core.c:999: warning: assignment makes pointer from integer =
without a cast
drivers/i2c/i2c-core.c:1012: error: implicit declaration of function 'class=
_compat_unregister'

I have used the i2c tree from next-20090828 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__31_Aug_2009_11_19_35_+1000_nUlOpoz6lYl43u.F
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqbJScACgkQjjKRsyhoI8wMYgCffKxWeBabN6LfRYlF6CU8NnNR
mjQAnjG4tjWKjvCR3Na4zUNHQFNu2RAS
=OBgn
-----END PGP SIGNATURE-----

--Signature=_Mon__31_Aug_2009_11_19_35_+1000_nUlOpoz6lYl43u.F--
