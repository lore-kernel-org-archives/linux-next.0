From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: manual merge of the akpm with the  tree
Date: Wed, 16 May 2012 18:43:24 +0200
Message-ID: <20120516164323.GA15140@redhat.com>
References: <20120516193052.4af4ee85feb4a36b936b74df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47904 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752832Ab2EPQqB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 May 2012 12:46:01 -0400
Content-Disposition: inline
In-Reply-To: <20120516193052.4af4ee85feb4a36b936b74df@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>

On 05/16, Stephen Rothwell wrote:
>
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@@ -1218,7 -1218,7 +1218,7 @@@ static int wait_task_zombie(struct wait
>   	unsigned long state;
>   	int retval, status, traced;
>   	pid_t pid = task_pid_vnr(p);
> - 	uid_t uid = from_kuid_munged(current_user_ns(), __task_cred(p)->uid);
>  -	uid_t uid = task_uid(p);
> ++	uid_t uid = from_kuid_munged(current_user_ns(), task_uid(p));
>   	struct siginfo __user *infop;

Thanks Stephen, the fix looks correct.

Oleg.
