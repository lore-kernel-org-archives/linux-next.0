From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: Regression due to 7ff9554 "printk: convert byte-buffer to variable-length
 record buffer"
Date: Thu, 10 May 2012 13:54:49 -0600
Message-ID: <4FAC1D09.1070004@wwwdotorg.org>
References: <4FAAB815.5040001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:55750 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752572Ab2EJTyy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 May 2012 15:54:54 -0400
In-Reply-To: <4FAAB815.5040001@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kay Sievers <kay@vrfy.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: William Douglas <william.douglas@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On 05/09/2012 12:31 PM, Stephen Warren wrote:
> For me, next-20120508 prints nothing when booted, and I think also
> hangs. To solve this, I reverted:
> 
> 7ff9554 printk: convert byte-buffer to variable-length record buffer
> 
> In order to build, I also had to revert:
> 
> c4e00da driver-core: extend dev_printk() to pass structured data
> 
> Note: I'm running on an ARM system using a serial console, with
> earlyprintk enabled.

This issue still occurs in next-20120510.

I've tracked it down to the assignment of msg->ts_nsec near the end of
log_store(). If I comment this out, everything works. The problem is the
assignment, not the call to local_clock():

fails:
	msg->ts_nsec = local_clock();
fails:
	msg->ts_nsec = 0;//local_clock();
works:
	//msg->ts_nsec = local_clock();

I guess that msg isn't pointing at what it's supposed to. I'll keep
trying to track this down, but if you could think about why this might
happen (or even revert the changes until this is isolated), it'd be great.
