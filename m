From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: quilt series BASE
Date: Wed, 8 Jun 2011 09:01:20 +0200
Message-ID: <20110608090120.7baea3fc@endymion.delvare>
References: <20110608111954.b9e85517.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:34351 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751839Ab1FHHBb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jun 2011 03:01:31 -0400
In-Reply-To: <20110608111954.b9e85517.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

On Wed, 8 Jun 2011 11:19:54 +1000, Stephen Rothwell wrote:
> I had to fix the BASE for your quilt series (i2c and jdelvare-hwmon)
> today from 3.0.0-rc2 to 3.0-rc2.

Sorry for the trouble. I extract the version from the Makefile, and
there it still reads 3.0.0. I've adjusted my uploader script to strip
the sublevel for 3.x series.

-- 
Jean Delvare
