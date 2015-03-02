From: NeilBrown <neilb@suse.de>
Subject: Re: linux-next: build failure after merge of the md tree
Date: Mon, 2 Mar 2015 17:03:45 +1100
Message-ID: <20150302170345.742add96@notabene.brown>
References: <20150302165057.29087a08@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/jh9vzJjS8IHcwq2I8WkVzh7"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33733 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750870AbbCBGD5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Mar 2015 01:03:57 -0500
In-Reply-To: <20150302165057.29087a08@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/jh9vzJjS8IHcwq2I8WkVzh7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Mar 2015 16:50:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au>
wrote:

> Hi Neil,
>=20
> After merging the md tree, today's linux-next build (i386 defconfig)
> failed like this:
>=20
> drivers/built-in.o: In function `bitmap_read_sb':
> bitmap.c:(.text+0x29cd52): undefined reference to `__udivdi3'
>=20
> Probably caused by commit b97e92574c0b ("Use separate bitmaps for each
> nodes in the cluster") or commit f9209a323547 ("bitmap_create returns
> bitmap pointer").
>=20
> I reverted the md tree for today (because I am not sure how to fix
> this and reverting less became messy).
>=20

Thanks.
I think
+               bm_blocks =3D DIV_ROUND_UP(bm_blocks, 4096);

needs DIV_ROUND_UP_SECTOR_T()


The first patch you identified adds that line.  The second relocates it.

I've queued a fix-up for now, but I might get it merged back into the
original...


Thanks,
NeilBrown

--Sig_/jh9vzJjS8IHcwq2I8WkVzh7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVPP9QTnsnt1WYoG5AQLw3xAAm2Q3WUUEsLvFQ3q1AOCD3qMNiVD3Lojm
Bd/8mOJdhbb9CyAcehicKNp9cqBUw1rt6GJYRuzu4WwEI/N+3WwSRvEvl9DwLl16
oQjJCopF9WmSXPqdOANTQ0kLImg2udkfvrBcG6GLRr8LtFlBhocoi/pY+GXA2sVM
lfLxPhRx9JZUZFsSrD/n5fLXLovez0cPvGGN/aGZ8a/9P+CK6gZzBV8f+oqzJYKb
SKWAEI+A0itJ4uXvEh2PLfjxDxs/mKyZHtKS7rkAs6IIfD/2zNxbTpOU0vCo4ktO
5/bKkOlnSAO7a4yAJv83lL1Y7duZCFpX8mVQhsFhwwdWiipHoNYNvjQVCdi+qoC9
aZbCvpbsqSE3RnV30py6TtqGgms8WoEyhgCG24PD4EVsG25wWK8ajelUuZ6U3lOM
yNs2v9TB2ti7+SBbBDLiy2q24KBmUxq7TT/VVbIXzHAqbJYm7uuG4pWGDN7ZhH56
HWYRG8p4k6GwZb34i6QFaO2PJ9xj5BsHKlpl8oC+6CFGeN3xOW0QRTkU+Cpi+32t
Clm72G6VNcXo6DuV5IhZgaKCmigsx5AqyH8ACXjGuJMpXSlHpXAtfSj+UCm4SUe3
iMZZpoqLe2iLw2Bc31tvekrBidOnNjBOtxdsd0IoIMZB3jLrfm9+ARPX64BBDnZD
dyjYF57wpUk=
=wM7X
-----END PGP SIGNATURE-----

--Sig_/jh9vzJjS8IHcwq2I8WkVzh7--
