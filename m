From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Wed, 15 Oct 2008 13:00:25 +0100
Message-ID: <17076.1224072025@redhat.com>
References: <20081015204849.a404162b.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:60045 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752455AbYJOMAq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 08:00:46 -0400
In-Reply-To: <20081015204849.a404162b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Frank Mayhar <fmayhar@google.com>, Ingo Molnar <mingo@elte.hu>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> - 	/* keep the process-shared keyrings here so that they do the right
> - 	 * thing in threads created with CLONE_THREAD */
> - #ifdef CONFIG_KEYS
> - 	struct key *session_keyring;	/* keyring inherited over fork */
> - 	struct key *process_keyring;	/* keyring private to this process */
> - #endif
>  -	struct list_head cpu_timers[3];
>  -

ACK.
