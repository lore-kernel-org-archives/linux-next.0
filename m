From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: Boot failure on x86_64 (OOPS set_cpu_sibling_map() )
Date: Mon, 3 Aug 2009 12:14:01 +0200
Message-ID: <20090803101401.GA14442@aftab>
References: <20090730182143.eadf36e6.sfr@canb.auug.org.au>
 <4A718338.6050907@in.ibm.com>
 <20090730135623.GB16659@aftab>
 <20090803093144.GC9074@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-dub.frontbridge.com ([213.199.154.16]:4577 "EHLO
	IE1EHSOBE001.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751323AbZHCKOO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Aug 2009 06:14:14 -0400
Content-Disposition: inline
In-Reply-To: <20090803093144.GC9074@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Sachin Sant <sachinp@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>

Hi Ingo,

On Mon, Aug 03, 2009 at 11:31:44AM +0200, Ingo Molnar wrote:
> Borislav, this patch:
>=20
>  From 4581c6313c16a38ffcef8bccd6ffbe9598d585b0 Mon Sep 17 00:00:00 20=
01
>  From: Andreas Herrmann <andreas.herrmann3@amd.com>
>  Date: Fri, 24 Jul 2009 10:21:06 +0200
>  Subject: [PATCH] x86: provide CPU topology information for multi-nod=
e processors
>=20
>  arch/x86/include/asm/processor.h |    2 ++
>  arch/x86/include/asm/smp.h       |    6 ++++++
>  arch/x86/include/asm/topology.h  |    2 ++
>  arch/x86/kernel/cpu/common.c     |    2 ++
>  arch/x86/kernel/cpu/proc.c       |    1 +
>  arch/x86/kernel/smpboot.c        |   20 ++++++++++++++++----
>  6 files changed, 29 insertions(+), 4 deletions(-)
>=20
> has absolutely _ZERO_ place in the EDAC tree. It was submitted to=20
> the x86 tree and was under discussion - i requested changes to it so=20
> this current form has my NAK.

I know that, I'm following the discussion. I needed the functionality i=
n
EDAC and that's why I added them _temporarily_ to the mix so that the
whole series (esp. the MCE bits) can see some testing. Which obviously
caught some issues :).

But I'm very well aware that the patches are not final and they will go
through x86 when done. This is what I told Stephen when upping them for
linux-next.

Sorry if I've caused any misunderstanding.

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
