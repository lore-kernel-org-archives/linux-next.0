From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd-lj tree
Date: Tue, 4 Mar 2014 16:06:55 +0800
Message-ID: <20140304080655.GD10579@lee--X1>
References: <20140211132552.68b0802fd8742c6d72dfa738@canb.auug.org.au>
 <20140304140318.06e7a535ed06e9432e5df7d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49238 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756231AbaCDIHA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Mar 2014 03:07:00 -0500
Received: by mail-pb0-f46.google.com with SMTP id rq2so4855845pbb.5
        for <linux-next@vger.kernel.org>; Tue, 04 Mar 2014 00:06:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20140304140318.06e7a535ed06e9432e5df7d9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Keerthy <j-keerthy@ti.com>

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

-rw-r--r-- 1 lee lee   6320 Mar  4 15:20 tps65218.o

Hmmm... I'm having trouble reproducing the error. My toolchain
doesn't complain about the lack of a terminating entry. I have fixed
the problem and re-pushed the branch though. Would you be kind enough
to re-test it please?

> Now that the otherproblem is fixed, I am getting this one again :-(
>=20
> > I have used the mfd-lj tree from next-20140210 for today.
>=20
> Again.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
