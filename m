From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: failing to fetch the sysctl tree
Date: Mon, 07 Nov 2011 16:52:17 -0800
Message-ID: <m1pqh3o2pq.fsf@fess.ebiederm.org>
References: <20111107095835.208466a386fbcf046c512d70@canb.auug.org.au>
	<m139e0q0n5.fsf@fess.ebiederm.org>
	<20111107213319.01f37a306f1c29faa386891e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:40241 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750771Ab1KHAv0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Nov 2011 19:51:26 -0500
In-Reply-To: <20111107213319.01f37a306f1c29faa386891e@canb.auug.org.au>
	(Stephen Rothwell's message of "Mon, 7 Nov 2011 21:33:19 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> On Sun, 06 Nov 2011 15:41:50 -0800 ebiederm@xmission.com (Eric W. Biederman) wrote:
>>
>> Something weird happened when I re-uploaded things.  Apparently hitting
>> Ctrl-C if when you are uploading and realized you forgot to clone from
>> Linus's repository is fatal to how git.kernel.org manages things.  Last
>> I checked I could not even delete the broken repository.
>> 
>> Can you please switch to linux/kernel/git/ebiederm/sysctl.git instead of
>> sysctl-2.6.git.
>
> Done.
>
> BTW to remove the other tree do this:
>
> ssh gitolte@ra.kernel.org unlock pub/scm/linux/kernel/git/ebiederm/sysctl-2.6
> ssh gitolte@ra.kernel.org rm pub/scm/linux/kernel/git/ebiederm/sysctl-2.6

Thanks.  unlock was apparently the gitolite magic command I did not know about.

Eric
