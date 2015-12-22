From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Dec 22
Date: Tue, 22 Dec 2015 13:08:16 +0530
Message-ID: <20151222073815.GA21698@sudip-pc>
References: <20151222162955.3f366781@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34704 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752620AbbLVHi1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Dec 2015 02:38:27 -0500
Content-Disposition: inline
In-Reply-To: <20151222162955.3f366781@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hans-Peter Nilsson <hans-peter.nilsson@axis.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Dec 22, 2015 at 04:29:55PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20151221:

cris allmodconfig fails with:
../block/partitions/ldm.c: In function 'ldm_partition':
../block/partitions/ldm.c:1567:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1027

compiler is based on gcc 5.3.0, and I guess since cris defconfig built
properly I have not messed up while building the cross_compiler.

cris allmodconfig build log is at:
https://travis-ci.org/sudipm-mukherjee/parport/jobs/98258283

regards
sudip
