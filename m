From: david@protonic.nl
Subject: Re: linux-next: manual merge of the mfd tree with the i.MX tree
Date: Wed, 2 Mar 2011 07:43:39 +0100 (CET)
Message-ID: <37329.84.56.74.117.1299048219.squirrel@protonic.xs4all.nl>
References: <20110301145436.b1ae1923.sfr@canb.auug.org.au>
    <20110301093528.00184f93@archvile> <20110301113930.4743a13c@debxo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from protonic.xs4all.nl ([213.84.116.84]:18386 "EHLO protonic.prtnl"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750831Ab1CBHPr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Mar 2011 02:15:47 -0500
In-Reply-To: <20110301113930.4743a13c@debxo>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andres Salomon <dilinger@queued.net>
Cc: David Jander <david.jander@protonic.nl>, Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Jander <david@protonic.nl>, Sascha Hauer <s.hauer@pengutronix.de>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>

> On Tue, 1 Mar 2011 09:35:28 +0100
> David Jander <david.jander@protonic.nl> wrote:
>
>>
>> Hi Stephen,
>>
>> On Tue, 1 Mar 2011 14:54:36 +1100
>> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > Today's linux-next merge of the mfd tree got a conflict in
>> > arch/arm/mach-imx/mach-mx27_3ds.c arch/arm/mach-imx/mach-pcm038.c
>> > arch/arm/mach-mx3/mach-mx31_3ds.c
>> > arch/arm/mach-mx3/mach-mx31moboard.c between commit
>> > 5836372e8a0ba5cc633f61bc0484ee20c86f4b36 ("ARM: imx+mx3: convert to
>> > mc13xxx MFD") from the i.MX tree and commit
>> > e84e545d47d26644275a79fe5ebc1797bcb80910 ("mfd: mfd_cell is now
>> > implicitly available to mc13xxx drivers") from the mfd tree.
>> >
>> > I fixed it up (I think - see below) and can carry the fix as
>> > necessary.
>>
>> Your fix seems correct, although I fear I am too dumb to understand
>> why commit e84e545d47d26644275a79fe5ebc1797bcb80910 introduces this
>> extra struct nesting.... AFAICS gcc will end up doing the same as
>> without the extra nest.
>
> It was requested in this thread:
> https://patchwork.kernel.org/patch/551441/

Ah, ok. I thought this change was somehow necessary for your patch to
work. I would have expected a separate patch otherwise.

Best regards,

-- 
David Jander
