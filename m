From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Oct 25 (target)
Date: Wed, 26 Oct 2011 11:39:46 -0700
Message-ID: <4EA853F2.4040503@xenotime.net>
References: <20111025203628.40a1b8a475e32053aa34dabe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:49491 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S933319Ab1JZSjy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Oct 2011 14:39:54 -0400
In-Reply-To: <20111025203628.40a1b8a475e32053aa34dabe@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>, target-devel@vger.kernel.org

On 10/25/11 02:36, Stephen Rothwell wrote:
> Hi all,

target_core_cdb.c needs to include <linux/export.h>:

drivers/target/target_core_cdb.c:1316:1: warning: data definition has no type or storage class [enabled by default]
drivers/target/target_core_cdb.c:1316:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL' [-Wimplicit-int]
drivers/target/target_core_cdb.c:1316:1: warning: parameter names (without types) in function declaration [enabled by default]


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
