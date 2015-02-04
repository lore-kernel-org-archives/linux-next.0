From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Wed, 4 Feb 2015 16:21:11 +0100
Message-ID: <CA+icZUXh3jdiF1SbJx4aRzYf2fjq_CErQ5drdQRK36ath0A-SA@mail.gmail.com>
References: <20150204193535.58f132c5@canb.auug.org.au>
	<CA+icZUXkMv+RYoHLN-BQSrYti8FUjqWih2XsARY4hDAP=2v1Yw@mail.gmail.com>
	<54D237D9.4070209@kernel.dk>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:55389 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755315AbbBDPVM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2015 10:21:12 -0500
In-Reply-To: <54D237D9.4070209@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>

On Wed, Feb 4, 2015 at 4:16 PM, Jens Axboe <axboe@kernel.dk> wrote:
> On 02/04/2015 05:26 AM, Sedat Dilek wrote:
>>
>> On Wed, Feb 4, 2015 at 9:35 AM, Stephen Rothwell <sfr@canb.auug.org.au>
>> wrote:
>>>
>>> Hi all,
>>>
>>> The next release I will be making will be next-20150209 - which will
>>> probably be after the v3.19 release.
>>>
>>> Changes since 20150203:
>>>
>>> The sound-asoc tree gained a conflict against the sound tree.
>>>
>>> The scsi tree gained a build failure caused by an interaction with the
>>> driver-core tree.  I applied a merge fix patch.
>>>
>>> The akpm-current tree gained a build failure for which I disabled
>>> CONFIG_KASAN.
>>>
>>> Non-merge commits (relative to Linus' tree): 7461
>>>   7314 files changed, 309736 insertions(+), 172363 deletions(-)
>>>
>>>
>>> ----------------------------------------------------------------------------
>>>
>>
>> [ CC Jens ]
>>
>> Hi,
>>
>> I am seeing the following in my logs several times...
>>
>> Feb  4 02:53:13 fambox kernel: [15507.397482] blk_update_request: I/O
>> error, dev loop0, sector 21261344
>> Feb  4 02:53:13 fambox kernel: [15507.397531] loop0: DISCARD failed.
>> Manually zeroing.
>
>
> This is from Martin's commit (CC'ed). Martin, there are various ways we can
> end up "failing" from blkdev_issue_discard(), I'm going to kill those debug
> warnings.
>

[ Really CC Martin :-) ]

Caused by this one...?

commit d93ba7a5a97c9f315bacdcdb8de4e5f368e7b396
"block: Add discard flag to blkdev_issue_zeroout() function"

- Sedat -

[1] http://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=d93ba7a5a97c9f315bacdcdb8de4e5f368e7b396
