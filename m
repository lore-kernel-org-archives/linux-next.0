From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] fixup! gpu: host1x: Add IOMMU support
Date: Wed, 5 Apr 2017 18:20:28 +0200
Message-ID: <20170405162028.GA8083@ulmo.ba.sec>
References: <20170405074544.29464-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170405074544.29464-1-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, amerilainen@nvidia.com
List-Id: linux-next.vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2017 at 10:45:44AM +0300, Mikko Perttunen wrote:
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 1 +
>  1 file changed, 1 insertion(+)

Applied this to the drm/tegra tree and pushed it out. Verified that
merging it into linux-next builds fine on various configurations.

Thierry

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljlGUcACgkQ3SOs138+
s6GvmRAAr9YHKc4tLR/C3qM+gHzLLortjQRA55qup0QMoEDgjhUhlY7M8LdV5TD4
3VCR1p9lWXmeK5xnDvZK3RzXz7CxEbzJxkHJAe0O7GN1FwWnor0kWnDd6H1XBJdH
p7ZEpuG7bNC0fyT7e6sPBgNkPj5jmQOJGamPKCQO71hDNjWdNzMLHoP9vFeLTsSe
XLJbJDwJAnmT9xtr1QjZ33yrAK9x8IJQkvuIBppDag9230EgaGBRSpepR37SfX/h
flzKoZzqzopStjDq8E2fbLwekwOJIoi/yVDSeTg2fgbbzZAgeoO4Quy0d06vaANc
bOZetxtcQsz3Mx7nx9NH4MsJYeuo0WC1/s0dkAovUwKcnkUTT+iUHBwoiM1Otopm
baL+Lj1tXs8iX+B8f31DkRkN7Oq7T83rPSeGlLmDYCmYDKTmlfHcPMCP7aFVQLPR
9P2Wkpf+GzhZ+0NAnA/GKvKYhssGh4P9U6KNKt5ID+MZU5vVoC38IdvFzwWemXbx
dDT+wjV81EhzS+URliwChl6ND1xsLoIbAmqUX9rNAD71bSu9glohFl+jYRAGnKyM
IRv1iPGhyZbeaejLLkjJ0bGCaKZaPY9ZlzdbPAMSc/TmIZG33BGl2t4JYHqNH2WU
MLwDlHzjpn7rgyKBOncfQ+m6btfE57aMFUHRLtsk2Q8oyO1Ell4=
=NieO
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
