From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH] cs5535-mfd: fix warning on x86-64
Date: Tue, 30 Nov 2010 11:01:38 +0100
Message-ID: <20101130100137.GA11125@sortiz-mobl>
References: <20101129115257.9a78ad14.sfr@canb.auug.org.au>
 <20101129204410.339805ef@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:9949 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754754Ab0K3KBl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Nov 2010 05:01:41 -0500
Content-Disposition: inline
In-Reply-To: <20101129204410.339805ef@queued.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andres Salomon <dilinger@queued.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andres,

On Mon, Nov 29, 2010 at 08:44:10PM -0800, Andres Salomon wrote:
> On Mon, 29 Nov 2010 11:52:57 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Samuel,
> > 
> > After merging the mfd tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > drivers/mfd/cs5535-mfd.c: In function 'cs5535_mfd_probe':
> > drivers/mfd/cs5535-mfd.c:106: warning: format '%d' expects type
> > 'int', but argument 3 has type 'long unsigned int'
> > 
> 
> Ick, ARRAY_SIZE is unsigned int on x86, unsigned long on x86-64.  The
> patch below fixes this.
> 
> 
> 
> 
> From: Andres Salomon <dilinger@queued.net>
> 
> ARRAY_SIZE() returns unsigned long on x86-64 (rather than unsigned int);
> cast it to the desired type to shut gcc up.
Patch applied, many thanks.
I'll look at your subdevices patches by the end of this week.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
