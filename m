From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: manual merge of the trivial tree with the v4l-dvb
 tree
Date: Tue, 17 Feb 2009 10:03:57 -0300
Message-ID: <20090217100357.6550e8d3@pedra.chehab.org>
References: <20090217192831.c22ad27b.sfr@canb.auug.org.au>
	<alpine.LNX.1.10.0902171234180.18110@jikos.suse.cz>
	<20090217232441.aa2ab65b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:46617 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750961AbZBQNEQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 08:04:16 -0500
In-Reply-To: <20090217232441.aa2ab65b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, Jean-Francois Moine <moinejf@free.fr>, Tobias Klauser <tklauser@distanz.ch>


On Tue, 17 Feb 2009 23:24:41 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jiri,
> 
> On Tue, 17 Feb 2009 12:35:16 +0100 (CET) Jiri Kosina <jkosina@suse.cz> wrote:
> >
> > yes, in fact I have pinged linux-media and other parties about that 
> > yesterday [1]. When Mauro confirms that he picked it up, I will drop it 
> > from trivial tree.
> 
> Excellent, thanks.
> 
I've picked it. I was waiting for a fix at patchwork.kernel.org for pulling it.
Before that fix, a XMLRPC call were returning an empty set of patches, if one
of the patches on a query had any character upper #127 (non-ascii chars).

I'm currently updating linux-media tree with the pending patches.

-- 

Cheers,
Mauro
