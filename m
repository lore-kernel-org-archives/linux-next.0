From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kmemleak tree build failure
Date: Fri, 31 Jul 2009 12:00:05 +1000
Message-ID: <20090731120005.22f6af5b.sfr@canb.auug.org.au>
References: <20090730160012.5814e251.sfr@canb.auug.org.au>
	<1248944337.3376.5.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__31_Jul_2009_12_00_05_+1000_h3QLOiWlosqyge3B"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41536 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751200AbZGaCAN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Jul 2009 22:00:13 -0400
In-Reply-To: <1248944337.3376.5.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__31_Jul_2009_12_00_05_+1000_h3QLOiWlosqyge3B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

On Thu, 30 Jul 2009 09:58:57 +0100 Catalin Marinas <catalin.marinas@arm.com=
> wrote:
>
> Yes, it's missing this (I was only testing it with slub which has
> kmemleak.h included in its header file).
>=20
> I updated the kmemleak branch now. Thanks.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__31_Jul_2009_12_00_05_+1000_h3QLOiWlosqyge3B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpyUCUACgkQjjKRsyhoI8wCCgCgiMGb3FvlHOOIkG/mc02VWsrD
O9QAn22ZeIZjnEnLjtN0TxhvVVWP75gG
=bk6B
-----END PGP SIGNATURE-----

--Signature=_Fri__31_Jul_2009_12_00_05_+1000_h3QLOiWlosqyge3B--
