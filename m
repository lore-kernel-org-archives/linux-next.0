From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 2 Aug 2017 15:45:54 +1000
Message-ID: <20170802154554.2fe6515b@canb.auug.org.au>
References: <20170801163904.7d49881a@canb.auug.org.au>
        <20170801205054.17c8579f@canb.auug.org.au>
        <00BCCF64-C319-44F0-992B-7F78D4676B5E@cs.rutgers.edu>
        <FB1FCBDA-1F7A-40C4-9415-3E6495B0B809@cs.rutgers.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uvBYKwonRYgGNDJYbu7b36N"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43467 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751062AbdHBFp4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Aug 2017 01:45:56 -0400
In-Reply-To: <FB1FCBDA-1F7A-40C4-9415-3E6495B0B809@cs.rutgers.edu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Zi Yan <zi.yan@cs.rutgers.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--Sig_/uvBYKwonRYgGNDJYbu7b36N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Zi,

On Tue, 01 Aug 2017 09:08:01 -0400 "Zi Yan" <zi.yan@cs.rutgers.edu> wrote:
>
> I found two possible fixes.
>=20
> 1. This uses C++ zero initializer, GCC is OK with it.
> I tested with GCC 4.9.3 (has the initialization bug) and GCC 6.4.0.
>=20
> --- a/include/linux/swapops.h~a
> +++ a/include/linux/swapops.h
> @@ -217,7 +217,7 @@ static inline swp_entry_t pmd_to_swp_ent
>=20
>  static inline pmd_t swp_entry_to_pmd(swp_entry_t entry)
>  {
> -	return (pmd_t){ 0 };
> +	return (pmd_t){};
>  }

I have done that for today ... please decide which is best (or find
something better - maybe every platform really needs to have a __pmd()
definition) and submit a real fix patch to Andrew.

--=20
Cheers,
Stephen Rothwell

--Sig_/uvBYKwonRYgGNDJYbu7b36N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEb/8FnQ4F3+D3b2b8ReVMXCmzCDkFAlmBZxIACgkQReVMXCmz
CDncFQ//TsgnFEIofBUHIbjLlP2NsrLrMRuj1mYR5nLxflCHGUqUXL2QSpcm/Fk6
pfvXao6pM6+I8V0KIUMtQJKeEyEVQb8PsmErGsBdYiappTXGMj2aZKSxb0pJ2qXl
aagmGxnvLIC+7LUmBuARC4GRZGcLsUS6i4jDWnvSvFp5txbBdBF2CxmKSXYuK5nm
0DSwGUgiR3w7KolA+4UvZYrD185z6vfDc9iJUWp/p2LQ5B0o1suUfaIcMC+i6GWN
xSY5laniI6Cvzq8nViUd58UaFmfzEz0ul3x/OIwyJhM9d2oyiwriwnpi7XqFrDBi
b6qCI1KZLVjZmiwclCV9L70NthSl2fkFJHsdggzIAxuXAXB7KDpPSbHgZcQlfF26
a8VOvgsokLYIPybxfmnbaXIbUIqfwGENd56MCqht82cLdCdS/v/1cr9Ov7wyv1D5
qKGUHM/yM839/iE9wYN/74bSKmm08DMqcZMpzj+U/68l9s2rpVXeHfw3yaGCQTZH
VVzDF0Z4vHcoO1smbAGrLraBl4pfDPcEmedz8jDIe8UEPc3FAFb1y8MWXQCj5Q27
VbWtJqitb/2hkEkCx7WA7v7Z1o6qe2XAmlfLkfR97x4Wj/Ky0M9McAtzK5PXb4nz
zOK+lSW9xNwLzP94YK+ozjQ/j0WqNe9X0emmSFQuOit5utd2Xxo=
=2Ani
-----END PGP SIGNATURE-----

--Sig_/uvBYKwonRYgGNDJYbu7b36N--
