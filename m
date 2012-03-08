From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next broken by "ARM: S3C2440: move mach-s3c2440/* into
 mach-s3c24xx/"
Date: Thu, 8 Mar 2012 19:12:07 +0000
Message-ID: <20120308191207.GC7557@sirena.org.uk>
References: <20120308162326.GA30941@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37236 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757747Ab2CHTMS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Mar 2012 14:12:18 -0500
Content-Disposition: inline
In-Reply-To: <20120308162326.GA30941@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, tiwai@suse.de, linux-next@vger.kernel.org

On Thu, Mar 08, 2012 at 11:23:26AM -0500, Paul Gortmaker wrote:
> Something bad happened in this commit (dd6f01b5cc).  It looks like
> the moved file is truncated, causing this failure:

> http://kisskb.ellerman.id.au/kisskb/buildresult/5818815/

> I believe it came in via the fix/asoc tree.

Hrm?  What is "it" in this context, and what was your analysis here?
Nothing in the page you're linking to above suggests something audio
related...
