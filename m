From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with the tip tree
Date: Mon, 21 May 2012 17:02:39 -0600
Message-ID: <87ipfp6sts.fsf@xmission.com>
References: <20120521173006.3c10df123692914ab19497b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out03.mta.xmission.com ([166.70.13.233]:56288 "EHLO
	out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751109Ab2EUXCu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 May 2012 19:02:50 -0400
In-Reply-To: <20120521173006.3c10df123692914ab19497b8@canb.auug.org.au>
	(Stephen Rothwell's message of "Mon, 21 May 2012 17:30:06 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> Today's linux-next merge of the userns tree got a conflict in
> include/linux/sched.h between commit 50954a1f450e ("sched/numa: Provide
> sysctl knob to disable numa scheduling and turn it off by default") from
> the tip tree and commit 7b44ab978b77 ("userns: Disassociate user_struct
> from the user_namespace") from the userns tree.
>
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

It looks reasonable.  Thanks.

Eric
