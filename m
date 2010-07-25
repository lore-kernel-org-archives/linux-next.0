From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH wq#for-next] fscache: fix build on !CONFIG_SYSCTL
Date: Sun, 25 Jul 2010 15:18:41 -0700
Message-ID: <4C4CB841.8010804@oracle.com>
References: <20100723164931.7bf2160f.sfr@canb.auug.org.au> <20100723090831.6af4a288.randy.dunlap@oracle.com> <4C4AAEE9.8050903@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:64649 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751971Ab0GYWU1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 25 Jul 2010 18:20:27 -0400
In-Reply-To: <4C4AAEE9.8050903@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 07/24/10 02:14, Tejun Heo wrote:
> Commit 8b8edefa (fscache: convert object to use workqueue instead of
> slow-work) made fscache_exit() call unregister_sysctl_table()
> unconditionally breaking build when sysctl is disabled.  Fix it by
> putting it inside CONFIG_SYSCTL.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: David Howells <dhowells@redhat.com>
> ---
> This should fix it.  Thanks.

Ack.  Thanks.

> 
>  fs/fscache/main.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/fscache/main.c b/fs/fscache/main.c
> index 500936d..f9d8567 100644
> --- a/fs/fscache/main.c
> +++ b/fs/fscache/main.c
> @@ -186,7 +186,9 @@ static void __exit fscache_exit(void)
> 
>  	kobject_put(fscache_root);
>  	kmem_cache_destroy(fscache_cookie_jar);
> +#ifdef CONFIG_SYSCTL
>  	unregister_sysctl_table(fscache_sysctl_header);
> +#endif
>  	fscache_proc_cleanup();
>  	destroy_workqueue(fscache_op_wq);
>  	destroy_workqueue(fscache_object_wq);


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
