From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: Tree for June 10
Date: Wed, 10 Jun 2009 18:32:50 -0400
Message-ID: <yq1bpov67ot.fsf@sermon.lab.mkp.net>
References: <20090610194309.4f7a0e54.sfr@canb.auug.org.au>
	<200906110027.38348.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:64333 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756833AbZFJWdN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2009 18:33:13 -0400
In-Reply-To: <200906110027.38348.bzolnier@gmail.com> (Bartlomiej
	Zolnierkiewicz's message of "Thu, 11 Jun 2009 00:27:37 +0200")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>>>>> "Bart" == Bartlomiej Zolnierkiewicz <bzolnier@gmail.com> writes:

>     Revert "block: Fix bounce limit setting in DM"
>     This reverts commit a05c0205ba031c01bba33a21bf0a35920eb64833.
>     DM doesn't need to access the bounce_pfn directly.

Fix coming via the DM tree.

-- 
Martin K. Petersen	Oracle Linux Engineering
