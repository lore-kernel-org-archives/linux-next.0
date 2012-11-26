From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the akpm tree with the userns tree
Date: Mon, 26 Nov 2012 12:30:31 -0600
Message-ID: <87624stdx4.fsf@xmission.com>
References: <20121127001320.12439806f19c9b6ccce4e895@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:57832 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754604Ab2KZSat (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Nov 2012 13:30:49 -0500
In-Reply-To: <20121127001320.12439806f19c9b6ccce4e895@canb.auug.org.au>
	(Stephen Rothwell's message of "Tue, 27 Nov 2012 00:13:20 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Andrew,
>
> Today's linux-next merge of the akpm tree got a conflict in kernel/fork.c
> between commit b2e0d98705e6 ("userns: Implement unshare of the user
> namespace") from the userns tree and commit  ("fork: unshare: remove dead
> cod") from the akpm tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary (no action
> is required).

Your resolution looks correct to me.  This was just of case of two patches
changing each others context. 

Eric
