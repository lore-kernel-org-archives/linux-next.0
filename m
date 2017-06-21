From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 1/1] percpu: resolve err may not be initialized in
 pcpu_alloc
Date: Wed, 21 Jun 2017 12:02:14 -0400
Message-ID: <20170621160214.GB5708@htj.duckdns.org>
References: <20170621152020.47cacaf6@canb.auug.org.au>
 <20170621155108.GA89068@dennisz-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:32945 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752782AbdFUQY2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jun 2017 12:24:28 -0400
Content-Disposition: inline
In-Reply-To: <20170621155108.GA89068@dennisz-mbp.dhcp.thefacebook.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dennis Zhou <dennisz@fb.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jun 21, 2017 at 11:51:09AM -0400, Dennis Zhou wrote:
> From 4a42ecc735cff0015cc73c3d87edede631f4b885 Mon Sep 17 00:00:00 2001
> From: Dennis Zhou <dennisz@fb.com>
> Date: Wed, 21 Jun 2017 08:07:15 -0700
> 
> Add error message to out of space failure for atomic allocations in
> percpu allocation path to fix -Wmaybe-uninitialized.
> 
> Signed-off-by: Dennis Zhou <dennisz@fb.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to percpu/for-4.13.

Thanks.

-- 
tejun
