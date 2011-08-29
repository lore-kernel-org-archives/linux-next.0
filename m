From: Giridhar Malavali <giridhar.malavali@qlogic.com>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Mon, 29 Aug 2011 01:07:16 -0700
Message-ID: <CA809449.296D8%giridhar.malavali@qlogic.com>
References: <1314602256.5038.1.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:56632 "EHLO
	TX2EHSOBE002.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753076Ab1H2IHV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Aug 2011 04:07:21 -0400
In-Reply-To: <1314602256.5038.1.camel@dabdike>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chad Dupuis <chad.dupuis@qlogic.com>



>>

>On Mon, 2011-08-29 at 12:09 +1000, Stephen Rothwell wrote:
>> Hi James,
>> 
>> After merging the scsi tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>> 
>> drivers/scsi/qla2xxx/qla_nx.c: In function 'qla82xx_md_alloc':
>> drivers/scsi/qla2xxx/qla_nx.c:4815:2: error: implicit declaration of
>>function 'vmalloc'
>> drivers/scsi/qla2xxx/qla_nx.c:4815:14: warning: assignment makes
>>pointer from integer without a cast
>> drivers/scsi/qla2xxx/qla_nx.c: In function 'qla82xx_md_free':
>> drivers/scsi/qla2xxx/qla_nx.c:4845:3: error: implicit declaration of
>>function 'vfree'
>> 
>> Caused by commit b60bb5832c00 ("[SCSI] qla2xxx: Add support for ISP82xx
>> to capture dump (minidump) on failure").  Missing include of
>> linux/vmalloc.h.  See Rule 1 in Documentation/SubmitChecklist.
>> 
>> I have used the scsi tree from next-20110826 for today.
>
>Thanks for finding the problem.  I updated the commit with a simple fix
>and re-pushed.

Thanks James and Stephen for finding and fixing this problem. I will make
sure that such issues won't happen in future.

-- Giri

>
>James
>
>
>
