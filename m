From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 22 (kvm)
Date: Mon, 29 Nov 2010 08:33:24 -0800
Message-ID: <20101129083324.6870d7da.randy.dunlap@oracle.com>
References: <20101122134911.b7e106f9.sfr@canb.auug.org.au>
	<20101122132627.bd4e88ef.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:56453 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754412Ab0K2Qdq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Nov 2010 11:33:46 -0500
In-Reply-To: <20101122132627.bd4e88ef.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 22 Nov 2010 13:26:27 -0800 Randy Dunlap wrote:

> On Mon, 22 Nov 2010 13:49:11 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20101119:
> 
> 
> kvm.c:(.init.text+0x11f49): undefined reference to `kvm_register_clock'
> 
> when CONFIG_KVM_CLOCK is not enabled.


BUild error still present in linux-next-2010-NOV-29.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
