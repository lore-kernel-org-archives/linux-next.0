From: Roland Dreier <rdreier@cisco.com>
Subject: Re: linux-next: infiniband tree build failure
Date: Thu, 19 Nov 2009 16:43:07 -0800
Message-ID: <adaskca58mc.fsf@roland-alpha.cisco.com>
References: <20091120110342.5128b8f8.sfr@canb.auug.org.au>
	<ada1vju6oa6.fsf@roland-alpha.cisco.com>
	<6307584467EB4D168602C43E0B185157@amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-6.cisco.com ([171.71.176.117]:55132 "EHLO
	sj-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750715AbZKTAnC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Nov 2009 19:43:02 -0500
In-Reply-To: <6307584467EB4D168602C43E0B185157@amr.corp.intel.com> (Sean
	Hefty's message of "Thu, 19 Nov 2009 16:30:55 -0800")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sean Hefty <sean.hefty@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, general@lists.openfabrics.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


 > Off the top of my head, I'll guess that maybe we need to add something like

 > #if defined(CONFIG_IPv6) || defined(CONFIG_IPV6_MODULE)

Yes, makes sense, I'll throw that in.

 - R.
