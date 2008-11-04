From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: git tree with cputime changes
Date: Tue, 04 Nov 2008 16:32:39 +0100
Message-ID: <1225812759.5805.0.camel@localhost>
References: <1225725054.24817.15.camel@localhost>
	 <20081105020139.a6a2be85.sfr@canb.auug.org.au>
Reply-To: schwidefsky@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.de.ibm.com ([195.212.29.155]:36964 "EHLO
	mtagate6.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752501AbYKDPiT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Nov 2008 10:38:19 -0500
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id mA4FaS0u091330
	for <linux-next@vger.kernel.org>; Tue, 4 Nov 2008 15:36:28 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mA4FaSMi3383494
	for <linux-next@vger.kernel.org>; Tue, 4 Nov 2008 16:36:28 +0100
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mA4FaRmh014337
	for <linux-next@vger.kernel.org>; Tue, 4 Nov 2008 16:36:28 +0100
In-Reply-To: <20081105020139.a6a2be85.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 2008-11-05 at 02:01 +1100, Stephen Rothwell wrote:
> > Martin Schwidefsky (4):
> >       [S390] fix scaled & unscaled cputime accounting
> >       [S390] idle cputime accounting
> 
> These first two aren't really s390 specific, are they?

Yeah that is true. The stupid script that applies the patches always
replaces [PATCH] with [S390] ..

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.
