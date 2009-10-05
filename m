From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: suspend tree build failure
Date: Mon, 5 Oct 2009 16:00:44 +1100
Message-ID: <20091005160044.d95daf41.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__5_Oct_2009_16_00_44_+1100__R+P14YCRttQ3jGZ"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751810AbZJEFBc@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__5_Oct_2009_16_00_44_+1100__R+P14YCRttQ3jGZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/built-in.o: In function `.device_initialize':
(.text+0x95cf4): undefined reference to `.device_pm_init'
drivers/built-in.o: In function `.device_del':
(.text+0x95ec4): undefined reference to `.device_pm_remove'
drivers/built-in.o: In function `.device_add':
(.text+0x965cc): undefined reference to `.device_pm_add'

Caused by commit 1db698d9d2c5a2f4032e620dd18c75b61eaca2c8 ("PM: Introduce
PM links framework").  This build has CONFIG_PM not set.

I have used the suspend tree from next-20091002 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__5_Oct_2009_16_00_44_+1100__R+P14YCRttQ3jGZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrJfXwACgkQjjKRsyhoI8x8jACdF38y3DevM1FFyDKXKXT4+maN
4lcAn2M6qrACLoEmfdYrSnR5xh6unNH7
=PHDB
-----END PGP SIGNATURE-----

--Signature=_Mon__5_Oct_2009_16_00_44_+1100__R+P14YCRttQ3jGZ--
