From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the final tree (mfd and
 input trees related)
Date: Wed, 21 Mar 2012 21:40:55 +0100
Message-ID: <20120321204055.GC3875@sortiz-mobl>
References: <20120321182930.6f75199b7406044669891a14@canb.auug.org.au>
 <20120321080313.GA12410@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:58627 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760155Ab2CUUct (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Mar 2012 16:32:49 -0400
Content-Disposition: inline
In-Reply-To: <20120321080313.GA12410@core.coreip.homeip.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Donggeun Kim <dg77.kim@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Hi Dmitry, Stephen,

On Wed, Mar 21, 2012 at 01:03:13AM -0700, Dmitry Torokhov wrote:
> > Caused by a bad merge of commits 104594b01ce7 ("Input: add driver support
> > for MAX8997-haptic") from the input tree and 02b09703e7a4 ("mfd: Add
> > platform data for MAX8997 haptic driver") from the mfd tree.
> 
> Sorry about this. I thought Samuel was going to revert the platform data
> from his tree as he OKed applying the combined patch...
My fault indeed. The commit is reverted now.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
