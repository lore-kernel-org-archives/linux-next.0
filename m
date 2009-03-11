From: "Sachin P. Sant" <sachinp@in.ibm.com>
Subject: Re: [RESEND GIT PATCH tj-percpu] percpu: fix spurious alignment WARN
 in legacy SMP percpu allocator
Date: Wed, 11 Mar 2009 12:18:14 +0530
Message-ID: <49B75EAE.4080708@in.ibm.com>
References: <20090310195534.8f8f3c7a.sfr@canb.auug.org.au> <49B67552.5070307@in.ibm.com> <49B73B15.3040101@in.ibm.com> <49B75215.5010707@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp07.in.ibm.com ([59.145.155.7]:49414 "EHLO
	e28smtp07.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120AbZCKGsU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2009 02:48:20 -0400
In-Reply-To: <49B75215.5010707@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

Tejun Heo wrote:
> Impact: remove spurious WARN on legacy SMP percpu allocator
>
> Commit f2a8205c4ef1af917d175c36a4097ae5587791c8 incorrectly added too
> tight WARN_ON_ONCE() on alignments for UP and legacy SMP percpu
> allocator.  Commit e317603694bfd17b28a40de9d65e1a4ec12f816e fixed it
> for UP but legacy SMP allocator was forgotten.  Fix it.
>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Sachin P. Sant <sachinp@in.ibm.com>
> ---
Thanks. The patch fixes the warning.

Tested-by : Sachin Sant <sachinp@in.ibm.com>


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
