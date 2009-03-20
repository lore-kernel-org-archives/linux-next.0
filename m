From: Alessio Igor Bogani <abogani@texware.it>
Subject: [PATCH] Staging: comedi: Fix an other build problem
Date: Fri, 20 Mar 2009 17:37:52 +0100
Message-ID: <1237567072-30463-1-git-send-email-abogani@texware.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f169.google.com ([209.85.218.169]:36771 "EHLO
	mail-bw0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753075AbZCTQiA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2009 12:38:00 -0400
Received: by bwz17 with SMTP id 17so961989bwz.37
        for <linux-next@vger.kernel.org>; Fri, 20 Mar 2009 09:37:57 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-next <linux-next@vger.kernel.org>
Cc: Alessio Igor Bogani <abogani@texware.it>

[...]
 CC [M]  drivers/staging/comedi/comedi_compat32.o
 drivers/staging/comedi/comedi_compat32.c: In function =E2=80=98raw_ioc=
tl=E2=80=99:
 drivers/staging/comedi/comedi_compat32.c:451: error: =E2=80=98comedi32=
_chaninfo=E2=80=99 undeclared (first use in this function)
 drivers/staging/comedi/comedi_compat32.c:451: error: (Each undeclared =
identifier is reported only once
 drivers/staging/comedi/comedi_compat32.c:451: error: for each function=
 it appears in.)
 drivers/staging/comedi/comedi_compat32.c:454: error: expected expressi=
on before =E2=80=98)=E2=80=99 token
 drivers/staging/comedi/comedi_compat32.c:454: error: expected expressi=
on before =E2=80=98)=E2=80=99 token
 drivers/staging/comedi/comedi_compat32.c:457: error: expected expressi=
on before =E2=80=98)=E2=80=99 token
 drivers/staging/comedi/comedi_compat32.c:457: error: expected expressi=
on before =E2=80=98)=E2=80=99 token
 drivers/staging/comedi/comedi_compat32.c:460: error: expected expressi=
on before =E2=80=98)=E2=80=99 token
 drivers/staging/comedi/comedi_compat32.c:460: error: expected expressi=
on before =E2=80=98)=E2=80=99 token
 drivers/staging/comedi/comedi_compat32.c:463: error: expected expressi=
on before =E2=80=98)=E2=80=99 token
 drivers/staging/comedi/comedi_compat32.c:463: error: expected expressi=
on before =E2=80=98)=E2=80=99 token
 drivers/staging/comedi/comedi_compat32.c:466: error: expected expressi=
on before =E2=80=98)=E2=80=99 token
 drivers/staging/comedi/comedi_compat32.c:466: error: expected expressi=
on before =E2=80=98)=E2=80=99 token
 [...]

Signed-off-by: Alessio Igor Bogani <abogani@texware.it>
---
 drivers/staging/comedi/comedi_compat32.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/comedi/comedi_compat32.c b/drivers/staging=
/comedi/comedi_compat32.c
index 2fa771e..5708f46 100644
--- a/drivers/staging/comedi/comedi_compat32.c
+++ b/drivers/staging/comedi/comedi_compat32.c
@@ -37,16 +37,16 @@
 #include <linux/ioctl32.h>	/* for (un)register_ioctl32_conversion */
 #endif
=20
-#define COMEDI32_CHANINFO _IOR(CIO, 3, comedi32_chaninfo)
-#define COMEDI32_RANGEINFO _IOR(CIO, 8, (struct comedi32_rangeinfo_str=
uct))
+#define COMEDI32_CHANINFO _IOR(CIO, 3, struct comedi32_chaninfo_struct=
)
+#define COMEDI32_RANGEINFO _IOR(CIO, 8, struct comedi32_rangeinfo_stru=
ct)
 /* N.B. COMEDI32_CMD and COMEDI_CMD ought to use _IOWR, not _IOR.
  * It's too late to change it now, but it only affects the command num=
ber. */
-#define COMEDI32_CMD _IOR(CIO, 9, (struct comedi32_cmd_struct))
+#define COMEDI32_CMD _IOR(CIO, 9, struct comedi32_cmd_struct)
 /* N.B. COMEDI32_CMDTEST and COMEDI_CMDTEST ought to use _IOWR, not _I=
OR.
  * It's too late to change it now, but it only affects the command num=
ber. */
-#define COMEDI32_CMDTEST _IOR(CIO, 10, (struct comedi32_cmd_struct))
-#define COMEDI32_INSNLIST _IOR(CIO, 11, (struct comedi32_insnlist_stru=
ct))
-#define COMEDI32_INSN _IOR(CIO, 12, (struct comedi32_insn_struct))
+#define COMEDI32_CMDTEST _IOR(CIO, 10, struct comedi32_cmd_struct)
+#define COMEDI32_INSNLIST _IOR(CIO, 11, struct comedi32_insnlist_struc=
t)
+#define COMEDI32_INSN _IOR(CIO, 12, struct comedi32_insn_struct)
=20
 struct comedi32_chaninfo_struct {
 	unsigned int subdev;
--=20
1.6.0.4
