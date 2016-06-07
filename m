From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 6 (scsi_debug.c)
Date: Mon, 6 Jun 2016 20:10:56 -0700
Message-ID: <57563B40.4090801@infradead.org>
References: <20160606142058.44b82e38@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:55855 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750933AbcFGDLA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Jun 2016 23:11:00 -0400
In-Reply-To: <20160606142058.44b82e38@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>

On 06/05/16 21:20, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160603:

on x86_64:

ERROR: "ip_compute_csum" [drivers/scsi/scsi_debug.ko] undefined!

CONFIG_GENERIC_CSUM doesn't seem to exist for x86, so lib/checksum.o is not built.


-- 
~Randy
