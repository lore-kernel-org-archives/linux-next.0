From: Jean Delvare <jdelvare@suse.de>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 28 May 2014 11:30:02 +0200
Message-ID: <1401269402.4597.15.camel@chaos.site>
References: <20140528180331.4abb99a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55326 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751363AbaE1LvY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 May 2014 07:51:24 -0400
In-Reply-To: <20140528180331.4abb99a0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen, Greg,

Le Wednesday 28 May 2014 =C3=A0 18:03 +1000, Stephen Rothwell a =C3=A9c=
rit :
> Hi Greg,
>=20
> After merging the driver-core tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> drivers/crypto/nx/nx-842.c: In function 'nx842_probe':
> drivers/crypto/nx/nx-842.c:1200:6: error: void value not ignored as i=
t ought to be
>   if (dev_set_drvdata(&viodev->dev, rcu_dereference(devdata))) {
>       ^
>=20
> Caused by commit 2c1f1ff0f0d9 ("driver core: dev_set_drvdata returns
> void").  Grep is better than hope :-)

Oops, that would be my fault, sorry. I did grep for such cases but my
grep command must have been poor, I only caught 2 of the 3 cases in the
kernel tree. And make allmodconfig didn't help as the driver is
ppc64-specific.

I'll send a fix-up patch immediately, sorry for the trouble.

--=20
Jean Delvare
SUSE L3 Support
