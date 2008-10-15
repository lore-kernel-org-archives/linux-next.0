From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Wed, 15 Oct 2008 13:02:50 +0100
Message-ID: <17113.1224072170@redhat.com>
References: <20081015210031.0d51294c.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:60099 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750834AbYJOMDI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 08:03:08 -0400
In-Reply-To: <20081015210031.0d51294c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Frank Mayhar <fmayhar@google.com>, Ingo Molnar <mingo@elte.hu>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> + 	info.si_uid = __task_cred(tsk)->uid;
>   	rcu_read_unlock();
>   
> - 	info.si_uid = tsk->uid;
> - 
>  -	info.si_utime = cputime_to_clock_t(cputime_add(tsk->utime,
>  -						       tsk->signal->utime));
>  -	info.si_stime = cputime_to_clock_t(cputime_add(tsk->stime,
>  -						       tsk->signal->stime));
>  +	thread_group_cputime(tsk, &cputime);
>  +	info.si_utime = cputime_to_jiffies(cputime.utime);
>  +	info.si_stime = cputime_to_jiffies(cputime.stime);

ACK.
