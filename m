From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 14
Date: Wed, 14 Oct 2009 08:55:15 -0700
Message-ID: <20091014085515.f40067c1.randy.dunlap@oracle.com>
References: <20091014163445.f0441473.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:45657 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934749AbZJNP4L (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2009 11:56:11 -0400
In-Reply-To: <20091014163445.f0441473.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 14 Oct 2009 16:34:45 +1100 Stephen Rothwell wrote:

> Changes since 20091013:
> 
> Undropped tree: i7core_edac
> 
> My fixes tree contains a build fix for powerpc/kvm.
> 
> The pci tree gained a conflict against Linus' tree.
> 
> The kbuild tree gained a build failure that required me to remove
> include/asm/asm-offsets.h from my object tree.
> 
> The net tree lost its build failure.
> 
> The percpu tree lost its build failure.
> 
> The tty tree still had a build failure for which I reverted a commit.
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/v2.6/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" as mentioned in the FAQ on the wiki
> (see below).

Hi Stephen,

Where are today's .bz2 file and the .sign files?

and when did pub/kernel/people/sfr/linux-next/ disappear?

The kernel.org/kdist/finger_banner file now reports:
The latest linux-next version of the Linux kernel is:         next-20091013

instead of 20091014.

---
~Randy
