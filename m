From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Tue, 14 Feb 2012 15:42:33 -0800
Message-ID: <20120214234233.GA26381@kroah.com>
References: <20120210154806.4a81ec53dc24a40cf91a758a@canb.auug.org.au>
 <20120210053036.GC2068@kroah.com>
 <CAB-zwWggC696WKszdkFvE+7azu5LtuVK8__SUcjBX3UP4ieV-g@mail.gmail.com>
 <20120214223758.GA21350@kroah.com>
 <CAB-zwWiA8a_N2FkdjoO47p-74CjSSY9ARqkbiW=fmy6Ka_Bi0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53411 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757340Ab2BNXmx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Feb 2012 18:42:53 -0500
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 9CE4C20A53
	for <linux-next@vger.kernel.org>; Tue, 14 Feb 2012 18:42:52 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <CAB-zwWiA8a_N2FkdjoO47p-74CjSSY9ARqkbiW=fmy6Ka_Bi0A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Ramirez Luna, Omar" <omar.ramirez@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?V=EDctor_Manuel_J=E1quez?= <vjaquez@igalia.com>

On Tue, Feb 14, 2012 at 05:33:40PM -0600, Ramirez Luna, Omar wrote:
> On Tue, Feb 14, 2012 at 4:37 PM, Greg KH <greg@kroah.com> wrote:
> > On Tue, Feb 14, 2012 at 03:31:39PM -0600, Ramirez Luna, Omar wrote:
> >> Hi,
> >>
> >> On Thu, Feb 9, 2012 at 11:30 PM, Greg KH <greg@kroah.com> wrote:
> >> > On Fri, Feb 10, 2012 at 03:48:06PM +1100, Stephen Rothwell wrote=
:
> >> >> Hi Greg,
> >> >>
> >> >> Today's linux-next merge of the staging tree got a conflict in
> >> >> drivers/staging/tidspbridge/rmgr/drv_interface.c between commit
> >> >> 5a63177a6967 ("staging: tidspbridge: fix bridge_open memory lea=
ks") from
> >> >> Linus' tree and commit 518761dba127 ("staging: tidspbridge: rem=
ove unused
> >> >> header") from the staging tree.
> >> >>
> >> >> I fixed it up (I think - see below) and can carry the fix as ne=
cessary.
> >> >
> >> > Thanks, I'll try to fix this up with a merge tomorrow to get thi=
s in
> >> > sync.
> >>
> >> 5a63177a6967 ("staging: tidspbridge: fix bridge_open memory leaks"=
)
> >> was accidentally reverted with the merge of staging-3.3-rc3 on
> >> staging-next branch, the same patch still applies since the previo=
us
> >> patch touching this code moves it some lines above.
> >
> > Ok, so what should I do here? =A0What patch should I apply to the
> > staging-next tree? =A0Just reapply 5a63177a6967?
>=20
> Yes, reapplying 5a63177a6967 worked for me.

Ok, thanks, now done.

greg k-h
