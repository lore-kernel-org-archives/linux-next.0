From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: linux-integrity
Date: Fri, 06 Jun 2014 01:11:09 -0400
Message-ID: <1402031469.5458.162.camel@dhcp-9-2-203-236.watson.ibm.com>
References: <1402026956.5458.130.camel@dhcp-9-2-203-236.watson.ibm.com>
	 <20140606142255.76bc38f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:40531 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaFFFLO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jun 2014 01:11:14 -0400
Received: from /spool/local
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zohar@linux.vnet.ibm.com>;
	Thu, 5 Jun 2014 23:11:13 -0600
In-Reply-To: <20140606142255.76bc38f1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>

On Fri, 2014-06-06 at 14:22 +1000, Stephen Rothwell wrote: 
> Hi Mimi,
> 
> On Thu, 05 Jun 2014 23:55:56 -0400 Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:
> >
> > Please include
> > git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity
> > #next in linux-next.
> 
> OK, it would be good to know what that tree is about 

The linux-integrity measures, appraises and enforces local file
integrity, and audit logs file hashes based on policy.  The
linux-integrity subsystem is upstreamed and pulled into linux-next via
linux-security.  A suggestion was made to have the linux-integrity
subsystem pulled directly into linux-next.

> ... also it is
> really late for inclusion in v3.16 even - I generally do not add trees
> to linux-next during the merge window.  This does not mean I won't
> include it if you can convince me otherwise ...

8 patches, mostly bugs fixes, are queued to be upstreamed
http://marc.info/?l=linux-security-module&m=140128032831578&w=2
Please add the linux-integrity subsystem at the next feasible
opportunity. 

thanks,

Mimi
