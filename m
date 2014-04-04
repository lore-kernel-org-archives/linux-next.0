From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Subject: [PATCH] topology: Fix compilation warning when not in SMP
Date: Fri,  4 Apr 2014 08:43:18 +0200
Message-ID: <1396593798-29173-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, stable@vger.kernel.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

The topology_##name() macro does not use its argument when CONFIG_SMP i=
s not
set, as it ultimately calls the cpu_data() macro.

So we avoid maintaining a possibly unused `cpu' variable, to avoid the
following compilation warning:

  drivers/base/topology.c: In function =E2=80=98show_physical_package_i=
d=E2=80=99:
  drivers/base/topology.c:103:118: warning: unused variable =E2=80=98cp=
u=E2=80=99 [-Wunused-variable]
   define_id_show_func(physical_package_id);

  drivers/base/topology.c: In function =E2=80=98show_core_id=E2=80=99:
  drivers/base/topology.c:106:106: warning: unused variable =E2=80=98cp=
u=E2=80=99 [-Wunused-variable]
   define_id_show_func(core_id);

This can be seen with e.g. x86 defconfig and CONFIG_SMP not set.

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <stable@vger.kernel.org> # 3.10.x
Cc: <stable@vger.kernel.org> # 3.13.x
Cc: <stable@vger.kernel.org> # 3.14.x
---
 drivers/base/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/base/topology.c b/drivers/base/topology.c
index ad9d177..c928576 100644
--- a/drivers/base/topology.c
+++ b/drivers/base/topology.c
@@ -39,8 +39,7 @@
 static ssize_t show_##name(struct device *dev,			\
 		struct device_attribute *attr, char *buf)	\
 {								\
-	unsigned int cpu =3D dev->id;				\
-	return sprintf(buf, "%d\n", topology_##name(cpu));	\
+	return sprintf(buf, "%d\n", topology_##name(dev->id));	\
 }
=20
 #if defined(topology_thread_cpumask) || defined(topology_core_cpumask)=
 || \
--=20
1.9.1
