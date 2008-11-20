From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 20 Nov 2008 14:58:03 +1030
Message-ID: <200811201458.03991.rusty@rustcorp.com.au>
References: <20081120142404.7dc7df09.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:47415 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751248AbYKTE2I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 23:28:08 -0500
In-Reply-To: <20081120142404.7dc7df09.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

On Thursday 20 November 2008 13:54:04 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next merge of the rr tree got a conflict in
> arch/s390/include/asm/smp.h arch/s390/kernel/smp.c between commit
> 32d13157b60c5499c858adaecb6a01873ff9a81a ("[S390] convert s390 to generic
> IPI infrastructure") from the s390 tree and commit
> 0a74a1ee6aaf74b687d649be3196c17f148127ea
> ("cpumask:smp_call_function_many") from the rr tree.
>
> I think (I may be wrong) that the s390 tree change has removed the need
> for the rr tree change to touch the s390 files.  I fixed it up
> accordingly and can carry the fix.

That's great, I didn't know they were doing that.

Thanks, I'll drop that part of the patch.
Rusty.
