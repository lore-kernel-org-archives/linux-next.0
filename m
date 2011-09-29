From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build failure after merge of the moduleh tree
Date: Wed, 28 Sep 2011 20:15:45 -0400
Message-ID: <CAP=VYLrHGYXpXaHn0GbE5ysRXkNhnqVimC01K3inwXq_KPBtYA@mail.gmail.com>
References: <20110928184150.0fcf097b7f9128f8639059f3@canb.auug.org.au>
	<4E83243A.7060408@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64636 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754057Ab1I2APr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 20:15:47 -0400
In-Reply-To: <4E83243A.7060408@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 28, 2011 at 9:42 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> On 11-09-28 04:41 AM, Stephen Rothwell wrote:
>> Hi Paul,
>>
>> After merging the moduleh tree, today's linux-next build (x86_64
>> allmodconfig) went on producing more failures (beyond those reported
>> earlier). =A0I have used the version of the moduleh tree from next-2=
0110927
>> for today and will see if I have more stamina tomorrow.
>
> I will grab a copy of today's next and pick up where you left off, pl=
owing
> into the new additions in next that are implicitly using module.h

Hi Stephen,

I figured, given the footprint of the module.h stuff, that it is entire=
ly
unfair for you to have to carry all those changes that aren't in the
merge-base of the module.h branch.  So I've created a post merge
commit series that I'll maintain -- which will have the commits that
can't be in the module.h split branch, but will be required, once all
the linux-next content has been merged.

If you clone:

   git://openlinux.windriver.com/people/paulg/modsplit-post-merge

you will get a repository of commits, and a series file (just like that=
 used
for longterm/stable queues) that you can deploy onto linux-next to get
the changes you'd been carrying, plus new ones I found by testing on
linux-next myself.  It replaces the following from your tree generation=
:

Applying: dm: use export.h instead of module.h where possible
Applying: block: bsg-lib.c needs export.h not module.h
Applying: PM: EXPORT_SYMBOL needs export.h
Applying: bcma: driver_chipcommon_pmu.c needs linux/export.h
Applying: powerpc/powernv: include export.h in hvc_opal.h for THIS_MODU=
LE
Applying: PM QoS: include export.h in qos.c for EXPORT_SYMBOL
Applying: x86, amd: include linux/elf.h since we use stuff from asm/elf=
=2Eh
Applying: block/mtip32xx: include module.h for its utilities
Applying: NFC: use of module facilities requires the inclusion of modul=
e.h
Applying: mmc: using mopdule_param requires the inclusion of modulepara=
m.h
Applying: rtlwifi: use of module_param requires the inclusion of module=
param.h
Applying: wireless/ath6kl: use of module_param requires the inclusion
of moduleparam.h

I'm hoping that you can plug pulls of this post-merge queue into your
infrastructure in a way that moves the burden off you and onto me.

[I didn't have exact copies of what you were using for the top three, b=
ut
it wasn't hard to recreate them based on the oneline shortlog]

I took the most recent linux-next, reverted the merge of the "old" modu=
le
split content, merged the "new" split content, and then played the seri=
es
file to get a tree that will pass x86_64 allmodconfig with the linux-ne=
xt
content all present.  I'll be doing additional build coverage over all =
the
other arch on that same tree overnight.

I also weeded out as many conflicts as I could by trivial relocations o=
f
include files.  However, the following remain, and can't be easily kill=
ed
because some files only have one or two includes, and don't lend
themselves to relocations.   Here is the conflicts that remain:

    Conflicts:
        arch/arm/mach-bcmring/mm.c
        drivers/media/dvb/frontends/dibx000_common.c
        drivers/misc/altera-stapl/altera.c
        drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
        drivers/scsi/libfc/fc_lport.c
        drivers/staging/iio/accel/adis16220_core.c
        include/linux/dmaengine.h
        sound/soc/soc-io.c

Some of these you will already have in your rr-cache for sure.
They are all trivial conflicts in header lists.

Hopefully this makes things easier for you.  If you have any
other suggestions/tweaks that you'd like to see in order to
make your life easier, please do let me know.

Thanks again for putting up with the large footprint of this,
Paul.
