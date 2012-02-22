From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Feb 17 (kernel/kcmp.c)
Date: Wed, 22 Feb 2012 12:20:48 -0800
Message-ID: <4F454E20.2060505@xenotime.net>
References: <20120217165045.2394d944d6efc37104421d2e@canb.auug.org.au> <4F3E95B7.3010700@xenotime.net> <20120218101446.64a7ea590b66f337762bfb57@canb.auug.org.au> <20120218065846.GA1905@moon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:37424 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751871Ab2BVUUv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Feb 2012 15:20:51 -0500
In-Reply-To: <20120218065846.GA1905@moon>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cyrill Gorcunov <gorcunov@openvz.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On 02/17/2012 10:58 PM, Cyrill Gorcunov wrote:
> On Sat, Feb 18, 2012 at 10:14:46AM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Fri, 17 Feb 2012 10:00:23 -0800 Randy Dunlap<rdunlap@xenotime.net>  wrote:
>>>
>>> on i386:
>>>
>>> kernel/kcmp.c:153:10: error: 'EOPNOTSUP' undeclared (first use in this
>>> function)
>>
>> Caused by commit 0e8a8193207d ("syscalls, x86: add __NR_kcmp syscall")
>> from the akpm tree.  Missing include of linux/errno.h ...
>>
>
> Ouch. Thanks Stephen for catching this and Andrew for fixing. Sorry.

Since this build error is still occurring in linux-next 20120222,
I looked and found that the Ecode is misspelled.

Please s/EOPNOTSUP/EOPNOTSUPP/

thanks,
-- 
~Randy
