From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Fri, 30 Sep 2011 09:57:12 +0200
Message-ID: <20110930075712.GA2412@osiris.boeblingen.de.ibm.com>
References: <20110930110514.eadb199f27c5418b28cab6c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate1.uk.ibm.com ([194.196.100.161]:48773 "EHLO
	mtagate1.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755538Ab1I3H5R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Sep 2011 03:57:17 -0400
Content-Disposition: inline
In-Reply-To: <20110930110514.eadb199f27c5418b28cab6c9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

On Fri, Sep 30, 2011 at 11:05:14AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, the next-20110929 build (s390x allmodconfig)
> failed like this:
> 
> drivers/s390/char/zcore.c:393: error: 'THIS_MODULE' undeclared here (not in a function)
> drivers/s390/char/zcore.c:741: error: expected declaration specifiers or '...' before string constant
> drivers/s390/char/zcore.c:741: warning: data definition has no type or storage class
> drivers/s390/char/zcore.c:741: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'
> drivers/s390/char/zcore.c:741: warning: function declaration isn't a prototype
> drivers/s390/char/zcore.c:742: error: expected declaration specifiers or '...' before string constant
> drivers/s390/char/zcore.c:742: warning: data definition has no type or storage class
> drivers/s390/char/zcore.c:742: warning: type defaults to 'int' in declaration of 'MODULE_DESCRIPTION'
> drivers/s390/char/zcore.c:742: warning: function declaration isn't a prototype
> drivers/s390/char/zcore.c:743: error: expected declaration specifiers or '...' before string constant
> drivers/s390/char/zcore.c:743: warning: data definition has no type or storage class
> drivers/s390/char/zcore.c:743: warning: type defaults to 'int' in declaration of 'MODULE_LICENSE'
> drivers/s390/char/zcore.c:743: warning: function declaration isn't a prototype
> 
> Probably revealed by the module.h split up.
> 
> This file needs to include module.h

Hmm.. wondering why I haven't seen that during my build tests a couple of
days ago. Anyway, thanks for letting us know!
I added a patch to our local tree. As soon as Martin pushes it out it
should be fixed.

Thanks,
Heiko
