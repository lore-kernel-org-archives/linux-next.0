From: Chris Mason <chris.mason@fusionio.com>
Subject: Re: Boot failure on Arndale with next-20131105
Date: Tue, 5 Nov 2013 15:33:08 -0500
Message-ID: <20131105203308.3802.45122@localhost.localdomain>
References: <CAHbNUh1Cw3bc4WR0VcD1H_eKYqGBtv_215_euh6mwTbZ41ejUw@mail.gmail.com>
 <52794823.7080503@kernel.dk>
 <CAOesGMj1xXXM-gNgWQwBKOczpJtM7CobYy4h7Fe=4W3U43EJGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from dkim2.fusionio.com ([66.114.96.54]:37318 "EHLO
	dkim2.fusionio.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754403Ab3KEUdP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2013 15:33:15 -0500
Received: from mx1.fusionio.com (unknown [10.101.1.160])
	by dkim2.fusionio.com (Postfix) with ESMTP id 5B8649A0372
	for <linux-next@vger.kernel.org>; Tue,  5 Nov 2013 13:33:15 -0700 (MST)
In-Reply-To: <CAOesGMj1xXXM-gNgWQwBKOczpJtM7CobYy4h7Fe=4W3U43EJGQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Jens Axboe <axboe@kernel.dk>
Cc: Tushar Behera <tushar.behera@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Quoting Olof Johansson (2013-11-05 15:23:51)
> On Tue, Nov 5, 2013 at 11:33 AM, Jens Axboe <axboe@kernel.dk> wrote:

[ horrible crashes fixed by removing my patch ]

> > Very weird! What file system is being used?
> 
> Most of my failures have happened on regular MMC cards with ext4
> filesystems on them.
> 
> Note that the panic happens during device probe / partition table
> scanning, not after mounting the filesystem.
> 
> Giving your patch a go now across the board. I'm very concerned about
> the reports of bisectability, build failures and heaps of warnings
> though. Did the 0-day builder pick up any of those? :-/
> 

Hmmm, is bcache in your config?

-chris
