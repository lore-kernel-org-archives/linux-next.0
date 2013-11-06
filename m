From: Eric Paris <eparis@redhat.com>
Subject: Re: linux-next: build failure after merge of the audit tree
Date: Wed, 06 Nov 2013 11:54:57 -0500
Message-ID: <1383756897.28218.66.camel@flatline.rdu.redhat.com>
References: <20131106172734.28986a5907009f84aead4e8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:16589 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754348Ab3KFQzC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Nov 2013 11:55:02 -0500
In-Reply-To: <20131106172734.28986a5907009f84aead4e8b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Guy Briggs <rgb@redhat.com>

On Wed, 2013-11-06 at 17:27 +1100, Stephen Rothwell wrote:
> Hi Eric,
> 
> After merging the audit tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> kernel/auditsc.c: In function 'audit_set_loginuid':
> kernel/auditsc.c:2003:15: error: incompatible types when assigning to type 'kuid_t' from type 'int'
>   oldsessionid = audit_get_sessionid(current);
>                ^
> kernel/auditsc.c:2016:2: error: incompatible type for argument 3 of 'audit_log_set_loginuid'
>   audit_log_set_loginuid(oldloginuid, loginuid, oldsessionid, sessionid, rc);
>   ^
> kernel/auditsc.c:1967:13: note: expected 'unsigned int' but argument is of type 'kuid_t'
>  static void audit_log_set_loginuid(kuid_t koldloginuid, kuid_t kloginuid,
>              ^
> 
> Caused by commit da0a610497ce ("audit: loginuid functions coding style").
> 
> I have used the version of the audit tree from next-20131105 for today.
> 

Should be fixed for tomorrow.  Thank you.
