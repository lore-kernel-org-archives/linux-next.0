From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security tree with Linus' tree
Date: Tue, 4 Aug 2015 11:14:06 +1000
Message-ID: <20150804111406.1ec4ac3b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46818 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751136AbbHDBOI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 Aug 2015 21:14:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Salvatore Mesoraca <s.mesoraca16@gmail.com>, Kees Cook <keescook@chromium.org>

Hi James,

Today's linux-next merge of the security tree got a conflict in:

  security/yama/yama_lsm.c

between commit:

  5413fcdbe9e7 ("Adding YAMA hooks also when YAMA is not stacked.")

from Linus' tree and commit:

  730daa164e7c ("Yama: remove needless CONFIG_SECURITY_YAMA_STACKED")

from the security tree.

I fixed it up (the latter removed the code updated by the former, so I
just did that) and can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
