From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH 1/1] ftrace: split out hardirq ftrace code into own
	header
Date: Fri, 7 Nov 2008 01:36:15 +0300
Message-ID: <20081106223615.GB26686@x200.localdomain>
References: <20081106211949.320119144@goodmis.org> <20081106212041.790862958@goodmis.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.191]:47331 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733AbYKFWc5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Nov 2008 17:32:57 -0500
Content-Disposition: inline
In-Reply-To: <20081106212041.790862958@goodmis.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>

On Thu, Nov 06, 2008 at 04:19:50PM -0500, Steven Rostedt wrote:
> -#include <linux/ftrace.h>
> +#include <linux/ftrace_irq.h>

This helps, please don't forget in merge compile fixes into original patches
before pleasepulling.
