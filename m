From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: manual merge of the cputime tree
Date: Mon, 10 Nov 2008 09:45:26 +0100
Message-ID: <1226306726.23046.14.camel@localhost>
References: <20081110170943.114a7786.sfr@canb.auug.org.au>
Reply-To: schwidefsky@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.de.ibm.com ([195.212.29.155]:44763 "EHLO
	mtagate6.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970AbYKJIy4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Nov 2008 03:54:56 -0500
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id mAA8sr3n442478
	for <linux-next@vger.kernel.org>; Mon, 10 Nov 2008 08:54:53 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mAA8srsY4141240
	for <linux-next@vger.kernel.org>; Mon, 10 Nov 2008 09:54:53 +0100
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mAA8sqLu000510
	for <linux-next@vger.kernel.org>; Mon, 10 Nov 2008 09:54:53 +0100
In-Reply-To: <20081110170943.114a7786.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>

Hi Stephen,

On Mon, 2008-11-10 at 17:09 +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the cputime tree got a conflict in
> arch/s390/kernel/process.c between commit
> 2933aa2758dc5e520f83a5f4c3f255aea297bd3f ("[S390] ftrace: disable tracing
> on idle psw") from the s390 tree and commit
> bbda3e73a200e966955b15a08a8be05a7c1d430e ("[PATCH] improve precision of
> idle accounting") from the cputime tree.
> 
> I attempted a fix (see below) but please either provide me with a better
> patch or fix this conflict in one or the other tree.  You could do this
> by merging the s390 tree into the cputime tree (but you would need to be
> careful to keep the consistent) and fixing this in the merge commit.

You are pulling the s390 tree first and then the cputime tree, no? Then
I could simply rebase the cputime tree off the s390 tree. You'll find
new features/cputime branches on git390.

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.
