From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 3 Dec 2015 09:39:01 +0100
Message-ID: <565FFFA5.6000003@bjorling.me>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
 <20151202164527.GA31048@lst.de> <565F5D96.5050902@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:34309 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758675AbbLCIjE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2015 03:39:04 -0500
Received: by wmvv187 with SMTP id v187so15489429wmv.1
        for <linux-next@vger.kernel.org>; Thu, 03 Dec 2015 00:39:03 -0800 (PST)
In-Reply-To: <565F5D96.5050902@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Mark Brown <broonie@kernel.org>
Cc: Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org

On 12/02/2015 10:07 PM, Jens Axboe wrote:
> On 12/02/2015 09:45 AM, Christoph Hellwig wrote:
>> Looks like I didn't test with CONFIG_NVM enabled, and neither did
>> the build bot.
>>
>> Most of this is really weird crazy shit in the lighnvm support, though.
>>
>> Struct nvme_ns is a structure for the NVM I/O command set, and it has
>> no business poking into it.  Second this commit:
>>
>> commit 47b3115ae7b799be8b77b0f024215ad4f68d6460
>> Author: Wenwei Tao <ww.tao0320@gmail.com>
>> Date:   Fri Nov 20 13:47:55 2015 +0100
>>
>>      nvme: lightnvm: use admin queues for admin cmds
>>
>> Does even more crazy stuff.  If a function gets a request_queue parameter
>> passed it'd better use that and not look for another one.

A little crazy yes. The reason is that the NVMe admin queues and NVMe 
user queues are driven by different request queues. Previously this was 
patched up with having two queues in the lightnvm core. One for admin 
and another for user. But was later merged into a single queue.

We can pass both request queues into lightnvm core, but I prefer to 
handle it in some good way in the nvme-lightnvm integration.
