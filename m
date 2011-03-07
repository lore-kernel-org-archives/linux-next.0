From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: Tree for March 4
Date: Mon, 7 Mar 2011 11:46:31 +0000
Message-ID: <20110307114631.GD13471@opensource.wolfsonmicro.com>
References: <20110304180027.20deb6c4.sfr@canb.auug.org.au>
 <20110306225210.GA9085@mako-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59030 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754607Ab1CGLqc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Mar 2011 06:46:32 -0500
Content-Disposition: inline
In-Reply-To: <20110306225210.GA9085@mako-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mariusz Kozlowski <mk@lab.zgora.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Sun, Mar 06, 2011 at 11:52:10PM +0100, Mariusz Kozlowski wrote:

> Looking at surrounding code it's missing ifdef for CONFIG_DEBUG_FS.

Yup, should be fixed now.
