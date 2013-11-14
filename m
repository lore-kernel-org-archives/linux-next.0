From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH next] fix unpaired rcu lock in prepend_path()
Date: Thu, 14 Nov 2013 10:17:51 +0800
Message-ID: <1384395471.2497.6.camel@ThinkPad-T5421>
References: <1384327311.19669.8.camel@ThinkPad-T5421>
	 <20131113122848.GZ13318@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp06.au.ibm.com ([202.81.31.148]:51456 "EHLO
	e23smtp06.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895Ab3KNCR7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Nov 2013 21:17:59 -0500
Received: from /spool/local
	by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Thu, 14 Nov 2013 12:17:57 +1000
Received: from d23relay04.au.ibm.com (d23relay04.au.ibm.com [9.190.234.120])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 966082BB0055
	for <linux-next@vger.kernel.org>; Thu, 14 Nov 2013 13:17:55 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id rAE20Fn466584710
	for <linux-next@vger.kernel.org>; Thu, 14 Nov 2013 13:00:16 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id rAE2Hs7N024508
	for <linux-next@vger.kernel.org>; Thu, 14 Nov 2013 13:17:54 +1100
In-Reply-To: <20131113122848.GZ13318@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next list <linux-next@vger.kernel.org>

On Wed, 2013-11-13 at 12:28 +0000, Al Viro wrote:
> On Wed, Nov 13, 2013 at 03:21:51PM +0800, Li Zhong wrote:
> > The patch tries to fix following complaint(next-1112) caused by unpaired
> > rcu_read_lock/unlock in function prepend_path():
> 
> Frankly, I wonder if it wouldn't be better to shift rcu_read_unlock()
> past the second done_seqretry() in there...

Do you mean we have rcu_read_lock/unlock outside of the goto loops? 

It seems to me it would cause the two locks(mount,rename) potentially
acquired inside rcu read lock. Or did I misunderstand something here?

Thanks,
Zhong
> 
