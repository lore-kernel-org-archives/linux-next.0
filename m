From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 11 Apr 2011 21:48:06 -0700
Message-ID: <20110412044806.GA13741@opensource.wolfsonmicro.com>
References: <20110412115954.c3ab875a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:39079 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750783Ab1DLEr7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Apr 2011 00:47:59 -0400
Content-Disposition: inline
In-Reply-To: <20110412115954.c3ab875a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 12, 2011 at 11:59:54AM +1000, Stephen Rothwell wrote:

> sound/soc/codecs/wm1250-ev1.c:76: error: '__mod_i2c_device_table' aliased to undefined symbol 'wm1250_ev1__id'

Fixed now.
