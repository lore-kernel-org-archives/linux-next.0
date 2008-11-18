From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: lblnet tree build failure
Date: Tue, 18 Nov 2008 15:11:12 +1100
Message-ID: <20081118151112.aa7fa93d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__18_Nov_2008_15_11_12_+1100_hv+D58VyTsQlwXy6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54995 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751589AbYKRELY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Nov 2008 23:11:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__18_Nov_2008_15_11_12_+1100_hv+D58VyTsQlwXy6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

In file included from include/net/cipso_ipv4.h:43,
                 from net/ipv4/ip_options.c:26:
include/net/netlabel.h:512: error: redefinition of 'netlbl_cfg_cipsov4_add'
include/net/netlabel.h:477: error: previous definition of 'netlbl_cfg_cipso=
v4_add' was here
include/net/netlabel.h:517: error: redefinition of 'netlbl_cfg_cipsov4_del'
include/net/netlabel.h:482: error: previous definition of 'netlbl_cfg_cipso=
v4_del' was here
include/net/netlabel.h:522: error: conflicting types for 'netlbl_cfg_cipsov=
4_map_add'
include/net/netlabel.h:490: error: previous definition of 'netlbl_cfg_cipso=
v4_map_add' was here

I have dropped the lblnet tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__18_Nov_2008_15_11_12_+1100_hv+D58VyTsQlwXy6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkiQGAACgkQjjKRsyhoI8zXoQCghQxz9gN+hREYdnuSjt6H8vsX
ty0AnAoBFJTm/1j8mvlI7mvVO8rP2ysv
=7LH/
-----END PGP SIGNATURE-----

--Signature=_Tue__18_Nov_2008_15_11_12_+1100_hv+D58VyTsQlwXy6--
