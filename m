From: Jiri Kosina <jikos@kernel.org>
Subject: Re: linux-next: build failure after merge of the hid tree
Date: Mon, 12 Dec 2016 09:50:40 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1612120950140.16984@cbobk.fhfr.pm>
References: <20161212105903.418e913f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45235 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932244AbcLLIuo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Dec 2016 03:50:44 -0500
In-Reply-To: <20161212105903.418e913f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Jo=E3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>, David Arcari <darcari@redhat.com>

On Mon, 12 Dec 2016, Stephen Rothwell wrote:

> Hi Jiri,
> 
> After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/hid/i2c-hid/i2c-hid.c: In function 'i2c_hid_start':
> drivers/hid/i2c-hid/i2c-hid.c:773:19: error: 'struct i2c_hid' has no member named 'irq'
>    disable_irq(ihid->irq);
>                    ^
> drivers/hid/i2c-hid/i2c-hid.c:777:18: error: 'struct i2c_hid' has no member named 'irq'
>    enable_irq(ihid->irq);
>                   ^
> 
> Caused by commit
> 
>   de3c99488609 ("HID: i2c-hid: Disable IRQ before freeing buffers")
> 
> interacting with commit
> 
>   ba18a9314a94 ("Revert "HID: i2c-hid: Add support for ACPI GPIO interrupts"")
> 
> from earlier in the same tree!
> 
> I have used the hid tree from next-20161209 for today.

I've now pushed out fixed for-next branch. Thanks,

-- 
Jiri Kosina
SUSE Labs
