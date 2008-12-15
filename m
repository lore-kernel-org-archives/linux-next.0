From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: next-20081215: kernel BUG at block/cfq-iosched.c:1243
Date: Mon, 15 Dec 2008 23:09:24 +0300
Message-ID: <a4423d670812151209m7c0b6f99oc86dbc6d934fa084@mail.gmail.com>
References: <a4423d670812151029u5458f9b4iaa36316a5f210ff1@mail.gmail.com>
	 <20081215183235.GG32491@kernel.dk>
	 <a4423d670812151038p4bab739fo3a6f9afd1ad3e358@mail.gmail.com>
	 <20081215184440.GI32491@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.30]:61926 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755375AbYLOUJ1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Dec 2008 15:09:27 -0500
In-Reply-To: <20081215184440.GI32491@kernel.dk>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2008/12/15 Jens Axboe <jens.axboe@oracle.com>:
> On Mon, Dec 15 2008, Alexander Beregalov wrote:
>> 2008/12/15 Jens Axboe <jens.axboe@oracle.com>:
>> >> [   23.080733] kernel BUG at block/cfq-iosched.c:1243!
>> >> [   23.080733] invalid opcode: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
>>
>> > Odd, is it reproducible? What is your .config?
>> Yes, it is
>>
>> Config is in attach
>
> It's weird, because the only change for CFQ in that area is the one
> below. Does the oops go away if you back this out?
Yes, it can boot without the patch, no oops.

> From 030a3f02bb42fad91ae84c99924fe3ee162a634d Mon Sep 17 00:00:00 2001
> From: Jens Axboe <jens.axboe@oracle.com>
> Date: Fri, 12 Dec 2008 15:56:31 +0100
> Subject: [PATCH] cfq-iosched: fix race between exiting queue and exiting task
