From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Nov 17 (bluetooth)
Date: Thu, 17 Nov 2011 09:50:39 -0800
Message-ID: <4EC5496F.2080509@xenotime.net>
References: <20111117150733.a70faf2c9030d511d5367e1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:35376 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752194Ab1KQRwj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Nov 2011 12:52:39 -0500
In-Reply-To: <20111117150733.a70faf2c9030d511d5367e1e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, "Gustavo F. Padovan" <padovan@profusion.mobi>, linux-bluetooth@vger.kernel.org

On 11/16/2011 08:07 PM, Stephen Rothwell wrote:
> Hi all,


When CONFIG_BT_L2CAP is not enabled:

net/built-in.o: In function `hci_dev_open':
(.text+0xdce9a): undefined reference to `enable_hs'

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
