From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc tree build failure
Date: Mon, 28 Jul 2008 16:38:08 +1000
Message-ID: <20080728163808.55efadb1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__28_Jul_2008_16_38_08_+1000_cmTdQQ4EM16QdixZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37084 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750726AbYG1GiQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 02:38:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Mon__28_Jul_2008_16_38_08_+1000_cmTdQQ4EM16QdixZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (sparc64 allmodconfig) failed like this:

usr/include/drm/drm.h:40: included file 'asm-sparc64/ioctl.h' is not export=
ed
usr/include/video/sisfb.h:24: included file 'asm-sparc64/ioctl.h' is not ex=
ported
usr/include/video/sisfb.h:25: included file 'asm-sparc64/types.h' is not ex=
ported
usr/include/linux/dvb/dmx.h:27: included file 'asm-sparc64/types.h' is not =
exported
usr/include/linux/dvb/frontend.h:29: included file 'asm-sparc64/types.h' is=
 not exported
usr/include/linux/dvb/net.h:27: included file 'asm-sparc64/types.h' is not =
exported
usr/include/linux/dvb/video.h:29: included file 'asm-sparc64/types.h' is no=
t exported
usr/include/linux/nfsd/export.h:13: included file 'asm-sparc64/types.h' is =
not exported
usr/include/linux/nfsd/nfsfh.h:17: included file 'asm-sparc64/types.h' is n=
ot exported
usr/include/linux/nfsd/syscall.h:12: included file 'asm-sparc64/types.h' is=
 not exported

This has been happening since (at least) next-20080723.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__28_Jul_2008_16_38_08_+1000_cmTdQQ4EM16QdixZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiNaVAACgkQjjKRsyhoI8y/kQCZAbCIngLlhA/4FUcbs1k3wPkn
xKUAmwW4nj6gx4O8RC/gkQpI1pNy2l/e
=lVyH
-----END PGP SIGNATURE-----

--Signature=_Mon__28_Jul_2008_16_38_08_+1000_cmTdQQ4EM16QdixZ--
