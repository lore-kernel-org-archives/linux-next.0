From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: scsi tree build failure
Date: Tue, 08 Jul 2008 08:00:50 +1000
Message-ID: <1215468050.8970.120.camel@pasglop>
References: <20080707222528.280f0b9e.sfr@canb.auug.org.au>
Reply-To: benh@kernel.crashing.org
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:38884 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758875AbYGGWBV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 18:01:21 -0400
In-Reply-To: <20080707222528.280f0b9e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, Robert Jennings <rcj@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

On Mon, 2008-07-07 at 22:25 +1000, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:

James, if you agree, I'll carry this commit in the powerpc tree along
with its dependencies (and your ack).

Cheers,
Ben.

> drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'map_sg_data':
> drivers/scsi/ibmvscsi/ibmvscsi.c:431: error: 'FW_FEATURE_CMO' undeclared (first use in this function)
> drivers/scsi/ibmvscsi/ibmvscsi.c:431: error: (Each undeclared identifier is reported only once
> drivers/scsi/ibmvscsi/ibmvscsi.c:431: error: for each function it appears in.)
> drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_queuecommand':
> drivers/scsi/ibmvscsi/ibmvscsi.c:750: error: 'FW_FEATURE_CMO' undeclared (first use in this function)
> drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'send_mad_adapter_info':
> drivers/scsi/ibmvscsi/ibmvscsi.c:864: error: 'FW_FEATURE_CMO' undeclared (first use in this function)
> drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_do_host_config':
> drivers/scsi/ibmvscsi/ibmvscsi.c:1412: error: 'FW_FEATURE_CMO' undeclared (first use in this function)
> drivers/scsi/ibmvscsi/ibmvscsi.c: At top level:
> drivers/scsi/ibmvscsi/ibmvscsi.c:1769: error: unknown field 'get_io_entitlement' specified in initializer
> drivers/scsi/ibmvscsi/ibmvscsi.c:1769: warning: missing braces around initializer
> drivers/scsi/ibmvscsi/ibmvscsi.c:1769: warning: (near initialization for 'ibmvscsi_driver.driver')
> drivers/scsi/ibmvscsi/ibmvscsi.c:1769: warning: initialization from incompatible pointer type
> 
> Caused because commit 341b56db6804040aa9559e913865108424e3b18b ("[SCSI]
> ibmvscsi: driver enablement for CMO"), which was 15/16 in a series, has
> been merged before any of the other patches in the series.  I have
> reverted that commit.
> 
