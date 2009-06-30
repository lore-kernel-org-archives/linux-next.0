From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Tue, 30 Jun 2009 13:57:40 +0300
Message-ID: <1246359460.8014.25.camel@penberg-laptop>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au>
	 <4A488D08.30307@in.ibm.com>
	 <20090629103123.GC9321@osiris.boeblingen.de.ibm.com>
	 <20090629103943.GA31299@wotan.suse.de>
	 <20090629115038.GD9321@osiris.boeblingen.de.ibm.com>
	 <20090629115835.GA2308@wotan.suse.de>
	 <20090629141234.GF9321@osiris.boeblingen.de.ibm.com>
	 <20090630090631.GB1114@wotan.suse.de>
	 <20090630100929.GA2559@osiris.boeblingen.de.ibm.com>
	 <20090630102958.GF1114@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:37837 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751716AbZF3K5m (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2009 06:57:42 -0400
In-Reply-To: <20090630102958.GF1114@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Sachin Sant <sachinp@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Tue, 2009-06-30 at 12:29 +0200, Nick Piggin wrote:
> On Tue, Jun 30, 2009 at 12:09:29PM +0200, Heiko Carstens wrote:
> > On Tue, Jun 30, 2009 at 11:06:31AM +0200, Nick Piggin wrote:
> > > On Mon, Jun 29, 2009 at 04:12:34PM +0200, Heiko Carstens wrote:
> > > > slqb returns ZERO_SIZE_PTR instead of NULL for large size requests it cannot
> > > > handle.
> > > > The patch below would fix it. But I think its too ugly. So I leave it up to
> > > > Nick to come up with a real and nice patch ;)
> > > 
> > > Could you try this patch and see if it helps? (it fixes a number
> > > of simple corner cases here, *blush*)
> > 
> > Yes, it does work now. Thanks!
> 
> Thanks. Pekka, can you please merge this with
> 
> Signed-off-by: Nick Piggin <npiggin@suse.de>

Done. Thanks everyone!
