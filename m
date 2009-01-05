From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: Pull request for Squashfs
Date: Mon, 05 Jan 2009 13:03:25 +0000
Message-ID: <4962051D.3050205@lougher.demon.co.uk>
References: <E1Kv0C3-0006GU-ES@dylan>	<20081028192919.94def38b.akpm@linux-foundation.org>	<4961FD0C.8040309@lougher.demon.co.uk> <20090105235241.3a2d54fc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from anchor-post-2.mail.demon.net ([195.173.77.133]:53407 "EHLO
	anchor-post-2.mail.demon.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751140AbZAENDM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Jan 2009 08:03:12 -0500
In-Reply-To: <20090105235241.3a2d54fc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Hi Phillip, Andrew,
> 
> On Mon, 05 Jan 2009 12:29:00 +0000 Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
>> Andrew Morton wrote:
>>
>>> Generally looks OK to me.  Please prepare a tree for linux-next
>>> inclusion and unless serious problems are pointed out I'd suggest
>>> shooting for a 2.6.29 merge.
>> Can you try pulling the master branch of:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
>>
>> into linux-next please?
>>
>> The Squashfs patches have been tested.
> 
> Is this intended for 2.6.29 (even this late) or should I wait until after
> -rc1 to add this to linux-next?
> 

Hmm, I didn't realise it was late for 2.6.29 :-(  I'd prefer it to be 
for 2.6.29 if possible.  But the decision isn't probably up to me...

Thanks

Phillip
