From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Date: Wed, 22 Feb 2017 16:13:07 -0500
Message-ID: <1487797987.2376.31.camel@HansenPartnership.com>
References: <20170222134119.42f26068@canb.auug.org.au>
         <20170223080639.753ac411@canb.auug.org.au> <yq1wpcix77a.fsf@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:46286 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S934248AbdBVVNM (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Feb 2017 16:13:12 -0500
In-Reply-To: <yq1wpcix77a.fsf@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Smart <jsmart2021@gmail.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Hannes Reinecke <hare@suse.com>

On Wed, 2017-02-22 at 16:10 -0500, Martin K. Petersen wrote:
> > > > > > "Stephen" == Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > > writes:
> 
> Stephen,
> 
> Stephen> Unfortunately, you have just merged this build failure into
> the
> Stephen> scsi tree :-(
> 
> Stephen> James Smart has posted a fix:
> 
> Stephen>   "[PATCH v2] lpfc: add missing Kconfig NVME dependencies"
> 
> I'll get the queued up shortly.

Perhaps it would be nice to rebase so we don't get bisect into a build
failure.

James
