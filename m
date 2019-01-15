From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the pm tree
Date: Wed, 16 Jan 2019 07:55:40 +1100
Message-ID: <20190116075540.78cff44e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ewciBN5rwJ4y3iGwf7XWmyg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sinan Kaya <okaya@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ewciBN5rwJ4y3iGwf7XWmyg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[I am experimenting with checking the Fixes tags in commits in linux-next.
Please let me know if you think I am being too strict.]

Hi Rafael,

Commits

  62b33d57c534 ("drivers: thermal: int340x_thermal: Make PCI dependency exp=
licit")
  cd793ab22a93 ("x86/intel/lpss: Make PCI dependency explicit")
  42ac19e7b81e ("ACPI: EC: Look for ECDT EC after calling acpi_load_tables(=
)")
  6c29b81b5695 ("platform/x86: apple-gmux: Make PCI dependency explicit")
  34783dc0182a ("platform/x86: intel_pmc: Make PCI dependency explicit")
  704658d1d3ae ("platform/x86: intel_ips: make PCI dependency explicit")
  5df37f3a1aa9 ("vga-switcheroo: make PCI dependency explicit")
  da1df6ee4296 ("ata: pata_acpi: Make PCI dependency explicit")
  ce97a22a596b ("ACPI / LPSS: Make PCI dependency explicit")

Have malformed Fixes tags:

There should be double quotes around the commit subject.

--=20
Cheers,
Stephen Rothwell

--Sig_/ewciBN5rwJ4y3iGwf7XWmyg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+SMwACgkQAVBC80lX
0GxIpAf/bcC3N9uGGIXP1nw6Of8LKN18uMRPIERRNs/1xJtbMzsJf4jzT7vFITlm
VCbNgu1nI3yckOxz7g2Bt3k2/3DR+K21ck5pRGRBk9I8vfVp1/hM5f4k/NOreqAO
gWXhCMOjtsy/sm9BzRJfT3k0NPBpXUZ6WE25MTlpCjIQwV9vhyV0f5pXnrS082Qw
QSQem6GzhIyDJLkrz1JZWmh/mq83+oRJOIu7iO9YPRzGSRiq57jHFHeNWbAEJLqD
WwePv8qal6zdp0wHRKAec+YLdo0PaBG2taPXSqlha3jL4vtSCKpT+2Gevy2Kc0pm
gdZNSNRXa8LzuFKDA2PhovQkqueYMw==
=4Ona
-----END PGP SIGNATURE-----

--Sig_/ewciBN5rwJ4y3iGwf7XWmyg--
