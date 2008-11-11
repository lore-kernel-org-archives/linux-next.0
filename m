From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/1] ring-buffer: buffer record on/off switch
Date: Tue, 11 Nov 2008 12:56:45 -0800
Message-ID: <20081111125645.4f7a5827.akpm@linux-foundation.org>
References: <20081111200601.147669239@goodmis.org>
	<20081111201034.315528609@goodmis.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:57833 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753873AbYKKU6V (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2008 15:58:21 -0500
In-Reply-To: <20081111201034.315528609@goodmis.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, mingo@elte.hu, tglx@linutronix.de, torvalds@linux-foundation.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, srostedt@redhat.com

On Tue, 11 Nov 2008 15:06:02 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> +static struct file_operations rb_simple_fops = {

should be const...

Probably it isn't worth fixing.  Someone(tm) should do period sweeps -
10% of our file_operationses aren't const.
