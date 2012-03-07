From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Mar 7 (kvm)
Date: Wed, 07 Mar 2012 14:56:17 -0800
Message-ID: <4F57E791.6070205@xenotime.net>
References: <20120307181009.bc377d39ae4f1d575305c693@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120307181009.bc377d39ae4f1d575305c693@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 03/06/2012 11:10 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120306:
> 
> The kvm tree lost its build failure.


I'm getting this build error on X86_32 (i386):

arch/x86/kvm/x86.c:1042: Error: no instruction mnemonic suffix given and no register operands; can't size instruction


-- 
~Randy
