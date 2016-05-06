From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 6 May 2016 14:58:10 +1000
Message-ID: <20160506145810.04a319d3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48704 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750915AbcEFE6N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 May 2016 00:58:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (and a
few earlier ones) (powerpc allnoconfig (and many others)) failed like
this:

lib/vsprintf.c:160:2: error: initializer element is not constant
lib/vsprintf.c:160:2: error: (near initialization for 'decpair[0]')
lib/vsprintf.c:160:2: error: initializer element is not constant
lib/vsprintf.c:160:2: error: (near initialization for 'decpair[1]')
lib/vsprintf.c:160:2: error: initializer element is not constant
lib/vsprintf.c:160:2: error: (near initialization for 'decpair[2]')
lib/vsprintf.c:160:2: error: initializer element is not constant
lib/vsprintf.c:160:2: error: (near initialization for 'decpair[3]')
lib/vsprintf.c:160:2: error: initializer element is not constant

and more ... basically any big endian build of code using __swabxx
or cpu_to_lexx in initailisers (in the above case cpu_to_le16()).

Caused (presumably) by commit

  eeee46ed3cda ("byteswap: try to avoid __builtin_constant_p gcc bug")

This is a buyild using gcc 4.6.3.

I have revreted that commit for today to see if it fixes the overnight
builds.

-- 
Cheers,
Stephen Rothwell
