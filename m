From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with the vfs tree
Date: Mon, 15 Dec 2014 22:40:37 -0600
Message-ID: <878ui8urzu.fsf@x220.int.ebiederm.org>
References: <20141216142109.4a67e8b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:60793 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820AbaLPEnA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Dec 2014 23:43:00 -0500
In-Reply-To: <20141216142109.4a67e8b0@canb.auug.org.au> (Stephen Rothwell's
	message of "Tue, 16 Dec 2014 14:21:09 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> Today's linux-next merge of the userns tree got a conflict in
> kernel/user_namespace.c between commits 3c0411846118 ("switch the rest
> of proc_ns_operations to working with &...->ns") and 64964528b24e
> ("make proc_ns_operations work with struct ns_common * instead of void
> *") from the vfs tree and commits 273d2c67c3e1 ("userns: Don't allow
> setgroups until a gid mapping has been setablished") and 9cc46516ddf4
> ("userns: Add a knob to disable setgroups on a per user namespace
> basis") from the userns tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

The fix is fine.

It might be a hair better if to_user_ns was below the code I added,
but it doesn't affect functionality so it doesn't matter.

Eric
