From: Nitin Gupta <ngupta@vflare.org>
Subject: Re: [PATCH] Allow sharing xvmalloc for zram and zcache
Date: Sat, 19 Feb 2011 04:05:38 +0530
Message-ID: <4D5EF43A.5040905@vflare.org>
References: <1297371646-11604-1-git-send-email-ngupta@vflare.org> <20110218212542.GI796@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:41700 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753589Ab1BRWfF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Feb 2011 17:35:05 -0500
In-Reply-To: <20110218212542.GI796@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Magenheimer <dan.magenheimer@oracle.com>, Randy Dunlap <randy.dunlap@oracle.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On 02/19/2011 02:55 AM, Greg KH wrote:
> On Thu, Feb 10, 2011 at 04:00:46PM -0500, Nitin Gupta wrote:
>> Both zram and zcache use xvmalloc allocator. If xvmalloc
>> is compiled separately for both of them, we will get linker
>> error if they are both selected as "built-in". We can also
>> get linker error regarding missing xvmalloc symbols if zram
>> is not built.
>>
>> So, we now compile xvmalloc separately and export its symbols
>> which are then used by both of zram and zcache.
>>
>> Signed-off-by: Nitin Gupta<ngupta@vflare.org>
>
> This doesn't apply to my tree, care to respin it and resend?
>


The new patch:
https://lkml.org/lkml/2011/2/18/340

applies to staging-next branch of the staging-2.6 tree.

Thanks,
Nitin
