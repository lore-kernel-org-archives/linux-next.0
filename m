From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] Missing bio_put following submit_bio_wait
Date: Tue, 7 Jun 2016 18:46:45 +0200
Message-ID: <20160607164645.GA13001@lst.de>
References: <1465316612-9649-1-git-send-email-shaun@tancheff.com> <1465317133-13266-1-git-send-email-shaun@tancheff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:45816 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161601AbcFGQqr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jun 2016 12:46:47 -0400
Content-Disposition: inline
In-Reply-To: <1465317133-13266-1-git-send-email-shaun@tancheff.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaun Tancheff <shaun@tancheff.com>
Cc: linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>, axboe@kernel.dk, David Drysdale <drysdale@google.com>, Xiong Zhou <xzhou@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-nvdimm@ml01.01.org, Larry Finger <Larry.Finger@lwfinger.net>, Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@fb.com>, bart.vanassche@sandisk.com, Shaun Tancheff <shaun.tancheff@seagate.com>

Looks fine,

Reviewed-by: Christoph Hellwig <hch@lst.de>
