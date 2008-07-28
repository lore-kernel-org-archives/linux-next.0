From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc tree build failure
Date: Tue, 29 Jul 2008 01:12:33 +1000
Message-ID: <20080729011233.b27e76e9.sfr@canb.auug.org.au>
References: <20080728163808.55efadb1.sfr@canb.auug.org.au>
	<20080728082114.GA11366@uranus.ravnborg.org>
	<20080728093102.GA30612@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__29_Jul_2008_01_12_33_+1000_z1/8q9x2FF05NaSP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49802 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752404AbYG1PMn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 11:12:43 -0400
In-Reply-To: <20080728093102.GA30612@cs181140183.pp.htv.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

--Signature=_Tue__29_Jul_2008_01_12_33_+1000_z1/8q9x2FF05NaSP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On Mon, 28 Jul 2008 12:31:02 +0300 Adrian Bunk <bunk@kernel.org> wrote:
>
> I can also reproduce it (triggered by CONFIG_HEADERS_CHECK=3Dy):
>=20
> ...
> make -rR -f /tmp/linux-next-20080728/scripts/Makefile.headersinst=20
> obj=3Dinclude/drm dst=3Dinclude/drm
>   perl scripts/headers_check.pl /tmp/linux-next-20080728/usr/include spar=
c64 /tmp/linux-next-20080728/usr/include/drm/drm.h /tmp/linux-next-20080728=
/usr/include/drm/drm_sarea.h /tmp/linux-next-20080728/usr/include/drm/i810_=
drm.h /tmp/linux-next-20080728/usr/include/drm/i830_drm.h /tmp/linux-next-2=
0080728/usr/include/drm/i915_drm.h /tmp/linux-next-20080728/usr/include/drm=
/mga_drm.h /tmp/linux-next-20080728/usr/include/drm/r128_drm.h /tmp/linux-n=
ext-20080728/usr/include/drm/radeon_drm.h /tmp/linux-next-20080728/usr/incl=
ude/drm/savage_drm.h /tmp/linux-next-20080728/usr/include/drm/sis_drm.h /tm=
p/linux-next-20080728/usr/include/drm/via_drm.h; touch /tmp/linux-next-2008=
0728/usr/include/drm/.check
> /tmp/linux-next-20080728/usr/include/drm/drm.h:40: included file 'asm-spa=
rc64/ioctl.h' is not exported
> make[3]: *** [/tmp/linux-next-20080728/usr/include/drm/.check] Error 1

Thanks.  My cross compiler completely failed me :-(
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__29_Jul_2008_01_12_33_+1000_z1/8q9x2FF05NaSP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiN4eEACgkQjjKRsyhoI8ylfwCgnjR8AQ3otE0dEDX1TWhDx+9Q
8hEAn2MMRUly7c+VFEHVMHcDZ7eNFInV
=00mU
-----END PGP SIGNATURE-----

--Signature=_Tue__29_Jul_2008_01_12_33_+1000_z1/8q9x2FF05NaSP--
