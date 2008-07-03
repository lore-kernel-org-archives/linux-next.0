From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Fw: [linuxtv-commits] [hg:v4l-dvb] uvc: Fix compilation
 breakage for the other drivers, if uvc is selected
Date: Thu, 3 Jul 2008 14:45:22 +1000
Message-ID: <20080703144522.fb806316.sfr@canb.auug.org.au>
References: <20080702090643.60b8ce47@gaivota>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_14_45_22_+1000_fYWG2F8RqPc7_Rtg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52775 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751959AbYGCEp1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 00:45:27 -0400
In-Reply-To: <20080702090643.60b8ce47@gaivota>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__3_Jul_2008_14_45_22_+1000_fYWG2F8RqPc7_Rtg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Wed, 2 Jul 2008 09:06:43 -0300 Mauro Carvalho Chehab <mchehab@infradead.=
org> wrote:
>
> I noticed a bad thing on a patch that I've added to linux-next. Basically=
, if
> you select uvc, it will drop some other drivers. So, your today build is
> probably incomplete.
>=20
> I'm adding this patch to my linux-next tree.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_14_45_22_+1000_fYWG2F8RqPc7_Rtg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsWWIACgkQjjKRsyhoI8wmjwCfbaA61rZ6ud+HfF3ZK4drsdb9
1m8AoLBUzoEWx6JQiZbLvgeD+SC9/hZe
=Mn/7
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_14_45_22_+1000_fYWG2F8RqPc7_Rtg--
