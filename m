From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tags need some work in the sound-asoc tree
Date: Wed, 29 May 2019 10:00:23 +1000
Message-ID: <20190529100023.4a7cfacc@canb.auug.org.au>
References: <20190529075614.150b1877@canb.auug.org.au>
        <44bbb3f1-5674-6431-5818-d8b5cca708dd@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F8gLjB5fcrXmqdy+Qe2tDr8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <44bbb3f1-5674-6431-5818-d8b5cca708dd@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>, Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, Keyon Jie <yang.jie@linux.intel.com>, Libin Yang <libin.yang@intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/F8gLjB5fcrXmqdy+Qe2tDr8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Pierre-Louis,

On Tue, 28 May 2019 17:22:40 -0500 Pierre-Louis Bossart <pierre-louis.bossa=
rt@linux.intel.com> wrote:
>
> On 5/28/19 4:56 PM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > In commit
> >=20
> >    be1b577d0178 ("ASoC: SOF: Intel: hda: fix the hda init chip")
> >=20
> > Fixes tag
> >=20
> >    Fixes: 8a300c8fb17 ("ASoC: SOF: Intel: Add HDA controller for Intel =
DSP") =20
>=20
> Sorry about that, not sure how I managed to add an off-by-one in all=20
> these tags. Checkpatch.pl --strict did not report any issues, something=20
> must be broken either in my setup or the script.
> Not sure how I can fix this now?

Its not worth the rebase necessary to fix them.  Just use it as a
learning experience.

--=20
Cheers,
Stephen Rothwell

--Sig_/F8gLjB5fcrXmqdy+Qe2tDr8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzty5cACgkQAVBC80lX
0GyG7Qf+MdPBfzF8R7UaulnuAKN1HfNFWuY3VXVToBvsKdOTLE0EfIQyDfEc2qxa
fq8v+ZOA+rSSgsyxE6LJMy+KhVhm7jzQO7Uoxp+5dxTWVA5+XysKrDsgoe1p/7+i
n0JUeguYaHwVam+YbWHNFRItx9qi/mMLIrnGSe0O+84rtrsQRGGPbVZE7Uv7CbLv
lyeqDw/s7+NXMI2EKX4YolwkjAnonfPOsM8VZ1oBLE+FdtFl5cVWBgKm4YskzAPh
CjCZVquLmrg2zvFbof6Oin4rU7fTpQimvXDaU2beoeW/fXkEmJyZrbpXtV+39R+f
n6jHvA07GMDPyOyx/nVtQTDwgELNmA==
=na2v
-----END PGP SIGNATURE-----

--Sig_/F8gLjB5fcrXmqdy+Qe2tDr8--
