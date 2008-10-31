From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hdlc tree
Date: Fri, 31 Oct 2008 16:29:13 +1100
Message-ID: <20081031162913.3cc30025.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__31_Oct_2008_16_29_13_+1100_d/y5ydOKPzaoa/y8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45863 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750950AbYJaF3X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 01:29:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>

--Signature=_Fri__31_Oct_2008_16_29_13_+1100_d/y5ydOKPzaoa/y8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Today's linux-next merge of the hdlc tree got a conflict in
Documentation/DocBook/wanbook.tmpl between commit
89a056df78b113fcab21d71cd24aa1893c09225b ("Rationalise Randy's address a
bit") from Linus' tree and commit
8a8c8f08abe7d3fd82c2853d0e1f391f8bfc96db ("WAN: syncppp.c is no longer
used by any kernel code. Remove it.") from the hdlc tree.

The former updated a file that the latter removed.  I just removed it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__31_Oct_2008_16_29_13_+1100_d/y5ydOKPzaoa/y8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkKl6kACgkQjjKRsyhoI8xmbACfepFme/Z4+3Nesy+OUIw7hiol
agEAn1F0JCqqWFtVkLLyfCCp1D/s6D47
=YiFd
-----END PGP SIGNATURE-----

--Signature=_Fri__31_Oct_2008_16_29_13_+1100_d/y5ydOKPzaoa/y8--
