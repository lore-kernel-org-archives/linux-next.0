From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for Mar 7 (kvm)
Date: Thu, 08 Mar 2012 13:53:59 +0200
Message-ID: <4F589DD7.1040704@redhat.com>
References: <20120307181009.bc377d39ae4f1d575305c693@canb.auug.org.au> <4F57E791.6070205@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:16464 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756972Ab2CHLyG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Mar 2012 06:54:06 -0500
In-Reply-To: <4F57E791.6070205@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org

On 03/08/2012 12:56 AM, Randy Dunlap wrote:
> On 03/06/2012 11:10 PM, Stephen Rothwell wrote:
>
> > Hi all,
> > 
> > Changes since 20120306:
> > 
> > The kvm tree lost its build failure.
>
>
> I'm getting this build error on X86_32 (i386):
>
> arch/x86/kvm/x86.c:1042: Error: no instruction mnemonic suffix given and no register operands; can't size instruction
>
>

Patch to follow.

-- 
error compiling committee.c: too many arguments to function
