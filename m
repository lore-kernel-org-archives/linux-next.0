From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: linux-next: proc tree build failure
Date: Mon, 10 Nov 2008 08:53:11 +0300
Message-ID: <20081110055311.GA3138@x200.localdomain>
References: <20081110162941.e9e9ef3a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.172]:41975 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221AbYKJFtv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Nov 2008 00:49:51 -0500
Received: by ug-out-1314.google.com with SMTP id 39so285143ugf.37
        for <linux-next@vger.kernel.org>; Sun, 09 Nov 2008 21:49:48 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20081110162941.e9e9ef3a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ken Chen <kenchen@google.com>, Ingo Molnar <mingo@elte.hu>

On Mon, Nov 10, 2008 at 04:29:41PM +1100, Stephen Rothwell wrote:
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/proc/base.c:2547: error: 'pid_stack' undeclared here (not in a function)
> 
> Caused by an interaction of commits
> 078e9901c02d4899db5b24f708b8dfbca8935891 ("stacktrace:
> add /proc/<pid>/stack to dump task's stack trace") and
> 35f0b5fd7fab907a1119eaa614d9b24e5e225755 ("stacktrace:
> convert /proc/<pid>/stack to seqfiles") from the tip-core tree with commit
> 5d8880e3e0fb96459c652ac5e1504b90c949b3b9 ("proc: remove '##' usage") from
> the proc tree.
> 
> The former added a new usage of INF (which the second converted to a
> ONE).  I added the following patch to the merge of the proc tree and can
> carry it.

Time to steal this /proc/*/stack from Ingo. :-)

> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -2544,7 +2544,7 @@ static const struct pid_entry tgid_base_stuff[] = {
>  	INF("wchan",      S_IRUGO, proc_pid_wchan),
>  #endif
>  #ifdef CONFIG_STACKTRACE
> -	ONE("stack",      S_IRUSR, pid_stack),
> +	ONE("stack",      S_IRUSR, proc_pid_stack),

correct
