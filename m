From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next build poblems
Date: Tue, 24 Jun 2008 09:29:47 +1000
Message-ID: <20080624092947.638cf366.sfr@canb.auug.org.au>
References: <20080624022232.5c81519c.sfr@canb.auug.org.au>
	<20080623170801.GA16637@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Jun_2008_09_29_47_+1000_AMZS+sthkduaQ5gl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45944 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751245AbYFWX3z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 19:29:55 -0400
In-Reply-To: <20080623170801.GA16637@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Haavard Skinnemoen <hskinnemoen@atmel.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org

--Signature=_Tue__24_Jun_2008_09_29_47_+1000_AMZS+sthkduaQ5gl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Mon, 23 Jun 2008 19:08:01 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> I will try to look at it tonight - as in a few hours from now.
> If you are in a hurry drop kbuild-next.git.

OK, thanks - obviously no hurry at the point you wrote this :-)

> I have changed a few things around the symlink handling
> and this was only tested with sparc and x86 (32 bit) as this
> is the cross toolchains I have available on this box.
>=20
> It is just perfect that -next find this before the merge window!

That is one of the reasons I am here :-)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Jun_2008_09_29_47_+1000_AMZS+sthkduaQ5gl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhgMesACgkQTgG2atn1QN/LfgCbBDnEMkkt6y4Fms3dafhUunUx
AtIAn02sQbftn3hBNADIS2nQVvSoQR5R
=fmyS
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Jun_2008_09_29_47_+1000_AMZS+sthkduaQ5gl--
