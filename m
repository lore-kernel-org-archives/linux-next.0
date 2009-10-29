From: Jeff Moyer <jmoyer@redhat.com>
Subject: Re: next-20091029: fs/aio.c build failure
Date: Thu, 29 Oct 2009 09:07:38 -0400
Message-ID: <x493a52pcv9.fsf@segfault.boston.devel.redhat.com>
References: <a4423d670910290540x21ab0692p90ebd04b5c3d62e@mail.gmail.com>
	<20091029125606.GK10727@kernel.dk> <20091029130135.GL10727@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38765 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751676AbZJ2NHk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Oct 2009 09:07:40 -0400
In-Reply-To: <20091029130135.GL10727@kernel.dk> (Jens Axboe's message of "Thu,
	29 Oct 2009 14:01:36 +0100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, linux-next <linux-next@vger.kernel.org>

Jens Axboe <jens.axboe@oracle.com> writes:

> On Thu, Oct 29 2009, Jens Axboe wrote:
>> On Thu, Oct 29 2009, Alexander Beregalov wrote:
>> > Hi
>> > 
>> > fs/aio.c:1575: error: implicit declaration of function 'blk_run_address_space'
>> > 
>> > CONFIG_BLOCK is not set.
>> 
>> Not the first time this has happened, I think we should just pull the
>> bdi/mapping unplug functions out of CONFIG_BLOCK protection. They work
>> on the backing_dev, so they aren't inherently tied to just block IO.
>
> I committed this:
>
> http://git.kernel.dk/?p=linux-2.6-block.git;a=commit;h=b9d128f1088ea5245109dfc9bbceb128b6371a77
>
> Same as the posted version, but adds the backing-dev.h include to
> fs/aio.c to make it visible as well. Passes compile/link testing here,
> for both CONFIG_BLOCk and !CONFIG_BLOCK.

Thanks for fixing that, Jens!

Acked-by: Jeff Moyer <jmoyer@redhat.com>
