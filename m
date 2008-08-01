From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for July 31 (IMA build error)
Date: Fri, 01 Aug 2008 13:33:00 -0400
Message-ID: <1217611980.4000.10.camel@new-host-2>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:51011 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751842AbYHARda (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Aug 2008 13:33:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, safford@watson.ibm.com, serue@linux.vnet.ibm.com, sailer@watson.ibm.com, zohar@us.ibm.com


Randy Dunlap <randy.dunlap@oracle.com> wrote on 08/01/2008 01:34:14 AM:
> security/integrity/ima:
> 
> linux-next-20080731/security/integrity/ima/ima_policy.c:81: error: implicit 
> declaration of function 'security_audit_rule_match'
> linux-next-20080731/security/integrity/ima/ima_policy.c:206: error: implicit 
> declaration of function 'security_audit_rule_init'
> make[4]: *** [security/integrity/ima/ima_policy.o] Error 1

- Update security/integrity/ima/Kconfig for LSM based policy rules 
  to select CONFIG_AUDIT.
- Add dummy security_filter_rule_init/match routines for when 
  CONFIG_AUDIT is not configured.

Signed-off-by: Mimi Zohar <zohar@us.ibm.com>

Index: security-testing-2.6/security/integrity/ima/Kconfig
===================================================================
--- security-testing-2.6.orig/security/integrity/ima/Kconfig
+++ security-testing-2.6/security/integrity/ima/Kconfig
@@ -39,3 +39,11 @@ config IMA_BASE_HOOKS
 	default n
 	help
 	  Enable this option to allow the LSM module to enforce integrity.
+
+config IMA_LSM_BASED_RULES
+	bool "Enable LSM based measurement policy rules(requires audit)"
+	depends on IMA
+	select AUDIT
+	default y
+	help
+	  Disabling this option will not enforce LSM based policy rules.
Index: security-testing-2.6/security/integrity/ima/ima.h
===================================================================
--- security-testing-2.6.orig/security/integrity/ima/ima.h
+++ security-testing-2.6/security/integrity/ima/ima.h
@@ -145,4 +145,25 @@ struct ima_iint_cache {
 	u8 		digest[IMA_DIGEST_SIZE];
 	struct mutex mutex;
 };
+
+/* LSM based policy rules require audit */
+#ifdef CONFIG_AUDIT
+
+#define security_filter_rule_init security_audit_rule_init
+#define security_filter_rule_match security_audit_rule_match
+
+#else
+
+static inline int security_filter_rule_init(u32 field, u32 op, char *rulestr,
+					    void **lsmrule)
+{
+	return -EINVAL;
+}
+
+static inline int security_filter_rule_match(u32 secid, u32 field, u32 op,
+				   void *lsmrule, struct audit_context *actx)
+{
+	return -EINVAL;
+}
+#endif
 #endif
Index: security-testing-2.6/security/integrity/ima/ima_policy.c
===================================================================
--- security-testing-2.6.orig/security/integrity/ima/ima_policy.c
+++ security-testing-2.6/security/integrity/ima/ima_policy.c
@@ -20,9 +20,6 @@
 
 #include "ima.h"
 
-#define security_filter_rule_init security_audit_rule_init
-#define security_filter_rule_match security_audit_rule_match
-
 struct ima_measure_rule_entry {
 	struct list_head list;
 	int action;
