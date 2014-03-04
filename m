From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd-lj tree
Date: Tue, 4 Mar 2014 15:05:12 +0800
Message-ID: <20140304070512.GC10579@lee--X1>
References: <20140211132552.68b0802fd8742c6d72dfa738@canb.auug.org.au>
 <20140304140318.06e7a535ed06e9432e5df7d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:52913 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752025AbaCDHFU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Mar 2014 02:05:20 -0500
Received: by mail-pd0-f171.google.com with SMTP id r10so4764670pdi.2
        for <linux-next@vger.kernel.org>; Mon, 03 Mar 2014 23:05:19 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20140304140318.06e7a535ed06e9432e5df7d9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Keerthy <j-keerthy@ti.com>

Stephen,

> > After merging the mfd-lj tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/mfd/tps65218: struct i2c_device_id is 32 bytes.  The last o=
f 1 is:
> > 0x74 0x70 0x73 0x36 0x35 0x32 0x31 0x38 0x00 0x00 0x00 0x00 0x00 0x=
00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xf0 0x00 0x00 0x0=
0 0x00 0x00 0x00 0x00=20
> > FATAL: drivers/mfd/tps65218: struct i2c_device_id is not terminated=
 with a NULL entry!
> >=20
> > Caused by commit cc493e30e3a1 ("mfd: tps65218: Add driver for the
> > TPS65218 PMIC").
>=20
> Now that the otherproblem is fixed, I am getting this one again :-(

That's annoying. I thought I'd built all of the new drivers.

> > I have used the mfd-lj tree from next-20140210 for today.
>=20
> Again.

Sorry, again.

/me investigates.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
