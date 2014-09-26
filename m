From: Brian King <brking@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Fri, 26 Sep 2014 07:43:13 -0500
Message-ID: <54255F61.4060302@linux.vnet.ibm.com>
References: <20140926183450.7474b448@canb.auug.org.au> <20140926083632.GA19463@lst.de> <1411725461.2183.2.camel@jarvis>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e9.ny.us.ibm.com ([32.97.182.139]:55181 "EHLO e9.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754374AbaIZMnT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Sep 2014 08:43:19 -0400
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <brking@linux.vnet.ibm.com>;
	Fri, 26 Sep 2014 08:43:18 -0400
In-Reply-To: <1411725461.2183.2.camel@jarvis>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xiong <wenxiong@linux.vnet.ibm.com>

On 09/26/2014 04:57 AM, James Bottomley wrote:
> On Fri, 2014-09-26 at 10:36 +0200, Christoph Hellwig wrote:
>> On Fri, Sep 26, 2014 at 06:34:50PM +1000, Stephen Rothwell wrote:
>>> Hi James,
>>>
>>> After merging the scsi tree, today's linux-next build (powerpc
>>> ppc64_defconfig) failed like this:
>>>
>>> drivers/scsi/ipr.c: In function 'ipr_handle_log_data':
>>> drivers/scsi/ipr.c:2468:15: error: 'IPR_IOASC_HW_CMD_FAILED' undeclared (first use in this function)
>>>   if (ioasc == IPR_IOASC_HW_CMD_FAILED &&
>>>                ^
>>>
>>> Caused by commit 3185ea63907c ("ipr: don't log error messages when
>>> applications issues illegal requests").  Someone typoed that name in
>>> ipr.h ...
>>>
>>> I have reverted that commit for today.
>>
>> Thanks.  The fix should be here:
>>
>> http://git.infradead.org/users/hch/scsi-queue.git/commitdiff/d247a70a4d67623eb738176ee703a7bb8b6c325c
> 
> OK, Pushed out.
> 
> I'll wait for the next couple of build cycles before pushing (assuming
> merge window opens on Sunday) just in case more things show up.

Hi James,

Anything preventing this patch set from getting picked up? Do you need a resend?

http://marc.info/?l=linux-scsi&m=140657929221696&w=2

Thanks,

Brian

-- 
Brian King
Power Linux I/O
IBM Linux Technology Center
