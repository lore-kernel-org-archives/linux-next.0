From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the
 wireless-drivers-next tree
Date: Thu, 28 May 2015 11:38:05 +1000
Message-ID: <20150528113805.099cdc72@canb.auug.org.au>
References: <20150527120358.47b88a4b@canb.auug.org.au>
	<55658993.8060709@broadcom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hBYLMlIUlcxLQVZkCvbembT"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45297 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751185AbbE1BiL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 May 2015 21:38:11 -0400
In-Reply-To: <55658993.8060709@broadcom.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arend van Spriel <arend@broadcom.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Fu, Zhonghui" <zhonghui.fu@linux.intel.com>

--Sig_/hBYLMlIUlcxLQVZkCvbembT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arend,

On Wed, 27 May 2015 11:08:35 +0200 Arend van Spriel <arend@broadcom.com> wr=
ote:
>
> On 05/27/15 04:03, Stephen Rothwell wrote:
> >
> > After merging the wireless-drivers-next tree, today's linux-next build
> > (arm multi_v7_defconfig) failed like this:
> >
> > drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c: In function 'brcmf_op=
s_sdio_probe':
> > drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c:1139:7: error: derefer=
encing pointer to incomplete type
> >     adev->flags.power_manageable =3D 0;
> >         ^
> >
> > Caused by commit f0992ace680c ("brcmfmac: prohibit ACPI power
> > management for brcmfmac driver").
> >
> > I have used the wireless-drivers-next from next-20150526 for today.
>=20
> Crap. struct acpi_device details are only known when CONFIG_ACPI is set.=
=20
> The attached patch should fix the issue.

I put that into linux-next today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/hBYLMlIUlcxLQVZkCvbembT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZnGBAAoJEMDTa8Ir7ZwVyoEQAJJSWmVBhixHh2ypeyApa7CD
QIa6AYKqxbloFDttq1QssO78SdHoN8CKtY+zeGKPb6kTG077BLa3NhngBegP0r3a
WRMJadkeLG61ApuO7y4ry0/wV11XVVA3vC5Twyf1mJho/ZHjxfl7XCXmTGXTwaZ4
A/rfcoUxDZswljny2XZIOXTTK+L7xC42hkC+UjiCgI7jb6jj+aNskapU+g5ixmLf
kI1gyW/SxbLaYV70+l3dproNInHM5WL2ddQLq7LpndzuYnaX/CZzz0gmuB9c/8Ib
lspAuKSXiauNLW0ZszhE0sTHRhgLf5JU8/PLVHmFoNiZetKX+UPXep5R1jKknXiB
2UPWOodNxtqcoZjnPUG9LvHAi1fKh3YddUbpLpG0ZnplapB6oCWku/0VIcxbTEQF
rdeA3zRYEYA0yy6ytcNLik1vbvbdcAwK5z/mWfkGtK9a1+0iOrO/CS0BwFbvrR3K
qiUGjbq8R++rqpZIF59Uqq17qw+TCBfSWqFZU5CUv3gceMexsz6270QyPSkbUwIn
YSUS4ReKZVVEwI0g1sPP4NtubaHfvAuWH64P2fCV4SCBBMq2i4tGKqQPN8oBIAmT
B/eZP59eYP/ZHp38MlT2hL4rkUlezzQrWokpNTF1HGCykW6dBhml7TiIdIv+pMYW
uKPvycVXLIxE9/z6Cbk1
=6NgJ
-----END PGP SIGNATURE-----

--Sig_/hBYLMlIUlcxLQVZkCvbembT--
