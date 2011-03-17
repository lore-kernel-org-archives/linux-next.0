From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: linux-next: build failure in Linus' tree
Date: Thu, 17 Mar 2011 16:35:25 -0700
Message-ID: <987664A83D2D224EAE907B061CE93D53019DCA3AD8@orsmsx505.amr.corp.intel.com>
References: <20110318102950.aee6f0bb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:34792 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755182Ab1CQXf1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Mar 2011 19:35:27 -0400
In-Reply-To: <20110318102950.aee6f0bb.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>

>I have reverted the merge commit afe997a183ec ("Pull pstorev4 into
> release branch") for today.

Ok.  I'm working with Al on fixing the pstore code.  I have a patch
that makes it buildable - but there are many more changes needed to
cure the rest of the problems that Al pointed out.

-Tony
