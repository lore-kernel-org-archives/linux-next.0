From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-2008-11-09: s390 vs ->ioctx_list
Date: Tue, 9 Dec 2008 03:11:13 +0300
Message-ID: <20081209001113.GA6107@x200.localdomain>
References: <20081208205929.366a9a01.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.184]:52088 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753461AbYLIAGt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2008 19:06:49 -0500
Received: by nf-out-0910.google.com with SMTP id d3so687088nfc.21
        for <linux-next@vger.kernel.org>; Mon, 08 Dec 2008 16:06:48 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20081208205929.366a9a01.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jmoyer@redhat.com, jens.axboe@oracle.com

  CC      arch/s390/mm/pgtable.o
arch/s390/mm/pgtable.c: In function 's390_enable_sie':
arch/s390/mm/pgtable.c:266: error: invalid operands to binary ||
arch/s390/mm/pgtable.c:282: error: invalid operands to binary ||

This is because ->ioctx_list turned from pointer to a hlist, some more locking
and different check required.
