From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 15 Dec 2011 06:10:17 +0000
Message-ID: <20111215061017.GB24287@sirena.org.uk>
References: <20111215143832.3d1f01c73e78804c479f4340@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:49764 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752667Ab1LOGKT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Dec 2011 01:10:19 -0500
Content-Disposition: inline
In-Reply-To: <20111215143832.3d1f01c73e78804c479f4340@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Dec 15, 2011 at 02:38:32PM +1100, Stephen Rothwell wrote:

> Caused by commit f6a9336879ca ("ASoC: Convert wm8993 to devm_kzalloc
> ()").  I really should not be seeing this sort of build problem ...

So, the big problem with this stuff is that I can't usefully do much
with my for-next tree directly except for build test it and it's
difficult to usefully do anything with the resulting binaries especially
as the configurations which usually turn things up are generally very
slow to build.  This means I tend to mostly test on my work tree which
does contain some other code (often code which is required in order to
do an actual test) with substantially different configurations and pure
for-next tests tend to drop off the end of the day.  Doing them in
parallel tends not to work so well due to the I/O scheduler issues and
the impact on disk cache.

In this case the fix for the typo got squashed into a change that isn't
published yet by mistake.
