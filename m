From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH wq#for-2.6.39] workqueue: fix build failure introduced
 by s/freezeable/freezable/
Date: Mon, 21 Feb 2011 10:10:09 +0100
Message-ID: <20110221091009.GF31267@htj.dyndns.org>
References: <20110221090354.GE31267@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f52.google.com ([209.85.214.52]:48080 "EHLO
	mail-bw0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752234Ab1BUJKO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Feb 2011 04:10:14 -0500
Content-Disposition: inline
In-Reply-To: <20110221090354.GE31267@htj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 21, 2011 at 10:03:54AM +0100, Tejun Heo wrote:
> new usage of the flag.  The combination of the two creates a build
> failure after merge.  Fix it by renaming all freezeables to
> freezables.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> I pulled mainline into wq#for-2.6.39 and applied the build fix.
> #for-next updated accordingly.  Dmitry, please feel free to pull in
> the following branch for system_wq_freezable.  The branch is stable.
> HEAD is 6c9e293a1f (workqueue: fix build failure introduced by
> s/freezeable/freezable/).
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-2.6.39

Updated commit message (the first line went missing because it started
with #fixes-2.6.38), the new HEAD is 24d51add74.

Thanks.

-- 
tejun
