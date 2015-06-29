From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: [next] new fail in linux-next s390 smp
Date: Mon, 29 Jun 2015 11:09:47 +0200
Message-ID: <20150629110947.62df85b2@mschwide>
References: <20150626174901.GB4633@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp15.uk.ibm.com ([195.75.94.111]:59129 "EHLO
	e06smtp15.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398AbbF2JJx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2015 05:09:53 -0400
Received: from /spool/local
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <schwidefsky@de.ibm.com>;
	Mon, 29 Jun 2015 10:09:52 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 84B73219005E
	for <linux-next@vger.kernel.org>; Mon, 29 Jun 2015 10:09:26 +0100 (BST)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com [9.149.37.248])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t5T99ms027656428
	for <linux-next@vger.kernel.org>; Mon, 29 Jun 2015 09:09:48 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t5T99m2l014777
	for <linux-next@vger.kernel.org>; Mon, 29 Jun 2015 05:09:48 -0400
In-Reply-To: <20150626174901.GB4633@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Michael Holzheu <holzheu@linux.vnet.ibm.com>, linux-next@vger.kernel.org

On Fri, 26 Jun 2015 13:49:01 -0400
Paul Gortmaker <paul.gortmaker@windriver.com> wrote:

> Seen in allnoconfig:
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/12450623/
> 
> arch/s390/kernel/setup.c: In function 'setup_arch':
> arch/s390/kernel/setup.c:875:2: error: implicit declaration of function
> 'smp_save_dump_cpus'
> make[2]: *** [arch/s390/kernel/setup.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [arch/s390/kernel] Error 2
> make: *** [arch/s390] Error 2
> make: *** Waiting for unfinished jobs....

I have added a patch from Heiko to the s390 tree. Should be fixed
with tomorrows -next tree.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
