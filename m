From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] tpm_tis: fix build when ACPI is not enabled
Date: Wed, 3 Aug 2011 20:56:34 +0200
Message-ID: <20110803185634.GA16988@elte.hu>
References: <20110727141151.d31e3da6a8d21a255473293c@canb.auug.org.au>
 <20110727114211.18be47cf.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:58325 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755197Ab1HCS5s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Aug 2011 14:57:48 -0400
Content-Disposition: inline
In-Reply-To: <20110727114211.18be47cf.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Leendert van Doorn <leendert@watson.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, James Morris <jmorris@namei.org>, tpmdd-devel@lists.sourceforge.net, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>


* Randy Dunlap <rdunlap@xenotime.net> wrote:

> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> Fix tpm_tis.c build when CONFIG_ACPI is not enabled by providing
> a stub function.  Fixes many build errors/warnings:
> 
> drivers/char/tpm/tpm_tis.c:89: error: dereferencing pointer to incomplete type
> drivers/char/tpm/tpm_tis.c:89: warning: type defaults to 'int' in declaration of 'type name'
> drivers/char/tpm/tpm_tis.c:89: error: request for member 'list' in something not a structure or union
> drivers/char/tpm/tpm_tis.c:89: warning: type defaults to 'int' in declaration of '__mptr'
> drivers/char/tpm/tpm_tis.c:89: error: dereferencing pointer to incomplete type
> drivers/char/tpm/tpm_tis.c:89: error: dereferencing pointer to incomplete type
> drivers/char/tpm/tpm_tis.c:89: error: dereferencing pointer to incomplete type
> drivers/char/tpm/tpm_tis.c:89: warning: type defaults to 'int' in declaration of 'type name'
> drivers/char/tpm/tpm_tis.c:89: error: request for member 'list' in something not a structure or union
> drivers/char/tpm/tpm_tis.c:89: warning: type defaults to 'int' in declaration of 'type name'
> drivers/char/tpm/tpm_tis.c:89: error: dereferencing pointer to incomplete type
> drivers/char/tpm/tpm_tis.c:89: error: dereferencing pointer to incomplete type
> drivers/char/tpm/tpm_tis.c:89: error: dereferencing pointer to incomplete type
> drivers/char/tpm/tpm_tis.c:89: warning: type defaults to 'int' in declaration of 'type name'
> drivers/char/tpm/tpm_tis.c:89: error: request for member 'list' in something not a structure or union
> drivers/char/tpm/tpm_tis.c:89: warning: type defaults to 'int' in declaration of '__mptr'
> drivers/char/tpm/tpm_tis.c:89: error: dereferencing pointer to incomplete type
> drivers/char/tpm/tpm_tis.c:89: error: dereferencing pointer to incomplete type
> drivers/char/tpm/tpm_tis.c:89: error: dereferencing pointer to incomplete type
> drivers/char/tpm/tpm_tis.c:89: warning: type defaults to 'int' in declaration of 'type name'
> drivers/char/tpm/tpm_tis.c:89: error: request for member 'list' in something not a structure or union
> drivers/char/tpm/tpm_tis.c:89: warning: type defaults to 'int' in declaration of 'type name'
> drivers/char/tpm/tpm_tis.c:90: error: dereferencing pointer to incomplete type
> 
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc: Leendert van Doorn <leendert@watson.ibm.com>
> ---
>  drivers/char/tpm/tpm_tis.c |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

FYI, this build breakage is now upstream as well and triggers easily.

This fix was sent 5+ days ago (with still no reply to it), a day 
after this fix the security tree pull request was sent with this 
known build breakage included, so the bug is still unfixed upstream 
and no fix is in the pipeline AFAICS. Got lost?

Thanks,

	Ingo
