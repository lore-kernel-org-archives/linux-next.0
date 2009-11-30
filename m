From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Subject: Re: linux-next: manual merge of the sysctl tree with the net tree
Date: Mon, 30 Nov 2009 17:26:12 +0800
Message-ID: <2375c9f90911300126t43bbe7cbh6d993a8af0e11b02@mail.gmail.com>
References: <20091130164415.f418834b.sfr@canb.auug.org.au>
	 <2375c9f90911292151t2deb8530idd96ce50ced74d80@mail.gmail.com>
	 <m1r5rga54f.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f194.google.com ([209.85.221.194]:59979 "EHLO
	mail-qy0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753169AbZK3J0H convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2009 04:26:07 -0500
In-Reply-To: <m1r5rga54f.fsf@fess.ebiederm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vlad Yasevich <vladislav.yasevich@hp.com>, "David S. Miller" <davem@davemloft.net>

On Mon, Nov 30, 2009 at 2:39 PM, Eric W. Biederman
<ebiederm@xmission.com> wrote:
> Am=C3=A9rico Wang <xiyou.wangcong@gmail.com> writes:
>
>> On Mon, Nov 30, 2009 at 1:44 PM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>>> Hi Eric,
>>>
>>> Today's linux-next merge of the sysctl tree got a conflict in
>>> net/sctp/sysctl.c between commit 90f2f5318b3a5b0898fef0fec9b91376c7=
de7a2c
>>> ("sctp: Update SWS avaoidance receiver side algorithm") from the ne=
t tree
>>> and commit f8572d8f2a2ba75408b97dc24ef47c83671795d7 ("sysctl net: R=
emove
>>> unused binary sysctl code") from the sysctl tree.
>>>
>>> I fixed it up (see below) and can carry the fix as necessary. =C2=A0=
I also
>>> removed the strategy member from the new added ctl_table entry.
>>> --
>>> Cheers,
>>> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
>>>
>>> diff --cc net/sctp/sysctl.c
>>> index ae03ded,d50a042..0000000
>>> --- a/net/sctp/sysctl.c
>>> +++ b/net/sctp/sysctl.c
>>> @@@ -285,19 -241,7 +242,17 @@@ static ctl_table sctp_table[] =3D
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.extra1 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &zero,
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.extra2 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &addr_scope_max,
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>>> =C2=A0+ =C2=A0 =C2=A0 =C2=A0{
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ctl_name =C2=A0=
 =C2=A0 =C2=A0 =3D CTL_UNNUMBERED,
>>> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.procname =C2=
=A0 =C2=A0 =C2=A0 =3D "rwnd_update_shift",
>>> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &sctp_rwnd_upd_shift,
>>> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.maxlen =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D sizeof(int),
>>> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0644,
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .proc_handler =C2=
=A0 =3D &proc_dointvec_minmax,
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .strategy =C2=A0=
 =C2=A0 =C2=A0 =3D &sysctl_intvec,
>>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.proc_handler =C2=
=A0 =3D proc_dointvec_minmax,
>>
>> Hey, what's this??
>
> The short version is I am running a git tree that holds all of
> the necessary cleanups to remove the support for binary sysctl handle=
rs.
>
> The binary sysctl support continues to be provided in kernel/sysctl_b=
inary.c
> with a compatibility wrapper. =C2=A0This has been reviewed on linux-k=
ernel
> and written up in lwn.

Yeah, I saw your patches, but didn't have a chance to look at them clos=
ely.

>
> In my tree .ctl_name and .strategy have been removed as they exist
> only to support binary sysctls and are not strictly needed today.
> .ctl_name =3D CTL_UNNUMBERED is equivalent to .ctl_name =3D 0, and se=
tting
> .strategy on new sysctl table entries without a ctl_name is a harmles=
s
> bug. =C2=A0Since I was in there I also removed all of the unnecessary=
 ampersands
> from in front of proc_dointvec_minmax.
>
> Since I have touched practically every sysctl table entry in the kern=
el
> new sysctl additions will almost inevitably cause a small by triviall=
y
> to resolve conflict (due to the fact I have almost certainly changed
> the proceeding and succeeding sysctl table entries).
>
> Currently this only the second sysctl added this kernel cycle, and it
> looks like this work happened in parallel, with my changes, and someh=
ow
> David missed this commit in his September pull, so the changes just
> showed up in net-next.
>
> It would seem to require talent to mess up the merge conflicts, and
> getting it wrong will result in a tree that won't compile so I am not
> going to worry about it until Linux pulls one of our trees.

Thanks for this explanation, I see...
