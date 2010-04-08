From: =?ISO-8859-1?Q?Timo_Ter=E4s?= <timo.teras@iki.fi>
Subject: Re: linux-next: powerpc boot failure
Date: Thu, 08 Apr 2010 10:48:01 +0300
Message-ID: <4BBD8A31.2080007@iki.fi>
References: <20100408165848.38f75f40.sfr@canb.auug.org.au>	<4BBD81B3.3030500@iki.fi>	<20100408172316.e6ee451d.sfr@canb.auug.org.au>	<4BBD85ED.4090209@iki.fi> <20100408174549.2f45ceea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f222.google.com ([209.85.219.222]:64405 "EHLO
	mail-ew0-f222.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758440Ab0DHHsJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2010 03:48:09 -0400
In-Reply-To: <20100408174549.2f45ceea.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi,
>=20
> On Thu, 08 Apr 2010 10:29:49 +0300 Timo Ter=E4s <timo.teras@iki.fi> w=
rote:
>> You don't probably have any xfrm policies then. And that code should=
 not
>> really get executed.
>>
>> Some of the changes touch globally visible structs, and inline funct=
ions.
>> Was this a clean rebuild? And did you update all kernel modules, als=
o in
>> the initramfs?
>=20
> Yes, the build is started from scratch and the kernel and modules are
> updated (this is our automated build and test system).
>=20
> I have attached the config in case that is of use.

Thanks, I'll check some of the xfrm related configs.

Can you on running system do:
 ip xfrm policy

That shows if there's any policies due to e.g. ipsec or tcp-md5.
