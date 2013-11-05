From: Olof Johansson <olof@lixom.net>
Subject: Re: Boot failure on Arndale with next-20131105
Date: Tue, 5 Nov 2013 12:38:33 -0800
Message-ID: <CAOesGMirg=ex9hLCjGBpj0cMhLeQ5cJQoRv72tgg7PoSKWUDhA@mail.gmail.com>
References: <CAHbNUh1Cw3bc4WR0VcD1H_eKYqGBtv_215_euh6mwTbZ41ejUw@mail.gmail.com>
	<52794823.7080503@kernel.dk>
	<CAOesGMj1xXXM-gNgWQwBKOczpJtM7CobYy4h7Fe=4W3U43EJGQ@mail.gmail.com>
	<20131105203308.3802.45122@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qe0-f48.google.com ([209.85.128.48]:61747 "EHLO
	mail-qe0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752906Ab3KEUig (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2013 15:38:36 -0500
Received: by mail-qe0-f48.google.com with SMTP id d4so5278676qej.7
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2013 12:38:35 -0800 (PST)
In-Reply-To: <20131105203308.3802.45122@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Mason <chris.mason@fusionio.com>
Cc: Jens Axboe <axboe@kernel.dk>, Tushar Behera <tushar.behera@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Tue, Nov 5, 2013 at 12:33 PM, Chris Mason <chris.mason@fusionio.com> wrote:
> Quoting Olof Johansson (2013-11-05 15:23:51)
>> On Tue, Nov 5, 2013 at 11:33 AM, Jens Axboe <axboe@kernel.dk> wrote:
>
> [ horrible crashes fixed by removing my patch ]
>
>> > Very weird! What file system is being used?
>>
>> Most of my failures have happened on regular MMC cards with ext4
>> filesystems on them.
>>
>> Note that the panic happens during device probe / partition table
>> scanning, not after mounting the filesystem.
>>
>> Giving your patch a go now across the board. I'm very concerned about
>> the reports of bisectability, build failures and heaps of warnings
>> though. Did the 0-day builder pick up any of those? :-/
>>
>
> Hmmm, is bcache in your config?

Doesn't look that way -- no ARM defconfigs enable it (it's what I
build and boot), and the option defaults to off and nothing selects
it.


-Olof
