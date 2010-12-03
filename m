From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH -next] arm: trivial: add missing argument to printk
Date: Fri, 3 Dec 2010 19:14:55 +0000
Message-ID: <20101203191455.GK30898@n2100.arm.linux.org.uk>
References: <1291403172-2438-1-git-send-email-gadiyar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:47183 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751600Ab0LCTPM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Dec 2010 14:15:12 -0500
Content-Disposition: inline
In-Reply-To: <1291403172-2438-1-git-send-email-gadiyar@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Anand Gadiyar <gadiyar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

On Sat, Dec 04, 2010 at 12:36:12AM +0530, Anand Gadiyar wrote:
> Patch "ARM: CPU hotplug: move cpu_killed completion to core code"
> accidentally left out an argument to a printk call. This introduces
> the following build warning - fix this.

Already caught this.
