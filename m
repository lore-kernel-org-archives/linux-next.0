From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the v4l-dvb
 tree
Date: Tue, 17 Feb 2009 14:07:15 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0902171406440.18110@jikos.suse.cz>
References: <20090217192831.c22ad27b.sfr@canb.auug.org.au> <alpine.LNX.1.10.0902171234180.18110@jikos.suse.cz> <20090217232441.aa2ab65b.sfr@canb.auug.org.au> <20090217100357.6550e8d3@pedra.chehab.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53968 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751862AbZBQNHR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 08:07:17 -0500
In-Reply-To: <20090217100357.6550e8d3@pedra.chehab.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Jean-Francois Moine <moinejf@free.fr>, Tobias Klauser <tklauser@distanz.ch>

On Tue, 17 Feb 2009, Mauro Carvalho Chehab wrote:

> > > yes, in fact I have pinged linux-media and other parties about that 
> > > yesterday [1]. When Mauro confirms that he picked it up, I will drop 
> > > it from trivial tree.
> > Excellent, thanks.
> I've picked it. I was waiting for a fix at patchwork.kernel.org for pulling it.
> Before that fix, a XMLRPC call were returning an empty set of patches, if one
> of the patches on a query had any character upper #127 (non-ascii chars).
> I'm currently updating linux-media tree with the pending patches.

Thanks. I have dropped the 'const static' -> 'static const' for V4L code 
from trivial tree.

-- 
Jiri Kosina
SUSE Labs
