From: "Hefty, Sean" <sean.hefty@intel.com>
Subject: RE: linux-next: build failure after merge of the infiniband tree
Date: Fri, 6 Jul 2012 06:31:12 +0000
Message-ID: <1828884A29C6694DAF28B7E6B8A8237346A4FE1B@ORSMSX101.amr.corp.intel.com>
References: <20120706123555.949d8efb4de5c4df18fb1ec0@canb.auug.org.au>
 <CAL1RGDW+3Q86QUp-aaWajT8nLK_7hQuCbxeE4q9He=aGdAMX6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:2590 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932307Ab2GFGbN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jul 2012 02:31:13 -0400
In-Reply-To: <CAL1RGDW+3Q86QUp-aaWajT8nLK_7hQuCbxeE4q9He=aGdAMX6Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <roland@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> Thanks, fixed with a "#if IS_ENABLED(CONFIG_IPV6)" around the code
> that touches ipv6... Sean, let me know if more is required.

The fix-up looks to be complete.  Thanks
