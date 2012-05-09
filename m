From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Regression due to 7ff9554 "printk: convert byte-buffer to variable-length
 record buffer"
Date: Wed, 09 May 2012 12:31:49 -0600
Message-ID: <4FAAB815.5040001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:58055 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753503Ab2EISbw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 May 2012 14:31:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kay Sievers <kay@vrfy.org>
Cc: William Douglas <william.douglas@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

For me, next-20120508 prints nothing when booted, and I think also
hangs. To solve this, I reverted:

7ff9554 printk: convert byte-buffer to variable-length record buffer

In order to build, I also had to revert:

c4e00da driver-core: extend dev_printk() to pass structured data

Note: I'm running on an ARM system using a serial console, with
earlyprintk enabled.
