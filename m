From: "Sean Hefty" <sean.hefty@intel.com>
Subject: RE: linux-next: infiniband tree build failure
Date: Thu, 19 Nov 2009 16:30:55 -0800
Message-ID: <6307584467EB4D168602C43E0B185157@amr.corp.intel.com>
References: <20091120110342.5128b8f8.sfr@canb.auug.org.au> <ada1vju6oa6.fsf@roland-alpha.cisco.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:14224 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757923AbZKTAau (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Nov 2009 19:30:50 -0500
In-Reply-To: <ada1vju6oa6.fsf@roland-alpha.cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Roland Dreier' <rdreier@cisco.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: general@lists.openfabrics.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

>Sorry, will track it down.  Sean this probably came from your patches,
>any idea off the top of your head?

Off the top of my head, I'll guess that maybe we need to add something like

#if defined(CONFIG_IPv6) || defined(CONFIG_IPV6_MODULE)

to cma_check_linklocal() in cma.c.  Does this build failure occur when IPv6 is
excluded?

- Sean
