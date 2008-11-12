From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: security-testing tree build failure
Date: Wed, 12 Nov 2008 21:56:36 +1100 (EST)
Message-ID: <alpine.LRH.1.10.0811122155510.12886@tundra.namei.org>
References: <20081112160553.33ad43df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:38579 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750873AbYKLK45 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 05:56:57 -0500
In-Reply-To: <20081112160553.33ad43df.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>, Stephen Smalley <sds@tycho.nsa.gov>

On Wed, 12 Nov 2008, Stephen Rothwell wrote:

> Hi James,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> In file included from init/main.c:35:
> include/linux/security.h:1788: error: static declaration of 'security_capable' follows non-static declaration
> include/linux/capability.h:524: error: previous declaration of 'security_capable' was here
> include/linux/security.h:1793: error: static declaration of 'security_capable_noaudit' follows non-static declaration
> include/linux/capability.h:525: error: previous declaration of 'security_capable_noaudit' was here
> 
> Caused by commit 06112163f5fd9e491a7f810443d81efa9d88e247 ("Add a new
> capable interface that will be used by systems that use audit to").
> 
> Please compile test with and without CONFIG_SECURITY.

Done, with the patch below (now pushed to the tree).


commit 92a77aac9812d5397abbe6f1920e085e50838635
Author: James Morris <jmorris@namei.org>
Date:   Wed Nov 12 21:20:00 2008 +1100

    security: remove broken and useless declarations
    
    Remove broken declarations for security_capable* functions,
    which were not needed anyway.
    
    Signed-off-by: James Morris <jmorris@namei.org>

diff --git a/include/linux/capability.h b/include/linux/capability.h
index b313ba1..7f26580 100644
--- a/include/linux/capability.h
+++ b/include/linux/capability.h
@@ -521,8 +521,6 @@ extern const kernel_cap_t __cap_init_eff_set;
 
 kernel_cap_t cap_set_effective(const kernel_cap_t pE_new);
 
-extern int security_capable(struct task_struct *t, int cap);
-extern int security_capable_noaudit(struct task_struct *t, int cap);
 /**
  * has_capability - Determine if a task has a superior capability available
  * @t: The task in question
