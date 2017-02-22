From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Date: Wed, 22 Feb 2017 16:10:33 -0500
Message-ID: <yq1wpcix77a.fsf@oracle.com>
References: <20170222134119.42f26068@canb.auug.org.au>
        <20170223080639.753ac411@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:21676 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933550AbdBVVK5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Feb 2017 16:10:57 -0500
In-Reply-To: <20170223080639.753ac411@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 23 Feb 2017 08:06:39 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Smart <jsmart2021@gmail.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Hannes Reinecke <hare@suse.com>

>>>>> "Stephen" == Stephen Rothwell <sfr@canb.auug.org.au> writes:

Stephen,

Stephen> Unfortunately, you have just merged this build failure into the
Stephen> scsi tree :-(

Stephen> James Smart has posted a fix:

Stephen>   "[PATCH v2] lpfc: add missing Kconfig NVME dependencies"

I'll get the queued up shortly.

-- 
Martin K. Petersen	Oracle Linux Engineering
