From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: Request the EXTCON remote-tracking branch
Date: Thu, 12 Mar 2015 10:16:17 +0900
Message-ID: <5500E8E1.7010800@samsung.com>
References: <54FFA674.2060006@samsung.com>
 <20150312101807.29983bf5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23274 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752059AbbCLBQU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2015 21:16:20 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NL200H6FRJ6ZRA0@mailout3.samsung.com> for
 linux-next@vger.kernel.org; Thu, 12 Mar 2015 10:16:18 +0900 (KST)
In-reply-to: <20150312101807.29983bf5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Stephen,

On 03/12/2015 08:18 AM, Stephen Rothwell wrote:
> Hi Chanwoo,
> 
> On Wed, 11 Mar 2015 11:20:36 +0900 Chanwoo Choi <cw00.choi@samsung.com> wrote:
>>
>> I'm a maintainer of EXTCON (External Connector) subsystem. I want to
>> merge latest extcon patch-set (extcon-next) to linux-next git repository
>> for integration test.
>>
>> EXTCON git repository:
>> - git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git (branch name : extcon-next)
> 
> That isn't really your repository, now is it? :-)
> 
> I used git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git

You're right. I'm so sorry about wrong information of extcon.git respository.

> 
> I have added your tree from today.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 

Thanks for your effort.

Best Regards,
Chanwoo Choi
