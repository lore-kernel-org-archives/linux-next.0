From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] Fix xfs build when CONFIG_XFS_POSIX_ACL=n
Date: Wed, 28 Jul 2010 10:25:49 -0700
Message-ID: <4C50681D.6020306@oracle.com>
References: <4c3f42cf1240489af5@agluck-desktop.sc.intel.com>	 <20100726084829.b173ffe3.randy.dunlap@oracle.com> <1280326978.2238.4.camel@doink>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:23379 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754526Ab0G1R0R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Jul 2010 13:26:17 -0400
In-Reply-To: <1280326978.2238.4.camel@doink>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: aelder@sgi.com
Cc: "Luck, Tony" <tony.luck@intel.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>

On 07/28/10 07:22, Alex Elder wrote:
> On Mon, 2010-07-26 at 08:48 -0700, Randy Dunlap wrote:
>> On Thu, 15 Jul 2010 10:18:07 -0700 Luck, Tony wrote:
>>
>>> When CONFIG_XFS_POSIX_ACL is not set "xfs_check_acl" is #defined
>>> to NULL - which breaks the code attempting to add a tracepoint
>>> on this function.
>>>
>>> Only define the tracepoint when the function exists.
>>>
>>> Signed-off-by: Tony Luck <tony.luck@intel.com>
>>
>> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> Alex, can we get this merged for linux-next, please?
>> This problem causes lots of xfs build errors in linux-next without this patch.
> 
> Confirmed fixed as of today's linux-next build.	-Alex


Thanks.  I'm not seeing those errors today.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
