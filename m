From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc build failure
Date: Thu, 28 Aug 2008 17:12:46 +1000
Message-ID: <20080828171246.979a97b2.sfr@canb.auug.org.au>
References: <20080828165149.4e6089e8.sfr@canb.auug.org.au>
	<20080828065754.GC16186@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_Aug_2008_17_12_46_+1000_9vwY_DhN6O+GNLQb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41237 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753197AbYH1HM6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 03:12:58 -0400
In-Reply-To: <20080828065754.GC16186@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>

--Signature=_Thu__28_Aug_2008_17_12_46_+1000_9vwY_DhN6O+GNLQb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Thu, 28 Aug 2008 08:57:54 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> thanks - the patch below should fix all those architectures. (there's=20
> also s390)

Thanks, saves me writing the patch :-)

Actually, it appears that s390 allmodconfig doesn't build any modules
that require nr_irqs.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__28_Aug_2008_17_12_46_+1000_9vwY_DhN6O+GNLQb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki2T+4ACgkQjjKRsyhoI8wg+ACglvMYjQVf9rJT7Z/C2ZB7IjMb
eCcAniZbe4Pi8mPt8m8v1B1JYYCQFegj
=DwyA
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Aug_2008_17_12_46_+1000_9vwY_DhN6O+GNLQb--
