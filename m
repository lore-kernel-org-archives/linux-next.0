From: Jiri Kosina <jkosina@suse.cz>
Subject: livepatching tree for linux-next
Date: Mon, 22 Dec 2014 20:52:02 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1412221412360.1680@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60042 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754764AbaLVTwE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2014 14:52:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-next@vger.kernel.org

Hi Stephen,

a substantial amount of work has been invested into abstracing "Live 
Patching" core functionality out of the already existing implementations, 
so that further improvements can be built on top of it in incremental 
steps.

The core functionality (which is self-contained) now works and has been 
Reviewed/Acked by both interested parties (i.e. people working on kPatch 
and kGraft) and agreed to be a common ground on which further development 
will happen.

We plan to send a pull request for 3.20, therefore I'd like to ask you to 
include 'for-next' branch of

	git://git.kernel.org/pub/scm/linux/kernel/git/jikos/livepatching.git

Into linux-next pile.

Thanks,

-- 
Jiri Kosina
SUSE Labs
