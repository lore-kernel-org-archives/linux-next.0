From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 2 (smack)
Date: Tue, 02 Apr 2013 10:18:35 -0700
Message-ID: <515B12EB.50303@infradead.org>
References: <20130402190929.62cea8988921a2599588a566@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:54613 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760013Ab3DBSSb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Apr 2013 14:18:31 -0400
In-Reply-To: <20130402190929.62cea8988921a2599588a566@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>, linux-security-module <linux-security-module@vger.kernel.org>

On 04/02/13 01:09, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130328:
> 


on x86_64:

security/smack/smackfs.c: In function 'smk_fill_super':
security/smack/smackfs.c:2221:29: error: 'SMACK_MAGIC' undeclared (first use in this function)


Needs to
#include <linux/magic.h>


-- 
~Randy
