From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: manual merge of the spi tree with the slave-dma tree
Date: Thu, 19 Mar 2015 15:05:13 +0530
Message-ID: <20150319093513.GW32683@intel.com>
References: <20150319144834.56c676f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150319144834.56c676f6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>
List-Id: linux-next.vger.kernel.org


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 02:48:34PM +1100, Stephen Rothwell wrote:
> Hi Mark,
>=20
> Today's linux-next merge of the spi tree got conflicts in
> drivers/dma/intel_mid_dma_regs.h and drivers/dma/intel_mid_dma.c
> between commit 3b62286d0ef7 ("dmaengine: Remove FSF mailing addresses")
> from the slave-dma tree and commit 36111da7838e ("dmaengine:
> intel-mid-dma: remove the driver") from the spi tree.
>=20
> I fixed it up (I just removed the files) and can carry the fix as
> necessary (no action is required).
Thanks Stephan,

The file removal is the right fix here

--=20
~Vinod


--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJVCphQAAoJEHwUBw8lI4NHgLUQAL7LK+79KoKPZxzQNCCYdSYJ
NyV2pewRltX3BtsKD9BML5XudZPNar0vox+NAvQu8HfJ7iouqMnJ740MRpQ2BgQw
ko2BAaOFm8i/k2515uEqoJPK1NmgEG43PCjs9phfwIuLsgZvbpfinDcY5qCaRo/h
JtOlL9w9bQkQfAqp7vvwZ4CFa/RyvsIrwxJd75EoIjaV9xoYACsEKDYaF32NcW2F
pZuK7Xh5i6SIWQo2o4KElfKiNjQqo3hdf4Gg7WxsfTd64yUWDa7LUFZ6BFdnUR2y
ZSOfvIEdJ8fNHcXkfnaI2ivvXQ9Pe5MJAs1b/eHsSdinaLs5h2wImXj4ZE4+cF+o
wZDoTmghxWxGyAL1Imp+rH3b6bGZVM/c2GLWOVo/CTq+1DGwFZ8jLTiZdimYyd0D
pQV1HojSDaaMRBOgeUMsJbKPFotXm6B5+bGA8Tr5YSqTGuHPNNYg8CMRaAP6gDMZ
dzr/GhcT2V++FdwpJDGPcsKtxD6ia5z9UMlZqGIEMkrZ4DwYUxIZmo7jDklNieGz
Ey2wlqE1so/FJm8qeWtl3JHE906sCvqElelx3Z08OeKcP7oSCSXGDWSZZEt1HKI8
y8dtEV+UFEOmEg1P5m+z+rkdA0uzC2b/6kquIa0yJDGjfSVir2qRaeceSX8habrX
T5Imt2WPMbd5DLcob6aF
=dpdR
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
