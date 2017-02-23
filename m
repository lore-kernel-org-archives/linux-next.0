From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Date: Thu, 23 Feb 2017 09:19:57 -0500
Message-ID: <yq1ino16lbm.fsf@oracle.com>
References: <20170223141240.0c15a9aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:33880 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750944AbdBWOU0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Feb 2017 09:20:26 -0500
In-Reply-To: <20170223141240.0c15a9aa@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 23 Feb 2017 14:12:40 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nilesh Javali <nilesh.javali@cavium.com>, Manish Rangankar <manish.rangankar@cavium.com>, Saurav Kashyap <saurav.kashyap@cavium.com>, Arun Easi <arun.easi@cavium.com>, Chad Dupuis <chad.dupuis@cavium.com>

>>>>> "Stephen" == Stephen Rothwell <sfr@canb.auug.org.au> writes:

Stephen,

Stephen> Caused by commit

Stephen>   61d8658b4a43 ("scsi: qedf: Add QLogic FastLinQ offload FCoE
Stephen>   driver framework")

Stephen> being rebased on top of commit

Stephen>   10383aea2f44 ("kref: Implement 'struct kref' using
Stephen>   refcount_t")

Stephen> and not using kref_read() to access the refcounts.

*sigh*

Chad: Please fix these up ASAP.


Stephen> I don't understand why you would rebase you work onto Linus'
Stephen> tree in the middle of the merge window in any case. :-(

I didn't rebase my existing patch queue. I started a new for-next based
on linus/master. Half of this new QLogic driver lives under net so I had
to wait for Linus to pull DaveM's tree before I could merge the SCSI
portion :(

We often have to do two-stage merge windows with SCSI because of
dependencies on changes in both block and net (the latter increasingly
so because of the popularity of converged adapters that do both networks
and storage).

-- 
Martin K. Petersen	Oracle Linux Engineering
