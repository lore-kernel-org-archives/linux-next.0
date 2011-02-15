From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [next-20110214] Kernel-modules with unknown parameter
Date: Tue, 15 Feb 2011 09:39:29 +0100
Message-ID: <AANLkTik4MhhJFJwRJzSdLt8NNVyOM--Um3thxpHmR151@mail.gmail.com>
References: <AANLkTimM1Tmws46DUyoNGsn+P8WN1XPsRu=L8yPzd=xU@mail.gmail.com>
	<AANLkTikO=5zBCvPbd2MXqgzE_mvnabTtH_e2C5_5bpQv@mail.gmail.com>
	<AANLkTinFOPc+BM8cnPE3SLt7Dc2TFOw1v+bntFu01hpO@mail.gmail.com>
	<201102151030.26956.rusty@rustcorp.com.au>
	<AANLkTi=NG+KTGh57oR6Ahq34PohdL5FQFsV+7=4a-J1Z@mail.gmail.com>
	<20110215145849.81116623.sfr@canb.auug.org.au>
	<AANLkTin1LV5yOH9C=dzftd=cvqOJH3+OMJOiLhwzVL29@mail.gmail.com>
	<20110215043645.GA4772@core.coreip.homeip.net>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:51283 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754521Ab1BOIjb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Feb 2011 03:39:31 -0500
In-Reply-To: <20110215043645.GA4772@core.coreip.homeip.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <randy.dunlap@oracle.com>

On Tue, Feb 15, 2011 at 5:36 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Tue, Feb 15, 2011 at 05:14:24AM +0100, Sedat Dilek wrote:
>> On Tue, Feb 15, 2011 at 4:58 AM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>> > Hi Sedat,
>> >
>> > On Tue, 15 Feb 2011 04:34:24 +0100 Sedat Dilek <sedat.dilek@google=
mail.com> wrote:
>> >>
>> >> On Tue, Feb 15, 2011 at 1:00 AM, Rusty Russell <rusty@rustcorp.co=
m.au> wrote:
>> >> > On Mon, 14 Feb 2011 11:45:59 pm Sedat Dilek wrote:
>> >> >> >> Any idea what's going on? Stephen, Randy noticed the same l=
ike me?
>> >> >
>> >> > Dmitry broke module parameters with a "trivial" transform which=
 turned out
>> >> > not to be.
>> >> >
>> >> > I wasn't paying enough attention, and let it through.
>> >> >
>> >> >> My damn brain can't understand - looking at the series file in=
 [2] -
>> >> >> why the hell the "possible" patch [3] is not included in linux=
-next?
>> >> >
>> >> > There are markers in the series file, which indicate what goes =
into
>> >> > linux-next.
>> >>
>> >> Thanks for the explanations, it makes things seen from the
>> >> patch-management side a bit clearer.
>> >> =C2=A0( Not sure if the series files was modified in the meantime=
=2E )
>> >>
>> >> Here for documentation-purposes-only (partially extracted):
>> >>
>> >> [ http://ozlabs.org/~rusty/kernel/rr-latest/series ]
>> >>
>> >> # NEXT_PATCHES_START
>> >> # MM_PATCHES_START
>> >> # Trivial compilation fixes.
>> >>
>> >>
>> >> ## for-linus
>> >> virtio:virtio-net-add_schedule_check_to_napi_enable_call.patch
>> >> ## for-linus end
>> >> module:deal_with_alignment_issues_in_built_in_versions.patch
>> >> module:do_not_hide_modver_version_show_declaration_behind_ifdef.p=
atch
>> >> virtio:blk_allow_re_reading_config_space_at_runtime.patch
>> >> # MM_PATCHES_END
>> >> # NEXT_PATCHES_END
>> >>
>> >> [ / http://ozlabs.org/~rusty/kernel/rr-latest/series ]
>> >
>> > That is how it looks today. =C2=A0Yesterday, the patch
>> > module:deal_with_alignment_issues_in_built_in_parameters.patch
>> > was also included and that is what caused the problem.
>> >
>> >> Looks to me, the FIXUP patch marked with ***** was not really app=
lied
>> >> to linux-next?
>> >
>> > No, instead the breaking patch (above) was removed from Rusty's
>> > linux-next series today.
>> >
>> >> Also, this fixup patch is no more in Rusty's series file.
>> >> Is that all correct now?
>> >
>> > Rusty has a new version of the above patch which includes the fix =
(I
>> > assume) but it is not included in linux-next today.
>> >
>> > --
>> > Cheers,
>> > Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
>> > http://www.canb.auug.org.au/~sfr/
>> >
>>
>> Hmm, would be nice to have a clarification or a confirmation after
>> compilation and kernel-modules are loaded correctly on i386 (amd64)
>> arch(s).
>
> As it was proven that the change was a bit *ahem* involved it is
> probably better for the updated patch (even though I am pretty sure i=
t
> is good now) to cook a bit more outside of next so Rusty removed it.
>
> Thanks.
>
> --
> Dmitry
>

Might be better this way.

( And yeah, it looks like "sth" was dropped according to merge.logs. )

- Sedat -

P.S.:

[ merge.log of next-20110215 ]
=2E..
3270 Merging quilt/rr
3271 $ git merge quilt/rr
3272 Merge made by recursive.
3273  drivers/block/virtio_blk.c |   88
+++++++++++++++++++++++++++++++++++++++-----
3274  include/linux/module.h     |   15 ++++---
3275  kernel/params.c            |    9 +++-
3276  3 files changed, 92 insertions(+), 20 deletions(-)
=2E..
[ merge.log of next-20110214 ]
=2E..
3315 $ git merge quilt/rr
3316 Merge made by recursive.
3317  drivers/block/virtio_blk.c  |   88
++++++++++++++++++++++++++++++++++++++-----
3318  include/linux/module.h      |   15 ++++---
3319  include/linux/moduleparam.h |   22 ++++++-----
3320  kernel/params.c             |   19 ++++++---
3321  4 files changed, 110 insertions(+), 34 deletions(-)
=2E..
- EOT -
