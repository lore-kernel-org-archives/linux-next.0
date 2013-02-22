From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ima: fix part_pack_uuid() build error
Date: Fri, 22 Feb 2013 13:20:17 -0800
Message-ID: <5127E111.6030605@infradead.org>
References: <1361562413.2908.22.camel@falcor1.watson.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <1361562413.2908.22.camel@falcor1.watson.ibm.com>
Sender: linux-security-module-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: David Rientjes <rientjes@google.com>, James Morris <jmorris@namei.org>, linux-security-module <linux-security-module@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Dmitry Kasatkin <dmitry.kasatkin@intel.com>
List-Id: linux-next.vger.kernel.org

On 02/22/13 11:46, Mimi Zohar wrote:
> Fix a build error when CONFIG_BLOCK is not enabled by defining
> a wrapper called ima_part_pack_uuid().  The wrapper returns
> -EINVAL, when CONFIG_BLOCK is not defined.

Some function wrapper for the case of BLOCK not enabled should be handled
where the function is defined, not where it is called.
That's how it is usually done in Linux.


> security/integrity/ima/ima_policy.c:538:4: error: implicit declaration
> of function 'part_pack_uuid' [-Werror=implicit-function-declaration]
> 
> Changelog v0:
> - fix UUID scripts/Lindent msgs
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Mimi Zohar <zohar@linux.vnet.ibm.com>
> ---
>  security/integrity/ima/ima.h        | 13 +++++++++++++
>  security/integrity/ima/ima_policy.c | 11 ++++++-----
>  2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
> index a41c9c1..902c356 100644
> --- a/security/integrity/ima/ima.h
> +++ b/security/integrity/ima/ima.h
> @@ -21,6 +21,7 @@
>  #include <linux/crypto.h>
>  #include <linux/security.h>
>  #include <linux/hash.h>
> +#include <linux/genhd.h>
>  #include <linux/tpm.h>
>  #include <linux/audit.h>
>  
> @@ -199,4 +200,16 @@ static inline int security_filter_rule_match(u32 secid, u32 field, u32 op,
>  	return -EINVAL;
>  }
>  #endif /* CONFIG_IMA_LSM_RULES */
> +
> +/* UUID policy option requires CONFIG_BLOCK */
> +#ifdef CONFIG_BLOCK
> +static inline int ima_part_pack_uuid(const u8 *uuid_str, u8 *to) {
> +	part_pack_uuid(uuid_str, to);
> +	return 0;
> +}
> +#else
> +static inline int ima_part_pack_uuid(const u8 *uuid_str, u8 *to) {
> +	return -EINVAL;
> +}
> +#endif
>  #endif
> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
> index b27535a..41b7f48 100644
> --- a/security/integrity/ima/ima_policy.c
> +++ b/security/integrity/ima/ima_policy.c
> @@ -176,7 +176,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule,
>  	    && rule->fsmagic != inode->i_sb->s_magic)
>  		return false;
>  	if ((rule->flags & IMA_FSUUID) &&
> -		memcmp(rule->fsuuid, inode->i_sb->s_uuid, sizeof(rule->fsuuid)))
> +	    memcmp(rule->fsuuid, inode->i_sb->s_uuid, sizeof(rule->fsuuid)))
>  		return false;
>  	if ((rule->flags & IMA_UID) && !uid_eq(rule->uid, cred->uid))
>  		return false;
> @@ -530,14 +530,15 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
>  			ima_log_string(ab, "fsuuid", args[0].from);
>  
>  			if (memchr_inv(entry->fsuuid, 0x00,
> -			    sizeof(entry->fsuuid))) {
> +				       sizeof(entry->fsuuid))) {
>  				result = -EINVAL;
>  				break;
>  			}
>  
> -			part_pack_uuid(args[0].from, entry->fsuuid);
> -			entry->flags |= IMA_FSUUID;
> -			result = 0;
> +			result = ima_part_pack_uuid(args[0].from,
> +						    entry->fsuuid);
> +			if (!result)
> +				entry->flags |= IMA_FSUUID;
>  			break;
>  		case Opt_uid:
>  			ima_log_string(ab, "uid", args[0].from);
> 


-- 
~Randy
