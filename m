From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next -> 2.6.34: Tree for April 28 (logfs)
Date: Tue, 18 May 2010 02:40:48 +0200
Message-ID: <20100518004048.GF20590@elte.hu>
References: <20100428164341.cee2911a.sfr@canb.auug.org.au>
 <20100428085604.0566092a.randy.dunlap@oracle.com>
 <20100505092020.66a461fa.randy.dunlap@oracle.com>
 <20100505203548.GI25129@logfs.org>
 <20100509062010.GA9485@elte.hu>
 <20100516204826.2625eed2.randy.dunlap@oracle.com>
 <20100517193159.GE28003@logfs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:59720 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752542Ab0ERAlT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 May 2010 20:41:19 -0400
Content-Disposition: inline
In-Reply-To: <20100517193159.GE28003@logfs.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, logfs@logfs.org


* J=F6rn Engel <joern@logfs.org> wrote:

> On Sun, 16 May 2010 20:48:26 -0700, Randy Dunlap wrote:
> >=20
> > This fix is now needed in 2.6.34....
>=20
> I didn't send Linus a pull request, as I was on=20
> vacation last week.  Bad timing, given the 2.6.34=20
> release date. :(

Dont worry about it too much - the likehood of the=20
build failure was very low, around 1:50 in my=20
randconfig tests. I doubt any real user ran into this=20
spontaenously - and randconfig folks know how to fix=20
rare build failures :-)

You might still want to forward the commit to=20
-stable, once it's in Linus's tree.

Thanks,

	Ingo
