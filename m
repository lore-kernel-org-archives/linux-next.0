From: Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH] powerpc: pseries/dtl.c should include asm/firmware.h
Date: Wed, 15 Apr 2009 09:45:46 +1000
Message-ID: <1239752746.198193.893152536767.1.gpush@pingu>
References: <<49D3419E.7000005@in.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1889370870=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
In-Reply-To: <<49D3419E.7000005@in.ibm.com>>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Mime-version: 1.0
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Neuling <mikey@neuling.org>, Subrata Modak <subrata@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--===============1889370870==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Sachin Sant <sachinp@in.ibm.com>

A randconfig build on powerpc failed with:

dtl.c: In function =E2=80=98dtl_init=E2=80=99:
dtl.c:238: error: implicit declaration of function =E2=80=98firmware_has_=
feature=E2=80=99
dtl.c:238: error: =E2=80=98FW_FEATURE_SPLPAR=E2=80=99 undeclared (first u=
se in this function)

- We need firmware.h for these definitions.

Signed-off-by: Sachin Sant <sachinp@in.ibm.com>
Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 arch/powerpc/platforms/pseries/dtl.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platform=
s/pseries/dtl.c
index fafcaa0..ab69925 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -25,6 +25,7 @@
 #include <asm/smp.h>
 #include <asm/system.h>
 #include <asm/uaccess.h>
+#include <asm/firmware.h>
=20
 #include "plpar_wrappers.h"
=20

--===============1889370870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@ozlabs.org
https://ozlabs.org/mailman/listinfo/linuxppc-dev
--===============1889370870==--
