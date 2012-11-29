From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with Linus' tree
Date: Thu, 29 Nov 2012 14:06:51 +1100
Message-ID: <20121129140651.33881363cc4870a87cf84adc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__29_Nov_2012_14_06_51_+1100_krrhcl/kpgpOqIYJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, "H. Peter Anvin" <hpa@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__29_Nov_2012_14_06_51_+1100_krrhcl/kpgpOqIYJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in
arch/x86/kernel/ptrace.c between commit cb57a2b4cff7 ("x86-32: Export
kernel_stack_pointer() for modules") from Linus' tree and commit
98dbec158343 ("context_tracking: New context tracking susbsystem") from
the rcu tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kernel/ptrace.c
index 974b67e,65b88a5..0000000
--- a/arch/x86/kernel/ptrace.c
+++ b/arch/x86/kernel/ptrace.c
@@@ -21,8 -21,7 +21,8 @@@
  #include <linux/signal.h>
  #include <linux/perf_event.h>
  #include <linux/hw_breakpoint.h>
- #include <linux/rcupdate.h>
 +#include <linux/module.h>
+ #include <linux/context_tracking.h>
 =20
  #include <asm/uaccess.h>
  #include <asm/pgtable.h>

--Signature=_Thu__29_Nov_2012_14_06_51_+1100_krrhcl/kpgpOqIYJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQttFLAAoJEECxmPOUX5FECEEQAJkeNP19+yIQ59QyEvfkIk/T
QbEDJVbb9uCP7Qlvp9nLb6MXK6xCatNDHs/wjMVLepbLYFzjPrU6+jAf1mmglHlE
MiE2ROKohEjmps9046SdGccRFpMjgcwZCfOAGodlSdjNmJp6ilHcCB9VRHV+Jj0I
BDihvcZ0FgtVV27ceDRUZaTu1CvgqotrrqvmABx38kc3pg3jBY2F0iGOPjeMOMAL
/vAm2zUty+/NfKz+a/qtD8mtmRck+qakE89iuJGHY0zLkx/WgP9//6KxK+VXvKiO
vskZPADoyox7yeW4vU1tHI2/JkhH71DL7VFiD05RvS9DlxgBd1G2kg6bEYKw4+lF
DfjlM8RoYysCPq67hZnsfeHIhMsoHr0gsuz/Ph0uNBNyd38u/Y2OPaYqWcjnlqIG
nQCO0RbLYPqd9Eg7sK9xVzlrGJDjetJ8ORLnwbgbqAqZOSsYjN6/urBcH989FqWD
1Q4EfxqVfjz7BB1tLEnCn5AzKEQDDb0VqtnTZ+bDJYSsIh27vhdkX6nUbPoy8gD3
hn9aM4HNvjdwWsrfnVK5RQA2uL918wIATneC5tXlkI1WtkHKmb5hVY0Wg+xTIpNa
dvgEtoSPuxQtnjfNQIC3BmdrjQ8cu7rddTdGKQXomhDQbG4LLhXUweB9lujtDEX7
Kkmw7vcVmsldL5qAEm79
=3k/D
-----END PGP SIGNATURE-----

--Signature=_Thu__29_Nov_2012_14_06_51_+1100_krrhcl/kpgpOqIYJ--
