From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build failure after merge of the userns tree
Date: Tue, 15 May 2012 18:12:19 -0700
Message-ID: <87fwb12aks.fsf@xmission.com>
References: <20120514191337.e06ca84184b73b20b5c52689@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out03.mta.xmission.com ([166.70.13.233]:60773 "EHLO
	out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966274Ab2EPBMk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 May 2012 21:12:40 -0400
In-Reply-To: <20120514191337.e06ca84184b73b20b5c52689@canb.auug.org.au>
	(Stephen Rothwell's message of "Mon, 14 May 2012 19:13:37 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> After merging the userns tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> fs/stat.c: In function 'cp_new_stat64':
> fs/stat.c:354:61: error: expected ';' before ')' token
> fs/stat.c:354:61: error: expected statement before ')' token
> fs/stat.c:355:61: error: expected ';' before ')' token
> fs/stat.c:355:61: error: expected statement before ')' token
>
> I have dropped the userns tree for today.

*puts paper bag on head*

Thanks, and fixed.

Eric
