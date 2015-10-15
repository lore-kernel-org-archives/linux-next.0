From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing in the s390 tree
Date: Fri, 16 Oct 2015 09:17:33 +1100
Message-ID: <20151016091733.30454691@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43249 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751420AbbJOWRg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Oct 2015 18:17:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Martin,

I noticed that the top commit

  748a000bdc07 ("s390/fpu: split fpu-internal.h into fpu internals, api, and type headers")

in the s390 tree has no Signed-off-by tag from you as committer ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
