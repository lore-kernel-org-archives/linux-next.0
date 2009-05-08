From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] linux-next: infiniband tree build failure
Date: Thu, 07 May 2009 21:36:55 -0700
Message-ID: <adatz3wqkgo.fsf@cisco.com>
References: <20090508115356.b97b8981.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-2.cisco.com ([171.71.176.71]:26152 "EHLO
	sj-iport-2.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751211AbZEHEgz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2009 00:36:55 -0400
In-Reply-To: <20090508115356.b97b8981.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Fri, 8 May 2009 11:53:56 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: general@lists.openfabrics.org, linux-next@vger.kernel.org

 > Today's linux-next build (x86_64 allmodconfig) failed like this:
 > 
 > drivers/infiniband/hw/mlx4/mr.c: In function 'mlx4_ib_alloc_fast_reg_page_list':
 > drivers/infiniband/hw/mlx4/mr.c:242: error: label 'err_free_mfrpl' used but not defined
 > 
 > Caused by commit 88029ff3c862812b81745ae3d6557ede96e2d051 ("IB/mlx4:
 > Don't overwrite fast registration page list when posting work request").
 > Clearly not build tested :-(

My fault for editing after applying the patch.  Fixed now.

Thanks,
  Roland
