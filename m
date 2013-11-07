From: Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Thu, 07 Nov 2013 13:38:28 -0600
Message-ID: <527BEC34.4000008@oracle.com>
References: <20131101142026.10390b6e3f70de348770c137@canb.auug.org.au> <5273C473.5070803@kernel.dk> <20131102072252.88d2380fa392705b912dbfad@canb.auug.org.au> <52740EB1.2070901@kernel.dk> <527411DD.7050008@oracle.com> <527414DE.9090704@kernel.dk> <52756583.2030808@oracle.com> <527BE7FA.90904@oracle.com> <20131107192545.GA20624@moria.home.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:47376 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336Ab3KGTik (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2013 14:38:40 -0500
In-Reply-To: <20131107192545.GA20624@moria.home.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kent Overstreet <kmo@daterainc.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zach Brown <zab@zabbo.net>, Olof Johansson <olof@lixom.net>



On 11/07/2013 01:25 PM, Kent Overstreet wrote:
> On Thu, Nov 07, 2013 at 01:20:26PM -0600, Dave Kleikamp wrote:
>> On 11/02/2013 03:50 PM, Dave Kleikamp wrote:
>>> On 11/01/2013 03:53 PM, Jens Axboe wrote:
>>
>>>> So we've three immediate options:
>>>>
>>>> 1) You base it on top of the block tree
>>>> 2) I carry the loop updates
>>>> 3) You hand Stephen a merge patch for the resulting merge of the two
>>>
>>> Attached is a merge patch and the merged loop.c. I'm having problems
>>> with the loop driver with both the block and my tree. I'll continue to
>>> look at that, but everything should build cleanly with this.
>>
>> Looking back, I obviously rushed the last patch out. This merge patch,
>> and the resulting loop.c, fix my problem. My code is working with Jens'
>> block tree now.
>>
>> Jens,
>> I ended up replacing a call to bio_iovec_idx() with __bvec_iter_bvec()
>> since the former was removed. It's not very elegant, but it works. I'm
>> open to suggestions on a cleaner fix, but it can wait until one or both
>> of these trees is merged.
> 
> No, that's definitely wrong. Read Documentation/block/biovecs.txt - you
> need to use either the new bio_iovec() or bio_iovec() iter. I can do the
> conversion later today.

I appreciate your help. The patchset requires that the iov_iter
structure can contain either a user-space iovec or a bio_vec, so that
the iov_iter can be passed down transparently into the filesystems. I'll
be happy any way we can get that to work.

Thanks,
Shaggy
