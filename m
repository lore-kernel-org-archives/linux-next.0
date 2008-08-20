From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 20 Aug 2008 09:26:36 +0100
Message-ID: <20080820092636.2356ad98@lxorguk.ukuu.org.uk>
References: <20080820182353.024d5a9e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:48724 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753105AbYHTIoA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Aug 2008 04:44:00 -0400
In-Reply-To: <20080820182353.024d5a9e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 20 Aug 2008 18:23:53 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next build (powerpc allnoconfig) failed like this:
> 
> drivers/char/pty.c:420: error: 'pty_bsd_ioctl' undeclared here (not in a function)
> 
> Caused by 5265223407c8eed1b023aca77492c631e2676f5c ("tty-fix-shutdown").
> I applied the following patch (which may not be correct).

Thanks - it's not quite right but it'll do the job. I'll push a corrected
change for the case where you build without legacy BSD PTY today.
