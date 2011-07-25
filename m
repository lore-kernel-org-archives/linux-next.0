From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: build failure after merge of the iscsi-target tree
Date: Mon, 25 Jul 2011 00:18:09 -0700
Message-ID: <1311578289.17766.17.camel@haakon2.linux-iscsi.org>
References: <20110725134509.3a1c59c07eb7a5608a8712f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linux-iscsi.org ([67.23.28.174]:39752 "EHLO
	linux-iscsi.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751324Ab1GYH1a (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2011 03:27:30 -0400
In-Reply-To: <20110725134509.3a1c59c07eb7a5608a8712f7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, target-devel <target-devel@vger.kernel.org>, Mike Christie <michaelc@cs.wisc.edu>

On Mon, 2011-07-25 at 13:45 +1000, Stephen Rothwell wrote:
> Hi Nicholas,
> 

Hi Stephen,

> After merging the iscsi-target tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/scsi/bnx2i/bnx2i_iscsi.c: In function 'bnx2i_task_xmit':
> drivers/scsi/bnx2i/bnx2i_iscsi.c:1233:20: error: dereferencing pointer to incomplete type
> 
> Caused by commit 5dd46e6560d4 ("iscsi: Resolve iscsi_proto.h naming
> conflicts with drivers/target/iscsi").
> 
> I have dropped the iscsi-target tree for today.

My apologies for missing this one..

Just fixed the missing struct iscsi_cmd -> struct iscsi_scsi_req
conversion in bnx2i_task_xmit(), and rebased -> pushed into
target-pending.git/for-next.

Thank you,

--nab
