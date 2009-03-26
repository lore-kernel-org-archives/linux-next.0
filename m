From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: Next March 26: s390 allnoconfig build failure still exists
Date: Thu, 26 Mar 2009 11:12:23 +0100
Message-ID: <20090326111223.3a8ad942@osiris.boeblingen.de.ibm.com>
References: <20090326190130.54fc6fde.sfr@canb.auug.org.au>
	<49CB5165.4060401@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate1.de.ibm.com ([195.212.17.161]:60242 "EHLO
	mtagate1.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212AbZCZKM1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2009 06:12:27 -0400
In-Reply-To: <49CB5165.4060401@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>, Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 26 Mar 2009 15:26:53 +0530
Sachin Sant <sachinp@in.ibm.com> wrote:

> I still see the following s390 allnoconfig build failure
> with today's next (and previous trees as well ).
> 
> arch/s390/include/asm/smp.h:96: error: redefinition of smp_send_stop
> include/linux/smp.h:125: error: previous definition of smp_send_stop was here

In theory it should have been fixed, since I sent a patch and Ingo applied it:

http://lkml.org/lkml/2009/3/20/74

For some reason it doesn't show up in linux-next.
