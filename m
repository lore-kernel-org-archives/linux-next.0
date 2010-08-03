From: John Johansen <john.johansen@canonical.com>
Subject: Re: [PATCH -next] apparmor: depends on NET
Date: Mon, 02 Aug 2010 19:43:42 -0700
Message-ID: <4C57825E.6020103@canonical.com>
References: <20100802144432.70293bda.sfr@canb.auug.org.au> <20100802105218.c2050fff.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:33854 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377Ab0HCCnt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Aug 2010 22:43:49 -0400
In-Reply-To: <20100802105218.c2050fff.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org

On 08/02/2010 10:52 AM, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> SECURITY_APPARMOR should depend on NET since AUDIT needs
> (depends on) NET.
> 
yes, thanks .that depends seems to have been dropped when I
split out networking hooks for later submission

Signed-off-by: John Johansen <john.johansen@canonical.com>


> Fixes 70-80 errors that occur when CONFIG_NET is not enabled,
> but APPARMOR selects AUDIT without qualification.  E.g.:
> 
> audit.c:(.text+0x33361): undefined reference to `netlink_unicast'
> (.text+0x333df): undefined reference to `netlink_unicast'
> audit.c:(.text+0x3341d): undefined reference to `skb_queue_tail'
> audit.c:(.text+0x33424): undefined reference to `kfree_skb'
> audit.c:(.text+0x334cb): undefined reference to `kfree_skb'
> audit.c:(.text+0x33597): undefined reference to `skb_put'
> audit.c:(.text+0x3369b): undefined reference to `__alloc_skb'
> audit.c:(.text+0x336d7): undefined reference to `kfree_skb'
> (.text+0x3374c): undefined reference to `__alloc_skb'
> auditfilter.c:(.text+0x35305): undefined reference to `skb_queue_tail'
> lsm_audit.c:(.text+0x2873): undefined reference to `init_net'
> lsm_audit.c:(.text+0x2878): undefined reference to `dev_get_by_index'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: John Johansen <john.johansen@canonical.com>
> ---
>  security/apparmor/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20100802.orig/security/apparmor/Kconfig
> +++ linux-next-20100802/security/apparmor/Kconfig
> @@ -1,6 +1,6 @@
>  config SECURITY_APPARMOR
>  	bool "AppArmor support"
> -	depends on SECURITY
> +	depends on SECURITY && NET
>  	select AUDIT
>  	select SECURITY_PATH
>  	select SECURITYFS
