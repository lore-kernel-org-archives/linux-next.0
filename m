From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: build failure after merge of the final tree
	(sparc, ptrace trees related)
Date: Fri, 14 Oct 2011 21:09:50 +0200
Message-ID: <20111014190950.GA10791@redhat.com>
References: <20111014180714.e11e15fd35dfaca839c6421e@canb.auug.org.au> <20111014.035459.2238341687770152474.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:4872 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755361Ab1JNTNx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Oct 2011 15:13:53 -0400
Content-Disposition: inline
In-Reply-To: <20111014.035459.2238341687770152474.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, matt.fleming@intel.com, tj@kernel.org

On 10/14, David Miller wrote:
>
> Now you guys are creating conflicts against those fixed up patches in
> another non-sparc tree, and adding new kinds of build failures as
> well.
>
> This doesn't work.

Sorry David and Stephen.

Stephen, could you please temporary remove ptrace from linux-next?

I'll send you another email once I fix the conflicts, can't do this
right now.

Oleg.
