From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] Fix build failure when CONFIG_NLS is set to 'm' by
 allmodconfig
Date: Tue, 19 Apr 2011 08:06:41 +0200
Message-ID: <20110419060641.GA26624@elte.hu>
References: <20110223131536.GA16707@fedora14-r610.blr.amer.dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:45363 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751393Ab1DSGHA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Apr 2011 02:07:00 -0400
Content-Disposition: inline
In-Reply-To: <20110223131536.GA16707@fedora14-r610.blr.amer.dell.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Narendra_K@Dell.com
Cc: viro@zeniv.linux.org.uk, jbarnes@virtuousgeek.org, mjg@redhat.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Shyam_Iyer@Dell.com, Matt_Domsch@Dell.com, Charles_Rose@Dell.com, Jordan_Hargrave@Dell.com


* Narendra_K@Dell.com <Narendra_K@Dell.com> wrote:

> This patch fixes the following build breakage introduced by the patch
> '[PATCH V3] Export ACPI _DSM provided firmware instance number and string to
> sysfs'.
> 
> drivers/built-in.o: In function `T.647':
> pci-label.c:(.text+0x28514): undefined reference to `utf16s_to_utf8s'

btw., this build bug still triggers upstream with .39-rc4 - any plans on when 
this regression will be fixed?

Thanks,

	Ingo
