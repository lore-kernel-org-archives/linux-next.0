From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: please clean up the fscache tree
Date: Wed, 3 Aug 2016 11:15:10 +1000
Message-ID: <20160803111510.65620fc7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39211 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754006AbcHCBPN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Aug 2016 21:15:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi David,

The fscache tree
(git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git#fscache)
only contains 2 commits:

b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed
3c9b3b74606d FS-Cache: Increase reference of parent after registering, netfs success

which also exist in Linus' tree as other commits (they were merged in
Nov, 2015 via Al Viro).

Please clean this up, or let me know if it is not going to be used any
more and I will delete the tree from linux-next.

-- 
Cheers,
Stephen Rothwell
