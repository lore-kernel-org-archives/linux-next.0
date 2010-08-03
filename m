From: John Johansen <john.johansen@canonical.com>
Subject: Re: linux-next: Fix AppArmor build warnings after merge of the security-testing
 tree
Date: Mon, 02 Aug 2010 19:40:31 -0700
Message-ID: <4C57819F.4000405@canonical.com>
References: <20100802121601.363af4a9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:33725 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377Ab0HCCki (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Aug 2010 22:40:38 -0400
In-Reply-To: <20100802121601.363af4a9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

Hi Stephen,

the follow patch fixes the AppArmor build warnings from the security-next tree merge


From: John Johansen <john.johansen@canonical.com>
Date: Mon, 2 Aug 2010 19:31:57 -0700
Subject: [PATCH] AppArmor: Fix build warnings from linux-next merge

Patch AppArmor to fix build warnings for changes that exist in the
linux-next tree.

Signed-off-by: John Johansen <john.johansen@canonical.com>
---
 security/apparmor/domain.c |    2 +-
 security/apparmor/ipc.c    |    2 +-
 security/apparmor/lsm.c    |    4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 08bbe63..c825c6e 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -62,7 +62,7 @@ static int may_change_ptraced_domain(struct task_struct *task,
 				     struct aa_profile *to_profile)
 {
 	struct task_struct *tracer;
-	struct cred *cred = NULL;
+	const struct cred *cred = NULL;
 	struct aa_profile *tracerp = NULL;
 	int error = 0;
 
diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
index 9013a78..649fad8 100644
--- a/security/apparmor/ipc.c
+++ b/security/apparmor/ipc.c
@@ -100,7 +100,7 @@ int aa_ptrace(struct task_struct *tracer, struct task_struct *tracee,
 
 	if (!unconfined(tracer_p)) {
 		/* lcred released below */
-		struct cred *lcred = get_task_cred(tracee);
+		const struct cred *lcred = get_task_cred(tracee);
 		struct aa_profile *tracee_p = aa_cred_profile(lcred);
 
 		error = aa_may_ptrace(tracer, tracer_p, tracee_p, mode);
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index d5666d3..f56978a 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -607,9 +607,11 @@ static int apparmor_setprocattr(struct task_struct *task, char *name,
 	return error;
 }
 
-static int apparmor_task_setrlimit(unsigned int resource,
+static int apparmor_task_setrlimit(struct task_struct *tsk,
+				   unsigned int resource,
 				   struct rlimit *new_rlim)
 {
+	/* Use current profile instead of profile on @tsk */
 	struct aa_profile *profile = aa_current_profile();
 	int error = 0;
 
-- 
1.7.0.4
