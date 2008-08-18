From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: linux-next: Tree for August 13 (nfsd)
Date: Mon, 18 Aug 2008 13:01:58 +0200
Message-ID: <20080818130158.1e01928a@surf>
References: <20080813172452.14b0775c.sfr@canb.auug.org.au>
	<20080813104748.13848196.randy.dunlap@oracle.com>
	<20080813180931.GC26765@fieldses.org>
	<20080814111633.55f5f1e8@surf>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([88.191.46.45]:49159 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751943AbYHRLCB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Aug 2008 07:02:01 -0400
In-Reply-To: <20080814111633.55f5f1e8@surf>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, neilb@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Le Thu, 14 Aug 2008 11:16:33 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a =C3=A9crit :

> > Looks like that's just two more functions that need to be stubbed
> > out in the case where CONFIG_FILE_LOCKING is undefined?--hopefully
> > Thomas Petazzoni (cc'd) could be talked into reproducing this and
> > sending me an incremental fix....
>=20
> Here is an incremental fix.

Does it work for you ?

Sincerly,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
