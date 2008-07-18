From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Fri, 18 Jul 2008 18:28:37 +1000
Message-ID: <20080718182837.bb9a729b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_18_28_37_+1000__foKd.jVw5gr3Vjt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40582 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751345AbYGRI2n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 04:28:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Greg KH <greg@kroah.com>

--Signature=_Fri__18_Jul_2008_18_28_37_+1000__foKd.jVw5gr3Vjt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/cp2101.c between commit
b147c3a769995335107b4cd674bd2d1e1493ddfb ("USB: cp2101.c fix sparse
signedness mismatch warnings") from the usb tree and commit
255ba432f804717e8a2d6096aa2d92e970f61c3d ("usb-serial-api-change") from
the ttydev tree.

I did the obvious fixup and can carry it.  (the conflict is below)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_18_28_37_+1000__foKd.jVw5gr3Vjt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAVDUACgkQjjKRsyhoI8wTFACfahatZL9eMoow+df2LsJb3w43
3Q0An1PpK/rAURpSa7tWrimrEF2HHuoa
=Qqdx
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_18_28_37_+1000__foKd.jVw5gr3Vjt--
