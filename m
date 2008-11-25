From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kbuild tree build failure
Date: Tue, 25 Nov 2008 19:58:05 +1100
Message-ID: <20081125195805.85eb5941.sfr@canb.auug.org.au>
References: <20081125154705.09683583.sfr@canb.auug.org.au>
	<20081125084226.GA31444@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_19_58_05_+1100_8vq+5z76CMvpTCAK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48304 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751836AbYKYI6Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 03:58:25 -0500
In-Reply-To: <20081125084226.GA31444@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__25_Nov_2008_19_58_05_+1100_8vq+5z76CMvpTCAK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Tue, 25 Nov 2008 09:42:26 +0100 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Tue, Nov 25, 2008 at 03:47:05PM +1100, Stephen Rothwell wrote:
> >=20
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> >=20
> > WARNING: modpost: Found 11 section mismatch(es).
> > To see full details build your kernel with:
> > 'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy'
> > .tmp_kallsyms1.S:1:23: error: asm/types.h: No such file or directory
> >=20
> > I have dropped the kbuild tree for today.
>=20
> Fixed.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_19_58_05_+1100_8vq+5z76CMvpTCAK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrvh0ACgkQjjKRsyhoI8zLPgCfdYU20+ADDfYuw8XGLgk54qKd
+pUAn1497bS2gwkG7rhsruEEYK/8fPbs
=N5lm
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_19_58_05_+1100_8vq+5z76CMvpTCAK--
