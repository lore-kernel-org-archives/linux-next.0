From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v3 2/2] workqueue: respect isolated cpus when queueing an
 unbound work
Date: Mon, 27 Nov 2017 08:57:47 -0800
Message-ID: <20171127165747.GG983427@devbig577.frc2.facebook.com>
References: <20171103135911.GS3252168@devbig577.frc2.facebook.com>
 <1509722870-27618-1-git-send-email-tal.shorer@gmail.com>
 <1509722870-27618-2-git-send-email-tal.shorer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:38540 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753489AbdK0Q5v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Nov 2017 11:57:51 -0500
Content-Disposition: inline
In-Reply-To: <1509722870-27618-2-git-send-email-tal.shorer@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tal Shorer <tal.shorer@gmail.com>
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, frederic@kernel.org

On Fri, Nov 03, 2017 at 05:27:50PM +0200, Tal Shorer wrote:
> Initialize wq_unbound_cpumask to exclude cpus that were isolated by
> the cmdline's isolcpus parameter.
> 
> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>

Applied 1-2 to wq/for-4.15-fixes.

Thanks.

-- 
tejun
