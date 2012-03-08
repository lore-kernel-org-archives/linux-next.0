From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next: drivers/gpio/gpio-sodaville.c breaks build
Date: Thu, 8 Mar 2012 11:47:24 -0500
Message-ID: <20120308164724.GA31129@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:39440 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756983Ab2CHQro (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Mar 2012 11:47:44 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: bigeasy@linutronix.de
Cc: linux-next@vger.kernel.org, grant.likely@secretlab.ca, hjk@linutronix.de, torbenh@linutronix.de

The addition of this driver has caused a build failur in the
i386 randconfig.  Perhaps it needs more Kconfig depends additions to
limit it to the platforms where hardware exists?

http://kisskb.ellerman.id.au/kisskb/buildresult/5819098/

Paul.
