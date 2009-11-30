From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Subject: Re: linux-next: manual merge of the sysctl tree with the net tree
Date: Mon, 30 Nov 2009 17:21:43 +0800
Message-ID: <2375c9f90911300121j437ffa9bleec585ebc8e62ea3@mail.gmail.com>
References: <20091130164415.f418834b.sfr@canb.auug.org.au>
	 <2375c9f90911292151t2deb8530idd96ce50ced74d80@mail.gmail.com>
	 <20091130174103.b5c05570.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f194.google.com ([209.85.221.194]:33472 "EHLO
	mail-qy0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752696AbZK3JVh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2009 04:21:37 -0500
In-Reply-To: <20091130174103.b5c05570.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vlad Yasevich <vladislav.yasevich@hp.com>, "David S. Miller" <davem@davemloft.net>

On Mon, Nov 30, 2009 at 2:41 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Am=C3=A9rico,
>
> On Mon, 30 Nov 2009 13:51:03 +0800 Am=C3=A9rico Wang <xiyou.wangcong@=
gmail.com> wrote:
>>
>> > diff --cc net/sctp/sysctl.c
>> > index ae03ded,d50a042..0000000
>> > --- a/net/sctp/sysctl.c
>> > +++ b/net/sctp/sysctl.c
>> > @@@ -285,19 -241,7 +242,17 @@@ static ctl_table sctp_table[] =3D
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.extra1 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D &zero,
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.extra2 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D &addr_scope_max,
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0{
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ctl_name =C2=A0=
 =C2=A0 =C2=A0 =3D CTL_UNNUMBERED,
>> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.procname =
=C2=A0 =C2=A0 =C2=A0 =3D "rwnd_update_shift",
>> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &sctp_rwnd_upd_shift,
>> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.maxlen =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D sizeof(int),
>> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0644,
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .proc_handler =C2=
=A0 =3D &proc_dointvec_minmax,
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .strategy =C2=A0=
 =C2=A0 =C2=A0 =3D &sysctl_intvec,
>> > ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.proc_handler =C2=
=A0 =3D proc_dointvec_minmax,
>>
>> Hey, what's this??
>
> If you mean "what is this strange looking patch", then it is the outp=
ut
> from "git diff --cc" after a merge conflict has been fixed up, but be=
fore
> it is committed. =C2=A0The '-' lines were added by one side of the me=
rge or
> the other, but removed from the final result. =C2=A0The line with '++=
' did not
> appear in either branch, but is in the final result. =C2=A0The lines =
with a
> single '+' appear in one of the branches or the other and in the fina=
l
> result as well.
>

Thanks for teaching this! I thought it was a mistake, it is not. :)
No problem then.
