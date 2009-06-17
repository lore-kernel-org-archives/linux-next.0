From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [BUILD FAILURE 02/04] Next June 04:PPC64 randconfig
	[drivers/usb/host/ohci-hcd.o]
Date: Wed, 17 Jun 2009 12:15:16 -0600
Message-ID: <fa686aa40906171115m3e3faab2r63814ea8013056d0@mail.gmail.com>
References: <20090605182651.24094.36577.sendpatchset@elm3a191.beaverton.ibm.com>
	<200906091738.58154.david-b@pacbell.net> <1244799348.5234.13.camel@subratamodak.linux.ibm.com>
	<1245048679.5239.8.camel@subratamodak.linux.ibm.com> <1245243186.4870.5.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f214.google.com ([209.85.217.214]:58680 "EHLO
	mail-gx0-f214.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753695AbZFQSPe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2009 14:15:34 -0400
In-Reply-To: <1245243186.4870.5.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: subrata@linux.vnet.ibm.com
Cc: David Brownell <david-b@pacbell.net>, Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org, Sachin P Sant <sachinp@linux.vnet.ibm.com>, Kumar Gala <galak@kernel.crashing.org>, Linux-Kernel <linux-kernel@vger.kernel.org>, Randy Dunlap <randy.dunlap@oracle.com>, Linux-Next <linux-next@vger.kernel.org>, Jon Smirl <jonsmirl@gmail.com>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel@wantstofly.org

On Wed, Jun 17, 2009 at 6:53 AM, Subrata
Modak<subrata@linux.vnet.ibm.com> wrote:
> On Mon, 2009-06-15 at 12:21 +0530, Subrata Modak wrote:
>> On Fri, 2009-06-12 at 15:05 +0530, Subrata Modak wrote:
>> > On Tue, 2009-06-09 at 17:38 -0700, David Brownell wrote:
>> > > On Friday 05 June 2009, Subrata Modak wrote:
>> > > > Correct, it fixes the issue. However, since few changes might =
have gone
>> > > > to the Kconfig, the patch does not apply cleanly. Below is the=
 patch, just
>> > > > a retake of the earlier one, but on the latest code.
>> > >
>> > > And it got mangled a bit along the way. =A0Plus, the original on=
e
>> > > goofed up Kconfig dependency displays ... both issues fixed in
>> > > this version, against current mainline GIT.
>> > >
>> > > If someone can verify all four PPC/OF/OHCI configs build on
>> > > on PPC64, I'm OK with it.
>> > >
>> > > - Dave
>> >
>> > Dave,
>> >
>> > Sorry for being late. The patch fixes the issue on the latest git =
for
>> > PPC64. Infact, the whole drivers/usb/host/ builds just fine:
>> >
>> > linux-2.6 # make drivers/usb/host/
>> > =A0 CHK =A0 =A0 include/linux/version.h
>> > =A0 CHK =A0 =A0 include/linux/utsrelease.h
>> > =A0 SYMLINK include/asm -> include/asm-powerpc
>> > =A0 CALL =A0 =A0scripts/checksyscalls.sh
>> > =A0 CC =A0 =A0 =A0drivers/usb/host/ohci-hcd.o
>> > =A0 CC =A0 =A0 =A0drivers/usb/host/pci-quirks.o
>> > =A0 CC =A0 =A0 =A0drivers/usb/host/uhci-hcd.o
>> > =A0 LD =A0 =A0 =A0drivers/usb/host/built-in.o
>> > =A0 CC [M] =A0drivers/usb/host/isp116x-hcd.o
>> > =A0 CC [M] =A0drivers/usb/host/u132-hcd.o
>> >
>> > You can check in the patch now.
>>
>> Dave,
>>
>> Have you checked in this patch ? Or, does it require some more
>> modification/updates from somebody=B4s side ?
>>
>
> Dave,
>
> Would you consider checking in this patch ?

Hold off please; give me a couple of hours to investigate.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
