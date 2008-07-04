From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree
Date: Fri, 4 Jul 2008 16:57:12 +1000
Message-ID: <20080704165712.3d941be3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Jul_2008_16_57_12_+1000_KQmr=DNQy9.WUveW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50706 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752816AbYGDG5U (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Jul 2008 02:57:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Greg KH <greg@kroah.com>

--Signature=_Fri__4_Jul_2008_16_57_12_+1000_KQmr=DNQy9.WUveW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/kernel/time.c between commit
5b01a6a61c48d8e6ab4679d6e6208f5962d07b85 ("sysdev: Pass the attribute to
the low level sysdev show/store function") from the driver-core tree and
commit 205bee6ad804d7034773b5978c74dde495df2301 ("[ARM] dyntick: Remove
obsolete and unused ARM dyntick support") from the arm tree.

The arm commit just removed some code that the driver-core commit
modified.  So I removed it and can carry the fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Jul_2008_16_57_12_+1000_KQmr=DNQy9.WUveW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhtycgACgkQjjKRsyhoI8wrVQCfTbz5AxZ6OM8c39zuK9ydQAVj
9jcAn2mnIKUKmtrRFIUcglpwUxj0qwYH
=3U1n
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Jul_2008_16_57_12_+1000_KQmr=DNQy9.WUveW--
