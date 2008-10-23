From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 23 Oct 2008 23:26:35 +1100
Message-ID: <200810232326.35839.rusty@rustcorp.com.au>
References: <20081023151241.d5ad0919.sfr@canb.auug.org.au> <200810231616.12076.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42813 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752590AbYJWM0c (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 08:26:32 -0400
In-Reply-To: <200810231616.12076.rusty@rustcorp.com.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

On Thursday 23 October 2008 16:16:11 Rusty Russell wrote:
> On Thursday 23 October 2008 15:12:41 Stephen Rothwell wrote:
> > Hi Rusty,
> >
> > Today's linux-next merge of the rr tree got a conflict in kernel/smp.c
> > between commit 562d8c23497402eb7eb9caf8dab84439a03a49ea ("smp: reduce
> > stack requirements for smp_call_function_mask") from the cpus4096 tree
> > and commit  ("1855648ee0b5ed8fe800edf401bbe25a3f2ed94a") from the rr
> > tree.
> >
> > Overlapping changes.  I have used the version from the rr tree, but I am
> > not sure if that is the correct thing to do.
>
> Mike?

OK, Ingo has the older September version.  Your call was correct.

Rusty.
