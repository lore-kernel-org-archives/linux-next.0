From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: fastboot tree build warning
Date: Wed, 3 Sep 2008 17:34:48 +1000
Message-ID: <20080903173448.55f2745b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__3_Sep_2008_17_34_48_+1000_qYn7kdFA3CydjLi."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49956 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753933AbYICHfA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2008 03:35:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__3_Sep_2008_17_34_48_+1000_qYn7kdFA3CydjLi.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arjan,

The linux-next build produces the following warning:

init/do_mounts_md.c: In function 'md_run_setup':
init/do_mounts_md.c:282: warning: ISO C90 forbids mixed declarations and co=
de

Introduced by commit b52c36a95ed8026b6925fe8595ebcab6921ae62d ("fastboot:
make the raid autodetect code wait for all devices to init").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Sep_2008_17_34_48_+1000_qYn7kdFA3CydjLi.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki+PhgACgkQjjKRsyhoI8wElwCfcZhK4+UXf0dqNJ62mCYybMuZ
UiMAn34G48tM28N+OMA1uyAj+VmeRzwU
=cBRy
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Sep_2008_17_34_48_+1000_qYn7kdFA3CydjLi.--
