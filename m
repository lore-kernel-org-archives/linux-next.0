From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [PATCH] RDMA/cxgb4: Add default_llseek to debugfs files.
Date: Wed, 29 Sep 2010 12:40:19 -0700
Message-ID: <adazkv01gpo.fsf@cisco.com>
References: <20100929141112.26944.21931.stgit@build.ogc.int>
	<201009292117.54828.arnd@arndb.de> <ada4od82w5x.fsf@cisco.com>
	<201009292129.31415.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-2.cisco.com ([171.71.176.71]:33613 "EHLO
	sj-iport-2.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755314Ab0I2Tk2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2010 15:40:28 -0400
In-Reply-To: <201009292129.31415.arnd@arndb.de> (Arnd Bergmann's message of
	"Wed, 29 Sep 2010 21:29:31 +0200")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Steve Wise <swise@opengridcomputing.com>, linux-rdma@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

 > Yes, but it's a very weak "should". My automatic conversion script
 > uses default_llseek.

OK, I'll just take steve's patch that does default_llseek if it really
doesn't matter.

 - R.
