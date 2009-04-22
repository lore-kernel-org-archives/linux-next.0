From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: linux-next: wireless tree build failure
Date: Wed, 22 Apr 2009 14:36:01 +0100
Message-ID: <20090422133601.GA25039@srcf.ucam.org>
References: <20090422115738.524272c8.sfr@canb.auug.org.au> <1240390746.17388.64.camel@johannes.local> <20090422230333.e1f7d3db.sfr@canb.auug.org.au> <20090422130612.GB3288@tuxdriver.com> <1240407191.21978.17.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:53054 "EHLO
	vavatch.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752551AbZDVNgV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 09:36:21 -0400
Content-Disposition: inline
In-Reply-To: <1240407191.21978.17.camel@johannes.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Len Brown <lenb@kernel.org>

On Wed, Apr 22, 2009 at 03:33:11PM +0200, Johannes Berg wrote:
> But that's not the interesting part -- the thing is the rfkill rewrite.
> I don't know how to handle that w/o breaking all users. I had hoped to
> finish this very soon to be ready early in .31, but I'm still waiting
> for Thinkpad and Toshiba conversions (and I forgot who wanted to look at
> Toshiba), but if new users are being added in other trees then that's a
> problem.

oqo-wmi can be ignored for the moment - Len, can you drop it from your 
tree for now? I'll clean that bit up as well.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
