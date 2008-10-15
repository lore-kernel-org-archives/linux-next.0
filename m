From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: scsi tree build failure
Date: Wed, 15 Oct 2008 08:27:24 -0400
Message-ID: <1224073644.4570.7.camel@localhost.localdomain>
References: <20081015174916.6cc04bdb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from accolon.hansenpartnership.com ([76.243.235.52]:45633 "EHLO
	accolon.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752579AbYJOM1c (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 08:27:32 -0400
In-Reply-To: <20081015174916.6cc04bdb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>

On Wed, 2008-10-15 at 17:49 +1100, Stephen Rothwell wrote:
> [Resent to get past vger's filters]
> 
> Hi James,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/scsi/sd.c:579:27: error: macro "sd_dif_op" passed 4 arguments, but takes just 3
> drivers/scsi/sd.c: In function 'sd_prep_fn':
> drivers/scsi/sd.c:578: error: 'sd_dif_op' undeclared (first use in this function)
> 
> Caused by commit 9e06688e7d60149cc9ef78ff29515c20186bb418 ("[SCSI] sd:
> Correctly handle all combinations of DIF and DIX").
> 
> I added the following patch.

Thanks.

Actually this is the patch I was planning to apply:

http://marc.info/?l=linux-scsi&m=122392563103390

(inlines are better than macros because of the side effect issue) once
I'd verified we didn't have any more hidden config problems.

James
