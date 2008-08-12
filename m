From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: ubifs tree build failure
Date: Tue, 12 Aug 2008 10:37:28 +0300
Message-ID: <48A13DB8.4090003@nokia.com>
References: <20080812162409.91834486.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.233]:24025 "EHLO
	mgw-mx06.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751386AbYHLHmo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Aug 2008 03:42:44 -0400
In-Reply-To: <20080812162409.91834486.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>
Cc: linux-next@vger.kernel.org

ext Stephen Rothwell wrote:
> Hi Artem,
>=20
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> fs/ubifs/super.c: In function 'ubifs_fh_to_dentry':
> fs/ubifs/super.c:1611: error: implicit declaration of function 'd_all=
oc_anon'
> fs/ubifs/super.c:1611: warning: assignment makes pointer from integer=
 without a cast
>=20
> Caused by interaction between commit
> 95b53e84e8899258a1af011a7216abb978afae26 ("kill d_alloc_anon") from t=
he
> vfs tree and b51e4badb0248ac75fe3128bb369d987e28b2f88 ("UBIFS: add NF=
S
> support") from the ubifs tree.  The former removes d_alloc_anon and t=
he
> latter adds a new usage.
>=20
> For now, I have reverted the ubifs commit.  Christoph, maybe you coul=
d
> provide a better solution.
>=20
> I have appended the reverted patch below.

I am not sure how to resolve things like this actually. I am planning t=
o
send ubifs-2.6.git upstream soon, so probably Christoph will be able to=
 amend
his stuff after this. Or any other suggestion?

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
