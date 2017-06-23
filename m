From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 22 Jun 2017 21:29:20 -0600
Message-ID: <bfc34735-1839-0204-de3b-dab57a92fdf7@kernel.dk>
References: <20170623130632.03bc60af@canb.auug.org.au>
 <f94e6ae4-e4d9-61fb-9e69-7b2ef08a38aa@kernel.dk>
 <20170623132433.5aff6b19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:34629 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753925AbdFWD3X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jun 2017 23:29:23 -0400
Received: by mail-pf0-f180.google.com with SMTP id s66so17755717pfs.1
        for <linux-next@vger.kernel.org>; Thu, 22 Jun 2017 20:29:23 -0700 (PDT)
In-Reply-To: <20170623132433.5aff6b19@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

On 06/22/2017 09:24 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Thu, 22 Jun 2017 21:09:22 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> I'll cherry pick that commit into the 4.13 branch to get this resolved.
> 
> Merging commit 8e8320c9315c might give a better result ...

To be clear, what I meant (and did) was cherry picking 8e8320c9315c
into for-4.13/block.

-- 
Jens Axboe
