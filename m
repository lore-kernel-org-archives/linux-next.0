From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Tue, 30 Sep 2014 09:52:39 +0200
Message-ID: <20140930075239.GA28481@linutronix.de>
References: <20140930173900.51839e76@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:56438 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751056AbaI3Hwp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Sep 2014 03:52:45 -0400
Content-Disposition: inline
In-Reply-To: <20140930173900.51839e76@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

* Stephen Rothwell | 2014-09-30 17:39:00 [+1000]:

>Hi Greg,
Hi Stephen,

>After merging the tty tree, today's linux-next build (powerpc
>ppc64_defconfig) failed like this:
>
>
>drivers/built-in.o: In function `.serial8250_stop_tx':
>8250_core.c:(.text+0xda1f4): undefined reference to `.__xchg_called_with_bad_pointer'
>drivers/built-in.o: In function `.serial8250_tx_chars':
>(.text+0xda42c): undefined reference to `.__xchg_called_with_bad_pointer'
>drivers/built-in.o: In function `.serial8250_start_tx':
>8250_core.c:(.text+0xda630): undefined reference to `.__xchg_called_with_bad_pointer'
>
>Caused by commit d74d5d1b7288 ("tty: serial: 8250_core: add run time
>pm").  xchg is called with &p->rpm_tx_active and that is an unsigned
>char.  PowerPC (at least) only allows xchg with objects 4 (or 8 on 64
>bit) bytes long.
>
>I have used the version of the tty tree from next-20140926 for today.

this should have been fixed by commit baeb7ef34952f ("tty: serial: 8250:
use 32bit variable for rpm_tx_active") in Greg's tty-next tree. Isn't
this the case or did you fetch the tty tree before Greg pushed it?

Sebastian
