From: Bob Liu <lliubbo@gmail.com>
Subject: Re: Blackfin.git tree change
Date: Sun, 13 Nov 2011 22:50:41 +0800
Message-ID: <CAA_GA1fFspdayjpLNpm1C-kPug6n7LXyJ0dqiX=3d_gHt2U9xg@mail.gmail.com>
References: <CAA_GA1f8+6bqXGXo33GDbJmXvaqdD-qMUh=ejx0+Ag-shmc0uw@mail.gmail.com>
	<20111113231944.4677bd7a2154975c989663ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:53026 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751922Ab1KMOum convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 13 Nov 2011 09:50:42 -0500
In-Reply-To: <20111113231944.4677bd7a2154975c989663ab@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Mike Frysinger <vapier@gentoo.org>, sonic.zhang@analog.com

Hi, Stephen

On Sun, Nov 13, 2011 at 8:19 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Bob,
>
> On Fri, 11 Nov 2011 18:49:59 +0800 Bob Liu <lliubbo@gmail.com> wrote:
>>
>> I'll take most of the arch Blackfin maintain work from now on.
>>
>> My tree is:
>> git://git.kernel.org/pub/scm/linux/kernel/git/lliubbo/blackfin.git#f=
or-linus
>>
>> Would you please update it for linux-next.
>
> OK, I have switched to that tree and will put you as the contact. =C2=
=A0Should
> I also keep Mike as a contact for problems with this tree?
>

Yes, Please.

> The only thing I did notice, is that this commit was in Mike's tree b=
ut
> is not in yours:
>
> Author: Sonic Zhang <sonic.zhang@analog.com>
> Date: =C2=A0 Mon Aug 1 17:53:21 2011 +0800
>
> =C2=A0 =C2=A0Blackfin: add serial TX IRQ in individual platform resou=
rce
>
> =C2=A0 =C2=A0The serial TX IRQ is not simply (RX IRQ + 1) on some Bla=
ckfin chips,
> =C2=A0 =C2=A0so move the values to the platform resources.
>
> =C2=A0 =C2=A0Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> =C2=A0 =C2=A0Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>
> Just in case it was forgotten.
>

Sorry for that, I thought that patch has been merged to mainline.
I'll update it soon. Thanks.

> Thanks for adding your subsystem tree as a participant of linux-next.=
 =C2=A0As
> you may know, this is not a judgment of your code. =C2=A0The purpose =
of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.
>
> You will need to ensure that the patches/commits in your tree/series =
have
> been:
> =C2=A0 =C2=A0 * submitted under GPL v2 (or later) and include the Con=
tributor's
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by,
> =C2=A0 =C2=A0 * posted to the relevant mailing list,
> =C2=A0 =C2=A0 * reviewed by you (or another maintainer of your subsys=
tem tree),
> =C2=A0 =C2=A0 * successfully unit tested, and
> =C2=A0 =C2=A0 * destined for the current or next Linux merge window.
>
> Basically, this should be just what you would send to Linus (or ask h=
im
> to fetch). =C2=A0It is allowed to be rebased if you deem it necessary=
=2E
>
> --
> Cheers,
> Stephen Rothwell
> sfr@canb.auug.org.au
>
> Legal Stuff:
> By participating in linux-next, your subsystem tree contributions are
> public and will be included in the linux-next trees. =C2=A0You may be=
 sent
> e-mail messages indicating errors or other issues when the
> patches/commits from your subsystem tree are merged and tested in
> linux-next. =C2=A0These messages may also be cross-posted to the linu=
x-next
> mailing list, the linux-kernel mailing list, etc. =C2=A0The linux-nex=
t tree
> project and IBM (my employer) make no warranties regarding the linux-=
next
> project, the testing procedures, the results, the e-mails, etc. =C2=A0=
If you
> don't agree to these ground rules, let me know and I'll remove your t=
ree
> from participation in linux-next.
>

--=20
Regards,
--Bob
