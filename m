From: John Johansen <john.johansen@canonical.com>
Subject: Re: linux-next: Tree for Jul 24 (apparmor)
Date: Mon, 25 Jul 2016 11:00:40 -0700
Message-ID: <c1b18fb7-a6b3-859b-c931-7a0e559cd673@canonical.com>
References: <20160724182040.1e49e90f@canb.auug.org.au>
 <7a66a4c7-60cb-166d-2518-b7ba8de0033b@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:54019 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752821AbcGYSAq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2016 14:00:46 -0400
In-Reply-To: <7a66a4c7-60cb-166d-2518-b7ba8de0033b@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org

On 07/24/2016 04:26 PM, Randy Dunlap wrote:
> On 07/24/16 01:20, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20160722:
>>
> 
> on x86_64:
> 
> CONFIG_SECURITY_APPARMOR=y
> CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
> # CONFIG_SECURITY_APPARMOR_HASH is not set
> 
> ../security/apparmor/lsm.c:675:25: error: 'CONFIG_SECURITY_APPARMOR_HASH_DEFAULT' undeclared here (not in a function)
>  bool aa_g_hash_policy = CONFIG_SECURITY_APPARMOR_HASH_DEFAULT;
>                          ^
> 
> 
yep thanks, its fixed by the following patch, and I have requested James pull it



The newly added Kconfig option could never work and just causes a build error
when disabled:

security/apparmor/lsm.c:675:25: error: 'CONFIG_SECURITY_APPARMOR_HASH_DEFAULT' undeclared here (not in a function)
 bool aa_g_hash_policy = CONFIG_SECURITY_APPARMOR_HASH_DEFAULT;

The problem is that the macro undefined in this case, and we need to use the IS_ENABLED()
helper to turn it into a boolean constant.

Another minor problem with the original patch is that the option is even offered
in sysfs when SECURITY_APPARMOR_HASH is not enabled, so this also hides the option
in that case.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 6059f71f1e94 ("apparmor: add parameter to control whether policy hashing is used")
---
 security/apparmor/crypto.c        | 3 +++
 security/apparmor/lsm.c           | 4 +++-
 security/apparmor/policy_unpack.c | 3 +--
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/crypto.c b/security/apparmor/crypto.c
index 532471d0b3a0..b75dab0df1cb 100644
--- a/security/apparmor/crypto.c
+++ b/security/apparmor/crypto.c
@@ -39,6 +39,9 @@ int aa_calc_profile_hash(struct aa_profile *profile, u32 version, void *start,
 	int error = -ENOMEM;
 	u32 le32_version = cpu_to_le32(version);
 
+	if (!aa_g_hash_policy)
+		return 0;
+
 	if (!apparmor_tfm)
 		return 0;
 
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 3be30c701bfa..41b8cb115801 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -671,9 +671,11 @@ enum profile_mode aa_g_profile_mode = APPARMOR_ENFORCE;
 module_param_call(mode, param_set_mode, param_get_mode,
 		  &aa_g_profile_mode, S_IRUSR | S_IWUSR);
 
+#ifdef CONFIG_SECURITY_APPARMOR_HASH
 /* whether policy verification hashing is enabled */
-bool aa_g_hash_policy = CONFIG_SECURITY_APPARMOR_HASH_DEFAULT;
+bool aa_g_hash_policy = IS_ENABLED(CONFIG_SECURITY_APPARMOR_HASH_DEFAULT);
 module_param_named(hash_policy, aa_g_hash_policy, aabool, S_IRUSR | S_IWUSR);
+#endif
 
 /* Debug mode */
 bool aa_g_debug;
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index b9b1c66a32a5..138120698f83 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -778,8 +778,7 @@ int aa_unpack(void *udata, size_t size, struct list_head *lh, const char **ns)
 		if (error)
 			goto fail_profile;
 
-		if (aa_g_hash_policy)
-			error = aa_calc_profile_hash(profile, e.version, start,
+		error = aa_calc_profile_hash(profile, e.version, start,
 						     e.pos - start);
 		if (error)
 			goto fail_profile;
-- 
2.9.0
