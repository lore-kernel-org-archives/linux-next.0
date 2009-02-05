From: Thomas Renninger <trenn@suse.de>
Subject: Re: linux-next: cpufreq tree build failure
Date: Thu, 5 Feb 2009 10:33:04 +0100
Message-ID: <200902051033.07035.trenn@suse.de>
References: <20090205185420.38214a06.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34550 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752109AbZBEJdJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 04:33:09 -0500
In-Reply-To: <20090205185420.38214a06.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Jones <davej@redhat.com>, linux-next@vger.kernel.org

On Thursday 05 February 2009 08:54:20 Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/cpufreq/cpufreq_conservative.o: In function `minimum_sampling_rate':
> (.opd+0x30): multiple definition of `minimum_sampling_rate'
> drivers/cpufreq/cpufreq_ondemand.o:(.opd+0x18): first defined here
> drivers/cpufreq/cpufreq_conservative.o: In function `minimum_sampling_rate':
> drivers/cpufreq/cpufreq_conservative.c:64: multiple definition of 
`.minimum_sampling_rate'
> drivers/cpufreq/cpufreq_ondemand.o:drivers/cpufreq/cpufreq_ondemand.c:62: 
first defined here
> 
> Caused by commit f935195b8a341d7ffdf600dd98a657f2f09b7908 ("[CPUFREQ]
> ondemand/conservative: sanitize sampling_rate restrictions").
> 
> I have reverted that commit for today.
Argh, I test compiled the conservative as module and ondemand permanent,
thus this bug did not show up.

The minimum_sampling_rate function must be declared static in both:
drivers/cpufreq/cpufreq_ondemand.c
and
drivers/cpufreq/cpufreq_conservative.c

This could be done by just adding this in the patch itself
(no newline needed).
Could Dave also drop the patch, declare the two functions static and
re-add it and you pick it up automatically with the next merge or
do I have to send an on top fix (or can you, Dave, just do this
little change)?

Sorry and thanks,

    Thomas
