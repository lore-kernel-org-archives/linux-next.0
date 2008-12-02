From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: manual merge of the s390 tree
Date: Tue, 02 Dec 2008 09:12:11 +0100
Message-ID: <1228205531.3250.3.camel@localhost>
References: <20081202093920.7f700183.sfr@canb.auug.org.au>
Reply-To: schwidefsky@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.de.ibm.com ([195.212.29.155]:49539 "EHLO
	mtagate6.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbYLBIMO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Dec 2008 03:12:14 -0500
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id mB28CDmw214940
	for <linux-next@vger.kernel.org>; Tue, 2 Dec 2008 08:12:13 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mB28CDWB3453180
	for <linux-next@vger.kernel.org>; Tue, 2 Dec 2008 09:12:13 +0100
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mB28CCTh027527
	for <linux-next@vger.kernel.org>; Tue, 2 Dec 2008 09:12:12 +0100
In-Reply-To: <20081202093920.7f700183.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org, Swen Schillig <swen@vnet.ibm.com>, James Bottomley <James.Bottomley@HansenPartnership.com>, Christof Schmitt <christof.schmitt@de.ibm.com>

On Tue, 2008-12-02 at 09:39 +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the s390 tree got a conflict in
> drivers/s390/scsi/zfcp_erp.c between commit
> fca55b6fb587e42c7761ee30bd1a6c313a9270c9 ("[SCSI] zfcp: fix deadlock
> between wq triggered port scan and ERP") from the scsi-rc-fixes tree
> and
> commit c70beccd971850d07d0dc5afcd5e1c6580c7e1e5 ("[S390] zfcp: Report
> microcode level through service level interface") from the s390 tree.
> 
> I fixed it up (by taking both changes - see below) and can carry the
> fix.  Someone should check that it is correct.

Your fixup is fine.

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.
