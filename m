From: Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Thu, 07 Nov 2013 18:04:57 -0600
Message-ID: <527C2AA9.9040608@oracle.com>
References: <20131101142026.10390b6e3f70de348770c137@canb.auug.org.au> <5273C473.5070803@kernel.dk> <20131102072252.88d2380fa392705b912dbfad@canb.auug.org.au> <52740EB1.2070901@kernel.dk> <527411DD.7050008@oracle.com> <527414DE.9090704@kernel.dk> <52756583.2030808@oracle.com> <527BE7FA.90904@oracle.com> <20131107192545.GA20624@moria.home.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:43625 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756503Ab3KHAFV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2013 19:05:21 -0500
In-Reply-To: <20131107192545.GA20624@moria.home.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kent Overstreet <kmo@daterainc.com>, Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zach Brown <zab@zabbo.net>, Olof Johansson <olof@lixom.net>

On 11/07/2013 01:25 PM, Kent Overstreet wrote:
> On Thu, Nov 07, 2013 at 01:20:26PM -0600, Dave Kleikamp wrote:

>> I ended up replacing a call to bio_iovec_idx() with __bvec_iter_bvec()
>> since the former was removed. It's not very elegant, but it works. I'm
>> open to suggestions on a cleaner fix, but it can wait until one or both
>> of these trees is merged.
> 
> No, that's definitely wrong. Read Documentation/block/biovecs.txt - you
> need to use either the new bio_iovec() or bio_iovec() iter. I can do the
> conversion later today.

Stephen,
Can you please drop the aio-direct tree for the time being?

My stuff is not aligning very well with the immutable biovecs and Kent
has a different approach in mind. I'll be working with him on a
replacement that will hopefully be simpler.

Thanks,
Shaggy
