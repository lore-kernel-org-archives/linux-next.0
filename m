From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for October 5
Date: Tue, 5 Oct 2010 10:50:26 +0200
Message-ID: <201010051050.26543.arnd@arndb.de>
References: <20101005161220.0bef433f.sfr@canb.auug.org.au> <AANLkTikF+-0ybP3RMA-7wr8DMit6At=G1W7oB0UO4Mvz@mail.gmail.com> <20101005194232.de733b2b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:57181 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753317Ab0JEIug (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2010 04:50:36 -0400
In-Reply-To: <20101005194232.de733b2b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Zimny Lech <napohybelskurwysynom2010@gmail.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Valdis.Kletnieks@vt.edu

On Tuesday 05 October 2010, Stephen Rothwell wrote:
> Hi,
> 
> On Tue, 5 Oct 2010 09:38:49 +0200 Zimny Lech <napohybelskurwysynom2010@gmail.com> wrote:
> >
> > Also, I saw this
> > /home/test/linux-2.6/include/linux/fs.h:1274:20: warning: function
> > declaration isn't a prototype
> > /home/test/linux-2.6/include/linux/fs.h:1278:20: warning: function
> > declaration isn't a prototype
> > 
> > It was fixed in -mmotm by Valdis Kletnieks.
> 
> Yeah, it was fixed in linux-next, but rebroken by a rebase of the bkl-vfs
> tree since yesterday.

Ok, fixed it again now. Sorry for messing this up twice.

	Arnd
