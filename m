From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for April 14 (Call-traces: RCU/ACPI/WQ
 related?)
Date: Thu, 14 Apr 2011 15:44:11 -0700
Message-ID: <20110414224411.GF2141@linux.vnet.ibm.com>
References: <BANLkTikd2MpRPF37R+vCwnb7Lzzd6EiS7A@mail.gmail.com>
 <BANLkTinq=mC9rs5R3U8FPLCp-GgCJris_g@mail.gmail.com>
 <BANLkTimT9OhHLL5NaPOP30MdiMfmmmEcyQ@mail.gmail.com>
 <BANLkTikVW9Z=WxD7=w9c=Z6kHO-Za2ru8A@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e31.co.us.ibm.com ([32.97.110.149]:39280 "EHLO
	e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754277Ab1DNWoQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Apr 2011 18:44:16 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTikVW9Z=WxD7=w9c=Z6kHO-Za2ru8A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 15, 2011 at 12:19:34AM +0200, Sedat Dilek wrote:
> On Thu, Apr 14, 2011 at 12:19 PM, Sedat Dilek
> <sedat.dilek@googlemail.com> wrote:
> > On Thu, Apr 14, 2011 at 11:16 AM, Sedat Dilek
> > <sedat.dilek@googlemail.com> wrote:
> >> [ Adding CC to RCU maintainer (Hi Paul :-)) ]
> >>
> >> Helping me for now with (see also Documentation/RCU/stallwarn.txt)=
:
> >>
> >> # cat /sys/module/rcutree/parameters/rcu_cpu_stall_suppress
> >> 0
> >>
> >> # echo "1" > /sys/module/rcutree/parameters/rcu_cpu_stall_suppress
> >>
> >> # cat /sys/module/rcutree/parameters/rcu_cpu_stall_suppress
> >> 1
> >>
> >> - Sedat -
> >>
> >
> > That workaround helped till a system-freeze when generating a tarba=
ll
> > from my current kernel-tree.
> > I switched back to my yesterday's linux-next kernel.
> >
> > - Sedat -
> >
>=20
> I isolated the culprit so far:
>=20
> commit 900507fc62d5ba0164c07878dbc36ac97866a858
> "rcu: move TREE_RCU from softirq to kthread"
>=20
> With this revert my system does not show the symptoms I have reported=
=2E

Hmmm...  I never was able to reproduce this, but did find a workload
that slowed up the grace periods.  I fixed that (which turned out to
be a wakeup problem), but my hopes that it would also fix your problem
were clearly unfounded.  I have once again stopped exporting this commi=
t
to -next.

							Thanx, Paul

> - Sedat -
>=20
> >> On Thu, Apr 14, 2011 at 10:59 AM, Sedat Dilek
> >> <sedat.dilek@googlemail.com> wrote:
> >>> On Thu, Apr 14, 2011 at 7:01 AM, Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> >>>> Hi all,
> >>>>
> >>>> Changes since 20110413:
> >>>>
> >>>> Dropped tree: xen
> >>>>
> >>>> The gfs2 tree lost its conflict.
> >>>>
> >>>> The net tree lost its build failure.
> >>>>
> >>>> The wireless tree lost all but one conflict.
> >>>>
> >>>> The trivial tree lost its conflict.
> >>>>
> >>>> The tip tree gained a conflict against Linus' tree.
> >>>>
> >>>> The usb tree gained a conflict against the s5p tree.
> >>>>
> >>>> The staging tree lost its conflicts.
> >>>>
> >>>> ----------------------------------------------------------------=
------------
> >>>
> >>> Just a quick hello and an attached dmesg.
> >>> Yesterday's linux-next (next-20110413) with same kernel-config wa=
s OK.
> >>>
> >>> ( Also, I have seen a section-mismatch in x86 (IIRC mm) missing
> >>> __init... but that's another story. )
> >>>
> >>> - Sedat -
> >>>
> >>> P.S.: diff between today's and yesterday's kernel-config
> >>>
> >>> $ diff -uprN /boot/config-2.6.39-rc3-next20110413.2-686-small
> >>> /boot/config-2.6.39-rc3-next20110414.2-686-small
> >>> --- /boot/config-2.6.39-rc3-next20110413.2-686-small =A0 =A02011-=
04-13
> >>> 12:32:09.000000000 +0200
> >>> +++ /boot/config-2.6.39-rc3-next20110414.2-686-small =A0 =A02011-=
04-14
> >>> 10:23:25.000000000 +0200
> >>> @@ -1,7 +1,7 @@
> >>> =A0#
> >>> =A0# Automatically generated make config: don't edit
> >>> =A0# Linux/x86 2.6.39-rc3 Kernel Configuration
> >>> -# Wed Apr 13 11:55:54 2011
> >>> +# Thu Apr 14 09:43:03 2011
> >>> =A0#
> >>> =A0# CONFIG_64BIT is not set
> >>> =A0CONFIG_X86_32=3Dy
> >>> @@ -2602,6 +2602,7 @@ CONFIG_USB_UHCI_HCD=3Dm
> >>> =A0#
> >>> =A0# Enable Host or Gadget support to see Inventra options
> >>> =A0#
> >>> +# CONFIG_USB_RENESAS_USBHS is not set
> >>>
> >>> =A0#
> >>> =A0# USB Device Class drivers
> >>>
> >>
> >
