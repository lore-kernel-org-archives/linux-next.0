From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: Tree for Feb 4
Date: Wed, 04 Feb 2015 08:16:41 -0700
Message-ID: <54D237D9.4070209@kernel.dk>
References: <20150204193535.58f132c5@canb.auug.org.au> <CA+icZUXkMv+RYoHLN-BQSrYti8FUjqWih2XsARY4hDAP=2v1Yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+icZUXkMv+RYoHLN-BQSrYti8FUjqWih2XsARY4hDAP=2v1Yw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sedat.dilek@gmail.com, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 02/04/2015 05:26 AM, Sedat Dilek wrote:
> On Wed, Feb 4, 2015 at 9:35 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> The next release I will be making will be next-20150209 - which will
>> probably be after the v3.19 release.
>>
>> Changes since 20150203:
>>
>> The sound-asoc tree gained a conflict against the sound tree.
>>
>> The scsi tree gained a build failure caused by an interaction with the
>> driver-core tree.  I applied a merge fix patch.
>>
>> The akpm-current tree gained a build failure for which I disabled
>> CONFIG_KASAN.
>>
>> Non-merge commits (relative to Linus' tree): 7461
>>   7314 files changed, 309736 insertions(+), 172363 deletions(-)
>>
>> ----------------------------------------------------------------------------
>>
>
> [ CC Jens ]
>
> Hi,
>
> I am seeing the following in my logs several times...
>
> Feb  4 02:53:13 fambox kernel: [15507.397482] blk_update_request: I/O
> error, dev loop0, sector 21261344
> Feb  4 02:53:13 fambox kernel: [15507.397531] loop0: DISCARD failed.
> Manually zeroing.

This is from Martin's commit (CC'ed). Martin, there are various ways we 
can end up "failing" from blkdev_issue_discard(), I'm going to kill 
those debug warnings.

-- 
Jens Axboe
