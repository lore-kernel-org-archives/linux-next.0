From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: ubi tree build failure
Date: Wed, 03 Jun 2009 15:55:04 +0300
Message-ID: <4A2672A8.8020809@nokia.com>
References: <20090603184408.49c7fb1f.sfr@canb.auug.org.au> <4A265DF6.3070602@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.105.134]:47392 "EHLO
	mgw-mx09.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756883AbZFCMzt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 08:55:49 -0400
In-Reply-To: <4A265DF6.3070602@nokia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry Pervushin <dpervushin@embeddedalley.com>

Artem Bityutskiy wrote:
> Stephen Rothwell wrote:
>> Today's linux-next build (powerpc ppc44x_defconfig) failed like this=
:
>>
>> drivers/mtd/ubi/gluebi.c: In function 'gluebi_get_device':
>> drivers/mtd/ubi/gluebi.c:126: error: implicit declaration of functio=
n 'IS_ERR'
>> drivers/mtd/ubi/gluebi.c:129: error: implicit declaration of functio=
n 'PTR_ERR'
>=20
> It is strange that I do not see these errors on my x86_86
>=20
>> Introduced by commit ec5c514efde253de7f28668c88bbae26d2a293de ("UBI:=
 make
>> gluebi a separate module") from the ubi tree.  I guess the conversio=
n
>> managed to remove an implicit include of linux/err.h.
>>
>> I have reverted that commit for today.  I then needed to also revert
>> commit 518ceef0c9ca97023e45ae46aedaefa240c690a6 ("UBI: remove built-=
in
>> gluebi") to make it build again.
>=20
> Hmm, this means bisection problems, which I'd also like to fix.
> But this commit builds just fine for me as well. Would be nice
> to see what are the errors.
>=20
> Any suggestions what I could do to reproduce the build issues?
> I'll try at least now to build this on x86 (32-bit).=20

Did not see compile error on x86 as well. Anyway, I have added more
includes which seem to be missed. Hopefully this problem is fixed
now. Thanks!

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
