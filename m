From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build warning after merge of the final tree (userns tree related)
Date: Sat, 19 May 2012 15:52:18 -0600
Message-ID: <87d35z260d.fsf@xmission.com>
References: <20120516195513.29d921bc25f308f92f0d6471@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:33252 "EHLO
	out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754804Ab2ESVw3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 19 May 2012 17:52:29 -0400
In-Reply-To: <20120516195513.29d921bc25f308f92f0d6471@canb.auug.org.au>
	(Stephen Rothwell's message of "Wed, 16 May 2012 19:55:13 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> After merging the final tree, today's linux-next build (powerpc
> ppc44x_defconfig) produced this warning:
>
> kernel/user.c:30:4: warning: this decimal constant is unsigned only in ISO C90 [enabled by default]
> kernel/user.c:38:4: warning: this decimal constant is unsigned only in ISO C90 [enabled by default]
>
> Introduced by commit 22d917d80e84 ("userns: Rework the user_namespace
> adding uid/gid mapping support").

Ugh.  I missed this email the first time through.  Thank you for the
report this problem should be fixed now.

Eric
