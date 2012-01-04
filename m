From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 4 Jan 2012 23:03:54 +0100
Message-ID: <CAPXgP13mifJCuPZKtbqvDnBwAQnGtg2HKM_Sk7PzOjGD3SB3RA@mail.gmail.com>
References: <20111228174518.721624fad9d048f9f85b3d50@canb.auug.org.au>
 <20120103162108.GC25909@kroah.com> <CAPXgP11yiS5hF9q3+A1tyORmtp=z2T6CWBUDFh3FhcL19jADpw@mail.gmail.com>
 <20120104003116.GC22350@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:56643 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757037Ab2ADWEP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 17:04:15 -0500
In-Reply-To: <20120104003116.GC22350@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>

On Wed, Jan 4, 2012 at 01:31, Greg KH <greg@kroah.com> wrote:
> On Wed, Jan 04, 2012 at 01:07:52AM +0100, Kay Sievers wrote:
>> On Tue, Jan 3, 2012 at 17:21, Greg KH <greg@kroah.com> wrote:
>> > On Wed, Dec 28, 2011 at 05:45:18PM +1100, Stephen Rothwell wrote:
>> >> Because of the powerpc problems above, I have used the driver-cor=
e tree
>> >> from next-20111222 for today.
>> >
>> > Sorry about all of the problems, we tried to fix everything we cou=
ld,
>> > but your merges and cross-builds found stuff we missed :(
>> >
>> > Kay, care to send me patches to fix this, and all of the other
>> > linux-next-reported problems to me so we can get this resolved thi=
s
>> > week?
>>
>> I rather don't want to add error checking to stuff that doesn't do i=
t
>> today. The sysdev stuff never had that forced checks, but the normal
>> device stuff has.
>
> That's fine.
>
>> I think the force return value check is really a pretty misguided id=
ea
>> in general, and it's up to the caller to do these checks and handle
>> rollbacks, not the driver core, I think.
>>
>> Can't we just remove that forced check?
>
> Probably, if it fixes these warning-is-an-error problems. =C2=A0There=
 were
> other issues with linux-next that were build issues, not just this on=
e
> from what I recall, that kept Stephen from including the tree in
> linux-next. =C2=A0I can bounce them to you if you missed them.

Oh, I thought that was all: "I fixed it up (see below) and can carry
the fix as necessary" material.

I might have missed some stuff, I don't see any others. Care to check
yours and let me know?

Thanks and sorry,
Kay
