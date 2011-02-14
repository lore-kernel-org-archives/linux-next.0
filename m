From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [next-20110214] Kernel-modules with unknown parameter
Date: Mon, 14 Feb 2011 16:32:25 +0100
Message-ID: <AANLkTindibr06aF=V439dovfZz45nXC328_TFiu59Zoq@mail.gmail.com>
References: <AANLkTimM1Tmws46DUyoNGsn+P8WN1XPsRu=L8yPzd=xU@mail.gmail.com>
	<AANLkTikO=5zBCvPbd2MXqgzE_mvnabTtH_e2C5_5bpQv@mail.gmail.com>
	<AANLkTinFOPc+BM8cnPE3SLt7Dc2TFOw1v+bntFu01hpO@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:56962 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755591Ab1BNPc0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Feb 2011 10:32:26 -0500
In-Reply-To: <AANLkTinFOPc+BM8cnPE3SLt7Dc2TFOw1v+bntFu01hpO@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>

On Mon, Feb 14, 2011 at 2:15 PM, Sedat Dilek <sedat.dilek@googlemail.co=
m> wrote:
> On Mon, Feb 14, 2011 at 1:24 PM, Sedat Dilek <sedat.dilek@googlemail.=
com> wrote:
>> On Mon, Feb 14, 2011 at 1:13 PM, Sedat Dilek <sedat.dilek@googlemail=
=2Ecom> wrote:
>>> Hi,
>>>
>>> I have pulled Dave's drm-fixes-staging into today's linux-next and =
did
>>> not see a KMS-modesetted resolution change in VT (runlevel-3).
>>> After a quick check of my dmesg, I see also my kernel-module for so=
und
>>> has "unknown parameter".
>>> ( Thus, personally I don't think it is a bug from any drm-2.6 tree.=
 )
>>>
>>> # dmesg | egrep -i 'unknown|param'
>>> [ =C2=A0 12.431216] radeon: Unknown parameter `modeset'
>>> [ =C2=A0 12.665911] snd_intel8x0m: Unknown parameter `index'
>>> [ =C2=A0 37.311333] radeon: Unknown parameter `modeset'
>>>
>>> Any idea what's going on? Stephen, Randy noticed the same like me?
>>>
>>> Regards,
>>> - Sedat -
>>>
>>> P.S.: Attached are dmesg and kernel dot-config.
>>>
>>
>> [ CC Dmitry Torokhov ]
>>
>> Could that be a possible fix for me [1]?
>>
>> - Sedat -
>>
>> [1] https://patchwork.kernel.org/patch/548891/
>>
>
> [ CC Rusty Russell + Removed drm-2.6/dri-devel folks ]
>
> While digging into the problem, I had a closer look into
> linux-next/Trees file [1], which list the included GIT/QUILT
> trees/patch-queues, line #121 says:
>
> rr =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quilt =C2=A0 http:=
//ozlabs.org/~rusty/kernel/rr-latest/
>
> ( Personally, I thought all stuff are pulled from GIT trees, but you
> learn more by CSI-ing. )
>
> As a clever guy, I was silently assuming the problem could occur from
> any module-related tree (so I checked linux-next GIT repo via "git lo=
g
> -3 kernel/params.c" which gave me a hint to Dmitry's commit in
> quilt/rr, Bingo?).
>
> With this "evidence material" I "tig-ged" into the commits in my loca=
l
> linux-next GIT repo, which revealed more:
>
> 2011-02-14 14:17 Stephen Rothwell =C2=A0 Merge branch 'quilt/rr'
> 2011-02-11 10:37 Rusty Russell =C2=A0 =C2=A0 =C2=A0module: deal with =
alignment issues
> in built-in module parameters FIX
> 2011-02-07 16:02 Dmitry Torokhov =C2=A0 =C2=A0module: deal with align=
ment issues
> in built-in module parameters
> 2011-02-01 21:43 Christoph Hellwig =C2=A0virtio_blk: allow re-reading
> config space at runtime
> 2011-02-07 16:02 Dmitry Torokhov =C2=A0 =C2=A0module: do not hide
> __modver_version_show declaration behind ifdef
> 2011-02-07 16:02 Dmitry Torokhov =C2=A0 =C2=A0module: deal with align=
ment issues
> in built-in module versions
>
> My damn brain can't understand - looking at the series file in [2] -
> why the hell the "possible" patch [3] is not included in linux-next?
> I did not compare but [3] looks similiar to [4].
> I have applied [3] on top my own patch-series and will report later,
> if this worked or not.
>
> BUT please, what are the factors for choosing the relevant patches
> from quilt/rr?
> ( For example, the cpumask stuff is awaited by systemd folks. Is this
> stuff included? I saw by a very quick look @ git.k.o there is a GIT
> repo for that. )
>
> And yeah, slow-ass UserModeSetting suckz here!
>
> /me confused,
> - Sedat -
>
> [1] http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=
=3Dblob;f=3DNext/Trees
> [2] http://ozlabs.org/~rusty/kernel/rr-latest/series
> [3] http://ozlabs.org/~rusty/kernel/rr-latest/module:deal_with_alignm=
ent_issues_in_built_in_parameters.patch
> [4] https://patchwork.kernel.org/patch/548891/
>

Patch "module-fix-fallout-from-alignment.patch" fixes the issue here.

- Sedat -

# dmesg | egrep -i 'modeset|intel8x'
[    0.000000] Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz-2.6.38-rc4-686-iniza
root=3DUUID=3D1ceb69a7-ecf4-47e9-a231-b74e0f0a9b62 ro init=3D/bin/syste=
md
radeon.modeset=3D1 lapic 3
[   10.706947] [drm] radeon kernel modesetting enabled.
[   10.712685] [drm] initializing kernel modesetting (RV250
0x1002:0x4C66).
[   13.552040] intel8x0_measure_ac97_clock: measured 55046 usecs (2652
samples)
[   13.563714] intel8x0: clocking to 48000
