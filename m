From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc tree build warning
Date: Fri, 29 Jan 2010 17:32:20 +1100
Message-ID: <20100129173220.abdd823d.sfr@canb.auug.org.au>
References: <20100128184423.40ce38fb.sfr@canb.auug.org.au>
	<20100128.052432.251700168.davem@davemloft.net>
	<20100129102543.7af32673.sfr@canb.auug.org.au>
	<20100128.201206.257650090.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__29_Jan_2010_17_32_20_+1100_e_oqV=GMz4WaUxDR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48990 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752042Ab0A2Gc0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Jan 2010 01:32:26 -0500
In-Reply-To: <20100128.201206.257650090.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__29_Jan_2010_17_32_20_+1100_e_oqV=GMz4WaUxDR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, 28 Jan 2010 20:12:06 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> Simply ignore the warning then, I thought you were reporting
> a build failure.

No worries, I just report warnings in case noone else notices them.  And
in case they are important.

> Looking at the specific case of net/core/pktgen.c:867
>=20
> "len" is variable in the net/core/pktgen.c line that emits the
> warning
>=20
> Even though it is limited to "sizeof(name) - 1" via strn_len()'s
> third argument, that's a lot to expect the compiler to dig into
> and be able to conclude invariants from.

Yeah, indeed.  We need an intuitive compiler :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__29_Jan_2010_17_32_20_+1100_e_oqV=GMz4WaUxDR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktigPQACgkQjjKRsyhoI8xHuQCfSnN6BPWqEAOg99839p/lypEU
ux4An3vebG6u7geiGrQhyg92QI+Pt5xl
=514x
-----END PGP SIGNATURE-----

--Signature=_Fri__29_Jan_2010_17_32_20_+1100_e_oqV=GMz4WaUxDR--
