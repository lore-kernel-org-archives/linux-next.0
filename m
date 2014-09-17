From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: : drop kirkwood from nightly build coverage.
Date: Wed, 17 Sep 2014 17:53:49 +1000
Message-ID: <20140917175349.782148ad@canb.auug.org.au>
References: <20140831035843.GA26632@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Dko8vtIWyE4+Gz=u9c3Alvd"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47513 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751618AbaIQHx4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Sep 2014 03:53:56 -0400
In-Reply-To: <20140831035843.GA26632@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org

--Sig_/Dko8vtIWyE4+Gz=u9c3Alvd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sat, 30 Aug 2014 23:58:43 -0400 Paul Gortmaker <paul.gortmaker@windriver=
.com> wrote:
>
> When you restart build coverage after vacation, the kirkwood should be
> dropped.  Log summary here:
>=20
> http://kisskb.ellerman.id.au/kisskb/target/8110/
>=20
> shows failures since July because it was removed from mainline.

Thanks for pointing this out.  Done.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Dko8vtIWyE4+Gz=u9c3Alvd
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUGT4SAAoJEMDTa8Ir7ZwVTRcP+wQ/jfLX581A57RpFUODIIc4
DdaShT9BA/s/q8xVmpJCylsVBEccD78HwfPKuzFpG80t+wUEQ/hHG28EoWc4E4ZL
HEcXvbvm9JGts+IvZIDr92qRYwr6TZKvMU1wpCfz+653PP2bohOAcCaOD53sjd3Q
RgVeorZRjKOqieVgsuhBrEcWQiKVEpJLvyRxBdykVOsMXa6yS3cnwFP3cj05qT7X
4ilYfYTZDqYimJ/yUgB+r92sPaqjH0h7Ch5YpNDpHyRfZSLuyGT5QuXH49fiV6t5
vLEg9XUkGj4ygv3FfMQf9Rd8pAEmjBoz1xQwiGYvX6pE2I55cdWFJsKHbo0I0MrL
9YU+toxehwEwpiv7nU1iM9D2ReUw4a7qFH1IeplmaFmrx4Hijgn9OlJjXaE0qaSH
jZ7o/4i/uCfKqmdi2avHiimAxjK7EGTrZ9lngZx4SQDqxXGu8OwCZoMziu8fq0fU
JVGll7B6QK2rWMRbJRhlsUsuIVqFpvY/IEcxZjKmDc3dRIKAfR21QhEVS+El1Gk3
eThMYPaVMkTtyieLD6NCh1AvxEy1uN+yRksQLzDg157PMGGn+GZrsqc8HZmUDzWy
jo/by8Rml/Q4q3CX2/vT9BbmXvmcV2XNa5foxbOFssWor0ddq3b238Ojmp2EheVy
lWQ11eiIeyjyKzl3It+Z
=Tzyz
-----END PGP SIGNATURE-----

--Sig_/Dko8vtIWyE4+Gz=u9c3Alvd--
