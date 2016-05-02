From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the tpmdd tree
Date: Mon, 2 May 2016 19:26:46 +0300
Message-ID: <20160502162646.GA4264@intel.com>
References: <20160428153232.0d6eb076@canb.auug.org.au>
 <1461834144.3482.4.camel@linux.intel.com>
 <20160501231222.42557edf@canb.auug.org.au>
 <20160502111036.GA9585@intel.com>
 <20160502221927.6568ac39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:19696 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754416AbcEBQ0v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 May 2016 12:26:51 -0400
Content-Disposition: inline
In-Reply-To: <20160502221927.6568ac39@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Ricard <christophe.ricard@gmail.com>

On Mon, May 02, 2016 at 10:19:27PM +1000, Stephen Rothwell wrote:
> Hi Jarkko,
> 
> On Mon, 2 May 2016 14:10:36 +0300 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> >
> > I applied the fix and merged it.
> 
> Unfortunately, you seem to have turned the leading whitespace from a
> TAB to spaces :-(

Fixed. Sorry. I also did cross-compilation for PPC to make sure that
this works. I'll take PPC compilation as part of my testing procedure
from now on in order to prevent this problem from happening again
in the first place.

> -- 
> Cheers,
> Stephen Rothwell

/Jarkko
