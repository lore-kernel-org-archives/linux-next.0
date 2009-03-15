From: Felix Blyakher <felixb@sgi.com>
Subject: Re: [xfs-masters] linux-next: xfs tree build failure
Date: Sun, 15 Mar 2009 08:33:46 -0500
Message-ID: <0F2D1207-4AC7-4FB7-9E74-8D8BA1379279@sgi.com>
References: <20090310134547.e5d1d9ee.sfr@canb.auug.org.au> <20090312120441.b9839805.sfr@canb.auug.org.au> <20090315121826.GA25955@disturbed>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay3.sgi.com ([192.48.171.31]:47492 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751512AbZCONdy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Mar 2009 09:33:54 -0400
In-Reply-To: <20090315121826.GA25955@disturbed>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org


On Mar 15, 2009, at 7:18 AM, Dave Chinner wrote:

> On Thu, Mar 12, 2009 at 12:04:41PM +1100, Stephen Rothwell wrote:
>> Hi David,
>>
>> On Tue, 10 Mar 2009 13:45:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au 
>> > wrote:
>>>
>>> Today's linux-next build (x86_64 allmodconfig) failed like this:
>>>
>>> In file included from fs/xfs/support/debug.c:21:
>>> fs/xfs/xfs_error.h:137: error: expected declaration specifiers or  
>>> '...' before 'xfs_mount_t'
>>> fs/xfs/xfs_error.h:138: error: expected ')' before '*' token
>>
>> This is still happening.
>
> Yes, there is a reviewed patch that doesn't appear to have been
> checked into the tree yet....

Checked in now.
Thanks for reporting it.

Felix
