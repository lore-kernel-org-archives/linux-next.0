From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH linux-next] serio: add ifdef for i8042 build fix
Date: Mon, 2 Jun 2008 10:44:36 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806021044010.6718@jikos.suse.cz>
References: <20080529182556.2994310a.sfr@canb.auug.org.au>
 <20080529094454.3605aa5c.randy.dunlap@oracle.com>
 <20080529095633.8893b4ec.randy.dunlap@oracle.com> <20080529184606.GA17728@anvil.corenet.prv>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:59588 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752997AbYFBIoh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Jun 2008 04:44:37 -0400
In-Reply-To: <20080529184606.GA17728@anvil.corenet.prv>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>

On Thu, 29 May 2008, Dmitry Torokhov wrote:

> > Restrict variable usage by bounding it with ifdef/endif CONFIG_PNP.
> > linux-next-20080529/drivers/input/serio/i8042-x86ia64io.h:590: error: 'i8042_nopnp' undeclared (first use in this function)
> Thank you for the report. I'd rahther changed it as in the patch below.
> What do you think?
> If everyone agrees then I will fold it in Jiri's original patch to keep
> the trees bisectable.

Definitely proper fix, sorry for messing it up. Folding Randy's fix into 
my patch is perfectly fine by me.

Thanks,

-- 
Jiri Kosina
SUSE Labs
