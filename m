From: Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH -next] ia64/sn: fix percpu warnings
Date: Mon, 26 Oct 2009 11:24:00 -0700
Message-ID: <12c511ca0910261124p64f2ad5emc88d00b9957482b3@mail.gmail.com>
References: <20091014163445.f0441473.sfr@canb.auug.org.au>
	 <20091014151003.0ef42973.randy.dunlap@oracle.com>
	 <4AD67C05.2030201@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.216.179]:33446 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752778AbZJZSX5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Oct 2009 14:23:57 -0400
In-Reply-To: <4AD67C05.2030201@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jes Sorensen <jes@sgi.com>, linux-ia64@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

> Acked-by: Tejun Heo <tj@kernel.org>
>
> Can this go through ia64 tree? =A0If not, I can route it through
> percpu#for-fixes.

It can ... but I'm getting a strange warning since I applied it:

  Building modules, stage 2.
  GZIP    arch/ia64/hp/sim/boot/vmlinux.gz
  MODPOST 198 modules
WARNING: "per_cpu____sn_cnodeid_to_nasid" [drivers/misc/sgi-xp/xpc.ko]
has no CRC!

Any idea what this means?

-Tony
