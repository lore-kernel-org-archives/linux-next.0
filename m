From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Wed, 04 Feb 2015 10:58:23 -0500
Message-ID: <yq1zj8tactc.fsf@sermon.lab.mkp.net>
References: <20150204193535.58f132c5@canb.auug.org.au>
	<CA+icZUXkMv+RYoHLN-BQSrYti8FUjqWih2XsARY4hDAP=2v1Yw@mail.gmail.com>
	<54D237D9.4070209@kernel.dk>
	<CA+icZUXh3jdiF1SbJx4aRzYf2fjq_CErQ5drdQRK36ath0A-SA@mail.gmail.com>
	<54D23B58.9000703@kernel.dk>
	<CA+icZUWeO03=kYT1MZ3p8ZZaUTv-MxzSjL3gjuq1-q-Qm5WYpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:39483 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755411AbbBDP6g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2015 10:58:36 -0500
In-Reply-To: <CA+icZUWeO03=kYT1MZ3p8ZZaUTv-MxzSjL3gjuq1-q-Qm5WYpA@mail.gmail.com>
	(Sedat Dilek's message of "Wed, 4 Feb 2015 16:36:12 +0100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>

>>>>> "Sedat" == Sedat Dilek <sedat.dilek@gmail.com> writes:

>>>>> I am seeing the following in my logs several times...
>>>>> 
>>>>> Feb 4 02:53:13 fambox kernel: [15507.397482] blk_update_request:
>>>>> I/O error, dev loop0, sector 21261344 Feb 4 02:53:13 fambox
>>>>> kernel: [15507.397531] loop0: DISCARD failed.  Manually zeroing.

Sedat> What's the plan... s/pr_warn/pr_debug ?

The rationale here is that we'd like to log (once) if discard or write
same fail on a given device.

In SCSI we disable these commands if they get failed by the storage. But
it looks like loop keeps advertising discard support after a failure.

Is your loop device encrypted? Do you know why the discard is failing?

-- 
Martin K. Petersen	Oracle Linux Engineering
