From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Thu, 5 Jan 2012 01:01:51 +0100
Message-ID: <CAPXgP13TC4iuy=MW-p8x05VG8ad-9rC+jxm6qHtx90tBX9zhTw@mail.gmail.com>
References: <20111228174518.721624fad9d048f9f85b3d50@canb.auug.org.au>
 <20120104230720.GD24583@kroah.com> <20120105104835.fd6c0fd173622af59d11012f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:36510 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757414Ab2AEACM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 19:02:12 -0500
In-Reply-To: <20120105104835.fd6c0fd173622af59d11012f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>

On Thu, Jan 5, 2012 at 00:48, Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:

> Kay, Greg, any hints would be nice. =C2=A0The tip tree commit is addi=
ng this:
>
> bool cpu_is_hotpluggable(unsigned cpu)
> {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct sys_device *dev =3D get_cpu_sysdev(=
cpu);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev && container_of(dev, struct cpu=
, sysdev)->hotpluggable;
> }
>
> and, of course, all the sys_device stuff has now gone ...
>
> So is this correct?
>
> bool cpu_is_hotpluggable(unsigned cpu)
> {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D get_cpu_device(cpu)=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev && container_of(dev, struct cpu=
, dev)->hotpluggable;
> }

Yes, that look like the right pattern.

Stephen, thanks a lot for your help here, it's very much appreciated.
I know we cause a lot of trouble every other year. :)

Thanks,
Kay
