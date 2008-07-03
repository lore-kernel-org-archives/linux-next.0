From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: inux-next: Tree for July 1
Date: Wed, 2 Jul 2008 21:53:06 -0700
Message-ID: <20080702215306.61367733.akpm@linux-foundation.org>
References: <20080702011434.6fb403d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:44332 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752246AbYGCEyE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 00:54:04 -0400
In-Reply-To: <20080702011434.6fb403d5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

s390 allmodconfig:

In file included from include/asm/pgtable.h:1087,
                 from include/linux/mm.h:39,
                 from arch/s390/mm/hugetlbpage.c:8:
include/asm-generic/pgtable.h: In function '__ptep_modify_prot_start':
include/asm-generic/pgtable.h:209: error: dereferencing pointer to incomplete type
