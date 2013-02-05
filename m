From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] init: fix name of root device in /proc/mounts
Date: Wed, 6 Feb 2013 08:45:46 +1100
Message-ID: <20130206084546.9a7adb093c14330a8e96147e@canb.auug.org.au>
References: <1360094867-28009-1-git-send-email-w.d.hubbs@gmail.com>
	<20130205201035.GA28045@linux1>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__6_Feb_2013_08_45_46_+1100_vY3BFPdgAQMiArmK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:34926 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756690Ab3BEVpz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Feb 2013 16:45:55 -0500
In-Reply-To: <20130205201035.GA28045@linux1>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: William Hubbs <w.d.hubbs@gmail.com>
Cc: linux-next@vger.kernel.org, mpagano@gentoo.org

--Signature=_Wed__6_Feb_2013_08_45_46_+1100_vY3BFPdgAQMiArmK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi William,

On Tue, 5 Feb 2013 14:10:35 -0600 William Hubbs <w.d.hubbs@gmail.com> wrote:
>
> this patch was originally sent to linux-kernel, but I was told it might
> be better to send it to this list since this section of the kernel does
> not have a specific maintainer.

You were misinformed.  The linux-next list is for discussion of things
about the linux-next releases and not for general development.
linux-kernel was the right place.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__6_Feb_2013_08_45_46_+1100_vY3BFPdgAQMiArmK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJREX2KAAoJEECxmPOUX5FEsp0P/2d2WSqeO1iuLMeVTHwlKxFR
tkPRNueLeYUofTn2IXtobN2OGPHai7r7zWXBFFT3/a1Xl028deNZPqTdpenOmDWC
yOIAmAmmGysoJyRehM+BF+sLkyCz4UrhnYcf2o+PVVcZYAlACO4U1QYAs7kI7Wfi
XJAGm4XHXL840auQ4dTLIJOPpUa53POIOMp/JNbBajCDfA0IiAWSLFXuKlrZdHpy
E83NUZ4Ejrt1tzNQ4jdVegkxduGrEyxJ3gr2+Aq6PqgHf6zxcEYQk/7Eo37Pt7wx
HrtYiJ9o03sa978jBcWieE+k99KIA/a7uKMkcLP2FKltciEAzqknkgSkK16CMLtl
AlGnWc4RvVQAj5LzkKE/zaImtT4+2au6S94SaDoCzDcdHf/FewHFZLNyS6mZ3MaK
jzTFo4t/e8gpsTBD7Vac/6MMgk6M5USY/RAclLSSiE8bu6HuwaOswF0+SnyKRQV9
kTTmnyNE0DwZIQ5SLXozxjGvVkllkCWq4PwwdgH4oWPtZ1S5eWPNhKHa92ZcykcZ
CMC0d1ZK5VEsKzU8O0poAr/CxLHzpxSG8ukvGNjsZI8j3/bTVbcEzmZSdvw8FtMu
fdFIOc9qzlIGyf3nzKfotsh6hQ/Q/4l/WrIlR1fZBOVCE2J0qiE64p5Vj4rTXj96
/6pvn8Kp7yjN0ZkG6Vww
=SABX
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Feb_2013_08_45_46_+1100_vY3BFPdgAQMiArmK--
