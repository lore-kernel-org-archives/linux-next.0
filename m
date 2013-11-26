From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: build warnings after merge of the block tree
Date: Tue, 26 Nov 2013 11:01:13 -0800
Message-ID: <CAOesGMiPpetDRt7dfHvcZ3LTSYyR3CBj2L2kq=pBMamkzCbb3A@mail.gmail.com>
References: <20131126132946.e402679788ae8269f0c5128a@canb.auug.org.au>
	<20131126143550.7a2195476ff4aa5c73db20b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qe0-f51.google.com ([209.85.128.51]:49145 "EHLO
	mail-qe0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753314Ab3KZTBO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Nov 2013 14:01:14 -0500
Received: by mail-qe0-f51.google.com with SMTP id 1so3966942qee.24
        for <linux-next@vger.kernel.org>; Tue, 26 Nov 2013 11:01:13 -0800 (PST)
In-Reply-To: <20131126143550.7a2195476ff4aa5c73db20b2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kent Overstreet <kmo@daterainc.com>

On Mon, Nov 25, 2013 at 7:35 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Tue, 26 Nov 2013 13:29:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the block tree, today's linux-next build (arm
>> multi_v7_defconfig) produced these warnings:
>>
>> block/blk-merge.c: In function 'blk_rq_map_sg':
>> block/blk-merge.c:133:8: warning: 'bvprv.bv_len' may be used uninitialized in this function [-Wuninitialized]
>> block/blk-merge.c:171:23: note: 'bvprv.bv_len' was declared here
>> block/blk-merge.c:133:8: warning: 'bvprv.bv_page' may be used uninitialized in this function [-Wuninitialized]
>> block/blk-merge.c:171:23: note: 'bvprv.bv_page' was declared here
>> block/blk-merge.c:133:8: warning: 'bvprv.bv_offset' may be used uninitialized in this function [-Wuninitialized]
>> block/blk-merge.c:171:23: note: 'bvprv.bv_offset' was declared here
>> block/blk-merge.c: In function 'blk_bio_map_sg':
>> block/blk-merge.c:133:8: warning: 'bvprv.bv_len' may be used uninitialized in this function [-Wuninitialized]
>> block/blk-merge.c:233:23: note: 'bvprv.bv_len' was declared here
>> block/blk-merge.c:133:8: warning: 'bvprv.bv_offset' may be used uninitialized in this function [-Wuninitialized]
>> block/blk-merge.c:233:23: note: 'bvprv.bv_offset' was declared here
>> block/blk-merge.c:133:8: warning: 'bvprv.bv_page' may be used uninitialized in this function [-Wuninitialized]
>> block/blk-merge.c:233:23: note: 'bvprv.bv_page' was declared here
>> block/blk-merge.c: In function 'attempt_merge':
>> block/blk-merge.c:108:7: warning: 'end_bv.bv_offset' may be used uninitialized in this function [-Wuninitialized]
>> block/blk-merge.c:89:17: note: 'end_bv.bv_offset' was declared here
>> block/blk-merge.c:108:7: warning: 'end_bv.bv_page' may be used uninitialized in this function [-Wuninitialized]
>> block/blk-merge.c:89:17: note: 'end_bv.bv_page' was declared here
>> block/blk-merge.c:108:7: warning: 'end_bv.bv_len' may be used uninitialized in this function [-Wuninitialized]
>> block/blk-merge.c:89:17: note: 'end_bv.bv_len' was declared here
>>
>> arm has its own definition of BIOVEC_PHYS_MERGEABLE() if that is relevant.
>
> For an easier test case, the i386 defcongig does this as well.

I just noticed that i see this with gcc 4.7.0, but 4.8.1 does not warn.


-Olof
