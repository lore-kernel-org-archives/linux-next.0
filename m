From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ipmi tree with the modules tree
Date: Thu, 2 Nov 2017 14:58:08 +1100
Message-ID: <20171102145808.5bb97c3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47781 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934073AbdKBD6J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Nov 2017 23:58:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Corey Minyard <cminyard@mvista.com>, Jessica Yu <jeyu@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>

Hi Corey,

Today's linux-next merge of the ipmi tree got a conflict in:

  drivers/char/ipmi/ipmi_si_intf.c

between commit:

  e4dca7b7aa08 ("treewide: Fix function prototypes for module_param_call()")

from the modules tree and commit:

  44814ec982d2 ("ipmi_si: Move the hotmod handling to another file.")

from the ipmi tree.

I fixed it up (I used the ipmi tree version of the file and added the
following merge fix patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 2 Nov 2017 14:55:01 +1100
Subject: [PATCH] ipmi_si: merge fix for "treewide: Fix function prototypes for
 module_param_call()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/ipmi/ipmi_si_hotmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si_hotmod.c b/drivers/char/ipmi/ipmi_si_hotmod.c
index da5716159974..fc03b9be2f3d 100644
--- a/drivers/char/ipmi/ipmi_si_hotmod.c
+++ b/drivers/char/ipmi/ipmi_si_hotmod.c
@@ -10,7 +10,7 @@
 
 #define PFX "ipmi_hotmod: "
 
-static int hotmod_handler(const char *val, struct kernel_param *kp);
+static int hotmod_handler(const char *val, const struct kernel_param *kp);
 
 module_param_call(hotmod, hotmod_handler, NULL, NULL, 0200);
 MODULE_PARM_DESC(hotmod, "Add and remove interfaces.  See"
@@ -97,7 +97,7 @@ static int check_hotmod_int_op(const char *curr, const char *option,
 	return 0;
 }
 
-static int hotmod_handler(const char *val, struct kernel_param *kp)
+static int hotmod_handler(const char *val, const struct kernel_param *kp)
 {
 	char *str = kstrdup(val, GFP_KERNEL);
 	int  rv;
-- 
2.14.1

-- 
Cheers,
Stephen Rothwell
