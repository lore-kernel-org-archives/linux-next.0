Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6276925771;
	Sat, 22 Aug 2026 17:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787420119; cv=none; b=dncObNC5/j95lb+bbWeEiz8LNcJFuT9lCsFJoN0cMJAfQzgSXUVq2NrfE7EEmH9dChmG5KCcs3F9V+XL+H5BvsfbPSrTvTRuBbGcOP/zkAZH9gI39/EShgakWjMhRkTJFi7Jx8UZUQ/fyS1N8biqPSSpSpOandaczXJXmz8ZmiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787420119; c=relaxed/simple;
	bh=pWz5vjaapKwOm5wy60uaMx09nyI4FfdvqBBkd+5Peac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZi3BO3ZQcpx7g+M15qrymLdgjQgDvr6hk5CWkpVHvh/EUtvvuU4qA3lyR2cg2NJKQ+7qyhb57tdwF7aoeW3umPCOtCMCj2rGEIfZPdTLlovJcUMIBtEwrPNSezSp7rchYtdauuqAuhdBg8MRDhqcxu0nu9rzsvsZo+/nZFsUVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fLuaEX+O; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fLuaEX+O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=IMMILyvm6FPwDXgnEtACLBuAHjM7Trg7ywnSeEzn8+w=; b=fLuaEX+OsKMRE3Ndg3XVSi4NUi
	ggCOsN3DXiGFp2fGDCFJC5braGJu86FqBoom6bBqoqXly1aC8Zhu213lsqpovWLX+RF3v9Q/GXLfX
	OKDZujXYN91OBTJnDODe5JoGnxSpUi5TpDUPeqehVhJPbgS3HCqly2zc0h86g1l0qEjR6UyLA2z11
	BQy6vjTp+JwF2FwkMCHzqEKrdlYqsgFiAFdDHgP+8MSBfsal5CTNBCLBIYtJhpuVu/fo3tq2siVvu
	iKDUE9lYsZMP90MJfkNTgMnl/2qYrPGeFAZkwOgB/71HnXashxMUssUHyN3fbjimLzb32kImrzvie
	YRsO4U2Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxpch-0000000EguF-29L5;
	Sat, 22 Aug 2026 17:35:15 +0000
Message-ID: <1842ee57-ff3b-42df-b6c7-c93d395a3944@infradead.org>
Date: Sat, 22 Aug 2026 10:35:14 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl
 guard
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>
Cc: Gregory Price <gourry@gourry.net>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>,
 Joel Granados <joel.granados@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-next@vger.kernel.org
References: <20260813062039.14567-1-kmehltretter@gmail.com>
 <20260822072325.51994-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260822072325.51994-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/22/26 12:23 AM, Karl Mehltretter wrote:
> Commit 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors
> CONFIG_SYSCTL") removed CONFIG_PROC_SYSCTL, but the sysctl added by
> commit 5b6e32ba7b59 ("syscall_user_dispatch: Add
> kernel.syscall_user_dispatch sysctl") is still guarded by it. Now that
> both commits are merged, kernel.syscall_user_dispatch is no longer
> registered.
> 
> syscall_user_dispatch_allowed defaults to true. SUD therefore remains
> available, but administrators cannot disable new activations.
> 
> Use CONFIG_SYSCTL for the guard and documentation.
> 
> Fixes: 5b6e32ba7b59 ("syscall_user_dispatch: Add kernel.syscall_user_dispatch sysctl")
> Assisted-by: Codex:gpt-5.6-sol
> Acked-by: Oleg Nesterov <oleg@redhat.com>
> Reviewed-by: Joel Granados <joel.granados@kernel.org>
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> Changes in v2:
>   - Reword changelog and rebase onto mainline now that both commits
>     are merged there (v7.2 is unaffected, it has neither commit).
>   - Collected Acked-by/Reviewed-by tags from v1. No code change.
> 
> v1: https://lore.kernel.org/all/20260813062039.14567-1-kmehltretter@gmail.com/
> 
>  Documentation/admin-guide/sysctl/kernel.rst | 2 +-
>  kernel/entry/syscall_user_dispatch.c        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index b6328cd0f43e..ffea61d448eb 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -1416,7 +1416,7 @@ Controls whether userspace may arm Syscall User Dispatch via
>    ==  ===================================================================
>  
>  Only present when the kernel is built with ``CONFIG_SYSCALL_USER_DISPATCH``
> -and ``CONFIG_PROC_SYSCTL``.
> +and ``CONFIG_SYSCTL``.
>  
>  
>  sysctl_writes_strict
> diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
> index 2002c7aae435..59c861866941 100644
> --- a/kernel/entry/syscall_user_dispatch.c
> +++ b/kernel/entry/syscall_user_dispatch.c
> @@ -178,7 +178,7 @@ int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long siz
>  					      (char __user *)(uintptr_t)cfg.selector);
>  }
>  
> -#ifdef CONFIG_PROC_SYSCTL
> +#ifdef CONFIG_SYSCTL
>  static const struct ctl_table syscall_user_dispatch_sysctls[] = {
>  	{
>  		.procname	= "syscall_user_dispatch",
> @@ -195,4 +195,4 @@ static int __init syscall_user_dispatch_sysctl_init(void)
>  	return 0;
>  }
>  late_initcall(syscall_user_dispatch_sysctl_init);
> -#endif /* CONFIG_PROC_SYSCTL */
> +#endif /* CONFIG_SYSCTL */
> 
> base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8

-- 
~Randy
