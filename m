From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Tue, 22 Nov 2016 17:24:15 -0500
Message-ID: <yq1eg23w3u8.fsf@sermon.lab.mkp.net>
References: <20161122184404.2fdd253d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:48911 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751678AbcKVWYb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Nov 2016 17:24:31 -0500
In-Reply-To: <20161122184404.2fdd253d@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 22 Nov 2016 18:44:04 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>, "Martin K. Petersen" <martin.petersen@oracle.com>

>>>>> "Stephen" == Stephen Rothwell <sfr@canb.auug.org.au> writes:

Stephen,

Stephen> drivers/scsi/hpsa.c: In function 'hpsa_slave_alloc':
Stephen> drivers/scsi/hpsa.c:2033:5: warning: 'sd' may be used
Stephen> uninitialized in this function [-Wmaybe-uninitialized]
Stephen>   if (!sd)
Stephen>      ^

Stephen> Introduced by commit

Stephen>   4eb307f7b18d ("scsi: hpsa: use bus '3' for legacy HBA
Stephen>   devices")

Fixed this up.

Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
