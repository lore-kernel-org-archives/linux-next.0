From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Subject: Re: linux-next: manual merge of the sysctl tree with the net tree
Date: Mon, 30 Nov 2009 13:51:03 +0800
Message-ID: <2375c9f90911292151t2deb8530idd96ce50ced74d80@mail.gmail.com>
References: <20091130164415.f418834b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f194.google.com ([209.85.221.194]:63629 "EHLO
	mail-qy0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750920AbZK3Fu5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2009 00:50:57 -0500
In-Reply-To: <20091130164415.f418834b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vlad Yasevich <vladislav.yasevich@hp.com>, "David S. Miller" <davem@davemloft.net>

On Mon, Nov 30, 2009 at 1:44 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Eric,
>
> Today's linux-next merge of the sysctl tree got a conflict in
> net/sctp/sysctl.c between commit 90f2f5318b3a5b0898fef0fec9b91376c7de=
7a2c
> ("sctp: Update SWS avaoidance receiver side algorithm") from the net =
tree
> and commit f8572d8f2a2ba75408b97dc24ef47c83671795d7 ("sysctl net: Rem=
ove
> unused binary sysctl code") from the sysctl tree.
>
> I fixed it up (see below) and can carry the fix as necessary. =C2=A0I=
 also
> removed the strategy member from the new added ctl_table entry.
> --
> Cheers,
> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
>
> diff --cc net/sctp/sysctl.c
> index ae03ded,d50a042..0000000
> --- a/net/sctp/sysctl.c
> +++ b/net/sctp/sysctl.c
> @@@ -285,19 -241,7 +242,17 @@@ static ctl_table sctp_table[] =3D
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.extra1 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &zero,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.extra2 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &addr_scope_max,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ctl_name =C2=A0 =C2=
=A0 =C2=A0 =3D CTL_UNNUMBERED,
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.procname =C2=
=A0 =C2=A0 =C2=A0 =3D "rwnd_update_shift",
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &sctp_rwnd_upd_shift,
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.maxlen =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D sizeof(int),
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0644,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .proc_handler =C2=A0=
 =3D &proc_dointvec_minmax,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .strategy =C2=A0 =C2=
=A0 =C2=A0 =3D &sysctl_intvec,
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.proc_handler =C2=A0=
 =3D proc_dointvec_minmax,

Hey, what's this??
