From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: patch excluded from usb tree
Date: Mon, 3 Nov 2008 11:40:11 +1100
Message-ID: <20081103114011.0bddceaa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__3_Nov_2008_11_40_11_+1100_T_Wc7J.FxqaNdstG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60924 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754020AbYKCAkW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Nov 2008 19:40:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__3_Nov_2008_11_40_11_+1100_T_Wc7J.FxqaNdstG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

I have excluded the patch "USB: driver for gotemp device" from the
linux-next tree.  Its commit message starts like this:

NOT FOR MAINLINE!

Which, I think, cannot be interpreted as "intended for the next merge
window".  :-)

Could you please move it out of the NEXT section of your series.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__3_Nov_2008_11_40_11_+1100_T_Wc7J.FxqaNdstG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkOSGsACgkQjjKRsyhoI8ymsQCgsW3WYzWeuBYVl+Cu4t0k4WxA
pOoAn07M1Lmwub4VkMRx9BTWevUoZGct
=sAZa
-----END PGP SIGNATURE-----

--Signature=_Mon__3_Nov_2008_11_40_11_+1100_T_Wc7J.FxqaNdstG--
