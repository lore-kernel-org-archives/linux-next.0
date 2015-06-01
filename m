From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: manual merge of the target-updates tree with Linus'
 tree
Date: Mon, 01 Jun 2015 04:31:00 -0700
Message-ID: <1433158260.3170.34.camel@haakon3.risingtidesystems.com>
References: <20150601204809.5cf1ac2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linux-iscsi.org ([67.23.28.174]:46369 "EHLO
	linux-iscsi.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751386AbbFALbD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2015 07:31:03 -0400
In-Reply-To: <20150601204809.5cf1ac2b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Stephen,

On Mon, 2015-06-01 at 20:48 +1000, Stephen Rothwell wrote:
> Hi Nicholas,
> 
> Today's linux-next merge of the target-updates tree got a conflict in
> drivers/target/target_core_configfs.c between commit d588cf8f618d
> ("target: Fix se_tpg_tfo->tf_subsys regression + remove tf_subsystem")
> from Linus' tree and commits c6eec4d58f5d ("target: remove tf_subsystem
> pointers") and 93af633991fd ("target: don't copy fabric ops") and
> f0eb815f8a53 ("target: put struct target_fabric_configfs on a diet")
> from the target-updates tree.
> 
> I fixed it up (the first of the target-updates tree patches is a subset
> of the patch in Linus' tree - see the result below) and can carry the
> fix as necessary (no action is required).
> 

Fixed in this morning's push to target-pending/for-next, using v4.1-rc6
updates in target-pending/master -> mainline as the updated for-next
base.

Thank you,

--nab
