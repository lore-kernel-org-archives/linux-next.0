From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Wed, 4 Feb 2015 16:36:12 +0100
Message-ID: <CA+icZUWeO03=kYT1MZ3p8ZZaUTv-MxzSjL3gjuq1-q-Qm5WYpA@mail.gmail.com>
References: <20150204193535.58f132c5@canb.auug.org.au>
	<CA+icZUXkMv+RYoHLN-BQSrYti8FUjqWih2XsARY4hDAP=2v1Yw@mail.gmail.com>
	<54D237D9.4070209@kernel.dk>
	<CA+icZUXh3jdiF1SbJx4aRzYf2fjq_CErQ5drdQRK36ath0A-SA@mail.gmail.com>
	<54D23B58.9000703@kernel.dk>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54D23B58.9000703@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 4, 2015 at 4:31 PM, Jens Axboe <axboe@kernel.dk> wrote:
> On 02/04/2015 08:21 AM, Sedat Dilek wrote:
>>
>> On Wed, Feb 4, 2015 at 4:16 PM, Jens Axboe <axboe@kernel.dk> wrote:
>>>
>>> On 02/04/2015 05:26 AM, Sedat Dilek wrote:
>>>>
>>>>
>>>> On Wed, Feb 4, 2015 at 9:35 AM, Stephen Rothwell <sfr@canb.auug.org.au>
>>>> wrote:
>>>>>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> The next release I will be making will be next-20150209 - which will
>>>>> probably be after the v3.19 release.
>>>>>
>>>>> Changes since 20150203:
>>>>>
>>>>> The sound-asoc tree gained a conflict against the sound tree.
>>>>>
>>>>> The scsi tree gained a build failure caused by an interaction with the
>>>>> driver-core tree.  I applied a merge fix patch.
>>>>>
>>>>> The akpm-current tree gained a build failure for which I disabled
>>>>> CONFIG_KASAN.
>>>>>
>>>>> Non-merge commits (relative to Linus' tree): 7461
>>>>>    7314 files changed, 309736 insertions(+), 172363 deletions(-)
>>>>>
>>>>>
>>>>>
>>>>> ----------------------------------------------------------------------------
>>>>>
>>>>
>>>> [ CC Jens ]
>>>>
>>>> Hi,
>>>>
>>>> I am seeing the following in my logs several times...
>>>>
>>>> Feb  4 02:53:13 fambox kernel: [15507.397482] blk_update_request: I/O
>>>> error, dev loop0, sector 21261344
>>>> Feb  4 02:53:13 fambox kernel: [15507.397531] loop0: DISCARD failed.
>>>> Manually zeroing.
>>>
>>>
>>>
>>> This is from Martin's commit (CC'ed). Martin, there are various ways we
>>> can
>>> end up "failing" from blkdev_issue_discard(), I'm going to kill those
>>> debug
>>> warnings.
>>>
>>
>> [ Really CC Martin :-) ]
>
>
> Ooops, thanks :-)
>
>> Caused by this one...?
>>
>> commit d93ba7a5a97c9f315bacdcdb8de4e5f368e7b396
>> "block: Add discard flag to blkdev_issue_zeroout() function"
>
>
> That's the one.
>

What's the plan... s/pr_warn/pr_debug ?

- Sedat -
