From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH next] errno.h: define ERFKILL
Date: Fri, 05 Jun 2009 13:30:24 +0200
Message-ID: <1244201424.2653.3.camel@johannes.local>
References: <1244196408-12771-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-XuF1SHK8P2frEKS5GiHQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xc.sipsolutions.net ([83.246.72.84]:44330 "EHLO
	sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750949AbZFELa3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2009 07:30:29 -0400
In-Reply-To: <1244196408-12771-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linville@tuxdriver.com, linux-next@vger.kernel.org, davem@davemloft.net, ralf@linux-mips.org, kyle@mcmartin.ca, rth@twiddle.net, ink@jurassic.park.msu.ru


--=-XuF1SHK8P2frEKS5GiHQ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-06-05 at 14:06 +0400, Alexander Beregalov wrote:
> Commit 1f87f7d3 (cfg80211: add rfkill support) added ERFKILL
> to asm-generic/errno.h, but alpha, mips, parisc and sparc use
> their own numbering scheme and do not include asm-generic/errno.h.
> We need to add definition of ERFKILL for them.

Oh, I wasn't aware of that, thanks.

johannes

> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
>  arch/alpha/include/asm/errno.h  |    2 ++
>  arch/mips/include/asm/errno.h   |    2 ++
>  arch/parisc/include/asm/errno.h |    1 +
>  arch/sparc/include/asm/errno.h  |    2 ++
>  4 files changed, 7 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/alpha/include/asm/errno.h b/arch/alpha/include/asm/errn=
o.h
> index 69e2655..98099bd 100644
> --- a/arch/alpha/include/asm/errno.h
> +++ b/arch/alpha/include/asm/errno.h
> @@ -120,4 +120,6 @@
>  #define	EOWNERDEAD	136	/* Owner died */
>  #define	ENOTRECOVERABLE	137	/* State not recoverable */
> =20
> +#define	ERFKILL		138	/* Operation not possible due to RF-kill */
> +
>  #endif
> diff --git a/arch/mips/include/asm/errno.h b/arch/mips/include/asm/errno.=
h
> index 3c0d840..a0efc73 100644
> --- a/arch/mips/include/asm/errno.h
> +++ b/arch/mips/include/asm/errno.h
> @@ -119,6 +119,8 @@
>  #define	EOWNERDEAD	165	/* Owner died */
>  #define	ENOTRECOVERABLE	166	/* State not recoverable */
> =20
> +#define	ERFKILL		167	/* Operation not possible due to RF-kill */
> +
>  #define EDQUOT		1133	/* Quota exceeded */
> =20
>  #ifdef __KERNEL__
> diff --git a/arch/parisc/include/asm/errno.h b/arch/parisc/include/asm/er=
rno.h
> index e2f3ddc..9992abd 100644
> --- a/arch/parisc/include/asm/errno.h
> +++ b/arch/parisc/include/asm/errno.h
> @@ -120,5 +120,6 @@
>  #define EOWNERDEAD	254	/* Owner died */
>  #define ENOTRECOVERABLE	255	/* State not recoverable */
> =20
> +#define	ERFKILL		256	/* Operation not possible due to RF-kill */
> =20
>  #endif
> diff --git a/arch/sparc/include/asm/errno.h b/arch/sparc/include/asm/errn=
o.h
> index a9ef172..4e2bc49 100644
> --- a/arch/sparc/include/asm/errno.h
> +++ b/arch/sparc/include/asm/errno.h
> @@ -110,4 +110,6 @@
>  #define	EOWNERDEAD	132	/* Owner died */
>  #define	ENOTRECOVERABLE	133	/* State not recoverable */
> =20
> +#define	ERFKILL		134	/* Operation not possible due to RF-kill */
> +
>  #endif

--=-XuF1SHK8P2frEKS5GiHQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJKKQHMAAoJEODzc/N7+Qmax/AP/Apf5N5y4kLfulp/IGXkhQhc
dtzT7Jeq3J7cWzJC9K0QGQUsp7jY0HwS9btacy9UD+xxKQ1MkePsft8t0xXZYDFj
TXGSoDxCJz6LjA+h90E42wifoeqlawV7x+wd0CK55FFMzhBuUVBHuhbV6IYpaCrq
jVGlM1f+ayhm0n8+zS8a4Ao+j6txNrfnnDTk8LEtR8SV2gwZ1f/JADzqxTAwI5Fc
5uVBqF47vi2X7sBomX3oGkJqePQJyOFTbJcT9oOOVpZJuC27HiQ8j4IVMIpegj4v
TAylCbK6kCE/xUa+x7QiIRkrWIXOMIYf+9z96fBMC0shL9QZASNNDNL2JJCwg7N0
0bVbohjaEF0043mVulM+2sYFYhGqFkVqBSB/YIyRiajH3nB2fWPdpVZbx91eP+5O
Kj+PcZ0m8OFUJbVocHgM5YUlTFBeGefPwEB4vWeWt/cA80zojy4DZriy9nbpGH1q
Bs7D32dvZ4bt1rdGSIpjh7F71mEK8VP28ZycxJmkkHAV8TdYabLdamimd9jtyvIC
1Xi43tafZYwVrhrI3cPnFA1ITcjQNzuvrMlhNx2liEf0Gh9Uj2GNOPnlY0X2oE6e
JPGyh5X1fA5nlNVm6G2W51Ame4gazoz4Zbfa4PJ9UX/WntOiY0KLkQACxlFL5BIf
AdKDRMoiB2zq1FISZ17r
=JTUj
-----END PGP SIGNATURE-----

--=-XuF1SHK8P2frEKS5GiHQ--
