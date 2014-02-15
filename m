From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] powerpc: Fix "attempt to move .org backwards" error
Date: Sat, 15 Feb 2014 10:02:31 -0800
Message-ID: <52FFABB7.3090302@roeck-us.net>
References: <20131209191015.22974.31604.stgit@mars> <20131210101031.82b02468d32ddb89481b24b9@canb.auug.org.au> <1386631570.32037.40.camel@pasglop> <20140212162251.57472ed024ace170b49ec2fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:53233 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753500AbaBOSCd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 15 Feb 2014 13:02:33 -0500
In-Reply-To: <20140212162251.57472ed024ace170b49ec2fa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>, linux-next <linux-next@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On 02/11/2014 09:22 PM, Stephen Rothwell wrote:
> Hi all,
>
> On Tue, 10 Dec 2013 10:26:10 +1100 Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:
>>
>> On Tue, 2013-12-10 at 10:10 +1100, Stephen Rothwell wrote:
>>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>
>>> Works for me.  Thanks.  I will add this to linux-next today if Ben
>>> doesn't add it to his tree.
>>
>> I will but probably not soon enough for your cut today
>
> As noted elsewhere, this did not completely fix the problem and I have
> been still getting this error from my allyesconfig builds for some time:
>

+allmodconfig in latest mainline.

> arch/powerpc/kernel/exceptions-64s.S: Assembler messages:
> arch/powerpc/kernel/exceptions-64s.S:1312: Error: attempt to move .org backwards
>
> Could someone please fix this?
>

Guenter
