From: Belisko Marek <marek.belisko@gmail.com>
Subject: Re: linux-next: build failure after merge of the battery tree
Date: Wed, 21 Oct 2015 08:12:37 +0200
Message-ID: <CAAfyv36mLX2FZW5HYsH1Lh7ybTVLyUh1K1EwCyCxa9gKRV+v6w@mail.gmail.com>
References: <20150929114531.2d611a2a@canb.auug.org.au>
	<20151002114932.043376ca@canb.auug.org.au>
	<20151008120424.6813920f@canb.auug.org.au>
	<20151016012639.420c31c7@canb.auug.org.au>
	<20151021093256.1198358f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:36143 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752694AbbJUGMj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2015 02:12:39 -0400
In-Reply-To: <20151021093256.1198358f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sebastian Reichel <sre@kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>

Adding Tony to CC

On Wed, Oct 21, 2015 at 12:32 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Sebastian,
>
> On Fri, 16 Oct 2015 01:26:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Thu, 8 Oct 2015 12:04:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > On Fri, 2 Oct 2015 11:49:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > >
>> > > On Tue, 29 Sep 2015 11:45:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > > >
>> > > > After merging the battery tree, today's linux-next build (arm
>> > > > multi_v7_defconfig) failed like this:
>> > > >
>> > > > ERROR (phandle_references): Reference to non-existent node or label "twl4030_madc"
>> > > > ERROR: Input tree has errors, aborting (use -f to force output)
>> > > > scripts/Makefile.lib:293: recipe for target 'arch/arm/boot/dts/omap3-beagle-xm-ab.dtb' failed
>> > > >
>> > > > and many more ...
>> > > >
>> > > > Caused by commit
>> > > >
>> > > >   af19161aaed7 ("ARM: dts: twl4030: Add iio properties for bci subnode")
>> > > >
>> > > > Presumably some updates to other files were missed.
>> > > >
>> > > > I have used the battery tree from next-20150925 fot today.
>> > >
>> > > I am still getting this error.
>> >
>> > Ping?
>>
>> I still got this error today ...
>
> And still ... This has been going on for 4 weeks now ... either revert
> the commit or get it fixed.  Nothing added to the battery tree since
> September 25 has been able to be tested in linux-next.
I posted last week fix [0]. Tony can you please merge it? Thanks.
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

[0] - https://lkml.org/lkml/2015/10/13/816

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
