From: Nick Piggin <npiggin@suse.de>
Subject: Re: Next April 28: boot failure on PowerPC with SLQB
Date: Wed, 29 Apr 2009 09:04:23 +0200
Message-ID: <20090429070423.GB3398@wotan.suse.de>
References: <20090428165343.2e357d7a.sfr@canb.auug.org.au> <49F6E421.401@in.ibm.com> <84144f020904280422s6a9a277fjc4619c904f37e5ca@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37050 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755594AbZD2HE1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 03:04:27 -0400
Content-Disposition: inline
In-Reply-To: <84144f020904280422s6a9a277fjc4619c904f37e5ca@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Sachin Sant <sachinp@in.ibm.com>, linuxppc-dev@ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Christoph Lameter <cl@linux-foundation.org>

On Tue, Apr 28, 2009 at 02:22:06PM +0300, Pekka Enberg wrote:
> Nick,
> 
> Here's another one. I think we need to either fix these rather quickly
> or make SLUB the defaut for linux-next again so we don't interfere
> with other testing.

Yeah, I'm working on it. Let me either give you a fix or a patch to
change the default, by the end of the day ;)

Thanks,
Nick
