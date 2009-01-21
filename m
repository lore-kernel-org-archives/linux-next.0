From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: linux-next: voltage tree build failure
Date: Wed, 21 Jan 2009 14:04:48 +0000
Message-ID: <49772B80.4090702@cam.ac.uk>
References: <20090121134600.d6e60b2f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ppsw-0.csi.cam.ac.uk ([131.111.8.130]:50489 "EHLO
	ppsw-0.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753346AbZAUO25 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Jan 2009 09:28:57 -0500
In-Reply-To: <20090121134600.d6e60b2f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Hi Liam,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/regulator/wm8350-regulator.c: In function 'pmic_uv_handler':
> drivers/regulator/wm8350-regulator.c:1296: error: dereferencing pointer to incomplete type
> drivers/regulator/wm8350-regulator.c:1305: error: dereferencing pointer to incomplete type
> 
> Immediate cause is commit 872ed3fe176833f7d43748eb88010da4bbd2f983
> ("Regulator: Push lock out of _notifier_call_chain + add voltage change
> event").
> 
> I have dropped the voltage tree for today.
Sorry, my error... It's always the simple changes that you don't build
test properly that catch you out.

Liam, can you revert this patch for now and I'll send a version
that doesn't have this problem shortly.

Jonathan
