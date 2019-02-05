From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the opp tree with the pm tree
Date: Wed, 6 Feb 2019 10:52:28 +1100
Message-ID: <20190206105228.42f7568c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fPxxs.qTiMFREPlX5SvVanf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Quentin Perret <quentin.perret@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/fPxxs.qTiMFREPlX5SvVanf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

Today's linux-next merge of the opp tree got a conflict in:

  drivers/cpufreq/scmi-cpufreq.c

between commit:

  5da7af9a94a7 ("cpufreq: scmi: Use auto-registration of thermal cooling de=
vice")

from the pm tree and commit:

  d7194c939ea3 ("cpufreq: scmi: Register an Energy Model")

from the opp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/cpufreq/scmi-cpufreq.c
index 66b633b48eb1,44449ff8ad47..000000000000
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@@ -11,6 -11,8 +11,7 @@@
  #include <linux/cpu.h>
  #include <linux/cpufreq.h>
  #include <linux/cpumask.h>
 -#include <linux/cpu_cooling.h>
+ #include <linux/energy_model.h>
  #include <linux/export.h>
  #include <linux/module.h>
  #include <linux/pm_opp.h>

--Sig_/fPxxs.qTiMFREPlX5SvVanf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxaIbwACgkQAVBC80lX
0GxXTAf+Mk4usPSHntcGU7c9TGd4/0fOgG+Nu89UrAnBixkkNvc/AJFV54BwUp4R
wSBypXHeBHPI668tEwAaY5FdzaqQPmOA5SjA/zmBEToDI85Jon3tQwQRQhcra1nh
GQwn+Y5JnIl4NVb410MEhbLM+/PKHpPg8P1sqKkQCkMUXLKNSx26dao9MnzccDu5
RiKFk8EQzQCiMhS+8bivWwP36fK2HGTIyGO8gbb34yBEyMI2bkBUmDEwByRldfJH
PgoUHwbsocDfXBmteI+DkeKVN23y9Qq/+eK9/g9Q+DzZkP5J7dHQ4ebvw2oXok0Z
6xIYXNal0XZsWfS9pzQJR3uvjrWTiw==
=lb1C
-----END PGP SIGNATURE-----

--Sig_/fPxxs.qTiMFREPlX5SvVanf--
