From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 24 Aug 2017 10:44:10 +0200
Message-ID: <20170824084410.GC19313@lst.de>
References: <20170824133203.18512289@canb.auug.org.au> <20170824133455.7fb963ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:48472 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751191AbdHXIoL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Aug 2017 04:44:11 -0400
Content-Disposition: inline
In-Reply-To: <20170824133455.7fb963ca@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Stephen,

Keith already sent a patch for this, it was a rebase failure :(

The documentation one is intentional - the document is completely
out of data, so doctoring around a bit won't help.  I'll try to find
some time to replace it with a sane new doc that use the ReST stuff
to not duplicate the structure. 
