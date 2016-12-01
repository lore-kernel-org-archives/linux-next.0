From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 30 Nov 2016 20:04:53 -0700
Message-ID: <e1f0ec6b-454e-a20c-a655-4302e952644a@kernel.dk>
References: <20161201135517.273c9a4d@canb.auug.org.au>
 <be0dd730-037a-2f42-489a-2a1fc90c8932@kernel.dk>
 <20161201140243.2554a006@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:36292 "EHLO
        mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751937AbcLADE5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2016 22:04:57 -0500
Received: by mail-pf0-f171.google.com with SMTP id 189so42959778pfz.3
        for <linux-next@vger.kernel.org>; Wed, 30 Nov 2016 19:04:57 -0800 (PST)
In-Reply-To: <20161201140243.2554a006@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, xfs@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On 11/30/2016 08:02 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Wed, 30 Nov 2016 20:00:36 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 11/30/2016 07:55 PM, Stephen Rothwell wrote:
>>>
>>> I love APIs changing :-(  
>>
>> It's a necessary evil...
> 
> Yeah
> 
>> This could have been avoided with the XFS tree pulling in the block
>> changes, but that obviously has other implications. Something to watch
>> for when the XFS tree is sent in for the merge window, however.
> 
> Indeed.  Or the block tree, which ever comes last.

Sure, but I usually try and push in the first few days since other trees
depend on mine. So it's more likely that the XFS tree will run into the
issue.

-- 
Jens Axboe
