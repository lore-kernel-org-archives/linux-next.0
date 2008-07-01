From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Tue, 1 Jul 2008 17:11:37 +1000
Message-ID: <20080701171137.f71c70f9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_17_11_37_+1000_AApJXU/i0rfTZM/v"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34072 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752361AbYGAHLs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 03:11:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Laurent Pinchart <laurentp@cse-semaphore.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Tue__1_Jul_2008_17_11_37_+1000_AApJXU/i0rfTZM/v
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a trivial conflict in
drivers/net/fs_enet/fs_enet-main.c between commit
55b6c8e99d582cc66947b465d0ff3147a0219808 ("drivers/net: Use linux/of_
{device,platform}.h instead of asm") from the powerpc tree and commit
d8b35fac8c7e1b44d873c1afcc5f88bc5ef4b361 ("fs_enet: MDIO on GPIO
support") from the net tree.

I fixed it up and can carry the fixup.
(The powerpc commit just changed asm/of_platform.h to linux/of_platform.h)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_17_11_37_+1000_AApJXU/i0rfTZM/v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhp2KkACgkQjjKRsyhoI8xC7gCgpUgW6OV2lEj+4rPPGAjgUWiq
c8AAoIYLmf9NCNXB1lK/0CLQJIvmB5Wl
=kfzp
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_17_11_37_+1000_AApJXU/i0rfTZM/v--
