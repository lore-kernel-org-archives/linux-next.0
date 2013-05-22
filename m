From: Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH linux-next] Driver core: cpu: remove not needed anymore hotplugable_cpu_attr_groups[]
Date: Wed, 22 May 2013 15:53:32 +0200
Message-ID: <1369230812-27375-1-git-send-email-imammedo@redhat.com>
References: <20130522140213.eb65bcc559088b199db1857f@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58189 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755724Ab3EVN5o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 May 2013 09:57:44 -0400
In-Reply-To: <20130522140213.eb65bcc559088b199db1857f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

after fixing conflict between
0902a9044 "Driver core: Use generic offline/online
for CPU offline/online"

and

1c4e2d70a "cpu: make sure that cpu/online file created
before KOBJ_ADD is emitted"

there was left some not needed remnants of the last
commit, remove them since the first commit does the
same thing in another way.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
PS:
Alernative way is just to drop 1c4e2d70a if rebase of tree
is acceptable.

---
 drivers/base/cpu.c |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index ff97614..130ba0b 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -169,13 +169,6 @@ static const struct attribute_group *common_cpu_attr_groups[] = {
 	NULL
 };
 
-static const struct attribute_group *hotplugable_cpu_attr_groups[] = {
-#ifdef CONFIG_KEXEC
-	&crash_note_cpu_attr_group,
-#endif
-	NULL
-};
-
 /*
  * Print cpu online, possible, present, and system maps
  */
@@ -292,8 +285,6 @@ int __cpuinit register_cpu(struct cpu *cpu, int num)
 	cpu->dev.bus->uevent = arch_cpu_uevent;
 #endif
 	cpu->dev.groups = common_cpu_attr_groups;
-	if (cpu->hotpluggable)
-		cpu->dev.groups = hotplugable_cpu_attr_groups;
 	error = device_register(&cpu->dev);
 	if (!error)
 		per_cpu(cpu_sys_devices, num) = &cpu->dev;
-- 
1.7.1
