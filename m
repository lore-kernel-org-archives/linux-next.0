From: Nathan Lynch <ntl@pobox.com>
Subject: [PATCH] cacheinfo: rename cache_dir per-cpu variable
Date: Fri, 9 Jan 2009 17:12:44 -0600
Message-ID: <20090109231244.GA6850@localdomain>
References: <20090109125327.351b7f65.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a-sasl-fastnet.sasl.smtp.pobox.com ([207.106.133.19]:62586 "EHLO
	sasl.smtp.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757964AbZAIXMv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Jan 2009 18:12:51 -0500
Content-Disposition: inline
In-Reply-To: <20090109125327.351b7f65.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, ppc-dev <linuxppc-dev@ozlabs.org>

The per_cpu__ prefix on DECLARE_PER_CPU'd variables is going away;
rename cache_dir to cache_dir_pcpu.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 arch/powerpc/kernel/cacheinfo.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

Not sure which route this should go, I assume either Rusty or Ben will
take it?


diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index b33f041..bb37b1d 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -113,7 +113,7 @@ struct cache {
 	struct cache *next_local;      /* next cache of >= level */
 };
 
-static DEFINE_PER_CPU(struct cache_dir *, cache_dir);
+static DEFINE_PER_CPU(struct cache_dir *, cache_dir_pcpu);
 
 /* traversal/modification of this list occurs only at cpu hotplug time;
  * access is serialized by cpu hotplug locking
@@ -468,9 +468,9 @@ static struct cache_dir *__cpuinit cacheinfo_create_cache_dir(unsigned int cpu_i
 
 	cache_dir->kobj = kobj;
 
-	WARN_ON_ONCE(per_cpu(cache_dir, cpu_id) != NULL);
+	WARN_ON_ONCE(per_cpu(cache_dir_pcpu, cpu_id) != NULL);
 
-	per_cpu(cache_dir, cpu_id) = cache_dir;
+	per_cpu(cache_dir_pcpu, cpu_id) = cache_dir;
 
 	return cache_dir;
 err:
@@ -820,13 +820,13 @@ void cacheinfo_cpu_offline(unsigned int cpu_id)
 
 	/* Prevent userspace from seeing inconsistent state - remove
 	 * the sysfs hierarchy first */
-	cache_dir = per_cpu(cache_dir, cpu_id);
+	cache_dir = per_cpu(cache_dir_pcpu, cpu_id);
 
 	/* careful, sysfs population may have failed */
 	if (cache_dir)
 		remove_cache_dir(cache_dir);
 
-	per_cpu(cache_dir, cpu_id) = NULL;
+	per_cpu(cache_dir_pcpu, cpu_id) = NULL;
 
 	/* clear the CPU's bit in its cache chain, possibly freeing
 	 * cache objects */
