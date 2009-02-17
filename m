From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] linux-next: infiniband tree build warning
Date: Tue, 17 Feb 2009 09:03:15 -0800
Message-ID: <adavdr9573g.fsf@cisco.com>
References: <20090217184403.7e1f18c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-3.cisco.com ([171.71.176.72]:2916 "EHLO
	sj-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752826AbZBQRDR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Feb 2009 12:03:17 -0500
In-Reply-To: <20090217184403.7e1f18c5.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Tue, 17 Feb 2009 18:44:03 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: general@lists.openfabrics.org, linux-next@vger.kernel.org

 > Today's linux-next build (x86_64 allmodconfig) produced these warnings:

 > drivers/infiniband/hw/cxgb3/iwch_qp.c: In function 'build_rdma_recv':
 > drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses around + or - inside shift

Thanks, should be fixed in the next pull of for-next.

 - R.
