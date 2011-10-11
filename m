From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Tue, 11 Oct 2011 17:37:14 +1100
Message-ID: <20111011173714.d54bbcee6c0676ddcc37a1f3@canb.auug.org.au>
References: <20111006144826.a69a5ea59d4ca94f8f7414cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__11_Oct_2011_17_37_14_+1100_LBsW4nUeb3l=X.ET"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:43832 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1749667Ab1JKGhV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Oct 2011 02:37:21 -0400
In-Reply-To: <20111006144826.a69a5ea59d4ca94f8f7414cf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>

--Signature=_Tue__11_Oct_2011_17_37_14_+1100_LBsW4nUeb3l=X.ET
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Thu, 6 Oct 2011 14:48:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: "irq_setup_generic_chip" [drivers/gpio/gpio-pch.ko] undefined!
> ERROR: "irq_alloc_generic_chip" [drivers/gpio/gpio-pch.ko] undefined!
> ERROR: "irq_setup_generic_chip" [drivers/gpio/gpio-ml-ioh.ko] undefined!
> ERROR: "irq_alloc_generic_chip" [drivers/gpio/gpio-ml-ioh.ko] undefined!
>=20
> Presumably caused by commits 54be566317b6 ("gpio-ml-ioh: Support
> interrupt function") and 38eb18a6f92d ("gpio-pch: Support interrupt
> function").
>=20
> I have used the gpio tree from next-20111005 for today.

I am still getting this build failure.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__11_Oct_2011_17_37_14_+1100_LBsW4nUeb3l=X.ET
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOk+QaAAoJEECxmPOUX5FEg+UP/jeieEU8UymcXxtomxyjtlCQ
wKb6IYlBZKol2EhkhOGIPAROp9meJMOaI/dpFVG9EJNhUPvNDSoKSv2jZiIeQ9yI
/sKiRv8DTGxgJ+qmDgoGpL+goe0lXuLJdDuM+1xkMCzPCFiw34c1YCAhNHmcgfMa
IkugqDxDcAYo0TaXu63uBpG739XwdwT3S9oKIYuXhLdxBZaBwkr+sZadMSqRrgwA
rl3HTyQioS+oicJ+pqC+ODS66HmX1iXa0ASEi9BfF4XLjy95M8rUQZqwnoRpFkEj
QAvtCL4/u3mEOH/qQYccP0wYD+iLts/HIqxBo0IJcK0QCxrwqc8SMAgS6h0BqQhz
EYQZ9RlLiCcVUp225ZaXzJbkLb123Iegr0lWX8w+jkrnPWqRhuKKnd/jn9MYW5Cb
qfzVXwif7jbDqx27h56zf0slOys17j1HCG70tI3jFCzZLZMuZ087QuZBqVkJqR8Y
7a0XAQ69426xx6DmTIg6eXYLkHE4mQ5/mwF7nU2pEqBM2Y7J5PxlcjajZVQ3dmv0
yAPjv30fhMPDal8rYrjNPC2epElrUIVqxRmO0Rm4TxiZDThgYCLJmJc0cxOwz85J
14qMwrqhqlF3FEvrtSbrXSnMkPvu+EKWzZkgkXnsXQcqbaBdgSulB1eaq2sQhfw5
TrnCz0c9HlN0NQkp27+W
=ufny
-----END PGP SIGNATURE-----

--Signature=_Tue__11_Oct_2011_17_37_14_+1100_LBsW4nUeb3l=X.ET--
