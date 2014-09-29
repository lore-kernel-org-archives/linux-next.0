From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next tree addition request -- doc.git
Date: Tue, 30 Sep 2014 08:16:35 +1000
Message-ID: <20140930081635.6ca54fd3@canb.auug.org.au>
References: <alpine.LNX.2.00.1409261132330.22196@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uGg_gJv0R.dcXzL/Nf2Wet1"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58547 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751972AbaI2WQn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Sep 2014 18:16:43 -0400
In-Reply-To: <alpine.LNX.2.00.1409261132330.22196@pobox.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>

--Sig_/uGg_gJv0R.dcXzL/Nf2Wet1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Fri, 26 Sep 2014 11:37:06 +0200 (CEST) Jiri Kosina <jkosina@suse.cz> wro=
te:
>
> as a followup to Randy stepping down as a documentation maintainer [1],=20
> could you please add
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/jikos/doc.git#for-next
>=20
> to the pile that gets pulled into linux-next?
>=20
> Thanks.
>=20
> [1] d671e42457e1fef70ad0df07084207078633a9e8

Added from today.  I also removed Randy's patch series.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/uGg_gJv0R.dcXzL/Nf2Wet1
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUKdpIAAoJEMDTa8Ir7ZwVatIQAJU030EgtaISeWxq+i78j0/G
0nYDZKZ4BE9azmDTEmiCRF477cCwYq4f205x/U5wlpUE9Y6F7dxFoioaRlHJnj98
HjUn5GZIoMApbGoCpriEogDfUoLIDPyQ1Hb3FfT+aaKyzoxyW/pbdkD0deoLtOIi
hPZQCD95O5gNk3gPCi4jeOZFrUMmWc228fURPIm5XE708Lrf0amdfP/0m7NbDq60
6tX6eYHLRBaF42ZH6rVSKRxUkPeicBCtg8x/ttb++LMKb7d6j7XLTWK8MlwdPkaf
enIL2dPsHCqz+qgf0RDBaz6UB+73UPBNsRrifv7Csy2oF/vqqaXG0Z2UaOBqJdUU
eB9xI+dGezevOUjWA+kfNZ9TdYxTRG8SW7M1CcFdL1Cn95sFS2QWavha9bxzyJZn
ycHnjrueGXywydtpGQbmuotD+aVTGTzaR3PxPUCAp5wsCROP4hfc0ZT2C73rp6S3
VHJGWZCoEvq+ksZOjZjp1P1vuJqIvOl6ubRx86Q9T/c6JezJScl8cXtTKSFxxAcb
TFiV3+zRLeMcHPupOl65ozHVgaOUzmr9T7IGoyKPRsuS4hWt7j2FO59dY8BWFtlu
VMjmWYxQ/SYYPoJcc7ACQREbBJ15T2qTvRJZf2VVXnJINsCCaUJEgjErH2RIeKM5
Mv1VQ84f7qVDF3gonGRu
=uRqr
-----END PGP SIGNATURE-----

--Sig_/uGg_gJv0R.dcXzL/Nf2Wet1--
