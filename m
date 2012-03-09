From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: slave-dma/next - please drop
 "drivers/dma: linux/module.h included twice"
Date: Fri, 9 Mar 2012 19:08:29 +1100
Message-ID: <20120309190829.a6259f5e98d8379dcf88ba98@canb.auug.org.au>
References: <20120309023643.GA1796@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__9_Mar_2012_19_08_29_+1100_pho1GGBkRJs.vGr+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:39925 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752010Ab2CIIIn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Mar 2012 03:08:43 -0500
In-Reply-To: <20120309023643.GA1796@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: vinod.koul@linux.intel.com, linux-next@vger.kernel.org

--Signature=_Fri__9_Mar_2012_19_08_29_+1100_pho1GGBkRJs.vGr+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 Mar 2012 21:36:44 -0500 Paul Gortmaker <paul.gortmaker@windriver.=
com> wrote:
>
> Please drop commit 865d9438eb1f7670d2e88849f059db551b320887 from your
> tree.  There is a commit to delete all the duplicate module.h includes
> tree-wide, and since your commit deletes one, and my commit deletes
> the other, the final tree has no module.h which causes this fail:
>=20
> http://kisskb.ellerman.id.au/kisskb/buildresult/5819464/

I have fixed this up in my tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__9_Mar_2012_19_08_29_+1100_pho1GGBkRJs.vGr+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPWbp9AAoJEECxmPOUX5FEt7cP/2FpxTxqctWQatzrKwknlpt4
3pzgdiA9WAH4UkNQyKIAa5Bg0NYLOC+9JSAYLpRdvslVpmRLVvI7wujtFqTqQnoC
sCjgsAPuvMXko2mRwh3lZqbziaWzQlEHZNq3CsPvpzSz2XHn/uTl1EwyK2AfiWdn
AtmHVR2DXeLns0BVM5JDEdVUU9m6896dR/j8hByZh++kEORxpwxY6n3uz4Eb5jwY
Lxv5xv1zqeQPzSSASJMbJRllUOmb20hM3bGRUTdj8n0QdCk2gLImjmaBLTVpHrhs
kMl/pg4kDjPSrkzJu5aEhEg7X2kNfaIuEx3YEWRbUAaxIln8iSOguNuKAkbsGYBH
JNZ1yuqZ2nmr86OJtGa965MWhxEmO8QfwIIWbeeT5M0IQB+W3RjvchIkm4OgBwe9
Ki48zei+RcqcjFhRePuHKUgZ7P9xnn9V2L/1FON8dINww1/7n24/f8xNpT0LBS80
6GUYlr2uwizIWgygQ4+atT2u+wRh13JwSV0sfnvwoLiPtTs6clq+K0jT385QFwRx
8WsiuhdqPtktew889Zpj2kGCB7ekak9phS/hLbSGe4YyG1751+lolDpffpsRE3NN
CNTwnXVNjJQ3X/CY58TAtjetiBSTkt2D/udnEOy2sTE/0Hpv4C+WJyBf7zGq5h1r
ik4BZVmYxnFwpTNp1JV+
=PTx+
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Mar_2012_19_08_29_+1100_pho1GGBkRJs.vGr+--
