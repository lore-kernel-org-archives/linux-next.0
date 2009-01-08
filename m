From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 8 (percpu)
Date: Thu, 08 Jan 2009 09:23:55 -0800
Message-ID: <496636AB.9000903@oracle.com>
References: <20090108171730.19a41e14.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:43190 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751599AbZAHRYI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jan 2009 12:24:08 -0500
In-Reply-To: <20090108171730.19a41e14.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090107:
> 
> Undropped tree:
> 	rr
> 
> Dropped trees (temporarily):
> 	ocfs2 (build problem)
> 	cpu_alloc (build problem)


When CONFIG_SMP=n, both arch/x86/include/asm/percpu.h and
include/asm-generic/percpu.h define both of
read_percpu_ptr() and read_percpu_var().


build-r8079.out:linux-next-20090108/include/asm-generic/percpu.h:124:1: warning: "read_percpu_ptr" redefined
build-r8079.out:linux-next-20090108/arch/x86/include/asm/percpu.h:107:1: warning: this is the location of the previous definition
build-r8079.out:linux-next-20090108/include/asm-generic/percpu.h:120:1: warning: "read_percpu_var" redefined
build-r8079.out:linux-next-20090108/arch/x86/include/asm/percpu.h:106:1: warning: this is the location of the previous definition



-- 
~Randy
