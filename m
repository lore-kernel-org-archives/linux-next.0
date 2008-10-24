From: Nigel Cunningham <ncunningham@crca.org.au>
Subject: Re: Current suspend issues on Lenovo X200
Date: Fri, 24 Oct 2008 14:03:14 +1100
Message-ID: <1224817394.6623.12.camel@nigel-laptop>
References: <20081023204326.GB4175@denkbrett.schottelius.org>
	 <20081023210707.GA5089@denkbrett.schottelius.org>
	 <200810240006.19857.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756139AbYJXDDa@vger.kernel.org>
In-Reply-To: <200810240006.19857.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Nico Schottelius <nico-linux-next@schottelius.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hey Rafael :)

On Fri, 2008-10-24 at 00:06 +0200, Rafael J. Wysocki wrote:
> On Thursday, 23 of October 2008, Nico Schottelius wrote:
> > First of all, this was wrong:
> >=20
> > Nico -telmich- Schottelius [Thu, Oct 23, 2008 at 10:43:26PM +0200]:
> > >  - 2.6.27: system freeze instead of wakeup
> > >    -> shows parts of the X screen, but does not react on ping
> >=20
> > System does not freeze, but reboots instead.
> >=20
> > Tried next-20081023 and 2.6.27 with acpi_sleep=3Ds3_bios:
> >=20
> > - suspend and wakeup on console works fine for both!
> > - no X running on next
> > - 2.6.27 + X -> reboot on wakeup
>=20
> Let me guess, you have a NVidia graphics?

Not this time. Going off the other log he posted, it's...

Chipset Mobile Intel=C2=AE GM45 Express Chipset found

Regards,

Nigel
