From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Subject: Re: linux-next: state of the trees
Date: Fri, 06 Mar 2009 10:41:10 +0100
Message-ID: <49B0EFB6.8040107@s5r6.in-berlin.de>
References: <20090306155634.cc6c682d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hp3.statik.tu-cottbus.de ([141.43.120.68]:40872 "EHLO
	hp3.statik.tu-cottbus.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221AbZCFJmV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2009 04:42:21 -0500
In-Reply-To: <20090306155634.cc6c682d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
...
> the numbers following the
> name are the total number of outstanding commits (relative to all the
> preceding trees) and the number after doing "git patch-id" matching with
> Linus' tree and all the previous trees.  Thus the order of the trees
> makes a difference to the numbers.
...
> ieee1394		112	94

The precise number would be 44.  The rest are mostly commits which were
equivalently folded into larger ones and then merged into mainline.
-- 
Stefan Richter
-=====-==--= --== --==-
http://arcgraph.de/sr/
