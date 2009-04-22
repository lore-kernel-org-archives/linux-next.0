From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: wireless tree build failure
Date: Wed, 22 Apr 2009 09:06:12 -0400
Message-ID: <20090422130612.GB3288@tuxdriver.com>
References: <20090422115738.524272c8.sfr@canb.auug.org.au> <1240390746.17388.64.camel@johannes.local> <20090422230333.e1f7d3db.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:47998 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752985AbZDVNPz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 09:15:55 -0400
Content-Disposition: inline
In-Reply-To: <20090422230333.e1f7d3db.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Len Brown <lenb@kernel.org>

On Wed, Apr 22, 2009 at 11:03:33PM +1000, Stephen Rothwell wrote:
> Hi Johannes,
> 
> On Wed, 22 Apr 2009 10:59:06 +0200 Johannes Berg <johannes@sipsolutions.net> wrote:
> >
> > Fun. Another rfkill problem. It'll get worse -- I have a complete rfkill
> > rewrite in the pipeline. For this part it's easy, just remove
> > user_claim_unsupported use from the driver.
> > 
> > Any suggestions on how to handle the other merge problems?
> 
> Well, the best way (and I know this is simplistic and maybe difficult) is
> to introduce the new rewrite alongside the old code and then slowly move
> the clients of the API over.

Maybe we should put user_claim_unsupported back into struct rfkill
(and deprecate it) for now?

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
