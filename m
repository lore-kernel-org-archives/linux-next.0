From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: manual merge of the s390 tree
Date: Thu, 20 Nov 2008 12:10:14 +0100
Message-ID: <1227179414.23671.1.camel@localhost>
References: <20081120101309.0553d091.sfr@canb.auug.org.au>
Reply-To: schwidefsky@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate1.de.ibm.com ([195.212.17.161]:52591 "EHLO
	mtagate1.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754034AbYKTLMn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Nov 2008 06:12:43 -0500
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate1.de.ibm.com (8.13.1/8.13.1) with ESMTP id mAKBCat1026982
	for <linux-next@vger.kernel.org>; Thu, 20 Nov 2008 11:12:36 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mAKBCaeS4116554
	for <linux-next@vger.kernel.org>; Thu, 20 Nov 2008 12:12:36 +0100
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mAKBCZFb019390
	for <linux-next@vger.kernel.org>; Thu, 20 Nov 2008 12:12:36 +0100
In-Reply-To: <20081120101309.0553d091.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, Paul Mackerras <paulus@samba.org>, Hendrik Brueckner <brueckner@linux.vnet.ibm.com>

On Thu, 2008-11-20 at 10:13 +1100, Stephen Rothwell wrote:
> Just overlapping additions. I fixed it up (see below) and can carry the
> fix.  The conflict could be eliminated by one of the two sets of changes
> moving slightly in the files (I am hinting about the s390 ones here as
> Paul does not like rebasing his tree ...).

Ok, done. I moved the HCV_ICUV option before HVC_BEAT.

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.
