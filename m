From: Geoff Levand <geoffrey.levand@am.sony.com>
Subject: [patch] powerpc/pasemi: Fix no SMP build error
Date: Fri, 17 Apr 2009 09:36:37 -0700
Message-ID: <49E8B015.7060808@am.sony.com>
References: <1239285094.5188.65.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1761273AbZDQQg7@vger.kernel.org>
In-Reply-To: <1239285094.5188.65.camel@subratamodak.linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Mackerras <paulus@samba.org>
Cc: subrata@linux.vnet.ibm.com, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: linux-next.vger.kernel.org

A non-SMP version of smp_send_stop() is now included in smp.h.
Remove the unneeded def in the pasemi setup.c.

=46ixes build errors like these when CONFIG_SMP=3Dn:

  arch/powerpc/platforms/pasemi/setup.c:48: error: redefinition of =E2=80=
=98smp_send_stop=E2=80=99
  include/linux/smp.h:125: error: previous definition of 'smp_send_stop=
' was here

Reported-by: subrata@linux.vnet.ibm.com
Signed-off-by: Geoff Levand <geoffrey.levand@am.sony.com>
---

diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platf=
orms/pasemi/setup.c
index c64fb5b..153051e 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -44,10 +44,6 @@
=20
 #include "pasemi.h"
=20
-#if !defined(CONFIG_SMP)
-static void smp_send_stop(void) {}
-#endif
-
 /* SDC reset register, must be pre-mapped at reset time */
 static void __iomem *reset_reg;
=20
