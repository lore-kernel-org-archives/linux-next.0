From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the percpu tree
Date: Wed, 5 Jan 2011 21:11:20 -0800
Message-ID: <20110106051120.GA21315@mtj.dyndns.org>
References: <20110104152105.5cc7c3a9.sfr@canb.auug.org.au>
 <20110104051314.GA6748@mtj.dyndns.org>
 <20110106151815.9e5c2a1e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:33111 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750735Ab1AFFLy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Jan 2011 00:11:54 -0500
Content-Disposition: inline
In-Reply-To: <20110106151815.9e5c2a1e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello, again.

On Thu, Jan 06, 2011 at 03:18:15PM +1100, Stephen Rothwell wrote:
> > My apologies.  I forgot an earlier patch to introduce this_cpu_has()
> > macro.  I've reverted the offending commit.
> 
> But that revert is not in your published for-next branch yet.  I have
> manually reverted that commit for today.

Ah, embarrassing.  I updated for-2.6.38 but forgot to update for-next
accordingly.  Fixed.

Thank you.

-- 
tejun
