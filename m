From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the block tree
Date: Fri, 11 Nov 2016 14:55:24 -0500
Message-ID: <yq1vavtkd03.fsf@sermon.lab.mkp.net>
References: <20161109135414.283a9ac5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:40209 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934931AbcKKTzk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Nov 2016 14:55:40 -0500
In-Reply-To: <20161109135414.283a9ac5@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 9 Nov 2016 13:54:14 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

>>>>> "Stephen" == Stephen Rothwell <sfr@canb.auug.org.au> writes:

Stephen,

Stephen> This latter commit also exists as commit 2266d5678ad1 in the
Stephen> scsi tree, but unfortunately, the scsi-mkp tree was rebased
Stephen> overnight, so now the two patches are not the same commit :-( A
Stephen> significant path of what was rebased overnight has already been
Stephen> merged into the scsi tree ... so please tidy up your tree WRT
Stephen> the scsi tree.  This conflict would not exist if the rebase had
Stephen> not been done.

James' tree is usually a week or two behind mine. I almost never rebase
mid-cycle but in this case we had a data corruption bug fix that went to
Linus for 4.9 that a driver update depended on.

In any case. It seems like the fact that the two SCSI trees may be out
of sync could be an ongoing problem. So maybe you should just drop my
tree again. I was just hoping to get visibility into potential merge
problems sooner...

-- 
Martin K. Petersen	Oracle Linux Engineering
