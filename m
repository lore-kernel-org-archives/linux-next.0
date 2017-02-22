From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Date: Wed, 22 Feb 2017 16:17:07 -0500
Message-ID: <yq1poiax6wc.fsf@oracle.com>
References: <20170222134119.42f26068@canb.auug.org.au>
        <20170223080639.753ac411@canb.auug.org.au>
        <yq1wpcix77a.fsf@oracle.com>
        <1487797987.2376.31.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:51937 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932760AbdBVVRZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Feb 2017 16:17:25 -0500
In-Reply-To: <1487797987.2376.31.camel@HansenPartnership.com> (James
        Bottomley's message of "Wed, 22 Feb 2017 16:13:07 -0500")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Smart <jsmart2021@gmail.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Hannes Reinecke <hare@suse.com>

>>>>> "James" == James Bottomley <James.Bottomley@HansenPartnership.com> writes:

James> Perhaps it would be nice to rebase so we don't get bisect into a
James> build failure.

My plan was to start 4.11/scsi-fixes based on linus/master. I need block
and net to satisfy dependencies for the remaining patches in the queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
