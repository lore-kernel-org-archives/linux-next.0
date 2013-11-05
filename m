From: Jens Axboe <axboe@kernel.dk>
Subject: Re: Boot failure on Arndale with next-20131105
Date: Tue, 05 Nov 2013 13:34:34 -0700
Message-ID: <5279565A.4050206@kernel.dk>
References: <CAHbNUh1Cw3bc4WR0VcD1H_eKYqGBtv_215_euh6mwTbZ41ejUw@mail.gmail.com>	<52794823.7080503@kernel.dk> <CAOesGMj1xXXM-gNgWQwBKOczpJtM7CobYy4h7Fe=4W3U43EJGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:39198 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752906Ab3KEUey (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2013 15:34:54 -0500
In-Reply-To: <CAOesGMj1xXXM-gNgWQwBKOczpJtM7CobYy4h7Fe=4W3U43EJGQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Tushar Behera <tushar.behera@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Chris Mason <chris.mason@fusionio.com>

On 11/05/2013 01:23 PM, Olof Johansson wrote:
>> Very weird! What file system is being used?
> 
> Most of my failures have happened on regular MMC cards with ext4
> filesystems on them.
> 
> Note that the panic happens during device probe / partition table
> scanning, not after mounting the filesystem.

Hmm ok.

> Giving your patch a go now across the board. I'm very concerned about
> the reports of bisectability, build failures and heaps of warnings
> though. Did the 0-day builder pick up any of those? :-/

Yeah, unfortunately the immutable conversion has turned out to be quite
messy :-(

-- 
Jens Axboe
