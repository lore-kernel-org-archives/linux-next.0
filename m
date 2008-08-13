From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: ubifs tree build failure
Date: Wed, 13 Aug 2008 12:58:06 +0300
Message-ID: <48A2B02E.8020601@nokia.com>
References: <20080812162409.91834486.sfr@canb.auug.org.au> <20080812182416.GA14420@lst.de> <20080812213933.GA25538@lst.de>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.233]:56336 "EHLO
	mgw-mx06.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751907AbYHMJ6h (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Aug 2008 05:58:37 -0400
In-Reply-To: <20080812213933.GA25538@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Christoph Hellwig wrote:
> Btw, a good example for export ops on a filesystem with similar
> constraints is Dave's patch for jffs2:
>=20
> 	http://git.kernel.org/?p=3Dlinux/kernel/git/viro/vfs-2.6.git;a=3Dcom=
mitdiff;h=3Ddd9207c31d6712a4665f197db7740da6c633cea7

OK, it is probably best if UBIFS NFS support goes via VFS git tree
just like JFFS2. I'll send a patch to fsdevel later.

Thus,  I'll remove NFS support from my tree and the conflict will
be solved.

Thanks.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
