From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 25 Jan 2016 11:41:50 +0000
Message-ID: <20160125114150.GK6588@sirena.org.uk>
References: <20160114151541.17e76d23@canb.auug.org.au>
 <20160115130527.c43357d0aef93d22380c6673@linux-foundation.org>
 <20160116100047.681e0e03@canb.auug.org.au>
 <20160115151401.03fe1a39ca397079407c2ca9@linux-foundation.org>
 <s5h4meductq.wl-tiwai@suse.de>
 <s5hmvs0uytw.wl-tiwai@suse.de>
 <20160121073859.3a6c22a3@canb.auug.org.au>
 <20160122112442.75c07aac@canb.auug.org.au>
 <20160122134045.438cd9d9@canb.auug.org.au>
 <s5h60yiatwt.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AUv0/Bqt5dWl9oeU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <s5h60yiatwt.wl-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Vinod Koul <vinod.koul@intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
List-Id: linux-next.vger.kernel.org


--AUv0/Bqt5dWl9oeU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 25, 2016 at 10:29:54AM +0100, Takashi Iwai wrote:
> Stephen Rothwell wrote:

> > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > index 50693c867e71..ee5f36b9c787 100644
> > --- a/sound/soc/codecs/Kconfig
> > +++ b/sound/soc/codecs/Kconfig
> > @@ -13,6 +13,7 @@ menu "CODEC drivers"
> >  config SND_SOC_ALL_CODECS
> >  	tristate "Build all ASoC CODEC drivers"
> >  	depends on COMPILE_TEST
> > +	depends on !PPC
> >  	select SND_SOC_88PM860X if MFD_88PM860X
> >  	select SND_SOC_L3
> >  	select SND_SOC_AB8500_CODEC if ABX500_CORE

> Suppressing this whole is an overreaction, IMO.  It should suffice
> just to disable compile-testing Intel driver.

Please send patches and reports to maintainers :(  I agree that this is
an absurdly wide change.

> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index 803f95e40679..d854cd66e090 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -31,6 +31,8 @@ config SND_SOC_INTEL_SST
>  	tristate
>  	select SND_SOC_INTEL_SST_ACPI if ACPI
>  	depends on (X86 || COMPILE_TEST)
> +	# FIXME: a part of compress API is broken for PPC
> +	depends on !PPC

Why is an Intel CPU thing being enabled by SND_SOC_ALL_CODECS?  I'm also
unclear why this will help when we're selecting in the drivers so their
dependencies will be ignored.

--AUv0/Bqt5dWl9oeU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWpgn+AAoJECTWi3JdVIfQmG0H/RrMReX0uFDnY1ZA8twErhq6
CnVk7mjWLaQA/8NGOgD3uqxGeRlAKDcsvwzj7gAHg6votsgKVsSTo1lduueGrJEm
MY7JnEEIOPIl7AzqZkqb2R7bNwVjtF8aqtvkxqsN2rat4y7TirJaRUf3wF3WP5xp
IP2TeHXvQDIrsiOSwUUAbn4EiJAxn0vdYEuqvBHQTctiohRxvFUSkHuWDz8WwZkI
BvvhbWWPcHdnbYh4imnQu5/XYh9UBoU41TeNNWmbXpHGtOYVhKsuiByNRNHjoOyb
rDLhQYEDTGhmM5Vd3gX431IJQ7I/pdI96vNyQbo/+3/ycUIiurXK+uuSV7eHpgI=
=Y47A
-----END PGP SIGNATURE-----

--AUv0/Bqt5dWl9oeU--
