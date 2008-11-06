From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: new build warning
Date: Thu, 06 Nov 2008 11:22:23 +0100
Message-ID: <1225966943.10268.7.camel@localhost>
References: <20081106152804.01c2b97c.sfr@canb.auug.org.au>
Reply-To: schwidefsky@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate7.de.ibm.com ([195.212.29.156]:51222 "EHLO
	mtagate7.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754666AbYKFKZg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Nov 2008 05:25:36 -0500
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate7.de.ibm.com (8.13.8/8.13.8) with ESMTP id mA6APQwH401238
	for <linux-next@vger.kernel.org>; Thu, 6 Nov 2008 10:25:26 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mA6APR783506192
	for <linux-next@vger.kernel.org>; Thu, 6 Nov 2008 11:25:27 +0100
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mA6APQtV005754
	for <linux-next@vger.kernel.org>; Thu, 6 Nov 2008 11:25:26 +0100
In-Reply-To: <20081106152804.01c2b97c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, 2008-11-06 at 15:28 +1100, Stephen Rothwell wrote:
> Hi Martin,
> 
> A powerpc ppc64_defconfig build of linux-next gives this new warning:
> 
> kernel/time/tick-sched.c: In function 'tick_nohz_restart_sched_tick':
> kernel/time/tick-sched.c:415: warning: unused variable 'ticks'
> 
> Introduced by commit 04d675f6275c660ac6b435d5c6ae2c73be0e7060 ("[S390]
> idle cputime accounting").

Fixed the warning. It's not pretty though, two #ifndefs in the functions
now ..

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.
