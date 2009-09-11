From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/3] kernel.h: move logging functions to separate file
Date: Fri, 11 Sep 2009 10:55:02 -0400
Message-ID: <1252680902.18996.687.camel@gandalf.stny.rr.com>
References: <cover.1252639195.git.joe@perches.com>
Reply-To: rostedt@goodmis.org
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:36876 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109AbZIKOzA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Sep 2009 10:55:00 -0400
In-Reply-To: <cover.1252639195.git.joe@perches.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>

On Thu, 2009-09-10 at 20:29 -0700, Joe Perches wrote:
> kernel.h has gotten cluttered.
> Unclutter it and make it kernel style compatible.
> 
> Joe Perches (3):
>   include/linux/logging.h: Separate logging functions out of kernel.h
>   include/linux/logging.h: Reduce data usage of printk_once
>   include/linux/kernel.h: neaten and group functions and definitions
> 
>  include/linux/kernel.h  |  754 ++++++++++++++++-------------------------------
>  include/linux/logging.h |  313 ++++++++++++++++++++
>  2 files changed, 573 insertions(+), 494 deletions(-)
>  create mode 100644 include/linux/logging.h
> 

This is just clean up code, so I'm fine with it.

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve
