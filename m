From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the kselftest
 tree
Date: Wed, 28 Nov 2018 09:27:35 +1100
Message-ID: <20181128092735.7a2f830f@canb.auug.org.au>
References: <20181128073603.3786e528@canb.auug.org.au>
        <6235956e-5edd-3b7d-1898-ab55094a7e16@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/to4+TA8.zCLxyH3aZBDWixN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6235956e-5edd-3b7d-1898-ab55094a7e16@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shuah <shuah@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Rue <dan.rue@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/to4+TA8.zCLxyH3aZBDWixN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Tue, 27 Nov 2018 14:17:57 -0700 shuah <shuah@kernel.org> wrote:
>
> Thanks for catching this. I will fix it. This is the result of change=20
> log content messing up the commit: The diff -Z in the change log=20
> resulted in throwing out the Signed-off and Acked-by.

Tricky :-(

> -----------------------------------------------------------------
> diff -Z is used to trim the trailing whitespace when comparing the
> loaded firmware file with the source firmware file. However, per the
> comment in the source code, -Z should not be necessary. In testing, the
> input and output files are identical.
>=20
> Additionally, -Z is not a standard option and is not available in
> environments such as busybox. When -Z is not supported, diff fails with
> a usage error, which is suppressed, but then causes read_firmwares() to
> exit with a false failure message.
> --------------------------------------------------------------------
>=20
> Oh well! I will fix-up the change-log and amend the commit.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/to4+TA8.zCLxyH3aZBDWixN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv9xNgACgkQAVBC80lX
0Gxv3gf+ICfHY/Q3qKU/lOgvCWm2r2BFYqoVrlZU6JxK3+oHtRb8VOYg0JA2AQa/
wylxNGvVFq/Izmkl0J6K9Xq9jJ+DbZCQYTuJnQ+BFr/auenL0fotdaTd0tYmKpBo
MevU0Q+3YEuoV+Yu1MUe2WBun1Hp18MC+EbV904ajQbKMVabJwNk+2hbIo1dzRfa
Mry+7KvDCj+Q5pgS4jMoF31KFLB81aIuXOzUpTO6lY13bknbDg4i64ynfYK2P6fR
h2CUYcMNf22SMeVIrsiz/4SU4sfCXKrlB+a6UiuMNpUpmT0p/eMpWptzveK2bC95
Yph/BQal2tDbR4w5ZL7eDnt2Fd4KWw==
=4WWZ
-----END PGP SIGNATURE-----

--Sig_/to4+TA8.zCLxyH3aZBDWixN--
