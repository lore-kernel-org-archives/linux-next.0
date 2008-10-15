From: Chris Zankel <chris@zankel.net>
Subject: Re: linux-next: bad xtensa tree update
Date: Wed, 15 Oct 2008 13:08:40 -0700
Message-ID: <48F64DC8.70603@zankel.net>
References: <20081015100906.877efcf0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from atlanta.zankel.net ([69.61.78.146]:1204 "EHLO
	atlanta.zankel.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752656AbYJOUQN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Oct 2008 16:16:13 -0400
In-Reply-To: <20081015100906.877efcf0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

Tree should be fixed again.

Do you have an update or better explanation to the instructions on 
http://lwn.net/Articles/289245/? When I follow those instructions, I end 
up with a linux-next tree, or are the 'rebase --onto' instructions meant 
to be used for a separate branch only?

Thanks,
-Chris



Stephen Rothwell wrote:
> I fetched the xtensa tree this morning and it now points to
> next-20080919.  The trees merged into linux-next should never depend on
> linux-next itself.  I have reverted the xtensa tree to what is was
> yesterday (commit dbd3dca "xtensa: use newer __SPIN_LOCK_UNLOCKED
> macro").  Pleas fix up your tree.
