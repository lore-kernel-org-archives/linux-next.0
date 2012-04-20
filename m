From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Apr 20 (kvm)
Date: Fri, 20 Apr 2012 15:00:19 -0700
Message-ID: <4F91DC73.5010207@xenotime.net>
References: <20120420155151.3fcac4c2d1002ade5ccf44ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120420155151.3fcac4c2d1002ade5ccf44ac@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 04/19/2012 10:51 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120419:
> 
> 
> The kvm tree inherited the kvm-ppc tree's build failure for which I
> reverted a commit.



on i386:

arch/x86/kvm/emulate.c:4122: Error: bad register name `%dil'


-- 
~Randy
