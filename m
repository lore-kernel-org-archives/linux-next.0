From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: ubifs tree build failure
Date: Tue, 12 Aug 2008 10:11:14 +0300
Message-ID: <48A13792.6090900@nokia.com>
References: <20080812162409.91834486.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.105.134]:47329 "EHLO
	mgw-mx09.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbYHLHQN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Aug 2008 03:16:13 -0400
In-Reply-To: <20080812162409.91834486.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> fs/ubifs/super.c: In function 'ubifs_fh_to_dentry':
> fs/ubifs/super.c:1611: error: implicit declaration of function 'd_all=
oc_anon'
> fs/ubifs/super.c:1611: warning: assignment makes pointer from integer=
 without a cast

Hi Stephen,

I'll look at this, thanks.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
