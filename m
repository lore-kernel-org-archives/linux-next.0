From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: linux-next: failure fetching the sunxi tree
Date: Thu, 5 Jan 2017 16:15:23 +0100
Message-ID: <20170105151523.vec6dnldfbkce2mk@lukather>
References: <20161221092413.3b1b1f75@canb.auug.org.au>
 <20170104093124.24147e05@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="flbra6kdw63gbzbc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:32783 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032726AbdAEPQC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2017 10:16:02 -0500
Content-Disposition: inline
In-Reply-To: <20170104093124.24147e05@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--flbra6kdw63gbzbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Jan 04, 2017 at 09:31:24AM +1100, Stephen Rothwell wrote:
> Hi Maxime,
>=20
> On Wed, 21 Dec 2016 09:24:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Trying to fetch the sunxi tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git#sunxi/=
for-next),
> > produces this error:
> >=20
> > fatal: Couldn't find remote ref refs/heads/sunxi/for-next
>=20
> I am still getting this error.

Sorry, I went in holidays and removed that branch to avoid any
conflicts during the merge window... I didn't know it was an issue to
you and assumed that you would just ignore it, sorry for that, it
won't happen again.

Anyway, I just pushed a new one, so everything should be back to
normal.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--flbra6kdw63gbzbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYbmMHAAoJEBx+YmzsjxAgBfMP/3GxCXYet6fzPTyIxGbECnWH
P/lYZNuPTkGJ10mEepZz7v1F22/wEjjZc84i03KoLSTkPK8Sx1H3TdxCOFO+nmcN
7v0gbvTGIg9FFUSApZC2qL8UXDLRd+m/1xD/qRX8c4n1oqTyifVFxDGB7MzxMZP/
u6Yav9wzwiSsURSgxPpv4oqRAT1tDx8bzzMiLh8a0p/V9usw4usD3i4LeU2DsWQy
IrE6yNYPFvWERZHUVBoeiqDmMwYSCN25LEuEP1OoQp/jcfFbZ76D0VNFAbX6sb83
Ll4Z02rGnH6bfUa8Jjps9QZDFJqLj1Pwik0lH2jsEjIo0VtyH5ZKztghCJuG5pTT
s/Mz1rJF3ksQNh3USWHjehTEXZpL+014XqyldAB8sN2/F3xo+9UCwA8trsC3ftRb
nOVnS8VSqzm1IDuLBcngKUEbWdEGr/Q3LMTNMHWX6mBfWnjQKq2qpPbhw9Q1LASo
vH8RYatpTftQmEeSleHEaw0gMBxwXHU0dsios6/4FRB2yjJVT5c3oslWyjjnFvRz
S9LYhZPtoHKLo+4anA67wEit+/hEkpCQaAIivf9ZxQ6UaW2FV62EzQUoeEpqrFyF
8eEhVi4eRnyicNZ/tVYR5N/lu1L6E3Y8WG1KbMTcjh7SDJsOLmCugdzR+jbupAPp
HLIb9HA7jEadIbJh0xNZ
=tZdm
-----END PGP SIGNATURE-----

--flbra6kdw63gbzbc--
