From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with the file-locks
 tree
Date: Wed, 28 Jun 2017 06:44:04 -0600
Message-ID: <88c5406c-5380-436e-7b5d-e5037195c177@kernel.dk>
References: <20170628115721.3e594e2c@canb.auug.org.au>
 <4feec680-6d4f-abbe-c025-61b462612dde@kernel.dk>
 <1498643640.4644.1.camel@poochiereds.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f43.google.com ([74.125.83.43]:35501 "EHLO
        mail-pg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751818AbdF1MoG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Jun 2017 08:44:06 -0400
Received: by mail-pg0-f43.google.com with SMTP id j186so31350540pge.2
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2017 05:44:06 -0700 (PDT)
In-Reply-To: <1498643640.4644.1.camel@poochiereds.net>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Layton <jlayton@poochiereds.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 06/28/2017 03:54 AM, Jeff Layton wrote:
> On Tue, 2017-06-27 at 20:01 -0600, Jens Axboe wrote:
>> On 06/27/2017 07:57 PM, Stephen Rothwell wrote:
>>> Hi Jens,
>>>
>>> Today's linux-next merge of the block tree got a conflict in:
>>>
>>>   include/linux/fs.h
>>>
>>> between commit:
>>>
>>>   3f64df8a51ce ("fs: new infrastructure for writeback error handling and reporting")
>>>
>>> from the file-locks tree and commit:
>>>
>>>   c75b1d9421f8 ("fs: add fcntl() interface for setting/getting write life time hints")
>>>
>>> from the block tree.
>>
>> Looks like we stole the same hole! Let's just merge it like this, then
>> post merge I (or Jeff) can move the member to a better location.
>>
> 
> (cc'ing Al since he might pick these up...)
> 
> Indeed!
> 
> I'll plan to move f_wb_err to the end of the struct.
> 
> I have some later patches that add a second 32-bit errseq_t field to
> struct file for tracking metadata writeback errors. That would make them
> adjacent to one another which at least looks a little cleaner.

OK perfect, I'll just ignore the issue then :-)

-- 
Jens Axboe
