From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Fri, 28 Nov 2008 14:46:59 +1100
Message-ID: <20081128144659.faae356d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__28_Nov_2008_14_46_59_+1100_x41AP5oQ_2zzyr4P"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54378 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752541AbYK1DrT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Nov 2008 22:47:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Steven Whitehouse <swhiteho@redhat.com>

--Signature=_Fri__28_Nov_2008_14_46_59_+1100_x41AP5oQ_2zzyr4P
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

In file included from /net/decnet/netfilter/dn_rtmsg.c:26:
include/net/dn.h:7:26: error: asm/unalignedh: No such file or directory
In file included from net/decnet/netfilter/dn_rtmsg.c:26:
include/net/dn.h: In function 'dn_eth2dn':
include/net/dn.h:176: error: implicit declaration of function 'get_unaligne=
d'

Caused by commit c4106aa88a440430d387e022f2ad6dc1e0d52e98 ("decnet:
remove private wrappers of endian helpers").  I can only assume that the
sparc64 allmodconfig doesn't include decnet ...

I will fix this one for you ... condsider it a late birthday present.  :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__28_Nov_2008_14_46_59_+1100_x41AP5oQ_2zzyr4P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkvabMACgkQjjKRsyhoI8y4HwCeL1eLyCkY18sSQqaMc/8BVGdA
/ncAnRCkAQ7Gw9L2bojz8jHY2JMG6vej
=OFmr
-----END PGP SIGNATURE-----

--Signature=_Fri__28_Nov_2008_14_46_59_+1100_x41AP5oQ_2zzyr4P--
