From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: error fetching the mips tree
Date: Thu, 19 Nov 2015 09:36:45 +1100
Message-ID: <20151119093645.141af61f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48217 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756151AbbKRWgs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Nov 2015 17:36:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Ralf,

Fetching the mips tree for the last couple of days produces this error:

fatal: unable to connect to git.linux-mips.org:
git.linux-mips.org[0: 2a01:4f8:201:92aa::4]: errno=Connection refused
git.linux-mips.org[1: 148.251.251.142]: errno=Connection refused

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
