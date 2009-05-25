From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: md tree build failure
Date: Mon, 25 May 2009 07:44:14 -0400
Message-ID: <yq17i05flv5.fsf@sermon.lab.mkp.net>
References: <20090525153346.758483fc.sfr@canb.auug.org.au>
	<20090525061552.GH11363@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:43178 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752742AbZEYLoa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2009 07:44:30 -0400
In-Reply-To: <20090525061552.GH11363@kernel.dk> (Jens Axboe's message of "Mon,
	25 May 2009 08:15:52 +0200")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Neil Brown <neilb@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, raz ben yehuda <raziebe@gmail.com>, "Martin K. Petersen" <martin.petersen@oracle.com>

>>>>> "Jens" == Jens Axboe <jens.axboe@oracle.com> writes:

Jens> Martin, this is starting to look like a disaster :-(

Yeah.  I guess you should have pushed the accessors first and let that
patch steep for a while before applying the rest of the kit :|

It's just super bad timing that both Neil and Alasdair had patches to
their respective hardsect size areas right now.  Neither tree has been
touched in that department for ages...

*sigh*

-- 
Martin K. Petersen	Oracle Linux Engineering
