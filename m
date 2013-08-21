From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Thu, 22 Aug 2013 09:53:29 +1000
Message-ID: <20130822095329.212e1bde8fcd3515284819a1@canb.auug.org.au>
References: <20130821174522.3af60c89647476d2aab5f47c@canb.auug.org.au>
	<5214E23B.9060608@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__22_Aug_2013_09_53_29_+1000_/=5GuMAT1M_7Uaaf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:39173 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753309Ab3HUXxj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Aug 2013 19:53:39 -0400
In-Reply-To: <5214E23B.9060608@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__22_Aug_2013_09_53_29_+1000_/=5GuMAT1M_7Uaaf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, 21 Aug 2013 10:52:27 -0500 Dave Kleikamp <dave.kleikamp@oracle.com>=
 wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> There's another problem after the merge. Now that buf is passed into
> aio_run_iocb(), ki_iter is no longer needed. It's not getting
> initialized and causes an oops.
>=20
> Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>

OK, thanks, this will be applied to the aio tree merge today.

> - ---

BTW, your GPG clearsigning corrupts patches.  You can clearsign them
using the --not-dash-escaped option to gpg (I think).  I fixed this up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__22_Aug_2013_09_53_29_+1000_/=5GuMAT1M_7Uaaf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJSFVL9AAoJEECxmPOUX5FEnugQAJdIqAWZuP+7TOTaZNSfwyLT
aSKcljV3sRN0BsI+Hsx2xVI35dR2HASlWz2I6uD5sXoJqZ9JC5631e0XkkCFW18i
pcys24kXzv1qlH7e76FGC1sf+4Kql+AYQ8aEMzScyNqFVuwzWZL4cZJME8sGT3zq
1KPwwAlalmixCOqs8YSYCiPYSgjQhCCev/yYku+j/WUxeSHeKR2Vh90eiHImbrjJ
nSzg8QZbu7QTAYPCZohyPeVeuGcfoM9zvH1KYQ7CfIE7Q2ObvExapPuGgeOJZZtu
tmtSXyjEyJ+1i0hv3/mAuWQ0rViK8vtg0jauuyOh/kBJLiZlMYJ77qJRCWpZAUYH
yzK6zTwY01458+k8FFGf09xS39Ne4+EuCQYbukbxvM/S8igJf60gFO7fvB2GZFqc
9YQY8HlVSu/sqZt77HxpbrI6Wt8OQ/vNzoyrRcrty4b66Kqdg/ZAH1rD16rAg3O3
gPy20Lrr3lh25tChRenGQrr/SB4scD9JgyTbO4QHdhf8Euh9tcowrwnAzXT6uLjT
EGWpvMB/Sqq/BMuxLR0f9YoNBiDQKVLf7udpLo6xpaQKPMzvD/wlKZ2FUAOGkOtp
vfcyrOmrUJsQsho0fuO8t0AExBGtGG64L/SJQJAL94lvNm5g/pkkwcTpHLEwUAGg
63MaeaIOxk2nx1AFqGgN
=Svum
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Aug_2013_09_53_29_+1000_/=5GuMAT1M_7Uaaf--
