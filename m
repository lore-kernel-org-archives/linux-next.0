From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the apparmor tree with Linus' tree
Date: Thu, 11 Apr 2019 12:24:08 +1000
Message-ID: <20190411122408.7b35cf74@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Q/8EpOQ53.R7ce447/f/weu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Johansen <john.johansen@canonical.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Chris Coulson <chris.coulson@canonical.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Q/8EpOQ53.R7ce447/f/weu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the apparmor tree got a conflict in:

  security/apparmor/lsm.c

between commit:

  e33c1b992377 ("apparmor: Restore Y/N in /sys for apparmor's "enabled"")

from Linus' tree and commit:

  876dd866c084 ("apparmor: Initial implementation of raw policy blob compre=
ssion")

from the apparmor tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc security/apparmor/lsm.c
index 87500bde5a92,e1e9c3c01cd3..000000000000
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@@ -25,8 -25,8 +25,9 @@@
  #include <linux/user_namespace.h>
  #include <linux/netfilter_ipv4.h>
  #include <linux/netfilter_ipv6.h>
+ #include <linux/zlib.h>
  #include <net/sock.h>
 +#include <uapi/linux/mount.h>
 =20
  #include "include/apparmor.h"
  #include "include/apparmorfs.h"
@@@ -1420,46 -1424,37 +1436,77 @@@ static int param_get_aauint(char *buffe
  	return param_get_uint(buffer, kp);
  }
 =20
 +/* Can only be set before AppArmor is initialized (i.e. on boot cmdline).=
 */
 +static int param_set_aaintbool(const char *val, const struct kernel_param=
 *kp)
 +{
 +	struct kernel_param kp_local;
 +	bool value;
 +	int error;
 +
 +	if (apparmor_initialized)
 +		return -EPERM;
 +
 +	/* Create local copy, with arg pointing to bool type. */
 +	value =3D !!*((int *)kp->arg);
 +	memcpy(&kp_local, kp, sizeof(kp_local));
 +	kp_local.arg =3D &value;
 +
 +	error =3D param_set_bool(val, &kp_local);
 +	if (!error)
 +		*((int *)kp->arg) =3D *((bool *)kp_local.arg);
 +	return error;
 +}
 +
 +/*
 + * To avoid changing /sys/module/apparmor/parameters/enabled from Y/N to
 + * 1/0, this converts the "int that is actually bool" back to bool for
 + * display in the /sys filesystem, while keeping it "int" for the LSM
 + * infrastructure.
 + */
 +static int param_get_aaintbool(char *buffer, const struct kernel_param *k=
p)
 +{
 +	struct kernel_param kp_local;
 +	bool value;
 +
 +	/* Create local copy, with arg pointing to bool type. */
 +	value =3D !!*((int *)kp->arg);
 +	memcpy(&kp_local, kp, sizeof(kp_local));
 +	kp_local.arg =3D &value;
 +
 +	return param_get_bool(buffer, &kp_local);
 +}
 +
+ static int param_set_aacompressionlevel(const char *val,
+ 					const struct kernel_param *kp)
+ {
+ 	int error;
+=20
+ 	if (!apparmor_enabled)
+ 		return -EINVAL;
+ 	if (apparmor_initialized)
+ 		return -EPERM;
+=20
+ 	error =3D param_set_int(val, kp);
+=20
+ 	aa_g_rawdata_compression_level =3D clamp(aa_g_rawdata_compression_level,
+ 					       Z_NO_COMPRESSION,
+ 					       Z_BEST_COMPRESSION);
+ 	pr_info("AppArmor: policy rawdata compression level set to %u\n",
+ 		aa_g_rawdata_compression_level);
+=20
+ 	return error;
+ }
+=20
+ static int param_get_aacompressionlevel(char *buffer,
+ 					const struct kernel_param *kp)
+ {
+ 	if (!apparmor_enabled)
+ 		return -EINVAL;
+ 	if (apparmor_initialized && !policy_view_capable(NULL))
+ 		return -EPERM;
+ 	return param_get_int(buffer, kp);
+ }
+=20
  static int param_get_audit(char *buffer, const struct kernel_param *kp)
  {
  	if (!apparmor_enabled)

--Sig_/Q/8EpOQ53.R7ce447/f/weu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyupUgACgkQAVBC80lX
0Gx45gf/VB40HfJVDnmWY+s10LavRxSl+A0EbfHr4qU6PsC+vjkxxO62tWWLzcVZ
SoGk/RhQ6zFZ6v7A8DJ6zFPKt+SyzKu8z4wvm5qaT+p5Tixjm1AzdL9re0FUEz7u
QH9q5eGM7HiS1phlanEJVscIm1wtRkXZo8HYmWKOh8ukAEF5Jv0T5OZ5uGurFeUq
/xelZvOpWqljZrYiUFwPqoMD7loqiH0kYLJTTgpXVlBGgdlbV6Qm3H8oOgEMO6No
j1marxDD2H2VtZsuO6vg94Uf3MjNXjFhJ2SHTpGWKG4TQQ2oxorYfq+FvyAqGhD5
Da4gRfEZutuLBQCmR8M6FC+AdDcIyA==
=HLfv
-----END PGP SIGNATURE-----

--Sig_/Q/8EpOQ53.R7ce447/f/weu--
