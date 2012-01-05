From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 4 Jan 2012 16:57:52 -0800
Message-ID: <20120105005751.GA1761@leaf>
References: <20111228174518.721624fad9d048f9f85b3d50@canb.auug.org.au>
 <20120104230720.GD24583@kroah.com>
 <20120105104835.fd6c0fd173622af59d11012f@canb.auug.org.au>
 <CAPXgP13TC4iuy=MW-p8x05VG8ad-9rC+jxm6qHtx90tBX9zhTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:58577 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757321Ab2AEA6C convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 19:58:02 -0500
Content-Disposition: inline
In-Reply-To: <CAPXgP13TC4iuy=MW-p8x05VG8ad-9rC+jxm6qHtx90tBX9zhTw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kay Sievers <kay.sievers@vrfy.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 05, 2012 at 01:01:51AM +0100, Kay Sievers wrote:
> On Thu, Jan 5, 2012 at 00:48, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
>=20
> > Kay, Greg, any hints would be nice. =A0The tip tree commit is addin=
g this:
> >
> > bool cpu_is_hotpluggable(unsigned cpu)
> > {
> > =A0 =A0 =A0 =A0struct sys_device *dev =3D get_cpu_sysdev(cpu);
> > =A0 =A0 =A0 =A0return dev && container_of(dev, struct cpu, sysdev)-=
>hotpluggable;
> > }
> >
> > and, of course, all the sys_device stuff has now gone ...
> >
> > So is this correct?
> >
> > bool cpu_is_hotpluggable(unsigned cpu)
> > {
> > =A0 =A0 =A0 =A0struct device *dev =3D get_cpu_device(cpu);
> > =A0 =A0 =A0 =A0return dev && container_of(dev, struct cpu, dev)->ho=
tpluggable;
> > }
>=20
> Yes, that look like the right pattern.
>=20
> Stephen, thanks a lot for your help here, it's very much appreciated.

Definitely, thanks for fixing up cpu_is_hotpluggable for this change.

- Josh Triplett
