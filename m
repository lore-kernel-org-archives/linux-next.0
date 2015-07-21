From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: error fetching the ipmi tree
Date: Wed, 22 Jul 2015 08:29:46 +1000
Message-ID: <20150722082946.39366276@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41963 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933611AbbGUW3s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jul 2015 18:29:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Corey Minyard <cminyard@mvista.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Corey,

While fetching the ipmi tree
(git://git.code.sf.net/p/openipmi/linux-ipmi#for-next), I get this
error:

fatal: unable to connect to git.code.sf.net:
git.code.sf.net[0: 216.34.181.155]: errno=Connection refused

I have been getting this for a few days now.  The http and https URLs
don't work either (for me in Firefox).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
