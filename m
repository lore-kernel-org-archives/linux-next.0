From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc64 build failure
Date: Fri, 20 Jun 2008 10:43:52 +1000
Message-ID: <20080620104352.1358ff2a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Jun_2008_10_43_52_+1000_KdJSwwDc02ihB_02"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60423 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752077AbYFTAoD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Jun 2008 20:44:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Fri__20_Jun_2008_10_43_52_+1000_KdJSwwDc02ihB_02
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Yesterday's linux-next build (sparc64 allmodconfig) failed like this:

usr/include/asm/asi.h:1: included file 'asm-sparc/asi.h' is not exported
usr/include/asm/auxvec.h:1: included file 'asm-sparc/auxvec.h' is not expor=
ted
usr/include/asm/bpp.h:1: included file 'asm-sparc/bpp.h' is not exported
usr/include/asm/byteorder.h:1: included file 'asm-sparc/byteorder.h' is not=
 exported
usr/include/asm/display7seg.h:1: included file 'asm-sparc/display7seg.h' is=
 not exported
usr/include/asm/envctrl.h:1: included file 'asm-sparc/envctrl.h' is not exp=
orted
usr/include/asm/errno.h:1: included file 'asm-sparc/errno.h' is not exported
usr/include/asm/fbio.h:1: included file 'asm-sparc/fbio.h' is not exported
usr/include/asm/fcntl.h:1: included file 'asm-sparc/fcntl.h' is not exported
usr/include/asm/ioctl.h:1: included file 'asm-sparc/ioctl.h' is not exported
usr/include/asm/ioctls.h:1: included file 'asm-sparc/ioctls.h' is not expor=
ted
usr/include/asm/mman.h:1: included file 'asm-sparc/mman.h' is not exported
usr/include/asm/msgbuf.h:1: included file 'asm-sparc/msgbuf.h' is not expor=
ted
usr/include/asm/openpromio.h:1: included file 'asm-sparc/openpromio.h' is n=
ot exported
usr/include/asm/param.h:1: included file 'asm-sparc/param.h' is not exported
usr/include/asm/perfctr.h:1: included file 'asm-sparc/perfctr.h' is not exp=
orted
usr/include/asm/poll.h:1: included file 'asm-sparc/poll.h' is not exported
usr/include/asm/psrcompat.h:1: included file 'asm-sparc/psrcompat.h' is not=
 exported
usr/include/asm/pstate.h:1: included file 'asm-sparc/pstate.h' is not expor=
ted
usr/include/asm/resource.h:1: included file 'asm-sparc/resource.h' is not e=
xported
usr/include/asm/sembuf.h:1: included file 'asm-sparc/sembuf.h' is not expor=
ted
usr/include/asm/setup.h:1: included file 'asm-sparc/setup.h' is not exported
usr/include/asm/shmbuf.h:1: included file 'asm-sparc/shmbuf.h' is not expor=
ted
usr/include/asm/socket.h:1: included file 'asm-sparc/socket.h' is not expor=
ted
usr/include/asm/sockios.h:1: included file 'asm-sparc/sockios.h' is not exp=
orted
usr/include/asm/termbits.h:1: included file 'asm-sparc/termbits.h' is not e=
xported
usr/include/asm/termios.h:1: included file 'asm-sparc/termios.h' is not exp=
orted
usr/include/asm/types.h:1: included file 'asm-sparc/types.h' is not exported
usr/include/asm/uctx.h:1: included file 'asm-sparc/uctx.h' is not exported
usr/include/asm/utrap.h:1: included file 'asm-sparc/utrap.h' is not exported
usr/include/asm/watchdog.h:1: included file 'asm-sparc/watchdog.h' is not e=
xported
make[3]: *** [usr/include/asm/.check] Error 1

See http://kisskb.ellerman.id.au/kisskb/buildresult/32521/
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Jun_2008_10_43_52_+1000_KdJSwwDc02ihB_02
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkha/UgACgkQTgG2atn1QN9RjwCfaDmn4fYQzBZS+oHzYSpqIOyB
WqoAmwX/b4FevJZQ3gUA6XR+vKA6wrRj
=vJzX
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Jun_2008_10_43_52_+1000_KdJSwwDc02ihB_02--
