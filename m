From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [PATCH] RDMA/cxgb4: Add default_llseek to debugfs files.
Date: Wed, 29 Sep 2010 10:41:08 -0700
Message-ID: <adask0s30sr.fsf@cisco.com>
References: <20100929141112.26944.21931.stgit@build.ogc.int>
	<adawrq431sr.fsf@cisco.com> <4CA37715.4020302@opengridcomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-5.cisco.com ([171.68.10.87]:46619 "EHLO
	sj-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753734Ab0I2RlN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2010 13:41:13 -0400
In-Reply-To: <4CA37715.4020302@opengridcomputing.com> (Steve Wise's message of
	"Wed, 29 Sep 2010 12:27:49 -0500")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve Wise <swise@opengridcomputing.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-rdma@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

 > I assume you mean debugs_read()...Like this?

Sorry, yeah, was looking at the old code.  But yes, that code seems a
lot simpler.
