From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Sat, 16 Jul 2011 23:15:11 +1000
Message-ID: <20110716231511.394534c7936a65d70a0a3ce6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__16_Jul_2011_23_15_11_+1000_V_+713.7HA6AS55L"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58432 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755053Ab1GPNPT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 16 Jul 2011 09:15:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

--Signature=_Sat__16_Jul_2011_23_15_11_+1000_V_+713.7HA6AS55L
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (powerpc ppc64_def=
config)
failed like this:

drivers/video/Kconfig:36:error: recursive dependency detected!
drivers/video/Kconfig:36:	symbol FB is selected by DRM_KMS_HELPER
drivers/gpu/drm/Kconfig:22:	symbol DRM_KMS_HELPER is selected by DRM_PSB
drivers/staging/gma500/Kconfig:1:	symbol DRM_PSB depends on ACPI_VIDEO

Caused by commit 66dca5178c70 ("gma500: Fix dependencies").

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__16_Jul_2011_23_15_11_+1000_V_+713.7HA6AS55L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOIY7fAAoJEDMEi1NhKgbsu2UH/05ThFD7XJbGKGLW/cXJZ0cS
UxQcKAZF70Gaos+kJjfVde+FwusKo2EsgutWJgXW4EbyTWfipXjD/+bdZLd8JHHr
HIygr3ktaOHBvOaISrYD2W/NjIBZ/DOsCXNLwjCZgho/PP7B5JcWa/7sgUzdpdcS
gOJS7Edso6W3PYUewGLmCxTITcCMD1IAouliWWeoQGbV3bMr7Xr2OEGqv/3gYyhu
gVvpQ+E8h+4kiwzXsOmIy313c0Q/DaHmcgB0mSKH1XzAjZqvh/L27MaylZ5iPS3O
JXb8/8NEOjREGusofFD70d9UNfyhyp3NzsyqBjWPYPZJvUDmvj3QdiaKaibWdzw=
=w5Ux
-----END PGP SIGNATURE-----

--Signature=_Sat__16_Jul_2011_23_15_11_+1000_V_+713.7HA6AS55L--
