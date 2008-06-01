From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for May 30
Date: Sun, 1 Jun 2008 17:07:10 +0200
Message-ID: <20080601150710.GB27843@elte.hu>
References: <20080530181901.8268f317.sfr@canb.auug.org.au> <1212316424.3253.8.camel@dhcppc1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:35795 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751548AbYFAPHa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Jun 2008 11:07:30 -0400
Content-Disposition: inline
In-Reply-To: <1212316424.3253.8.camel@dhcppc1>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Yinghai Lu <yhlu.kernel@gmail.com>


* Thomas Meyer <thomas@m3y3r.de> wrote:

> Am Freitag, den 30.05.2008, 18:19 +1000 schrieb Stephen Rothwell:
> > Hi all,
> > 
> > Changes since next-20080529:
> 
> Last next kernel booting for me is next-20080527. I didn't try 
> next-20080528, but next-20080529 and next-20080530 fail to boot.
> 
> Git told me to revert a63ef28f149c113740c7e429072351078a8821c6 (x86: 
> fix bootmem crash).
> 
> After reverting above commit, next-20080530 boots again.
> 
> Basicly I'm running Fedora 9 with the linux-next kernel.
> 
> See attached screenshot of boot error.

hm, that commit is gone in latest tip - does tip/master boot fine for 
you? It's:

   http://people.redhat.com/mingo/tip.git/README

that commit was an interim fix that got removed meanwhile and replaced 
with the real fixes.

	Ingo
