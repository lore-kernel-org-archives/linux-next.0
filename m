From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH -next] qdio: add missing export.h include
Date: Wed, 28 Sep 2011 08:34:25 +0200
Message-ID: <20110928063425.GA2621@osiris.boeblingen.de.ibm.com>
References: <1316676108-5729-1-git-send-email-heiko.carstens@de.ibm.com>
 <4E824F3A.6070302@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate7.uk.ibm.com ([194.196.100.167]:51671 "EHLO
	mtagate7.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485Ab1I1Ge2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 02:34:28 -0400
Received: from d06nrmr1806.portsmouth.uk.ibm.com (d06nrmr1806.portsmouth.uk.ibm.com [9.149.39.193])
	by mtagate7.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p8S6YQbR032548
	for <linux-next@vger.kernel.org>; Wed, 28 Sep 2011 06:34:26 GMT
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com [9.149.37.248])
	by d06nrmr1806.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p8S6YQ4x2293818
	for <linux-next@vger.kernel.org>; Wed, 28 Sep 2011 07:34:26 +0100
Received: from d06av07.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p8S6YQk8000859
	for <linux-next@vger.kernel.org>; Wed, 28 Sep 2011 00:34:26 -0600
Content-Disposition: inline
In-Reply-To: <4E824F3A.6070302@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, Frank Blaschka <blaschka@linux.vnet.ibm.com>, Jan Glauber <jang@linux.vnet.ibm.com>

On Tue, Sep 27, 2011 at 06:33:30PM -0400, Paul Gortmaker wrote:
> On 11-09-22 03:21 AM, Heiko Carstens wrote:
> > Fix compile breakage caused by splitting module.h:
> > 
> > drivers/s390/cio/qdio_setup.c:31:1:
> >  warning: data definition has no type or storage class [enabled by default]
> > drivers/s390/cio/qdio_setup.c:31:1:
> >  warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> 
> Now that I look at this, and the other patch, I'm not
> seeing how this is possible.  Unless there is some
> convoluted CPP magic going on, I don't see any instances
> of EXPORT_SYMBOL in qdio_setup.c -- similarly I don't
> see any module_ or MODULE_ references in zfcp_qdio.c
> 
> Am I missing something obvious here?   The line numbers
> you quote dont match anything meaningful -- so I'm wondering
> if perhaps these changes are meant to be in advance of the
> s390 changes you've got queued in next -- which is fine, but
> it would be nice to have that called out.

Oh right, I should have mentioned this. Sorry!
he two patches fix compile breakages only in -next because of s390
related patches in the scsi and net git trees. Since it's not possible
to add the compile fixes (at least for the new export.h header file)
to the scsi or net trees I just sent these patches towards you...

Thanks,
Heiko
