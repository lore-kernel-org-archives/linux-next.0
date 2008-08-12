From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: ubifs tree build failure
Date: Tue, 12 Aug 2008 23:39:33 +0200
Message-ID: <20080812213933.GA25538@lst.de>
References: <20080812162409.91834486.sfr@canb.auug.org.au> <20080812182416.GA14420@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:43651 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750849AbYHLVjm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 17:39:42 -0400
Content-Disposition: inline
In-Reply-To: <20080812182416.GA14420@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Btw, a good example for export ops on a filesystem with similar
constraints is Dave's patch for jffs2:

	http://git.kernel.org/?p=linux/kernel/git/viro/vfs-2.6.git;a=commitdiff;h=dd9207c31d6712a4665f197db7740da6c633cea7
