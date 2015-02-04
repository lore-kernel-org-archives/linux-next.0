From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Update for drm-intel.git branches
Date: Wed, 4 Feb 2015 23:12:11 +1100
Message-ID: <20150204231211.56a8d446@canb.auug.org.au>
References: <CAKMK7uHhCVaODBoi_uSWt7eXe6P04YvwT9XboobaWUQ9VxPBVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4=51TMnByFXzP51p05TXWY1"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52111 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753195AbbBDMMS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2015 07:12:18 -0500
In-Reply-To: <CAKMK7uHhCVaODBoi_uSWt7eXe6P04YvwT9XboobaWUQ9VxPBVQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-next <linux-next@vger.kernel.org>, "Nikula, Jani" <jani.nikula@linux.intel.com>

--Sig_/4=51TMnByFXzP51p05TXWY1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 3 Feb 2015 10:28:16 +0100 Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
>
> I've renamed the topic/core-stuff branch to topic/drm-misc in the
> drm-intel.git. I'll leave the old branch around until you've updated
> your scripts, please reply when you've done that.
>=20
> Another thing: Nowadays I have 2-3 special-purpose topic branches per
> kernel release, and at least with some of them I think it would be
> good to include them into linux-next. Would it be possible for your
> scripts to pick up the list of -next branches to pick up dynamically
> from some file? That would also simplify things with the
> for-linux-next branch, which is an alias to different branches
> depending upon where in the release cycle we are.

I'll get back to you next week about this, OK?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/4=51TMnByFXzP51p05TXWY1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0gygAAoJEMDTa8Ir7ZwVk0QQAIj9gSUh4JvQI7SlfWFvycyi
nUPYdSed5jH0TgImLG11G0OrbHDb+YOtPnTI8ea299YPKswEfbMku/FstAS6Dgv2
bt7Z+hpcVsfuDSfLoaK2tdp61IwhXPrq9jYrtbQQzwS1qXErm9Gj/RXaTz29w406
UJ+fNVRVpp1B7R5GJiXJXKmdFvDB/4VDhy7K3ywGt9X/rLXaQZne0xsCKF35ShBT
uOLiQYGpnoTSI3AB7LP789aSoHG3gdKJQmJ3KIoq4+Sbf33S6NcDWtc3JiE2Xixx
k+zBSecJXOWw3cURWxP3l7dCHjOSZSXWsg5M82cVj5gM8tYih6XgXeB7WdNalTL+
nrZSFVI1xaUot+o/NXvXWTScBy+DNvDWjbPmHeTVlJg3GcCxdGUmgGEuwuDcj7ls
qTiZMANeibGRbfcpCatjDUB5rWgS0H5j+xwIzJlJpzgBHmc4prx4wWYn0647e0dl
hDx0beXmnM5kqAW3YF4A2VTn6Pb8r6678Odd7lXMJKhChibK6bYpUdtpga04HcFD
BRi0wcUyqZ+fr89iz64ElYJzCoRC2chga2KQ7KuCm2Zkx0JKYNFnWbQc9FS86yPO
huj/Vpt0CTzrhAJogN6ei73+tMGexDst7z7CmyX4uH3FfIXDN9YEes9KIUMtuG83
j580umqQ2O37/tq1uq+P
=7DTp
-----END PGP SIGNATURE-----

--Sig_/4=51TMnByFXzP51p05TXWY1--
