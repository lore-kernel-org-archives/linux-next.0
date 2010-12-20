From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the final tree (mfd
 tree related)
Date: Mon, 20 Dec 2010 11:33:37 +0100
Message-ID: <20101220103336.GC11095@sortiz-mobl>
References: <20101220192121.47767525.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:33036 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752968Ab0LTKdj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Dec 2010 05:33:39 -0500
Content-Disposition: inline
In-Reply-To: <20101220192121.47767525.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hi Stephen,

On Mon, Dec 20, 2010 at 07:21:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
Ok, I removed Mark's commit, the MFD tree should build fine now.
I'm keeping this one for whenever we'll have a proper pwm framework.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
