From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for July 10 (cpufreq oops)
Date: Fri, 10 Jul 2009 20:54:37 +0200
Message-ID: <200907102054.37956.bzolnier@gmail.com>
References: <20090710151846.c7ebec37.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f225.google.com ([209.85.218.225]:40515 "EHLO
	mail-bw0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756402AbZGJSsw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2009 14:48:52 -0400
In-Reply-To: <20090710151846.c7ebec37.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dave Jones <davej@redhat.com>

On Friday 10 July 2009 07:18:46 Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090709:
 
[ this particular problem goes back to next-20090709 ]

From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: [PATCH] cpufreq: fix OOPS in __cpufreq_governor()

commit 0d923c15b774bed3491400bae6db50481ac8b9e4 ("[CPUFREQ] Factor out
policy setting from cpufreq_add_dev") accidentally reordered new_policy
setup and policy->governor reset.

Fix it, also update comment to match the function name while at it.

Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
---
 drivers/cpufreq/cpufreq.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

Index: b/drivers/cpufreq/cpufreq.c
===================================================================
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -896,10 +896,11 @@ int cpufreq_add_dev_interface(unsigned i
 	if (ret)
 		goto err_out_kobj_put;
 
-	policy->governor = NULL; /* to assure that the starting sequence is
-				  * run in cpufreq_set_policy */
+	memcpy(&new_policy, policy, sizeof(new_policy));
+
+	/* assure that the starting sequence is run in __cpufreq_set_policy */
+	policy->governor = NULL;
 
-	memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
 	/* set default policy */
 	ret = __cpufreq_set_policy(policy, &new_policy);
 	policy->user_policy.policy = policy->policy;
