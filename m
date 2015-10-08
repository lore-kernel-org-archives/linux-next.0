From: Belisko Marek <marek.belisko@gmail.com>
Subject: Re: linux-next: build failure after merge of the battery tree
Date: Thu, 8 Oct 2015 08:12:06 +0200
Message-ID: <CAAfyv37Jox-SK9gVORhGUnK5+x=p5SkXy_VeLtWMUePHxnCBFg@mail.gmail.com>
References: <20150929114531.2d611a2a@canb.auug.org.au>
	<20151002114932.043376ca@canb.auug.org.au>
	<20151008120424.6813920f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151008120424.6813920f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sebastian Reichel <sre@kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Oct 8, 2015 at 3:04 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Sebastian,
>
> On Fri, 2 Oct 2015 11:49:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Tue, 29 Sep 2015 11:45:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > After merging the battery tree, today's linux-next build (arm
>> > multi_v7_defconfig) failed like this:
>> >
>> > ERROR (phandle_references): Reference to non-existent node or label "twl4030_madc"
>> > ERROR: Input tree has errors, aborting (use -f to force output)
>> > scripts/Makefile.lib:293: recipe for target 'arch/arm/boot/dts/omap3-beagle-xm-ab.dtb' failed
>> >
>> > and many more ...
>> >
>> > Caused by commit
>> >
>> >   af19161aaed7 ("ARM: dts: twl4030: Add iio properties for bci subnode")
>> >
>> > Presumably some updates to other files were missed.
>> >
>> > I have used the battery tree from next-20150925 fot today.
>>
>> I am still getting this error.
>
> Ping?
I did test it and it builds fine (multi_v7_defconfig). My HEAD is on
dad463bdcbb41dfd17c799a5653bb57f185f2c76
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

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
