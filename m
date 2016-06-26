From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: lots of repeated patches in the tpmdd tree
Date: Mon, 27 Jun 2016 09:36:46 +1000
Message-ID: <20160627093646.58390c59@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44503 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751459AbcFZXgu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Jun 2016 19:36:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jarkko,

I noticed that a large number of the patches in the tpmdd tree appear
twice (and some three times).  They appear to have been rebased on top
of the security tree before being remerged.  Please clean this all up.

-- 
Cheers,
Stephen Rothwell
