From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: manual merge of the rr tree
Date: Wed, 25 Jun 2008 08:38:40 +0200
Message-ID: <200806250838.40212.borntraeger@de.ibm.com>
References: <20080625162739.5add4f55.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate2.uk.ibm.com ([195.212.29.135]:11632 "EHLO
	mtagate2.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752479AbYFYGio (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Jun 2008 02:38:44 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate2.uk.ibm.com (8.13.8/8.13.8) with ESMTP id m5P6cfjX023288
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2008 06:38:41 GMT
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com [9.149.37.228])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5P6cf9M2158612
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2008 07:38:41 +0100
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5P6ce5h023601
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2008 07:38:41 +0100
In-Reply-To: <20080625162739.5add4f55.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Michael Ellerman <michael@ellerman.id.au>, Paul Mackerras <paulus@samba.org>

Am Mittwoch, 25. Juni 2008 schrieb Stephen Rothwell:
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got a conflict in
> drivers/char/hvc_console.h between commit
> 1c8950ff87de950a3b6ccfb26650fc0a56278836 ("[POWERPC] Make cpus_in_xmon
> static and remove extern mess from hvc_console.c") from the powerpc tree
> and commit c9a834016cfb2b0fb71392fddab4d80ab9f9d172 ("hvc_console: rework
> setup to replace irq functions with callbacks") from the rr tree.
> 
> Just a matter of overlapping additions.

Yes, it looks simple. What is the preferred way of solving such conflicts in 
linux-next?
