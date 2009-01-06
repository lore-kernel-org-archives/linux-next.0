From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: strncat() misuse (was: Re: dm_attr_{name,uuid}_show buffer overflow? (was: Re: linux-next: Tree for January 5))
Date: Tue, 6 Jan 2009 02:16:58 +0000
Message-ID: <20090106021658.GQ5098@agk.fab.redhat.com>
References: <20090105173517.deeff918.sfr@canb.auug.org.au> <Pine.LNX.4.64.0901052225400.5451@anakin> <Pine.LNX.4.64.0901052259420.5451@anakin> <20090106012759.GA3512@agk.fab.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:50810 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751869AbZAFCRr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 21:17:47 -0500
Content-Disposition: inline
In-Reply-To: <20090106012759.GA3512@agk.fab.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Milan Broz <mbroz@redhat.com>, Jaya Kumar <jayakumar.video@gmail.com>, Laurent Pinchart <laurent.pinchart@skynet.be>, Mauro Carvalho Chehab <mchehab@infradead.org>, Gene Sally <Gene.Sally@timesys.com>, Sam Ravnborg <sam@ravnborg.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Jan 06, 2009 at 01:27:59AM +0000, Alasdair G Kergon wrote:
> On Mon, Jan 05, 2009 at 11:18:38PM +0100, Geert Uytterhoeven wrote:
> > On Mon, 5 Jan 2009, Geert Uytterhoeven wrote:
> > > On Mon, 5 Jan 2009, Stephen Rothwell wrote:
> > > |         strncat(buf, "\n", DM_NAME_LEN);
> > > |         return strnlen(buf, DM_NAME_LEN);
 
I've edited the patch to use strcat and strlen.  

  http://git.kernel.org/?p=linux/kernel/git/agk/linux-2.6-dm.git;a=commit;h=911950f88bfd8a6747a1c6da5c5410641845bc64  

Alasdair
-- 
agk@redhat.com
