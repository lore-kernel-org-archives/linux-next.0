From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the wireless-drivers-next
 tree
Date: Wed, 27 May 2015 12:03:58 +1000
Message-ID: <20150527120358.47b88a4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fnwYkBcjEgIr.hGKrSIT=DB"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37568 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751517AbbE0CER (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 May 2015 22:04:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Fu, Zhonghui" <zhonghui.fu@linux.intel.com>, Arend van Spriel <arend@broadcom.com>

--Sig_/fnwYkBcjEgIr.hGKrSIT=DB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kalle,

After merging the wireless-drivers-next tree, today's linux-next build
(arm multi_v7_defconfig) failed like this:

drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c: In function 'brcmf_ops_sd=
io_probe':
drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c:1139:7: error: dereferenci=
ng pointer to incomplete type
   adev->flags.power_manageable =3D 0;
       ^

Caused by commit f0992ace680c ("brcmfmac: prohibit ACPI power
management for brcmfmac driver").

I have used the wireless-drivers-next from next-20150526 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/fnwYkBcjEgIr.hGKrSIT=DB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZSYeAAoJEMDTa8Ir7ZwVPBgP/RU+2xryej868CRIRsIUYon+
qwjXsLKYJCPyPSYZ/JPx/phQfEWuRBR7FNuYqQypSmJonT6DeS9lxuBrap8mv2yF
7VQzYKzZrQUuOVuY3Z80+Lo0rj4CeOcnabWVz4G18D0zQUiqa4woDjxAD+Ad6vv+
xB5S0kBo5xHC0nP0X5ZEEDaHBhnLma6qCj9Fq71Nau/m4EUroRMz5SosgbjAQn6M
s5Wl/tDF/Lm1GdYVR3X7GjFjMbzBPkObF6CnTOFRciailBIS00eAk2DL7CeH2BuD
+ggGSyA9JuqcOSEvBNzWgyEpI9/9UU6pE6ksyG0S2EKdI1+32+hMWW36ZZGFO/TF
7KznO/ElK+cN3/bqNF9NnswYfNn6nultXM6Ru6YL5v+z/FpY/VWUoYL9b4u6P7ky
oHRWTkMKPjctIX6FSFGou6DP/GqV3fISQBBLc3rrbXKHJb6ApYVkzE0d8975WIIU
pPWhbSNN9IRIgvae4nKpgEEze1TmZm2TSX31YIIy8f+Rqzrum29kB5WV1o4hK0Pg
Cvddqs5vHdatLTTqnntO61wFp+TQjnN4X8T1KQUzZyncmCFYt5Lybqg44FK4I5pA
euFgwI4Vgj2nGRnUxkW7YNvuSa0vw6dmi8ZjhCghd64jjd3UiZB/Wz7URwZt12l9
3IXjVWtnuriNd61/mISb
=XwXe
-----END PGP SIGNATURE-----

--Sig_/fnwYkBcjEgIr.hGKrSIT=DB--
