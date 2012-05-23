From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Wed, 23 May 2012 16:34:34 +0200
Message-ID: <20120523143434.GE23600@sortiz-mobl>
References: <20120521134219.6d6396802bd6a097503bac92@canb.auug.org.au>
 <4FB9F818.4030801@linaro.org>
 <20120521184005.3b7661ec6468c5878a22615d@canb.auug.org.au>
 <4FBA0460.1070300@linaro.org>
 <20120521191007.9347651e88add2e7c247a24f@canb.auug.org.au>
 <4FBA08A4.6030706@linaro.org>
 <20120521095427.GA30045@sirena.org.uk>
 <4FBA18C7.4030800@linaro.org>
 <20120522224214.GG10210@sortiz-mobl>
 <20120523085226.7ffe604b626a2d96084ee682@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:9702 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753206Ab2EWOei (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 May 2012 10:34:38 -0400
Content-Disposition: inline
In-Reply-To: <20120523085226.7ffe604b626a2d96084ee682@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On Wed, May 23, 2012 at 08:52:26AM +1000, Stephen Rothwell wrote:
> Hi Samuel,
> 
> On Wed, 23 May 2012 00:42:14 +0200 Samuel Ortiz <sameo@linux.intel.com> wrote:
> >
> > I would appreciate if we could have a fix for this one sooner than later as
> > I'm planning to send my pull request by the end of this week.
> 
> Just so you know, nothing you have added to your tree since May 11 has
> been in linux-next due to 3 separate build problems.  As far as I can see
> the same will be true today due to the problem you were discussing here.
I applied a fix for this one, and a couple of other commits for 2 more build
failures. The mfd tree should build fine now.
Sorry for the delay.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
