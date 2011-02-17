From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the workqueues tree
Date: Thu, 17 Feb 2011 10:23:26 +0100
Message-ID: <20110217092326.GM19830@htj.dyndns.org>
References: <20110217143321.78f52ec5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:37796 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095Ab1BQJXb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Feb 2011 04:23:31 -0500
Content-Disposition: inline
In-Reply-To: <20110217143321.78f52ec5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On Thu, Feb 17, 2011 at 02:33:21PM +1100, Stephen Rothwell wrote:
> Caused by commit 58a69cb47ec6991bf006a3e5d202e8571b0327a4 ("workqueue,
> freezer: unify spelling of 'freeze' + 'able' to 'freezable'") being
> mismerged with commit 4149efb22da66e326fc48baf80d628834509f7f0
> ("workqueue: add system_freezeable_wq") which added another use of
> WQ_FREEZEABLE.
> 
> Please do at least simple build testing before submitting to
> linux-next ...

Yeap, please feel free to call me an idiot.  After verifying the
original branch, I completely forgot merge could introduce this type
of silent conflicts.  I apologize for the late screwups.

Thank you.

-- 
tejun
