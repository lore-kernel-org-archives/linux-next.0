From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Apr 24 (kvm)
Date: Tue, 24 Apr 2012 09:25:30 -0700
Message-ID: <4F96D3FA.1010909@xenotime.net>
References: <20120424154354.7feba600beac616833d034de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:45998 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755782Ab2DXQZB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Apr 2012 12:25:01 -0400
In-Reply-To: <20120424154354.7feba600beac616833d034de@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org

On 04/23/2012 10:43 PM, Stephen Rothwell wrote:

> Hi all,
> 
> There will probably be no linux-next release until April 30 as I am
> taking a break.
> 
> Changes since 20120423:


on i386:

  CC [M]  arch/x86/kvm/emulate.o
arch/x86/kvm/emulate.c: Assembler messages:
arch/x86/kvm/emulate.c:4122: Error: bad register name `%bpl'


-- 
~Randy
