From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 03/11] avr32: fix nop compile fails from system.h split up
Date: Mon, 02 Apr 2012 06:47:36 +0100
Message-ID: <30076.1333345656@redhat.com>
References: <1333312727-11428-4-git-send-email-paul.gortmaker@windriver.com> <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:1027 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752158Ab2DBFrm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Apr 2012 01:47:42 -0400
In-Reply-To: <1333312727-11428-4-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: dhowells@redhat.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

Paul Gortmaker <paul.gortmaker@windriver.com> wrote:

> To fix:
> 
>   In file included from kernel/exit.c:61:
>   arch/avr32/include/asm/mmu_context.h: In function 'enable_mmu':
>   arch/avr32/include/asm/mmu_context.h:135: error: implicit
>   declaration of function 'nop'

Better would be to move the definition of nop() into asm/barrier.h to be
consistent with other arches.

David
