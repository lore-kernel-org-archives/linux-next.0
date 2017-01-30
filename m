From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Sun, 29 Jan 2017 20:07:28 -0700
Message-ID: <a6d77e7a-2c5c-9dd9-f270-278dc3a5b060@kernel.dk>
References: <20170130124350.36a57549@canb.auug.org.au>
 <5f2da80f-c6fe-8c45-0e56-819aae7d925c@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:38781 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750994AbdA3DHb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Jan 2017 22:07:31 -0500
Received: by mail-it0-f54.google.com with SMTP id c7so93017803itd.1
        for <linux-next@vger.kernel.org>; Sun, 29 Jan 2017 19:07:31 -0800 (PST)
In-Reply-To: <5f2da80f-c6fe-8c45-0e56-819aae7d925c@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On 01/29/2017 06:53 PM, Jens Axboe wrote:
> On 01/29/2017 06:43 PM, Stephen Rothwell wrote:
>> Hi Jens,
>>
>> After merging the block tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/nvme/host/scsi.c: In function 'nvme_scsi_translate':
>> drivers/nvme/host/scsi.c:2350:9: error: 'BLK_MAX_CDB' undeclared (first use in this function)
>>   u8 cmd[BLK_MAX_CDB];
>>          ^
>> drivers/nvme/host/scsi.c:2350:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nvme/host/scsi.c:2350:5: warning: unused variable 'cmd' [-Wunused-variable]
>>   u8 cmd[BLK_MAX_CDB];
>>      ^
>> drivers/nvme/host/scsi.c: In function 'nvme_sg_io':
>> drivers/nvme/host/scsi.c:2454:20: error: 'BLK_MAX_CDB' undeclared (first use in this function)  
>>   if (hdr.cmd_len > BLK_MAX_CDB)
>>                     ^
>>
>> Caused by commit
>>
>>   82ed4db499b8 ("block: split scsi_request out of struct request")
>>
>> I have used the block tree from next-20170125 for today.
> 
> Huh, I wonder how that snuck past my allmodconfig builds, that looks
> like a clear failure.

Fixed, sorry about that.

-- 
Jens Axboe
