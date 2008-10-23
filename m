From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: next-20081023 x86_64 boot hang: int3
Date: Thu, 23 Oct 2008 21:57:23 +0400
Message-ID: <20081023175723.GD29659@localhost>
References: <4900B7CC.5060005@oracle.com> <20081023175008.GC29659@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gv-out-0910.google.com ([216.239.58.186]:46749 "EHLO
	gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754AbYJWR5e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 13:57:34 -0400
Received: by gv-out-0910.google.com with SMTP id e6so50672gvc.37
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 10:57:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20081023175008.GC29659@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

[Cyrill Gorcunov - Thu, Oct 23, 2008 at 09:50:08PM +0400]
...
| 
| Hi Randy,
| 
| i don't remember the details -- these int3 opcodes are likely to
| come from some paging or stack protector... hmm... can't remember
| absolutely :) There was a thread on LKML about half a year ago about
| why to fill pages with int3 opcode. But I may be absolutely wrong :)
| 
| 		- Cyrill -

Hmm, I think I'm not in touch don't play attention on this mail,
sorry :)

		- Cyrill -
