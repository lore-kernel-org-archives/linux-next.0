From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Wed, 7 Apr 2010 10:53:02 +0200
Message-ID: <20100407085301.GF2962@sortiz.org>
References: <20100407150242.ebeb11fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga10.intel.com ([192.55.52.92]:46810 "EHLO
	fmsmga102.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932097Ab0DGIwZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2010 04:52:25 -0400
Content-Disposition: inline
In-Reply-To: <20100407150242.ebeb11fb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Ira W. Snyder" <iws@ovro.caltech.edu>

Hi Stephen,

On Wed, Apr 07, 2010 at 03:02:42PM +1000, Stephen Rothwell wrote:
> Hi Samuel,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/mfd/janz-cmodio.c:270: error: 'PCI_VENDOR_ID_JANZ' undeclared here (not in a function)
> 
> Caused by commit d4a16922bc8ecece287becf3cc2c0333f77bdf9e ("mfd: Janz
> CMOD-IO PCI MODULbus Carrier Board support").
> 
> I have used the version of the mfd tree from next-20100401 for today.
I fixed and verified this one as well, thanks a lot.

Cheers,
Samuel.


> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/



-- 
Intel Open Source Technology Centre
http://oss.intel.com/
