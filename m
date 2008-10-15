From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Wed, 15 Oct 2008 13:00:09 +0100
Message-ID: <17064.1224072009@redhat.com>
References: <20081015211221.1c4a1346.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:60041 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752173AbYJOMAg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 08:00:36 -0400
In-Reply-To: <20081015211221.1c4a1346.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Frank Mayhar <fmayhar@google.com>, Ingo Molnar <mingo@elte.hu>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>   		}
> - 		tsec->sid = sid;
>  -
>  -		if (current->signal->rlim[RLIMIT_CPU].rlim_cur != RLIM_INFINITY) {
>  -			/*
>  -			 * This will cause RLIMIT_CPU calculations to be
>  -			 * refigured.
>  -			 */
>  -			current->it_prof_expires = jiffies_to_cputime(1);
>  -		}
> ++		update_rlimit_cpu(rlim->rlim_cur);

ACK, though I'd personally leave the blank line after the closing curly at the
end of the for-loop.  That's a very minor matter, though, so don't worry too
much about it.

David
