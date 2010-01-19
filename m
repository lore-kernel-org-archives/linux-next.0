From: Alberto Panizzo <maramaopercheseimorto@gmail.com>
Subject: Re: linux-next: backlight tree build warning
Date: Tue, 19 Jan 2010 09:29:17 +0100
Message-ID: <1263889757.3121.10.camel@realization>
References: <20100119150836.bb975e4b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.25]:26553 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754418Ab0ASI3V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2010 03:29:21 -0500
In-Reply-To: <20100119150836.bb975e4b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On mar, 2010-01-19 at 15:08 +1100, Stephen Rothwell wrote:
> Hi Richard,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/video/backlight/l4f00242t03.o
> 
> Introduced by commit 1bb615b563230e690b332dae4fda0067c2f88bbc
> ("backlight: Add Epson L4F00242T03 LCD driver").
> 

Mm I don't know what it goes wrong but metadata of that patch indicate
to create the file l4f00242t03.c with one line less (the module licence).
Sorry me, surely is my fault.

Fixing patch in response..

Alberto!
