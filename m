From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64/efi: Make strnlen() available to the EFI namespace
Date: Tue, 16 Feb 2016 11:19:35 +0100
Message-ID: <20160216101935.GA4868@ulmo>
References: <1455563856-1553-1-git-send-email-thierry.reding@gmail.com>
 <CAKv+Gu86oyHJcBhkjouLQk8FMR=0obrPpwnYvXMFSJkOa3c2pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:33761 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754551AbcBPKTi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2016 05:19:38 -0500
Received: by mail-wm0-f46.google.com with SMTP id g62so184175326wme.0
        for <linux-next@vger.kernel.org>; Tue, 16 Feb 2016 02:19:37 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAKv+Gu86oyHJcBhkjouLQk8FMR=0obrPpwnYvXMFSJkOa3c2pA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-next@vger.kernel.org, Rob Herring <robh@kernel.org>


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 08:23:22PM +0100, Ard Biesheuvel wrote:
> Hi Thierry,
>=20
> On 15 February 2016 at 20:17, Thierry Reding <thierry.reding@gmail.com> w=
rote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Changes introduced in the upstream version of libfdt pulled in by commit
> > 91feabc2e224 ("scripts/dtc: Update to upstream commit b06e55c88b9b") use
> > the strnlen() function, which isn't currently available to the EFI name-
> > space. Add it to the EFI namespace to avoid a linker error.
> >
> > Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm64/kernel/image.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
> > index c9c62cab25a4..8a1978f4a555 100644
> > --- a/arch/arm64/kernel/image.h
> > +++ b/arch/arm64/kernel/image.h
> > @@ -96,6 +96,8 @@ __efistub_strcmp              =3D KALLSYMS_HIDE(__pi_=
strcmp);
> >  __efistub_strncmp              =3D KALLSYMS_HIDE(__pi_strncmp);
> >  __efistub___flush_dcache_area  =3D KALLSYMS_HIDE(__pi___flush_dcache_a=
rea);
> >
> > +__efistub_strnlen              =3D KALLSYMS_HIDE(strnlen);
> > +
>=20
> To align with the existing code, we should use __pi_strnlen here, and
> declare the asm version of strnlen with ENDPIPROC()

Yes, you're absolutely right. For some reason I had missed the ARM64
implementation of strnlen() in the grep output. Sent a v2 now which is
consistent with the existing code.

Thierry

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWwvezAAoJEN0jrNd/PrOhteQQALgu7TTL3yqckK8R84L6Npkd
u9BXWbwDZ5Lb8TKnoA6lQf6/n0UnHL9X5clyNQuPXvqueUo+iPoaeBI377WwgF4p
nlOI4FfPPcfVXpcuk8h7duKp3cGpCSMxkhJPvpmgjsteQ0PQdTXxVEQQTiDB/GIn
STXzC9KGLS1hL/onPB21t+ljTlgnozxAE6/57GQgSi03xs8mH8LW/xwcaiVfVRZ9
rpHtMyKi/JHFC46/9rTNWpd0TW6zfsKJrQQrNQAVQv+0Qu9gJu2FFbSBy3ZS5uvH
bcAshS1kczvT/UhS/uuefDsZnjFYcR5Jm0S92jGTuWwx9pV0meXFoSKDsk3Krspb
wJkQG+MC1XSCtMp3rTISbdb7Lb2nE2KyrD0VR8Qwr0ILDx7b15C7LfIfirU/HAyw
FYYfp/CHenBIFrayEOt4ZVUARFTXa5pJREzw3BUAYd1wViKaPXvlTdeXQyCGyqya
nBfPBgEOJxE07UY2K5FZVfuxg2LlSjwiZAlzZ3oX8tVLMMmY4sTHq29bDEJLPNVX
Qv/NI/y3ZyfYVxeBm6hZ/qsrhXCD6Qj1GpxthWHqmj60J/v0qf2CMiV19mStqA6+
dj1hnO/kEd+gulSm38EOgHczn1496so2xcdmB0Eod8G8vOhuWSov1qZ0do5sNljJ
3h6lFLyDKml89HQgHM2k
=U0E8
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
