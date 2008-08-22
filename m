From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: merge conflicts in firmware tree
Date: Fri, 22 Aug 2008 14:34:43 +1000
Message-ID: <20080822143443.1da1a0c8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__22_Aug_2008_14_34_43_+1000_GcDoiLc8M_Ze9Uq6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38304 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751015AbYHVEev (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Aug 2008 00:34:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>

--Signature=_Fri__22_Aug_2008_14_34_43_+1000_GcDoiLc8M_Ze9Uq6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

The linux-next merge of the firmware tree get conflicts in
drivers/media/dvb/ttpci/Kconfig and drivers/media/dvb/ttpci/Makefile.
There conflicts are now against Linus' tree and so could they be resolved
in the firmware tree (by merging at least 2.6.27-rc1), please?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__22_Aug_2008_14_34_43_+1000_GcDoiLc8M_Ze9Uq6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiuQeMACgkQjjKRsyhoI8wiPwCgs3xXoFS23D2pWtps0TFiP3HF
JTkAoIuoD9T2/ygjdsp7J7Qv5aq/SuxK
=unNM
-----END PGP SIGNATURE-----

--Signature=_Fri__22_Aug_2008_14_34_43_+1000_GcDoiLc8M_Ze9Uq6--
