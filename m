From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Date: Tue, 12 Jun 2018 11:23:10 +1000
Message-ID: <20180612112310.2d77e1c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/C/Fn3bIaRLIIzwXsLHngfG3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/C/Fn3bIaRLIIzwXsLHngfG3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/platform/x86/silead_dmi.c:84:21: error: variable 'chuwi_vi10_data' =
has initializer but incomplete type
 static const struct ts_dmi_data chuwi_vi10_data =3D {
                     ^~~~~~~~~~~
drivers/platform/x86/silead_dmi.c:85:3: error: 'const struct ts_dmi_data' h=
as no member named 'acpi_name'
  .acpi_name      =3D "MSSL0002:00",
   ^~~~~~~~~
drivers/platform/x86/silead_dmi.c:85:20: warning: excess elements in struct=
 initializer
  .acpi_name      =3D "MSSL0002:00",
                    ^~~~~~~~~~~~~
drivers/platform/x86/silead_dmi.c:85:20: note: (near initialization for 'ch=
uwi_vi10_data')
drivers/platform/x86/silead_dmi.c:86:3: error: 'const struct ts_dmi_data' h=
as no member named 'properties'
  .properties     =3D chuwi_vi10_props,
   ^~~~~~~~~~
drivers/platform/x86/silead_dmi.c:86:20: warning: excess elements in struct=
 initializer
  .properties     =3D chuwi_vi10_props,
                    ^~~~~~~~~~~~~~~~
drivers/platform/x86/silead_dmi.c:86:20: note: (near initialization for 'ch=
uwi_vi10_data')
drivers/platform/x86/silead_dmi.c:84:33: error: storage size of 'chuwi_vi10=
_data' isn't known
 static const struct ts_dmi_data chuwi_vi10_data =3D {
                                 ^~~~~~~~~~~~~~~

Caused by commit

  2da502a0aea7 ("platform/x86: silead_dmi: Add touchscreen info for the Chu=
wi Vi10 tablet")

I have reverted that commit for today.  More care please.

--=20
Cheers,
Stephen Rothwell

--Sig_/C/Fn3bIaRLIIzwXsLHngfG3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsfIH4ACgkQAVBC80lX
0GwfTAgApD0ZSlIZcTAo6Mw/WEyTBVMSwkxwZemzF7CZmLVIaiYh1fyD0Qy27B3Q
InZTlRu5MXcQQNvavq6VBi0CihGFEgP+8/bCGWM2yXeRYgAwdp7oSMnzmIUh+WcF
LawiheNrljzou++wBPXElX+eYceSz5Zj/lZYoL37r5Hrd1us0XeCV1LjGv7/sRwS
3GKr5klgzy/dgCBzcJ+AJaUfiA5Nrp4D5sh1yHYkAN4/Fd0lqFxuw17mFhpFOiei
bvqen0s8FxIEDCFVsrXAcQasf0ND7i4lH6fIDyKrZfjysmGk2CfZkHtT2f0RDTTK
+93lFAv739WY2A38Kf2KMnUClTrf4w==
=rwvg
-----END PGP SIGNATURE-----

--Sig_/C/Fn3bIaRLIIzwXsLHngfG3--
