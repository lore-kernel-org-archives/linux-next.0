From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 1 (xconfig problem)
Date: Sun, 1 Nov 2015 19:11:33 -0800
Message-ID: <5636D465.4060104@infradead.org>
References: <20151102035340.17310681@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:41853 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750935AbbKBDLj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Nov 2015 22:11:39 -0500
In-Reply-To: <20151102035340.17310681@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On 11/01/15 08:53, Stephen Rothwell wrote:
> Hi all,
> 
> I start again a day early, and this is how you all repay me? ;-)
> 
> Changes since 20151022:
> 

on x86_64:

'make xconfig' dies a quick death when I try to use it:

linux-next-20151101> ASSERT: "!isEmpty()" in file /usr/include/QtCore/qlist.h, line 282


-- 
~Randy
