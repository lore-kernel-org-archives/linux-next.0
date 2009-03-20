From: Alessio Igor Bogani <abogani@texware.it>
Subject: [PATCH] Staging: comedi: Fix build problem
Date: Fri, 20 Mar 2009 17:36:50 +0100
Message-ID: <1237567010-30354-1-git-send-email-abogani@texware.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:46235 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751981AbZCTQg7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2009 12:36:59 -0400
Received: by fxm2 with SMTP id 2so981661fxm.37
        for <linux-next@vger.kernel.org>; Fri, 20 Mar 2009 09:36:56 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-next <linux-next@vger.kernel.org>
Cc: Alessio Igor Bogani <abogani@texware.it>

[...]
 CC [M]  drivers/staging/comedi/comedi_compat32.o
 drivers/staging/comedi/comedi_compat32.c: In function =E2=80=98compat_=
chaninfo=E2=80=99:
 drivers/staging/comedi/comedi_compat32.c:135: error: dereferencing poi=
nter to incomplete type
 drivers/staging/comedi/comedi_compat32.c:139: error: dereferencing poi=
nter to incomplete type
 drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing poi=
nter to incomplete type
 drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing poi=
nter to incomplete type
 drivers/staging/comedi/comedi_compat32.c:145: warning: type defaults t=
o =E2=80=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
 drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing poi=
nter to incomplete type
 drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing poi=
nter to incomplete type
 drivers/staging/comedi/comedi_compat32.c:145: warning: type defaults t=
o =E2=80=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
 drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing poi=
nter to incomplete type
 drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing poi=
nter to incomplete type
 drivers/staging/comedi/comedi_compat32.c:145: warning: type defaults t=
o =E2=80=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
 drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing poi=
nter to incomplete type
 drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing poi=
nter to incomplete type
 [...]

Signed-off-by: Alessio Igor Bogani <abogani@texware.it>
---
 drivers/staging/comedi/comedi.h      |    4 ++--
 drivers/staging/comedi/comedi_fops.c |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/comedi/comedi.h b/drivers/staging/comedi/c=
omedi.h
index e6b5f16..405b191 100644
--- a/drivers/staging/comedi/comedi.h
+++ b/drivers/staging/comedi/comedi.h
@@ -294,7 +294,7 @@ enum comedi_support_level {
 #define COMEDI_DEVCONFIG _IOW(CIO, 0, struct comedi_devconfig)
 #define COMEDI_DEVINFO _IOR(CIO, 1, struct comedi_devinfo)
 #define COMEDI_SUBDINFO _IOR(CIO, 2, struct comedi_subdinfo)
-#define COMEDI_CHANINFO _IOR(CIO, 3, struct comedi_chaninfo)
+#define COMEDI_CHANINFO _IOR(CIO, 3, struct comedi_chaninfo_struct)
 #define COMEDI_TRIG _IOWR(CIO, 4, comedi_trig)
 #define COMEDI_LOCK _IO(CIO, 5)
 #define COMEDI_UNLOCK _IO(CIO, 6)
@@ -365,7 +365,7 @@ struct comedi_cmd {
 	unsigned int data_len;
 };
=20
-struct comedi_chaninfo {
+struct comedi_chaninfo_struct {
 	unsigned int subdev;
 	unsigned int *maxdata_list;
 	unsigned int *flaglist;
diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/com=
edi/comedi_fops.c
index 19dce2e..c356f19 100644
--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -75,7 +75,7 @@ static int do_devinfo_ioctl(struct comedi_device *dev=
, struct comedi_devinfo *ar
 			    struct file *file);
 static int do_subdinfo_ioctl(struct comedi_device *dev, struct comedi_=
subdinfo *arg,
 			     void *file);
-static int do_chaninfo_ioctl(struct comedi_device *dev, struct comedi_=
chaninfo *arg);
+static int do_chaninfo_ioctl(struct comedi_device *dev, struct comedi_=
chaninfo_struct *arg);
 static int do_bufinfo_ioctl(struct comedi_device *dev, void *arg);
 static int do_cmd_ioctl(struct comedi_device *dev, void *arg, void *fi=
le);
 static int do_lock_ioctl(struct comedi_device *dev, unsigned int arg, =
void *file);
@@ -490,12 +490,12 @@ static int do_subdinfo_ioctl(struct comedi_device=
 *dev, struct comedi_subdinfo *
 		arrays at elements of chaninfo structure
=20
 */
-static int do_chaninfo_ioctl(struct comedi_device *dev, struct comedi_=
chaninfo *arg)
+static int do_chaninfo_ioctl(struct comedi_device *dev, struct comedi_=
chaninfo_struct *arg)
 {
 	struct comedi_subdevice *s;
-	struct comedi_chaninfo it;
+	struct comedi_chaninfo_struct it;
=20
-	if (copy_from_user(&it, arg, sizeof(struct comedi_chaninfo)))
+	if (copy_from_user(&it, arg, sizeof(struct comedi_chaninfo_struct)))
 		return -EFAULT;
=20
 	if (it.subdev >=3D dev->n_subdevices)
--=20
1.6.0.4
