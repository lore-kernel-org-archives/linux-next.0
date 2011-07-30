From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] s390: add missing module.h/export.h includes
Date: Sat, 30 Jul 2011 11:31:35 -0700
Message-ID: <20110730113135.1f93e253.rdunlap@xenotime.net>
References: <20110730072515.GA2641@osiris.boeblingen.de.ibm.com>
	<4E344260.8070100@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:46914 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751810Ab1G3Sbh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Jul 2011 14:31:37 -0400
In-Reply-To: <4E344260.8070100@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Sat, 30 Jul 2011 13:41:52 -0400 Paul Gortmaker wrote:

> On 11-07-30 03:25 AM, Heiko Carstens wrote:
> > Subject: [PATCH] s390: add missing module.h/export.h includes
> > 
> > From: Heiko Carstens <heiko.carstens@de.ibm.com>
> > 
> > Fix several compile errors on s390 caused by splitting module.h.
> 
> Thanks, I'll put this on the branch today.

Hi Paul,

Did you see the 10 (I think) patches that I posted in reply to
Stephen's linux-next 20110729 announcement?
[that I did not copy you on :( ]

They add linux/module.h or linux/export.h (and 1 for linux/sysfs.h)
to multiple files to fix build errors.

You can see them as replies to https://lkml.org/lkml/2011/7/29/52
or I can send them directly to you if you want me to do that...

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
