From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Date: Thu, 8 Oct 2015 12:39:54 +0530
Message-ID: <20151008070954.GE4570@linux>
References: <20151007155146.41c4528f@canb.auug.org.au>
 <8672077.UYXmy4VzzX@vostro.rjw.lan>
 <20151008090427.61690eef@canb.auug.org.au>
 <1846544.jnahGernn9@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34721 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876AbbJHHJ7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2015 03:09:59 -0400
Received: by padhy16 with SMTP id hy16so46219408pad.1
        for <linux-next@vger.kernel.org>; Thu, 08 Oct 2015 00:09:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1846544.jnahGernn9@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 08-10-15, 00:47, Rafael J. Wysocki wrote:
> Well, the conflicting commits here were from the same developer which is kind
> of annoying.

I do understand why its annoying, but I wasn't doing them in parallel.
The patches in Greg's tree were written long after the other series
got applied to your tree.

So, I was kind of helpless here :(

> The new use in my tree can wait until the API update in the Greg's tree is
> merged IMO.  That's why I've now dropped the commit that added it. :-)

Looking at the current state of your tree, looks like you have dropped
way too many patches. Was it intentional?

Missing commits:

1840995c52d4 PM / OPP: reuse of_parse_phandle()
f0489a5ef4d0 PM / OPP: Rename opp init/free table routines
8f8d37b2537a PM / OPP: Prefix exported opp routines with dev_pm_opp_
33692dc381f9 PM / OPP: Move opp core to its own directory
f59d3ee8480d PM / OPP: Move cpu specific code to opp/cpu.c
5cb5fdbf3877 PM / OPP: Add debugfs support

I though you just dropped the last commit, but no.

-- 
viresh
