From: Rakib Mullick <rakib.mullick@gmail.com>
Subject: Re: linux-next: Tree for December 10 (x86 nmi_watchdog)
Date: Tue, 14 Dec 2010 11:42:37 +0600
Message-ID: <AANLkTinuqUTgntBOfBcfLnymKRqn_FAoFquj_Lz7BP-X@mail.gmail.com>
References: <20101210135746.0cf6cbcd.sfr@canb.auug.org.au>
	<20101210092533.4f426650.randy.dunlap@oracle.com>
	<AANLkTi=bw8EcxEffbVV6CfdAPVdM25ZMxHqAmz1yukq3@mail.gmail.com>
	<20101213144434.GB18577@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:35420 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751389Ab0LNFmk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Dec 2010 00:42:40 -0500
In-Reply-To: <20101213144434.GB18577@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Don Zickus <dzickus@redhat.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org

On Mon, Dec 13, 2010 at 8:44 PM, Don Zickus <dzickus@redhat.com> wrote:
> On Sun, Dec 12, 2010 at 11:27:02AM +0600, Rakib Mullick wrote:
>> On Fri, Dec 10, 2010 at 11:25 PM, Randy Dunlap <randy.dunlap@oracle.=
com> wrote:
>> > On Fri, 10 Dec 2010 13:57:46 +1100 Stephen Rothwell wrote:
>> >
>> >> Hi all,
>> >>
>> >> Changes since 20101209:
>> >
>> >
>> > arch/x86/kernel/apic/hw_nmi.c:28: error: redefinition of 'touch_nm=
i_watchdog'
>> > include/linux/nmi.h:22: note: previous definition of 'touch_nmi_wa=
tchdog' was here
>
> I'll have to checkout that branch to see what got merged. =A0I though=
t I
> fixed all these. =A0Is there a config I can use to duplicate these?
>
Allnoconfig also introduces this breakage.


thanks,
rakib



>
> Cheers,
> Don
>
>
