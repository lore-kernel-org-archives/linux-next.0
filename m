From: Richard Weinberger <richard@nod.at>
Subject: linux-next: User Mode Linux broken
Date: Thu, 21 Oct 2010 13:15:26 +0200
Message-ID: <201010211315.26679.richard@nod.at>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:57321 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757119Ab0JULPh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Oct 2010 07:15:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tglx@linutronix.de
Cc: peterz@infradead.org, hpa@zytor.com, mingo@elte.hu, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

Thomas,

Your commit c5f7563 ("genirq: Provide compat handling for chip->enable()") 
breaks UML.
It does not start anymore.

When I apply this patch it works fine again.
http://userweb.kernel.org/~akpm/mmotm/broken-out/um-migrate-from-__do_irq-to-
generic_handle_irq.patch

Maybe your patch breaks all users of __do_IRQ()?

Thanks,
//richard
