From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Wed, 15 Oct 2008 13:02:19 +0100
Message-ID: <17101.1224072139@redhat.com>
References: <20081015205522.bcd25de3.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:60085 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752212AbYJOMCk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 08:02:40 -0400
In-Reply-To: <20081015205522.bcd25de3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Frank Mayhar <fmayhar@google.com>, Ingo Molnar <mingo@elte.hu>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> - 	int ret;

Do you need to put 'ret' back as it's now used a little further on:

>   	if (clone_flags & CLONE_THREAD) {
>  -		atomic_inc(&current->signal->count);
>  -		atomic_inc(&current->signal->live);
>  -		return 0;
>  +		ret = thread_group_cputime_clone_thread(current);
>  +		if (likely(!ret)) {
>  +			atomic_inc(&current->signal->count);
>  +			atomic_inc(&current->signal->live);
>  +		}
>  +		return ret;

The next bit is fine:

>  +	thread_group_cputime_free(sig);
> - 	exit_thread_group_keys(sig);

David
