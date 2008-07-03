From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: inux-next: Tree for July 1
Date: Wed, 2 Jul 2008 22:11:32 -0700
Message-ID: <20080702221132.15a57a72.akpm@linux-foundation.org>
References: <20080702011434.6fb403d5.sfr@canb.auug.org.au>
	<20080702215306.61367733.akpm@linux-foundation.org>
	<20080702215846.f6b0491b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:42335 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754766AbYGCFMX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 01:12:23 -0400
In-Reply-To: <20080702215846.f6b0491b.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@d>


arch/s390/appldata/appldata_base.c: In function 'appldata_generic_handler':
arch/s390/appldata/appldata_base.c:393: error: implicit declaration of function 'P_ERROR'

I dunno what that's all about - P_ERROR got deleted but it still has
users.

That's enough s390ing for today...
