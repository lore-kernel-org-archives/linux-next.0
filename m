From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH -next] thinkpad_acpi: fix build, HOTKEY_POLL is optional
Date: Fri, 9 Oct 2009 21:08:08 -0300
Message-ID: <20091010000808.GA10637@khazad-dum.debian.net>
References: <20091009190654.741eeffd.sfr@canb.auug.org.au>
 <20091009161723.b68b91a7.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1.smtp.messagingengine.com ([66.111.4.25]:57562 "EHLO
	out1.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757322AbZJJAJO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2009 20:09:14 -0400
Content-Disposition: inline
In-Reply-To: <20091009161723.b68b91a7.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, lenb@kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 09 Oct 2009, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix optional part of driver to be built optionally:

NAK!

This happens because of (linux-next) commit
7f6443f7238a0aa9014b11a0a31ab76825d75cdf 
"thinkpad-acpi: Fix build on !CONFIG_THINKPAD_ACPI_HOTKEY_POLL" by
Ingo.

That commit is wrong, it must NOT be applied as explained in the thread
starting at http://lkml.org/lkml/2009/9/27/30.

Ingo, can you please check if you don't have that commit still in one of
your trees that are fed into linux-next?  It broke the driver now that the
"backlight/thinkpad-acpi: issue backlight class events" patch landed in
-next, just like I said it would happen...

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
